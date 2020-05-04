<template>
  <div id="HelloWorld" class="hello">
    <div id="Test">
      <div v-if="check === 0"><NavLogIn /></div>
      <div v-else-if="check === 1"><NavLogOut /></div>
    </div>

    <slide />
  
    <section id="checkavi" style="padding:50px; margin:-350px 50px 50px ">
      <checkavi />
    </section>  

    <section id="weltx" style="padding:50px; margin:-800px auto auto auto; float:center ">
      <weltx />
    </section>  

        <!-- check
login0 -> login -> book(ที่เชคว่างไปแล้ว) -> payment
login1 -> book -> payment -->
  <br><br>

    <section id="room" style="padding:50px; margin-top:300px">
      <roomSec />
    </section>

    <section id="services">
      <serviceSec />
    </section>

    <section id="contact">
      <contactSec />
    </section>

    <!-- เอามาวางตรงนี้ จะเอามาลองง -->
    <a href='booking'> <button>Check available</button> </a>
    <br>
    <button v-on:click="check = 1">Login as customer</button>
    <a href='shome'> <button>Login as staff</button> </a>
    <a href='mhome'> <button>Login as manager</button> </a>

    <!-- Footer -->
    <footer class="py-5" style="background-color:#513f2a;">
      <div class="container">
        <br>
        <p class="m-0 text-center text-white" style="font-size:17px">
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
import weltx from "./Weltext.vue";
import checkavi from "./CheckAvi.vue";
import roomSec from "./RoomSection.vue";
import serviceSec from "./Services.vue";
import contactSec from "./ContactUs.vue";


export default {
  name: "HelloWorld",
  components: {
    NavLogIn,
    NavLogOut,
    slide,
    weltx,
    checkavi,
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
    watch: {
        $route: {
            immediate: true,
            // eslint-disable-next-line no-unused-vars
            handler(to, from) {
                document.title = to.meta.title || 'Hakuna hotel';
            }
        },
    }
};
</script>

<style scoped>
#services{
  background-color:antiquewhite;
}
</style>
