<template>
  <div id='HelloWorld' class="hello">
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
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Contact us</h2>
          <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero odio fugiat voluptatem dolor, provident officiis, id iusto! Obcaecati incidunt, qui nihil beatae magnam et repudiandae ipsa exercitationem, in, quo totam.</p>
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
