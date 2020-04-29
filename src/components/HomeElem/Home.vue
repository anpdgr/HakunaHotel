<template>
  <div id="HelloWorld" class="hello">
    <div id="Test">
      <div v-if="check === 0"><NavLogIn /></div>
      <div v-else-if="check === 1"><NavLogOut /></div>
    </div>

    <slide />

        <!-- check
login0 -> login -> book(ที่เชคว่างไปแล้ว) -> payment
login1 -> book -> payment -->

    <a href='booking'> <button>Check available</button> </a>
    <br>
    <button v-on:click="check = 1">Login as customer</button>
    <a href='shome'> <button>Login as staff</button> </a>
    <a href='mhome'> <button>Login as manager</button> </a>


    <section id="room" style="padding:50px">
      <roomSec />
    </section>

    <section id="services" class="bg-light">
      <serviceSec />
    </section>

    <section id="contact">
      <contactSec />
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
import NavLogIn from "../Nav.vue";
import NavLogOut from "../NavLO.vue";
import slide from "./SlidePic.vue";
import roomSec from "./RoomSection.vue";
import serviceSec from "./Services.vue";
import contactSec from "./ContactUs.vue";

export default {
  name: "HelloWorld",
  components: {
    NavLogIn,
    NavLogOut,
    slide,
    roomSec,
    serviceSec,
    contactSec,
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
