<?php
$page_title = "Portfolio";
$projects = [
    [
        'id'             => 1,
        'title'          => 'Tech Solutions Website',
        'category'       => 'web',
        'category_label' => 'Web Development',
        'description'    => 'A modern corporate website built for a leading IT solutions company.',
        'image'          => 'assets/img/blog/1.jpg',
        'url'            => '#',
    ],
    [
        'id'             => 2,
        'title'          => 'Retail Mart POS System',
        'category'       => 'pos',
        'category_label' => 'POS Solutions',
        'description'    => 'A complete POS solution with inventory, billing, & reporting for Retail Mart.',
        'image'          => 'assets/img/blog/2.jpg',
        'url'            => '#',
    ],
    [
        'id'             => 3,
        'title'          => 'Analytics Dashboard',
        'category'       => 'software',
        'category_label' => 'Custom Software',
        'description'    => 'A custom analytics dashboard that turns data into actionable insights.',
        'image'          => 'assets/img/blog/3.jpg',
        'url'            => '#',
    ],
    [
        'id'             => 4,
        'title'          => 'Fashion Store eCommerce',
        'category'       => 'web',
        'category_label' => 'Web Development',
        'description'    => 'A sleek eCommerce platform with a smooth and modern shopping experience.',
        'image'          => 'assets/img/blog/4.jpg',
        'url'            => '#',
    ],
    [
        'id'             => 5,
        'title'          => 'FoodHub POS Solution',
        'category'       => 'pos',
        'category_label' => 'POS Solutions',
        'description'    => 'POS system for restaurants to manage orders, menus, and staff efficiently.',
        'image'          => 'assets/img/blog/5.jpg',
        'url'            => '#',
    ],
    [
        'id'             => 6,
        'title'          => 'BrandBoost Campaign',
        'category'       => 'marketing',
        'category_label' => 'Digital Marketing',
        'description'    => 'A results-driven digital campaign that increased brand visibility by 200%.',
        'image'          => 'assets/img/blog/6.jpg',
        'url'            => '#',
    ],
    [
        'id'             => 7,
        'title'          => 'School Management System',
        'category'       => 'software',
        'category_label' => 'Custom Software',
        'description'    => 'A comprehensive platform to manage students, teachers, and classes.',
        'image'          => 'assets/img/blog/blog-1.png',
        'url'            => '#',
    ],
    [
        'id'             => 8,
        'title'          => 'Real Estate Website',
        'category'       => 'web',
        'category_label' => 'Web Development',
        'description'    => 'A property listing website with advanced search and filter options.',
        'image'          => 'assets/img/blog/blog-2.png',
        'url'            => '#',
    ],
    [
        'id'             => 9,
        'title'          => 'Pharmacy POS System',
        'category'       => 'pos',
        'category_label' => 'POS Solutions',
        'description'    => 'Specialized POS solution for pharmacies with medicine & stock management.',
        'image'          => 'assets/img/blog/banner.jpg',
        'url'            => '#',
    ],
];

$category_colors = [
    'web'       => 'badge-web',
    'pos'       => 'badge-pos',
    'software'  => 'badge-software',
    'marketing' => 'badge-marketing',
];

$testimonials = [
    [
        'text'   => 'Next Edge transformed our retail operations with a powerful and easy-to-use POS solution.',
        'name'   => 'Nimal Fernando',
        'role'   => 'Retail Mart',
        'avatar' => 'assets/img/testimonial/1.png',
        'stars'  => 5,
    ],
    [
        'text'   => 'Professional team, excellent communication, and outstanding website delivery!',
        'name'   => 'Sahan Perera',
        'role'   => 'CEO, Tech Solutions',
        'avatar' => 'assets/img/testimonial/2.png',
        'stars'  => 5,
    ],
    [
        'text'   => 'Their digital marketing strategies helped us boost our brand visibility and reach the right audience.',
        'name'   => 'Tharushi Weerakoon',
        'role'   => 'Marketing Head, Fashion Hub',
        'avatar' => 'assets/img/testimonial/3.png',
        'stars'  => 5,
    ],
    [
        'text'   => 'The custom software they built for us saved hours of manual work every week.',
        'name'   => 'Kamal Gunaratne',
        'role'   => 'Director, Sunrise Imports',
        'avatar' => 'assets/img/testimonial/4.png',
        'stars'  => 5,
    ],
    [
        'text'   => 'Outstanding service and attention to detail. Our new website loads fast and converts visitors.',
        'name'   => 'Dilani Jayawardena',
        'role'   => 'Owner, Glow Beauty Studio',
        'avatar' => 'assets/img/testimonial/5.png',
        'stars'  => 5,
    ],
];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include "./Includes/head.php"; ?>
    <link rel="stylesheet" href="assets/css/portfolio.css">
