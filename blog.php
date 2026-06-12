<!DOCTYPE html>
<html lang="en">

	<head>
        <?php 
        include "./Includes/head.php";
        ?>	
		<link rel="stylesheet" href="assets/css/blog.css">
	</head>
	
    <body data-spy="scroll" data-offset="80">

		<!-- START PRELOADER -->
        <?php 
        include "./Includes/preloader.php";
        ?>

		<!-- END PRELOADER -->		
		<!-- START NAVBAR -->
        <?php 
        include "./Includes/header.php";
        ?>
		<!-- END NAVBAR -->	

		<!-- START HOME -->
        <section class="hero-section">
            <div class="container2">
                <div class="row align-items-center">

                    <!-- LEFT -->
                    <div class="col-lg-6">
                        <span class="hero-badge">Our Blog</span>

                        <h1>
                            Insights, Tips & Trends<br>
                            to <span>Grow Your Business</span>
                        </h1>

                        <p>
                            Stay updated with the latest trends, expert tips, and industry insights to help your business grow and stay ahead.
                        </p>
                    </div>

                    <!-- RIGHT -->
                    <div class="col-lg-6 text-center position-relative">

                        <div class="hero-image">
                            <img src="assets/img/bg/blog.png" alt="">
                        </div>

                        <!-- FLOATING CARD -->
                        <div class="smart-card">
                            <h5>Blog</h5>
                            <p>Tips • Tricks • Insights</p>
                        </div>

                    </div>

                </div>
            </div>
        </section>
		<!-- END  HOME -->					
		<!-- START BLOG PAGE SECTION -->	
		<section class="blog-page">
			<div class="container">
						<div class="blog-top-filters">
							<button class="filter-btn active" data-category="all">
								All Posts
							</button>
							<div class="filter-btns">

								<button class="filter-btn" data-category="web">
									Web Development
								</button>

								<button class="filter-btn" data-category="pos">
									POS Solutions
								</button>

								<button class="filter-btn" data-category="marketing">
									Digital Marketing
								</button>

								<button class="filter-btn" data-category="business">
									Business Growth
								</button>	
							</div>
							

							<div class="blog-search">
								<input type="text" id="blogSearch" placeholder="Search blogs...">
								<i class="fa fa-search"></i>
							</div>

						</div>

				<div class="blog-layout">

					<!-- BLOGS -->
					<div class="blog-main">

						<div class="blog-list">

							<!-- BLOG -->
							<article class="blog-card" data-category="web">
								<div class="blog-image">
									<img src="./assets/img/blog/1.jpg" alt="">
								</div>

								<div class="blog-content">
									<span class="blog-category">Web Development</span>

									<h3>10 Best Practices for a High Converting Website</h3>

									<p>
										Discover proven tips and strategies to build a website
										that not only looks great but also converts visitors into customers.
									</p>

									<a href="#">Read More</a>
								</div>
							</article>

							<article class="blog-card" data-category="seo">
								<div class="blog-image">
									<img src="./assets/img/blog/2.jpg" alt="">
								</div>

								<div class="blog-content">
									<span class="blog-category">SEO</span>

									<h3>How SEO Friendly Content Drives More Traffic</h3>

									<p>
										Learn how optimized content can significantly increase
										your website visibility.
									</p>

									<a href="#">Read More</a>
								</div>
							</article>

							<article class="blog-card" data-category="pos">
								<div class="blog-image">
									<img src="./assets/img/blog/3.jpg" alt="">
								</div>

								<div class="blog-content">
									<span class="blog-category">POS Solutions</span>

									<h3>How POS Systems Improve Business Efficiency</h3>

									<p>
										Explore how modern POS systems streamline operations.
									</p>

									<a href="#">Read More</a>
								</div>
							</article>

							<article class="blog-card" data-category="marketing">
								<div class="blog-image">
									<img src="./assets/img/blog/4.jpg" alt="">
								</div>

								<div class="blog-content">
									<span class="blog-category">Digital Marketing</span>

									<h3>5 Ways to Grow Your Small Business</h3>

									<p>
										Practical strategies and actionable tips.
									</p>

									<a href="#">Read More</a>
								</div>
							</article>

							<article class="blog-card" data-category="seo">
								<div class="blog-image">
									<img src="./assets/img/blog/5.jpg" alt="">
								</div>

								<div class="blog-content">
									<span class="blog-category">SEO</span>

									<h3>SEO, Social Media & Ads</h3>

									<p>
										Understanding the right marketing mix.
									</p>

									<a href="#">Read More</a>
								</div>
							</article>

							<article class="blog-card" data-category="pos">
								<div class="blog-image">
									<img src="./assets/img/blog/6.jpg" alt="">
								</div>

								<div class="blog-content">
									<span class="blog-category">POS Solutions</span>

									<h3>Top Features to Look for in a Smart POS</h3>

									<p>
										Important features every business should consider.
									</p>

									<a href="#">Read More</a>
								</div>
							</article>

						</div>

						<div class="pagination"></div>

					</div>

					<!-- SIDEBAR -->
					<aside class="blog-sidebar">

						<div class="sidebar-card">
							<h4 class="cat-title">Categories</h4>

							<ul class="category-list">
								<li><a href="#" class="filter-btn active" data-category="all">All Posts</a></li>
								<li><a href="#" class="filter-btn" data-category="web">Web Development</a></li>
								<li><a href="#" class="filter-btn" data-category="seo">SEO</a></li>
								<li><a href="#" class="filter-btn" data-category="marketing">Digital Marketing</a></li>
								<li><a href="#" class="filter-btn" data-category="pos">POS Solutions</a></li>
							</ul>
						</div>

						<div class="sidebar-card subscribe-box">
							<div class="d-flex flex-column align-items-center">
								<img src="./assets/img/bg/email.png" alt="" class="email-img">
							</div>
							<h4 class="cat-title text-center">Stay Ahead with Expert Insights</h4>
							<p class="text-center">Subscribe to our newsletter and get the latest tips, trends, and updates</p>
							<form action="" method="post" id="newsletter-form" class="mt-3">
								<input type="email" placeholder="Enter your email" required>

								<button type="submit">Subscribe</button>	
							</form>
							
						</div>

					</aside>

				</div>

			</div>
		</section>
		<!-- END BLOG PAGE SECTION -->	
		<!-- START CTA SECTION -->	
		<section class="cta-banner-section">

			<div class="container">

				<div class="cta-banner">

					<div class="cta-left">

						<div class="cta-icon">
							<img src="./assets/img/favicon.png" alt="">
						</div>

						<div class="cta-content">

							<h3>
								Ready to Grow Your Business?
							</h3>

							<p>
								Let's build something great together.
							</p>

						</div>

					</div>

					<div class="cta-actions">

						<a href="https://wa.me/94770206960" class="cta-whatsapp">
							<i class="ti ti-brand-whatsapp"></i>
							WhatsApp Us
						</a>

						<a href="#" class="cta-quote">
							Get a Free Quote
						</a>

					</div>

				</div>

			</div>

		</section>			
		<!-- END CTA SECTION -->				
	
		
		<!-- START FOOTER -->
		<?php 
        include "./Includes/footer.php";
        ?>
		<script src="assets/jquery/blog.js"></script>
    </body>
</html>