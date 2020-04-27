<template>
  <div id="HelloWorld" class="hello">

    
    <div id='Test'>
      <div v-if='check===0' > <NavLogIn/> </div>
      <div v-else-if='check===1'> <NavLogOut/> </div>
    </div>

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
        </b-carousel-slide>

        <!-- Slides with custom text -->
        <b-carousel-slide
          caption="Welcome to Hakuna Hotel"
          text="Nulla vitae elit libero, a pharetra augue mollis interdum."
          img-src="@/assets/room.home.jpg"
        >
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
<button v-on:click="check=1">LOGIN</button>
     <section id="room" style="padding:50px">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2>Our room type</h2>
            <p class="lead">
              This is a great place to talk about your webpage. This template is
              purposefully unstyled so you can use it as a boilerplate or
              starting point for you own landing page designs! This template
              features:
            </p>
          </div>
        </div>
      </div>
      <!-- room card -->
      <div class="flip-card">
        <div class="flip-card-inner">
          <div class="flip-card-front">
            <img src="@/assets/delux_ub_tw.jpg" alt="DUT" style="width:350px;height:240px;">
          </div>
          <div class="flip-card-back">
            <h1>DELUXE URBAN TWIN BED</h1>
            <p>Architect & Engineer</p>
            <p>We love that guy</p>
          </div>
        </div>
      </div>
    </section>

    <section id="services" class="bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2>Services we offer</h2>
            <p class="lead">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut
              optio velit inventore, expedita quo laboriosam possimus ea
              consequatur vitae, doloribus consequuntur ex. Nemo assumenda
              laborum vel, labore ut velit dignissimos.
            </p>
          </div>
        </div>
      </div>
    </section>

    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <h2>Contact us</h2>
            <p class="lead">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero
              odio fugiat voluptatem dolor, provident officiis, id iusto!
              Obcaecati incidunt, qui nihil beatae magnam et repudiandae ipsa
              exercitationem, in, quo totam.
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">
          Copyright &copy; ปจดตบกจกรร 2020
        </p>
      </div>
      <!-- /.container -->
    </footer>
  </div>
</template>

<script>
import NavLogIn from "./Nav.vue";
import NavLogOut from './NavLO.vue';

export default {
  name: "HelloWorld",
  components:{
    NavLogIn,
    NavLogOut
  },
  props: {
    msg: String,
  },
  data() {
    return {
      slide: 0,
      sliding: null,
      check:0,
    };
  },
  methods: {
    // Convenience method to scroll a heading into view.
    // Not required for scrollspy to work
    scrollIntoView(evt) {
      evt.preventDefault();
      const href = evt.target.getAttribute("href");
      const el = href ? document.querySelector(href) : null;
      if (el) {
        this.$refs.content.scrollTop = el.offsetTop;
      }
    },

  },
};
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



/* flip card */
.flip-card {
  background-color: transparent;
  width: 300px;
  height: 200px;
  border: 1px solid #f1f1f1;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #bbb;
  color: black;
}

/* Style the back side */
.flip-card-back {
  background-color: dodgerblue;
  color: white;
  transform: rotateY(180deg);
}
</style>
