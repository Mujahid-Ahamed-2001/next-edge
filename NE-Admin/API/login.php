<?php

header('Content-Type: application/json');

require_once '../config/database.php';

$email = isset($_POST['email']) ? trim($_POST['email']) : '';
$password = isset($_POST['password']) ? trim($_POST['password']) : '';

if (empty($email) || empty($password))
{
    echo json_encode([
        'status' => 'error',
        'message' => 'Please enter email and password.'
    ]);
    exit;
}

$password = md5($password);

$stmt = $conn->prepare("SELECT
        id,
        email,
        is_active
    FROM users
    WHERE email = ? OR username = ?
    AND password_hash = ?
    LIMIT 1
");

$stmt->bind_param("sss", $email, $email, $password);
$stmt->execute();

$result = $stmt->get_result();

if ($result->num_rows == 0)
{
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid email or password.'
    ]);
    exit;
}

$user = $result->fetch_assoc();

if (!$user['is_active'])
{
    echo json_encode([
        'status' => 'error',
        'message' => 'Your account is inactive.'
    ]);
    exit;
}

/*
|--------------------------------------------------------------------------
| Generate Login Token
|--------------------------------------------------------------------------
*/

$token = bin2hex(random_bytes(64));

$update = $conn->prepare("UPDATE users
    SET remember_token = ?,
        last_login = NOW()
    WHERE id = ?
");

$update->bind_param(
    "si",
    $token,
    $user['id']
);

$update->execute();

/*
|--------------------------------------------------------------------------
| Cookie (30 Days)
|--------------------------------------------------------------------------
*/

setcookie(
    "auth_token",
    $token,
    [
        'expires'  => time() + (86400 * 30),
        'path'     => '/',
        'secure'   => false, // true if HTTPS
        'httponly' => true,
        'samesite' => 'Lax'
    ]
);

echo json_encode([
    'status' => 'success',
    'message' => 'Login successful.'
]);

exit;