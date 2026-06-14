<?php

require_once  './config/database.php';

$current_user = [];

if (
    !isset($_COOKIE['auth_token']) ||
    empty($_COOKIE['auth_token'])
)
{
    header("Location: ./login.php");
    exit;
}

$token = trim($_COOKIE['auth_token']);

$stmt = $conn->prepare("SELECT
        id,
        username,
        email,
        mobile,
        is_active
    FROM users
    WHERE remember_token = ?
    LIMIT 1
");

$stmt->bind_param("s", $token);
$stmt->execute();

$result = $stmt->get_result();

if ($result->num_rows == 0)
{
    setcookie(
        "auth_token",
        "",
        time() - 3600,
        "/"
    );

    header("Location: ./login.php");
    exit;
}

$current_user = $result->fetch_assoc();

if (!$current_user['is_active'])
{
    setcookie(
        "auth_token",
        "",
        time() - 3600,
        "/"
    );

    header("Location: ./login.php");
    exit;
}

/*
|--------------------------------------------------------------------------
| User Variables
|--------------------------------------------------------------------------
*/

$user_id = $current_user['id'];
$user_name = $current_user['username'];
$user_email = $current_user['email'];
$user_phone = $current_user['mobile'];