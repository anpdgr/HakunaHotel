<template>
  <div class="hello">
    <div>
    <b-carousel
      id="carousel-1"
      v-model="slide"
      :interval="4000"
      controls
      indicators
      background="#ababab"
      img-width="1024"
      img-height="480"
      style="text-shadow: 1px 1px 2px #333;"
    >
      <!-- Text slides with image -->

      <b-carousel-slide
        caption="Welcome to Hakuna Hotel"
        text="Nulla vitae elit libero, a pharetra augue mollis interdum."
        img-src="@/assets/hotel.home.jpg"
      >
      <h1 class="header-intro text-uppercase font-josefin-light pt-md-4 pb-md-3 aos-init aos-animate" data-aos-offset="100" data-aos="fade-up" data-aos-duration="500" data-aos-delay="100" style="padding: 300px">Welcome to<br>Hakuna Hotel</h1>
      </b-carousel-slide>

      <!-- Slides with custom text -->
      <b-carousel-slide
        caption="Welcome to Hakuna Hotel"
        text="Nulla vitae elit libero, a pharetra augue mollis interdum."
        img-src="@/assets/room.home.jpg"
      >
      <b-icon icon="alarm-fill"></b-icon>
      </b-carousel-slide>

      <!-- Slides with image only -->
        <b-carousel-slide
        caption="Welcome to Hakuna Hotel"
        text="Nulla vitae elit libero, a pharetra augue mollis interdum."
        img-src="@/assets/food.home.jpg"
      >
      </b-carousel-slide>    
    </b-carousel>
  </div>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Hakuna Hotel</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#room">Room</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#services">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger">Register</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" to="/Login">Login</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

  <section id="room">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Our room type</h2>
          <p class="lead">This is a great place to talk about your webpage. This template is purposefully unstyled so you can use it as a boilerplate or starting point for you own landing page designs! This template features:</p>
        </div>
      </div>
    </div>
  </section>

  <section id="services" class="bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Services we offer</h2>
          <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut optio velit inventore, expedita quo laboriosam possimus ea consequatur vitae, doloribus consequuntur ex. Nemo assumenda laborum vel, labore ut velit dignissimos.</p>
        </div>
      </div>
    </div>
  </section>

  <section id="contact">
    <div class="container">
                <div class="row py-3 py-md-5">
                    <div class="col-12 col-lg-12 py-4 pb-md-5 pt-md-0 text-center">
                        <h4 class="title mb-0">Don’t miss our secret offer!</h4>
                        <p class="word">Only available for booking direct on the hotel website.</p>
                    </div>
                    <div class="col-12 col-lg block py-3">
                                        <div id="social">
                    <div class="bubble"><a class="tw" target="_blank" href="https://twitter.com"><i class="icon fab fa-twitter" aria-hidden="true"></i></a></div>
                    <!-- <div class="bubble"><a class="yt" target="_blank" href="#"><i class="icon fab fa-youtube" aria-hidden="true"></i></a></div> -->
                    <div class="bubble"><a class="ig" target="_blank" href="https://www.instagram.com"><i class="icon fab fa-instagram" aria-hidden="true"></i></a></div>
                    <div class="bubble"><a class="fb" target="_blank" href="http://facebook.com"><i class="icon fab fa-facebook-f" aria-hidden="true"></i></a></div>
                    <div class="bubble"><a class="ta" target="_blank" href="https://www.tripadvisor.com"><i class="icon fab fa-tripadvisor" aria-hidden="true"></i></a></div>
                </div>                    </div>
                    <div class="col-12 col-lg-2 block py-3">
                        <div class="d-flex align-items-top">
                            <i class="icon-contact rotate fas fa-phone" aria-hidden="true"></i>
                            <div class="content">
                                <span class="title">TELEPHONE<br></span>
                                <span class="detail"><a href="tel:+66555555555">+66555555555</a></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg block py-3">
                        <div class="d-flex align-items-top">
                            <i class="icon-contact far fa-envelope" aria-hidden="true"></i>
                            <div class="content">
                                <span class="title">EMAIL<br></span>
                                <span class="detail"><a href="https://mail.google.com/">info@hakunahotel.com</a></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg block py-3">
                        <div class="d-flex align-items-top">
                            <i class="icon-contact fas fa-map-marker-alt" aria-hidden="true"></i>
                            <div class="content">
                                <span class="title">ADDRESS<br></span>
                                <span class="detail"><a target="_blank" href="https://www.google.co.th/maps/place/King+Mongkut%E2%80%99s+University+of+Technology+Thonburi/@13.6493767,100.4906678,17z/data=!3m1!4b1!4m5!3m4!1s0x30e2a251bb6b0cf1:0xf656e94ff13324ad!8m2!3d13.6493767!4d100.4928565">400/400 Moo 4A Thanon Road, City, Bangkok 10600 Thailand</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
  </section>

  

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; ปจดตบกจกรร 2020</p>
    </div>
    <!-- /.container -->
  </footer>



  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data() {
      return {
        slide: 0,
        sliding: null
      }
    },
  methods: {
      // Convenience method to scroll a heading into view.
      // Not required for scrollspy to work
      scrollIntoView(evt) {
        evt.preventDefault()
        const href = evt.target.getAttribute('href')
        const el = href ? document.querySelector(href) : null
        if (el) {
          this.$refs.content.scrollTop = el.offsetTop
        }
      }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