</head>
<body data-spy="scroll" data-offset="80">

    <?php include "./Includes/preloader.php"; ?>
    <?php include "./Includes/header.php"; ?>
    <section class="portfolio-hero">
        <div class="container2">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <span class="hero-badge">Our Portfolio</span>

                    <h1>Our Work, Their Success</h1>

                    <h2 class="portfolio-hero-gradient">Real Results We're Proud Of</h2>

                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam.
                    </p>

                    <div class="portfolio-stats">

                        <div class="portfolio-stat-item">
                            <i class="ti ti-briefcase"></i>
                            <div>
                                <strong>120+</strong>
                                <span>Projects Completed</span>
                            </div>
                        </div>

                        <div class="portfolio-stat-item">
                            <i class="ti ti-mood-happy"></i>
                            <div>
                                <strong>98%</strong>
                                <span>Client Satisfaction</span>
                            </div>
                        </div>

                        <div class="portfolio-stat-item">
                            <i class="ti ti-building-store"></i>
                            <div>
                                <strong>5+</strong>
                                <span>Industries Served</span>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- RIGHT -->
                <div class="col-lg-6">
                    <div class="portfolio-hero-img-wrap">
                        <img src="assets/img/bg/pos-mockup.png" alt="Portfolio Showcase">
                        <div class="portfolio-float-card">
                            <h5>120+ Projects</h5>
                            <p>Delivered across 5+ industries</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <section class="portfolio-filter-section">
        <div class="container2">
            <div class="portfolio-top-filters">

                <button class="portfolio-filter-btn active" data-category="all">
                    All Projects
                </button>

                <div class="portfolio-filter-btns">
                    <button class="portfolio-filter-btn" data-category="web">
                        Web Development
                    </button>
                    <button class="portfolio-filter-btn" data-category="pos">
                        POS Solutions
                    </button>
                    <button class="portfolio-filter-btn" data-category="software">
                        Custom Software
                    </button>
                    <button class="portfolio-filter-btn" data-category="marketing">
                        Digital Marketing
                    </button>
                </div>

                <div class="portfolio-search">
                    <input type="text" id="portfolioSearch" placeholder="Search projects...">
                    <i class="fa fa-search"></i>
                </div>

            </div>
        </div>
    </section>
    <section class="portfolio-grid-section section-padding">
        <div class="container2">

            <div class="portfolio-no-results" id="portfolioNoResults">
                <i class="ti ti-search-off"></i>
                <p>No projects found. Try a different search or category.</p>
            </div>

            <div class="row g-4" id="portfolioGrid">

                <?php foreach ($projects as $project): ?>

                <div class="col-lg-4 col-md-6 col-12 portfolio-item"
                     data-category="<?= htmlspecialchars($project['category']) ?>"
                     data-title="<?= htmlspecialchars(strtolower($project['title'])) ?>"
                     data-desc="<?= htmlspecialchars(strtolower($project['description'])) ?>">

                    <div class="portfolio-card">
                        <div class="portfolio-card-image">
                            <img src="<?= htmlspecialchars($project['image']) ?>"
                                 alt="<?= htmlspecialchars($project['title']) ?>">
                            <div class="portfolio-card-overlay">
                                <a href="<?= htmlspecialchars($project['url']) ?>"
                                   class="portfolio-view-btn">
                                    <i class="ti ti-eye"></i> View Project
                                </a>
                            </div>
                        </div>
                        <div class="portfolio-card-content">

                            <span class="portfolio-badge <?= $category_colors[$project['category']] ?? '' ?>">
                                <?= htmlspecialchars($project['category_label']) ?>
                            </span>

                            <h3><?= htmlspecialchars($project['title']) ?></h3>

                            <p><?= htmlspecialchars($project['description']) ?></p>

                            <a href="<?= htmlspecialchars($project['url']) ?>"
                               class="portfolio-readmore">
                                View Project <i class="ti ti-arrow-right"></i>
                            </a>

                        </div>

                    </div>

                </div>

                <?php endforeach; ?>

            </div>

        </div>
    </section>

    <section class="portfolio-testimonials-section bg-section">
        <div class="container2">

            <div class="section-title text-center">
                <span class="subtitle">WHAT OUR CLIENTS SAY</span>
                <h2>Trusted by Businesses Like Yours</h2>
                <p>
                    We take pride in building long-term relationships through results and reliability.
                </p>
            </div>

            <div class="ps-relative">

                <div class="swiper portfolio-testimonials-slider">
                    <div class="swiper-wrapper">

                        <?php foreach ($testimonials as $t): ?>
                        <div class="swiper-slide">
                            <div class="testimonial-card">

                                <div class="portfolio-testi-quote">
                                    <i class="fa fa-quote-left"></i>
                                </div>
                                <p class="testimonial-text">
                                    <?= htmlspecialchars($t['text']) ?>
                                </p>

                                <div class="testimonial-user">
                                    <div class="testimonial-avatar">
                                        <img src="<?= htmlspecialchars($t['avatar']) ?>"
                                             alt="<?= htmlspecialchars($t['name']) ?>">
                                    </div>
                                    <div class="testimonial-info">
                                        <h4><?= htmlspecialchars($t['name']) ?></h4>
                                        <span><?= htmlspecialchars($t['role']) ?></span>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <?php endforeach; ?>

                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="portfolio-testi-prev">
                    <i class="ti ti-chevron-left"></i>
                </div>
                <div class="portfolio-testi-next">
                    <i class="ti ti-chevron-right"></i>
                </div>

            </div>

        </div>
    </section>
    
    <section class="cta-banner-section">
        <div class="container">
            <div class="cta-banner">

                <div class="cta-left">
                    <div class="cta-icon">
                        <img src="./assets/img/favicon.png" alt="Next Edge">
                    </div>
                    <div class="cta-content">
                        <h3>Ready to Grow Your Business?</h3>
                        <p>Let's build something great together.</p>
                    </div>
                </div>

                <div class="cta-actions">
                    <a href="https://wa.me/94770206960" class="cta-whatsapp" target="_blank" rel="noopener noreferrer">
                        <i class="ti ti-brand-whatsapp"></i>
                        WhatsApp Us
                    </a>
                    <a href="./contact" class="cta-quote">
                        Get a Free Quote
                    </a>
                </div>

            </div>
        </div>
    </section>
    <?php include "./Includes/footer.php"; ?>
    <script src="assets/jquery/portfolio.js"></script>

</body>
</html>
