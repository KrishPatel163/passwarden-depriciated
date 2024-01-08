<x-LoginRegister>
    @if ($errors->any())
        <div id="error">
            <div class="err-content">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        </div>
    @endif

    <div id="container">
        <form action="/login" method="post">
            @csrf
            <div class="form">
                <div class="form-header">
                    <h2>Log in</h2>
                    <hr>
                </div>
                <div class="form-inp">
                    <div class="form-group">
                        <input type="text" name="name" placeholder="Enter your name">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" placeholder="Enter your password">
                    </div>
                    <div class="form-group">
                        <button type="submit">Log in</button>
                    </div>
                </div>
                <hr>
                <div class="form-footer">
                    <a href="/register">Register here</a>
                </div>
            </div>
        </form>
    </div>
</x-LoginRegister>
