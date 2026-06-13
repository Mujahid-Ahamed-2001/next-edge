    <?php 
    $brand ="Next Edge Solutions";
    $title = isset($page_title) && !empty($page_title) ? $page_title." | ".$brand : "Next Edge Solutions | Build Beyond Boubdaries";
    ?>

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

    <?php 
    if(isset($chart_apex) && !empty($chart_apex))
    {
        ?>
        
    <link rel="stylesheet" href="./lib/apexcharts/apexcharts.css">
        <?php
    }
    
    ?>

    <!-- Template CSS -->
    <link rel="stylesheet" href="./assets/css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css">