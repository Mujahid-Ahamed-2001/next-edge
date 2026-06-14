    <?php 
    $brand ="Next Edge Solutions";
    $title = isset($page_title) && !empty($page_title) ? $page_title." | ".$brand : "Next Edge Solutions | Build Beyond Boubdaries";
    ?>
<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Meta -->
    <meta name="description" content="">
    <meta name="author" content="Themepixels">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">

    <title><?php echo $title; ?></title>

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="./lib/remixicon/fonts/remixicon.css">

    <!-- Template CSS -->
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/login.css">

    <link rel="stylesheet" href="./assets/css/iziModal.min.css">

    <link rel="stylesheet" href="./assets/css/iziToast.min.css">
  </head>
  <body class="page-sign">

    <div class="card card-sign">
      <div class="card-header">
        <a href="../" class="header-logo mb-4">Smart Edge</a>
        <h3 class="card-title">Sign In</h3>
        <p class="card-text">Welcome back! Please signin to continue.</p>
      </div><!-- card-header -->
      <div class="card-body">
        <form action="" method="post" class="login-foem" id="login-form">
          <div class="mb-4">
            <label class="form-label" for="username">Email address</label>
            <input type="text" name="email" id="email" class="form-control" placeholder="Enter your email address" required>
          </div>
          <div class="mb-4">
            <label class="form-label d-flex justify-content-between" for="password">Password <a href="">Forgot password?</a></label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
          </div>
          <div class="mb-4 rows">
            <div class="col-md-12 form-check">
              <input type="checkbox" name="" id="showPW" class="form-check-input">
              <label for="showPW" class="form-check-label">Show Password</label>
            </div>
          </div>
          <button type="submit" class="btn btn-primary btn-sign" id="btn-sign">Sign In</button>  
        </form>
        
      </div><!-- card-body -->
    </div><!-- card -->

    <script src="./lib/jquery/jquery.min.js"></script>
    <script src="./lib/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/js/iziToast.min.js"></script>
    <script src="./assets/jquery/login.js"></script>
  </body>
</html>
