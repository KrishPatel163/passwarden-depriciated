<?php
if (isset($_COOKIE['visit_count'])) {
    $a = $_COOKIE['visit_count'];
    $a++;
    setcookie('visit_count', $a, time() + 3600);
} else {
    setcookie('visit_count', 1, time() + 3600);
}
$visit_count = $_COOKIE['visit_count'];
?>
<!DOCTYPE html>
<html>

<head>
    <title>Visitor Page Counter</title>
</head>

<body>
    <h1>Welcome to the Page</h1>
    <p>This page has been visited <?php echo $visit_count; ?> times.</p>
</body>

</html>