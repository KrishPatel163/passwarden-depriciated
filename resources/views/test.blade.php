<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="/decrypt" method="post">
        @csrf
        <input type="text" name="pass" id="pass">
        <button type="submit">Submit</button>
    </form>
</body>
</html>