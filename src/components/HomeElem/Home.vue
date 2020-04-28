<template>
  <div id="HelloWorld" class="hello">
    <div id="Test">
      <div v-if="check === 0"><NavLogIn /></div>
      <div v-else-if="check === 1"><NavLogOut /></div>
    </div>

    <slide />

    <button v-on:click="check = 1">LOGIN</button>

    <section id="room" style="padding:50px">
      <roomSec />
    </section>

    <section id="services" class="bg-light">
      <service />
    </section>

    <section id="contact">
      <contact />
    </section>

    <!-- check
login0 -> login -> book(ที่เชคว่างไปแล้ว) -> payment
login1 -> book -> payment -->

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
import NavLogIn from "../Nav.vue";
import NavLogOut from "../NavLO.vue";
import slide from "./SlidePic.vue";
import roomSec from "./RoomSection.vue";
import service from "./Services.vue";
import contact from "./ContactUs.vue";

export default {
  name: "HelloWorld",
  components: {
    NavLogIn,
    NavLogOut,
    slide,
    roomSec,
    service,
    contact,
  },
  props: {
    msg: String,
  },
  data() {
    return {
      slide: 0,
      sliding: null,
      check: 0,
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
    Link(path) {
      this.$router.push(path);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
