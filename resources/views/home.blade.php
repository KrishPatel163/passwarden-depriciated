<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/main.css">
    <title>Home</title>
</head>

<body>
    <div id="nav">
        <div id="navright">
            <h2>Passwarden </h2>
        </div>
        <div id="navleft">
            <a href="">About</a>
            <a href="">Contact us</a>
            <form action="/logout" method="POST">
                @csrf
                <button type="submit">Log Out</button>
            </form>
        </div>
    </div>
    <div id="main">

        <div id="modal">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Store
                Password</button>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Enter Credentials</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="/create-pass" method="post">
                                @csrf
                                <div class="mb-3">
                                    <label for="website" class="col-form-label">Webiste:</label>
                                    <input type="text" class="form-control" name="website">
                                </div>
                                <div class="mb-3">
                                    <label for="website" class="col-form-label">Account Name:</label>
                                    <input type="text" class="form-control" name="account_name">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="col-form-label">Password:</label>
                                    <input type="text" class="form-control" name="password">
                                </div>
                                <button type="submit" class="btn btn-primary">Store Password</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="line"></div>

        <div id="table">
            <table>
                <th>Website</th>
                <th>Account Name</th>
                <th>Password</th>
                <th>Created At</th>
                <th>Updated At</th>

                @if ($count > 0)

                    @foreach ($data as $user)
                        <tr>
                            <td>{{ $user->website }}</td>
                            <td>{{ $user->account_name }}</td>

                            <td onclick="decryptAndCopy('{{ $user->password }}')" style="cursor: pointer">
                                {{ substr($user->password, 0, 30) }}</td>

                            <td>{{ $user->created_at->format('d-m-y') }}</td>
                            <td>{{ $user->updated_at->format('d-m-y') }}</td>
                        </tr>
                    @endforeach
                @else
                    <tr>
                        <td colspan="4">
                            <h4>No Saved Passwords</h4>
                        </td>
                    </tr>
                @endif
            </table>
        </div>

    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
    integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous">
</script>
<script src="/home.js"></script>
{{-- <script>
    function decryptAndCopy(encryptedPassword) {
    fetch('http://127.0.0.1:8000/decrypt', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': '{{ csrf_token() }}', // Laravel CSRF token
        },
        body: JSON.stringify({
            pass: encryptedPassword
        }),
    })
    .then(response => response.json())
    .then(data => {
        console.log(data)
        navigator.clipboard.writeText(data.password).then(() => {
            alert("password copied successfully!")
        }, (err) => {
            alert("error: ", err)
        })
    })
    .catch(error => console.error('Error:', error));
}
</script> --}}
</html>
