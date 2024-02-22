<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <center>
        {{-- {{ $maildata['otp'] }} --}}
        <form action="/sm" method="post">
            @csrf
            OTP: <input type="text" name="otp" id="mail"><br>
            <button type="submit">Submit</button>
        </form>
    </center>
</body>
</html>