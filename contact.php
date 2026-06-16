<?php


$success_message = "";  
$error_message   = "";  
if (isset($_POST["submit"])) {

    $name     = htmlspecialchars(trim($_POST['name']     ?? ''));
    $email    = htmlspecialchars(trim($_POST['email']    ?? ''));
    $phone    = htmlspecialchars(trim($_POST['phone']    ?? ''));
    $service  = htmlspecialchars(trim($_POST['service']  ?? ''));
    $subject  = htmlspecialchars(trim($_POST['subject']  ?? ''));
    $message  = htmlspecialchars(trim($_POST['message']  ?? ''));

    $to = 'hello@nextedge.lk';

    $body  = "New Contact Form Submission\n";
    $body .= "============================\n";
    $body .= "Name    : $name\n";
    $body .= "Email   : $email\n";
    $body .= "Phone   : $phone\n";
    $body .= "Service : $service\n";
    $body .= "Subject : $subject\n";
    $body .= "\nMessage:\n$message\n";

    $sent = mail($to, "Contact: $subject", $body, "From: $email");

    if ($sent) {
        $success_message = "Thank you, $name! Your message has been sent. We'll get back to you shortly.";
    } else {
        $error_message = "Oops! Something went wrong. Please try again or email us directly.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Include the shared <head> tags (meta, fonts, Bootstrap CSS, etc.) -->
    <?php
    $page_title = "Contact Us";   /* This variable is used by head.php to set the <title> */
    include "./Includes/head.php";
    ?>

    <!-- Our contact-page-specific stylesheet -->
    <link rel="stylesheet" href="assets/css/contact.css">
    <link rel="stylesheet" href="assets/css/common.css">
</head>

<body data-spy="scroll" data-offset="80">

    <?php include "./Includes/preloader.php"; ?>

    <?php include "./Includes/header.php"; ?>

    <section class="contact-hero">

        <!-- Decorative dot patterns (purely visual) -->
        <div class="dot-pattern"></div>
        <div class="dot-pattern-2"></div>

        <div class="container2">
            <div class="row align-items-center">

                <div class="col-lg-6">

                    <span class="contact-badge">Contact Us</span>

                    <h1>
                        Let's Build Something<br>
                        <span>Amazing Together</span>
                    </h1>

                    <!-- Short description -->
                    <p class="hero-desc">
                        We'd love to hear from you! Whether you have a question, need
                        a consultation, or want to discuss your project, our team is
                        ready to help.
                    </p>

                    <!-- 4 info boxes in a 2×2 grid -->
                    <div class="contact-info-grid">

                        <!-- Box 1: Phone -->
                        <div class="contact-info-box">
                            <div class="contact-info-icon">
                                <i class="ti ti-phone"></i>
                            </div>
                            <div>
                                <span class="info-label">Phone</span>
                                <span class="info-value">+94 77 123 4567</span>
                            </div>
                        </div>

                        <!-- Box 2: Email -->
                        <div class="contact-info-box">
                            <div class="contact-info-icon">
                                <i class="ti ti-mail"></i>
                            </div>
                            <div>
                                <span class="info-label">Email</span>
                                <span class="info-value">hello@nextedge.lk</span>
                            </div>
                        </div>

                        <!-- Box 3: Location -->
                        <div class="contact-info-box">
                            <div class="contact-info-icon">
                                <i class="ti ti-map-pin"></i>
                            </div>
                            <div>
                                <span class="info-label">Location</span>
                                <span class="info-value">Colombo, Sri Lanka</span>
                            </div>
                        </div>

                        <!-- Box 4: Business Hours -->
                        <div class="contact-info-box">
                            <div class="contact-info-icon">
                                <i class="ti ti-clock"></i>
                            </div>
                            <div>
                                <span class="info-label">Business Hours</span>
                                <span class="info-value">Mon – Sat: 9 AM – 6 PM</span>
                            </div>
                        </div>

                    </div>

                </div>


     
                <div class="col-lg-6">
                    <div class="contact-hero-visual">

                        <!-- Main large card in the centre -->
                        <div class="float-main-card">

                            <!-- Card title with phone icon -->
                            <div class="fmc-title">
                                <i class="ti ti-phone"></i>
                                Get in Touch
                            </div>

                            <!-- Fake form input lines (decorative) -->
                            <div class="float-input-line"></div>
                            <div class="float-input-line short"></div>
                            <div class="float-input-line"></div>
                            <div class="float-input-line short"></div>
                            <div class="float-input-line"></div>

                            <!-- Fake send button -->
                            <div class="float-send-btn">Send Message &rarr;</div>

                        </div><!-- /float-main-card -->


                        <!-- Floating badge: Email Us (top-right) -->
                        <div class="float-badge badge-email">
                            <div class="fb-icon fb-blue">
                                <i class="ti ti-mail"></i>
                            </div>
                            <div class="fb-text">
                                <span>Email Us</span>
                                <small>hello@nextedge.lk</small>
                            </div>
                        </div>

                        <!-- Floating badge: WhatsApp (bottom-left) -->
                        <div class="float-badge badge-whatsapp">
                            <div class="fb-icon fb-green">
                                <i class="ti ti-brand-whatsapp"></i>
                            </div>
                            <div class="fb-text">
                                <span>WhatsApp</span>
                            </div>
                        </div>

                        <!-- Floating badge: Visit Our Office (bottom-right) -->
                        <div class="float-badge badge-office">
                            <div class="fb-icon fb-orange">
                                <i class="ti ti-map-pin"></i>
                            </div>
                            <div class="fb-text">
                                <span>Visit Our Office</span>
                                <small>Colombo, Sri Lanka</small>
                            </div>
                        </div>

                    </div><!-- /contact-hero-visual -->
                </div><!-- /col-lg-6 right -->

            </div><!-- /row -->
        </div><!-- /container2 -->

    </section>
    <!-- END HERO SECTION -->



    <section class="contact-form-section">
        <div class="container2">

            <div class="row g-4">  

                <div class="col-lg-7">
                    <div class="contact-form-wrapper">

                        <h2>Send Us a Message</h2>
                        <p class="form-subtitle">Fill out the form below and we'll get back to you as soon as possible.</p>

                       
                        <?php if ($success_message): ?>
                            <div class="alert alert-success" role="alert">
                                <?= $success_message ?>
                            </div>
                        <?php endif; ?>

                        <?php if ($error_message): ?>
                            <div class="alert alert-danger" role="alert">
                                <?= $error_message ?>
                            </div>
                        <?php endif; ?>

                        
                        <form method="POST" action="">
                            <div class="row g-3 mb-3">
                                <div class="col-md-6">
                                    <label class="form-label" for="name">Full Name *</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="name"
                                        name="name"
                                        placeholder="e.g. Kasun Perera"
                                        required
                                    >
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label" for="email">Email Address *</label>
                                    <input
                                        type="email"
                                        class="form-control"
                                        id="email"
                                        name="email"
                                        placeholder="you@example.com"
                                        required
                                    >
                                </div>

                            </div><

                            <div class="row g-3 mb-3">

                                <div class="col-md-6">
                                    <label class="form-label" for="phone">Phone Number *</label>
                                    <input
                                        type="tel"
                                        class="form-control"
                                        id="phone"
                                        name="phone"
                                        placeholder="+94 77 000 0000"
                                        required
                                    >
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label" for="service">Service Interested In *</label>
                                    <select class="form-select" id="service" name="service" required>
                                        <option value="" disabled selected>Select a service...</option>
                                        <option value="Web Development">Web Development</option>
                                        <option value="Custom Software">Custom Software</option>
                                        <option value="POS Solutions">POS Solutions</option>
                                        <option value="Digital Marketing">Digital Marketing</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>

                            </div><!-- /row 2 -->
                            <div class="mb-3">
                                <label class="form-label" for="subject">Subject *</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="subject"
                                    name="subject"
                                    placeholder="What is this about?"
                                    required
                                >
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="message">Your Message *</label>
                                <textarea
                                    class="form-control"
                                    id="message"
                                    name="message"
                                    placeholder="Tell us about your project or question..."
                                    required
                                ></textarea>
                            </div>
                            <div class="form-footer">
                                <button type="submit" name="submit" class="btn-send">
                                    Send Message
                                    <i class="ti ti-send"></i>
                                </button>

                                <span class="form-secure-note">
                                    <i class="ti ti-circle-check"></i>
                                    Your information is secure and will never be shared.
                                </span>

                            </div>

                        </form><!-- /form -->

                    </div><!-- /contact-form-wrapper -->
                </div><!-- /col-lg-7 -->
                <div class="col-lg-5">
                    <div class="contact-sidebar">

                        <h3>Get in Touch</h3>
                        <p class="sidebar-subtitle">We're here to help and answer any question you might have.</p>

                        <!-- Phone -->
                        <div class="sidebar-contact-item">
                            <div class="sidebar-icon">
                                <i class="ti ti-phone"></i>
                            </div>
                            <div>
                                <span class="sc-label">Phone</span>
                                <span class="sc-value">+94 77 123 4567</span>
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="sidebar-contact-item">
                            <div class="sidebar-icon">
                                <i class="ti ti-mail"></i>
                            </div>
                            <div>
                                <span class="sc-label">Email</span>
                                <span class="sc-value">hello@nextedge.lk</span>
                            </div>
                        </div>

                        <!-- Location -->
                        <div class="sidebar-contact-item">
                            <div class="sidebar-icon">
                                <i class="ti ti-map-pin"></i>
                            </div>
                            <div>
                                <span class="sc-label">Location</span>
                                <span class="sc-value">Colombo, Sri Lanka</span>
                            </div>
                        </div>

                        <!-- Business Hours -->
                        <div class="sidebar-contact-item">
                            <div class="sidebar-icon">
                                <i class="ti ti-clock"></i>
                            </div>
                            <div>
                                <span class="sc-label">Business Hours</span>
                                <span class="sc-value">Mon – Sat : 9 AM – 6 PM</span>
                            </div>
                        </div>

                        <!-- Horizontal line divider -->
                        <hr class="sidebar-divider">

                        <!-- Social media links -->
                        <p class="sidebar-social-title">Connect With Us</p>
                        <p class="sidebar-social-subtitle">Follow us on social media for updates.</p>

                        <div class="social-icons-row">
                            <a href="#" class="social-icon-btn" target="_blank" title="Facebook">
                                <i class="ti ti-brand-facebook"></i>
                            </a>
                            <a href="#" class="social-icon-btn" target="_blank" title="Instagram">
                                <i class="ti ti-brand-instagram"></i>
                            </a>
                            <a href="#" class="social-icon-btn" target="_blank" title="LinkedIn">
                                <i class="ti ti-brand-linkedin"></i>
                            </a>
                            <a href="mailto:hello@nextedge.lk" class="social-icon-btn" title="Email">
                                <i class="ti ti-mail"></i>
                            </a>
                        </div>

                    </div><!-- /contact-sidebar -->
                </div><!-- /col-lg-5 -->

            </div><!-- /row -->
        </div><!-- /container2 -->
    </section>

    <section class="office-section">
        <div class="container2">

            <div class="row align-items-center g-4">

                <div class="col-lg-5">

                    <h2>Our Office Location</h2>
                    <p>
                        Visit us at our office. We'd love to meet you in person!
                        We're conveniently located in the heart of Colombo.
                    </p>

                    <div class="office-address">
                        <strong>Next Edge (Pvt) Ltd.</strong>
                        <span>Galle Road</span>
                        <span>Colombo 04, Sri Lanka</span>
                    </div>

                </div><!-- /col-lg-5 -->

                <div class="col-lg-7">
                    <div class="map-wrapper">
                        
                        <iframe
                            src="https://maps.google.com/maps?q=Colombo+04,+Sri+Lanka&output=embed"
                            allowfullscreen
                            loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"
                            title="Next Edge Office Location">
                        </iframe>
                    </div>
                </div><!-- /col-lg-7 -->

            </div><!-- /row -->
        </div><!-- /container2 -->
    </section>
    <section class="why-section">
        <div class="container2">

            <span class="section-label">WHY CHOOSE NEXT EDGE</span>
            <h2>We Are Here for Your Success</h2>
            <p class="section-subtitle">We don't just deliver solutions, we build long-term partnerships.</p>
            <div class="row g-4">

                <!-- Card 1: Fast Response -->
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="why-card">
                        <div class="why-icon">
                            <i class="ti ti-bolt"></i>
                        </div>
                        <h4>Fast Response</h4>
                        <p>We respond quickly to all inquiries and ensure you get the information you need.</p>
                    </div>
                </div>

                <!-- Card 2: Expert Consultation -->
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="why-card">
                        <div class="why-icon">
                            <i class="ti ti-users"></i>
                        </div>
                        <h4>Expert Consultation</h4>
                        <p>Our experts are ready to understand your needs and provide the best solutions.</p>
                    </div>
                </div>

                <!-- Card 3: Secure Communication -->
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="why-card">
                        <div class="why-icon">
                            <i class="ti ti-shield-check"></i>
                        </div>
                        <h4>Secure Communication</h4>
                        <p>Your information is safe with us. We follow strict privacy and security policies.</p>
                    </div>
                </div>

                <!-- Card 4: Long-Term Support -->
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="why-card">
                        <div class="why-icon">
                            <i class="ti ti-headset"></i>
                        </div>
                        <h4>Long-Term Support</h4>
                        <p>We're with you even after project delivery to help your business grow.</p>
                    </div>
                </div>

            </div><!-- /row -->
        </div><!-- /container2 -->
    </section>
    <section class="faq-section">
        <div class="container2">

            <h2>Frequently Asked Questions</h2>
            <div class="accordion" id="faqAccordion">

                <!-- Question 1 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="faq1-heading">
                        <button
                            class="accordion-button"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#faq1"
                            aria-expanded="true"
                            aria-controls="faq1">
                            How quickly do you respond to inquiries?
                        </button>
                    </h2>
                    <div id="faq1" class="accordion-collapse collapse show" aria-labelledby="faq1-heading" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            We aim to respond to all inquiries within 24 hours on business days (Monday to Saturday).
                            For urgent matters, you can reach us directly via WhatsApp for a faster response.
                        </div>
                    </div>
                </div>

                <!-- Question 2 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="faq2-heading">
                        <button
                            class="accordion-button collapsed"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#faq2"
                            aria-expanded="false"
                            aria-controls="faq2">
                            Do you provide free quotations?
                        </button>
                    </h2>
                    <div id="faq2" class="accordion-collapse collapse" aria-labelledby="faq2-heading" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Yes! We offer free consultations and quotations for all projects.
                            Simply fill out the contact form above or reach out via WhatsApp,
                            and our team will prepare a detailed proposal for you at no charge.
                        </div>
                    </div>
                </div>

                <!-- Question 3 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="faq3-heading">
                        <button
                            class="accordion-button collapsed"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#faq3"
                            aria-expanded="false"
                            aria-controls="faq3">
                            Can you help with custom software development?
                        </button>
                    </h2>
                    <div id="faq3" class="accordion-collapse collapse" aria-labelledby="faq3-heading" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Absolutely! Custom software is one of our core specialities.
                            We build tailored solutions — from inventory management systems
                            to full web applications — designed specifically for your business needs.
                        </div>
                    </div>
                </div>

                <!-- Question 4 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="faq4-heading">
                        <button
                            class="accordion-button collapsed"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#faq4"
                            aria-expanded="false"
                            aria-controls="faq4">
                            Do you provide support after the project is completed?
                        </button>
                    </h2>
                    <div id="faq4" class="accordion-collapse collapse" aria-labelledby="faq4-heading" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Yes, we believe in long-term partnerships. We provide ongoing support,
                            maintenance, and updates after every project to ensure your solution
                            continues to perform at its best.
                        </div>
                    </div>
                </div>

            </div><!-- /accordion -->
        </div><!-- /container2 -->
    </section>
    <!-- END FAQ SECTION -->
    <section class="cta-banner-section">
        <div class="container">

            <div class="cta-banner">

                <div class="cta-left">
                    <!-- Company logo icon -->
                    <div class="cta-icon">
                        <img src="./assets/img/favicon.png" alt="Next Edge">
                    </div>
                    <!-- Heading + subtext -->
                    <div class="cta-content">
                        <h3>Ready to Grow Your Business?</h3>
                        <p>Let's build something great together.</p>
                    </div>
                </div>

                <!-- Action buttons -->
                <div class="cta-actions">
                    <a href="https://wa.me/94770206960" class="cta-whatsapp" target="_blank">
                        <i class="ti ti-brand-whatsapp"></i>
                        WhatsApp Us
                    </a>
                    <a href="contact.php" class="cta-quote">
                        Get a Free Quote
                    </a>
                </div>

            </div><!-- /cta-banner -->

        </div><!-- /container -->
    </section>
    <!-- END CTA SECTION -->
    <?php include "./Includes/footer.php"; ?>

    <script src="assets/jquery/index.js"></script>

</body>
</html>
