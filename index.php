<!DOCTYPE html>
<html lang="en">

	<head>
        <?php 
        include "./Includes/head.php";
        ?>	
		<link rel="stylesheet" href="assets/css/index.css">
	</head>
	
    <body data-spy="scroll" data-offset="80">

		<!-- START PRELOADER -->
        <?php 
        include "./Includes/preloader.php";
        ?>

		<!-- END PRELOADER -->		
        <?php 
        include "./Includes/header.php";
        ?>
		<!-- START NAVBAR -->

		<!-- END NAVBAR -->		

		<!-- START HOME -->
        <section class="hero-section">
            <div class="container2">
                <div class="row align-items-center">

                    <!-- LEFT -->
                    <div class="col-lg-6">
                        <span class="hero-badge">Your Growth, Our Solutions</span>

                        <h1>
                            All-in-One Solutions<br>
                            to <span>Grow Your Business</span>
                        </h1>

                        <p>
                            We build powerful websites, custom software, and provide digital 
                            solutions and POS systems to help your business grow smarter and faster.
                        </p>

                        <!-- ICONS -->
                        <div class="hero-icons">
                            <div class="hero-icon-box">
                                <i class="ti ti-world"></i>
                                <span>Web Development</span>
                            </div>

                            <div class="hero-icon-box">
                                <i class="ti ti-device-desktop"></i>
                                <span>POS Solutions</span>
                            </div>

                            <div class="hero-icon-box">
                                <i class="ti ti-code"></i>
                                <span>Custom Software</span>
                            </div>

                            <div class="hero-icon-box">
                                <i class="ti ti-speakerphone"></i>
                                <span>Digital Marketing</span>
                            </div>
                        </div>

                        <!-- BUTTONS -->
                        <div class="hero-buttons">
                            <a href="#" class="btn-primary">Explore Services →</a>
                            <a href="#" class="btn-secondary">View Products</a>
                        </div>
                    </div>

                    <!-- RIGHT -->
                    <div class="col-lg-6 text-center position-relative">

                        <div class="hero-image">
                            <img src="assets/img/bg/pos-mockup.png" alt="">
                        </div>

                        <!-- FLOATING CARD -->
                        <div class="smart-card">
                            <h5>Smart Edge POS</h5>
                            <p>Powerful • Simple • Reliable</p>
                            <a href="#" class="trial-btn">
                                Try 7 Days Free <i class="ti ti-arrow-right"></i>
                            </a>
                        </div>

                    </div>

                </div>
            </div>
        </section>
		<!-- END  HOME -->			

		<!-- START COUNTER -->
        <section class="stats-section">
            <div class="container2">
                <div class="stats-wrapper">

                    <div class="stat-item">
                        <i class="ti ti-users"></i>
                        <div>
                            <h3>250+</h3>
                            <p>Happy Clients</p>
                        </div>
                    </div>

                    <div class="stat-item">
                        <i class="ti ti-checklist"></i>
                        <div>
                            <h3>500+</h3>
                            <p>Projects Completed</p>
                        </div>
                    </div>

                    <div class="stat-item">
                        <i class="ti ti-briefcase"></i>
                        <div>
                            <h3>5+</h3>
                            <p>Years Experience</p>
                        </div>
                    </div>

                    <div class="stat-item">
                        <i class="ti ti-clock"></i>
                        <div>
                            <h3>24/7</h3>
                            <p>Support</p>
                        </div>
                    </div>

                </div>
            </div>
        </section>
		<!-- END COUNTER -->

		<!-- START services -->
		<section class="services-section section-padding bg-section">
			<div class="container2">

				<div class="section-title text-center">
					<span class="subtitle">WHAT WE DO</span>
					<h2>Our Services</h2>
					<p>End-to-end digital solutions to take your business to the next level.</p>
				</div>
				<div class="ps-relative">
					<div class="swiper services-slider">
						<div class="swiper-wrapper">

							<!-- Service 1 -->
							<div class="swiper-slide">
								<div class="service-card">
									<div class="service-image">
										<img src="assets/img/Services/web-development.png" alt="">
									</div>
									<h3>Web Development</h3>
									<p>
										Responsive, fast, and modern websites that convert visitors into customers.
									</p>
									<a href="#">View Packages <i class="ti-arrow-right"></i></a>
								</div>
							</div>

							<!-- Service 2 -->
							<div class="swiper-slide">
								<div class="service-card">
									<div class="service-image">
										<img src="assets/img/Services/custom-software.png" alt="">
									</div>
									<h3>Custom Software</h3>
									<p>
										Tailored software solutions to automate and grow your business.
									</p>
									<a href="#">View Packages <i class="ti-arrow-right"></i></a>
								</div>
							</div>

							<!-- Service 3 -->
							<div class="swiper-slide">
								<div class="service-card">
									<div class="service-image">
										<img src="assets/img/Services/pos.png" alt="">
									</div>
									<h3>POS Solutions</h3>
									<p>
										Complete POS systems and billing solutions for your business.
									</p>
									<a href="#">View Packages <i class="ti-arrow-right"></i></a>
								</div>
							</div>

							<!-- Service 4 -->
							<div class="swiper-slide">
								<div class="service-card">
									<div class="service-image">
										<img src="assets/img/Services/digital-marketing.png" alt="">
									</div>
									<h3>Digital Marketing</h3>
									<p>
										SEO, Social Media, Ads & Content strategies that deliver results.
									</p>
									<a href="#">View Packages <i class="ti-arrow-right"></i></a>
								</div>
							</div>

							<!-- Service 5 -->
							<div class="swiper-slide">
								<div class="service-card">
									<div class="service-image">
										<img src="assets/img/Services/mobile-app.png" alt="">
									</div>
									<h3>Mobile Apps</h3>
									<p>
										Android and iOS applications designed for growth and engagement.
									</p>
									<a href="#">View Packages <i class="ti-arrow-right"></i></a>
								</div>
							</div>

						</div>

						<div class="swiper-pagination"></div>
					</div>	
					<div class="testimonials-arrow-prev">
						<i class="ti ti-chevron-left"></i>
					</div>

					<div class="testimonials-arrow-next">
						<i class="ti ti-chevron-right"></i>
					</div>
				</div>
				

				<div class="text-center mt-5">
					<a href="#" class="view-services-btn">
						View All Services
					</a>
				</div>

			</div>
		</section>
		<!-- END SERVICES -->		
		
		<!-- START PRODUCTS SECTION -->
		<section class="products-section section-padding">
			<div class="container2">

				<div class="row align-items-center">

					<!-- Left Content -->
					<div class="col-lg-3">
						<div class="products-content">

							<span class="product-subtitle">
								OUR PRODUCTS
							</span>

							<h2>
								High Quality POS Products for Your Business
							</h2>

							<p>
								We provide reliable and high-performance POS hardware
								to simplify your operations.
							</p>

							<a href="#" class="view-products-btn">
								View All Products
								<i class="ti-shopping-cart"></i>
							</a>

						</div>
					</div>

					<!-- Right Slider -->
					<div class="col-lg-9 ps-relative">

						<div class="swiper products-slider">

							<div class="swiper-wrapper">

								<!-- Product -->
								<div class="swiper-slide">
									<div class="product-card">

										<div class="product-image">
											<img src="assets/img/Products/printer.png" alt="">
										</div>

										<h3 class="product-title" title="Thermal Receipt Printer">
											<a href="">Thermal Receipt Printer</a>
										</h3>

										<p class="product-desc">
											High speed printing
										</p>

										<div class="product-price">
											Rs. 25,000
										</div>

										<a href="#" class="enquire-btn  mb-3">
											Enquire Now
										</a>

									</div>
								</div>
								<!-- Product -->
								<div class="swiper-slide">
									<div class="product-card">

										<div class="product-image">
											<img src="assets/img/Products/printer.png" alt="">
										</div>

										<h3 class="product-title" title="Thermal Receipt Printer">
											<a href="">Thermal Receipt Printer</a>
										</h3>

										<p class="product-desc">
											High speed printing
										</p>

										<div class="product-price">
											Rs. 25,000
										</div>

										<a href="#" class="enquire-btn  mb-3">
											Enquire Now
										</a>

									</div>
								</div>
								<!-- Product -->
								<div class="swiper-slide">
									<div class="product-card">

										<div class="product-image">
											<img src="assets/img/Products/pos-machine.png" alt="">
										</div>

										<h3 class="product-title" title="Android POS Billing Machine">
											<a href="">Android POS Billing Machine</a>
										</h3>

										<p class="product-desc">
											All-in-one billing solution
										</p>

										<div class="product-price">
											Rs. 85,000
										</div>

										<a href="#" class="enquire-btn  mb-3">
											Enquire Now
										</a>

									</div>
								</div>
								<!-- Product -->
								<div class="swiper-slide">
									<div class="product-card">

										<div class="product-image">
											<img src="assets/img/Products/scanner.png" alt="">
										</div>

										<h3 class="product-title" title="Wireless Barcode Scanner with Long Name">
											<a href="">Wireless Barcode Scanner with Long Name</a>
										</h3>

										<p class="product-desc">
											1D & 2D scanning
										</p>

										<div class="product-price">
											Rs. 12,500
										</div>

										<a href="#" class="enquire-btn  mb-3">
											Enquire Now
										</a>

									</div>
								</div>
								<!-- Product -->
								<div class="swiper-slide">
									<div class="product-card">

										<div class="product-image">
											<img src="assets/img/Products/cash-drawer.png" alt="">
										</div>

										<h3 class="product-title" title="Heavy Duty Cash Drawer">
											<a href="">Heavy Duty Cash Drawer</a>
										</h3>

										<p class="product-desc">
											Secure cash management
										</p>

										<div class="product-price">
											Rs. 15,000
										</div>

										<a href="#" class="enquire-btn  mb-3">
											Enquire Now
										</a>

									</div>
								</div>
							</div>

							<div class="swiper-pagination"></div>

						</div>
						

						<div class="testimonials-arrow-prev">
							<i class="ti ti-chevron-left"></i>
						</div>

						<div class="testimonials-arrow-next">
							<i class="ti ti-chevron-right"></i>
						</div>

					</div>

				</div>

			</div>
		</section>
		<!-- END PRODUCTS SECTION -->	
		<!-- START BANNER SECTION -->	
		 <section class="smart-edge-banner">
			<div class="container2">

				<div class="banner-wrapper">

					<!-- Left Content -->
					<div class="banner-content">

						<span class="banner-subtitle">
							Smart Edge POS Software
						</span>

						<h2>
							The Smarter Way to <br>
							Manage Your Business
						</h2>

						<div class="banner-features">

							<div class="feature-item">
								<i class="ti ti-check"></i>
								Easy Billing & Invoicing
							</div>

							<div class="feature-item">
								<i class="ti ti-check"></i>
								Multi-Store Management
							</div>

							<div class="feature-item">
								<i class="ti ti-check"></i>
								Inventory Management
							</div>

							<div class="feature-item">
								<i class="ti ti-check"></i>
								User Management
							</div>

							<div class="feature-item">
								<i class="ti ti-check"></i>
								Sales & Purchase Reports
							</div>

							<div class="feature-item">
								<i class="ti ti-check"></i>
								And Much More...
							</div>

						</div>

					</div>

					<!-- Center Image -->
					<div class="banner-image">
						<img src="assets/img/Banner/smart-edge-dashboard.png" alt="Smart Edge POS">
					</div>

					<!-- Right CTA -->
					<div class="banner-cta">

						<h4>
							Try Smart Edge POS
						</h4>

						<h3>
							7 Days Free Trial
						</h3>

						<p>
							Full access. No credit card required.
						</p>

						<a href="#" class="trial-btn">
							Start Free Trial
							<i class="ti ti-arrow-right"></i>
						</a>

					</div>

				</div>

			</div>
		</section>
		<!-- END BANNER SECTION -->				
		<!-- START TESTIMONIAL SECTION -->	
		<section class="testimonials-section section-padding">
			<div class="container2">

				<div class="row align-items-center">

					<!-- Left Content -->
					<div class="col-lg-2">

						<div class="testimonial-heading">

							<span class="testimonial-subtitle">
								OUR CLIENTS
							</span>

							<h2>
								Trusted by Businesses
							</h2>

						</div>

					</div>

					<!-- Slider -->
					<div class="col-lg-10 ps-relative">

						<div class="swiper testimonials-slider">

							<div class="swiper-wrapper">

								<!-- Testimonial -->
								<div class="swiper-slide">
									<div class="testimonial-card">

										<div class="testimonial-stars">
											★★★★★
										</div>

										<p class="testimonial-text"
										title="Next Edge delivered a website that perfectly represents our brand. Great team, professional communication and excellent support throughout the project.">
											Next Edge delivered a website that perfectly represents our brand. Great team, professional communication and excellent support throughout the project.
										</p>

										<div class="testimonial-user">

											<div class="testimonial-avatar">
												<img src="assets/img/testimonial/1.png" alt="">
											</div>

											<div class="testimonial-info">
												<h4 title="Sahan Perera">Sahan Perera</h4>
												<span title="CEO, Tech Solutions">CEO, Tech Solutions</span>
											</div>

										</div>

									</div>
								</div>

								<!-- Testimonial -->
								<div class="swiper-slide">
									<div class="testimonial-card">

										<div class="testimonial-stars">
											★★★★★
										</div>

										<p class="testimonial-text"
										title="The POS system improved our billing speed and accuracy. Highly recommended.">
											The POS system improved our billing speed and accuracy. Highly recommended.
										</p>

										<div class="testimonial-user">

											<div class="testimonial-avatar">
												<img src="assets/img/testimonial/2.png" alt="">
											</div>

											<div class="testimonial-info">
												<h4 title="Nimal Fernando">Nimal Fernando</h4>
												<span title="Manager, Retail Mart">Manager, Retail Mart</span>
											</div>

										</div>

									</div>
								</div>

								<!-- Testimonial -->
								<div class="swiper-slide">
									<div class="testimonial-card">

										<div class="testimonial-stars">
											★★★★★
										</div>

										<p class="testimonial-text"
										title="Digital marketing services from Next Edge increased our online sales significantly and helped us reach new customers.">
											Digital marketing services from Next Edge increased our online sales significantly and helped us reach new customers.
										</p>

										<div class="testimonial-user">

											<div class="testimonial-avatar">
												<img src="assets/img/testimonial/3.png" alt="">
											</div>

											<div class="testimonial-info">
												<h4 title="Thanushi Weerasinghe">Thanushi Weerasinghe</h4>
												<span title="Marketing Head, Fashion Hub">Marketing Head, Fashion Hub</span>
											</div>

										</div>

									</div>
								</div>

								<!-- Testimonial -->
								<div class="swiper-slide">
									<div class="testimonial-card">

										<div class="testimonial-stars">
											★★★★★
										</div>

										<p class="testimonial-text"
										title="Next Edge delivered a website that perfectly represents our brand. Great team, professional communication and excellent support throughout the project.">
											Next Edge delivered a website that perfectly represents our brand. Great team, professional communication and excellent support throughout the project.
										</p>

										<div class="testimonial-user">

											<div class="testimonial-avatar">
												<img src="assets/img/testimonial/4.png" alt="">
											</div>

											<div class="testimonial-info">
												<h4 title="Sahan Perera">Sahan Perera</h4>
												<span title="CEO, Tech Solutions">CEO, Tech Solutions</span>
											</div>

										</div>

									</div>
								</div>

								<!-- Testimonial -->
								<div class="swiper-slide">
									<div class="testimonial-card">

										<div class="testimonial-stars">
											★★★★★
										</div>

										<p class="testimonial-text"
										title="The POS system improved our billing speed and accuracy. Highly recommended.">
											The POS system improved our billing speed and accuracy. Highly recommended.
										</p>

										<div class="testimonial-user">

											<div class="testimonial-avatar">
												<img src="assets/img/testimonial/5.png" alt="">
											</div>

											<div class="testimonial-info">
												<h4 title="Nimal Fernando">Nimal Fernando</h4>
												<span title="Manager, Retail Mart">Manager, Retail Mart</span>
											</div>

										</div>

									</div>
								</div>

								<!-- Testimonial -->
								<div class="swiper-slide">
									<div class="testimonial-card">

										<div class="testimonial-stars">
											★★★★★
										</div>

										<p class="testimonial-text"
										title="Digital marketing services from Next Edge increased our online sales significantly and helped us reach new customers.">
											Digital marketing services from Next Edge increased our online sales significantly and helped us reach new customers.
										</p>

										<div class="testimonial-user">

											<div class="testimonial-avatar">
												<img src="assets/img/testimonial/3.png" alt="">
											</div>

											<div class="testimonial-info">
												<h4 title="Thanushi Weerasinghe">Thanushi Weerasinghe</h4>
												<span title="Marketing Head, Fashion Hub">Marketing Head, Fashion Hub</span>
											</div>

										</div>

									</div>
								</div>

							</div>

							<div class="swiper-pagination"></div>

						</div>
						

						<div class="testimonials-arrow-prev">
							<i class="ti ti-chevron-left"></i>
						</div>

						<div class="testimonials-arrow-next">
							<i class="ti ti-chevron-right"></i>
						</div>
					</div>

				</div>

			</div>
		</section>			
		<!-- END TESTIMONIAL SECTION -->				
		<!-- START BLOG SECTION -->		
		<section class="blogs-section section-padding">

			<div class="container">

				<div class="blogs-header">

					<div>
						<span class="blog-subtitle">
							FROM OUR BLOG
						</span>

						<h2>
							Latest Insights & Tips
						</h2>
					</div>

					<a href="#" class="view-blogs-btn">
						View All Blogs
						<i class="ti ti-arrow-right"></i>
					</a>

				</div>

				<div class="blog-slider-wrapper">

					<div class="swiper blogs-slider">

						<div class="swiper-wrapper">

							<!-- Blog -->
							<div class="swiper-slide">

								<div class="blog-card">

									<div class="blog-image">
										<img src="assets/img/blog/1.jpg" alt="">
									</div>

									<div class="blog-content">

										<div class="blog-meta">
											<span>Web Development</span>
											<span>May 20, 2024</span>
										</div>

										<h3 class="blog-title custom-tooltip"
											title="10 Best Practices for a High Converting Website">
											10 Best Practices for a High Converting Website
										</h3>

										<a href="#" class="blog-readmore">
											Read More
											<i class="ti ti-arrow-right"></i>
										</a>

									</div>

								</div>

							</div>

							<!-- Duplicate More Blogs -->

							<div class="swiper-slide">
								<div class="blog-card">

									<div class="blog-image">
										<img src="assets/img/blog/2.jpg" alt="">
									</div>

									<div class="blog-content">

										<div class="blog-meta">
											<span>Digital Marketing</span>
											<span>May 19, 2024</span>
										</div>

										<h3 class="blog-title custom-tooltip"
											title="How SEO Friendly Content Drives More Traffic To Your Website">
											How SEO Friendly Content Drives More Traffic To Your Website
										</h3>

										<a href="#" class="blog-readmore">
											Read More
											<i class="ti ti-arrow-right"></i>
										</a>

									</div>

								</div>
							</div>

							<div class="swiper-slide">
								<div class="blog-card">

									<div class="blog-image">
										<img src="assets/img/blog/3.jpg" alt="">
									</div>

									<div class="blog-content">

										<div class="blog-meta">
											<span>POS Solutions</span>
											<span>May 15, 2024</span>
										</div>

										<h3 class="blog-title custom-tooltip"
											title="How POS Systems Improve Business Efficiency">
											How POS Systems Improve Business Efficiency
										</h3>

										<a href="#" class="blog-readmore">
											Read More
											<i class="ti ti-arrow-right"></i>
										</a>

									</div>

								</div>
							</div>

							<div class="swiper-slide">
								<div class="blog-card">

									<div class="blog-image">
										<img src="assets/img/blog/4.jpg" alt="">
									</div>

									<div class="blog-content">

										<div class="blog-meta">
											<span>Business Tips</span>
											<span>May 10, 2024</span>
										</div>

										<h3 class="blog-title custom-tooltip"
											title="5 Ways to Grow Your Small Business in 2024">
											5 Ways to Grow Your Small Business in 2024
										</h3>

										<a href="#" class="blog-readmore">
											Read More
											<i class="ti ti-arrow-right"></i>
										</a>

									</div>

								</div>
							</div>
							<div class="swiper-slide">
								<div class="blog-card">

									<div class="blog-image">
										<img src="assets/img/blog/4.jpg" alt="">
									</div>

									<div class="blog-content">

										<div class="blog-meta">
											<span>Business Tips</span>
											<span>May 10, 2024</span>
										</div>

										<h3 class="blog-title custom-tooltip"
											title="5 Ways to Grow Your Small Business in 2024">
											5 Ways to Grow Your Small Business in 2024
										</h3>

										<a href="#" class="blog-readmore">
											Read More
											<i class="ti ti-arrow-right"></i>
										</a>

									</div>

								</div>
							</div>

						</div>

					</div>

					<div class="blog-arrow-prev">
						<i class="ti ti-chevron-left"></i>
					</div>

					<div class="blog-arrow-next">
						<i class="ti ti-chevron-right"></i>
					</div>

				</div>

			</div>

		</section>		
		<!-- END BLOG SECTION -->				
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
		<script src="assets/jquery/index.js"></script>
    </body>
</html>