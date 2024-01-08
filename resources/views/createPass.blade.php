<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PassWarden</title>
</head>
<body>
    <center>
        <form action="/create-pass" method="post">
            @csrf
            for site: <input type="text" name="website"><br>
            password: <input type="password" name="password"><br>
            <button type="submit">Submit</button>
        </form>
    </center>
</body>
</html>