<template>
  <!-- Home page -->
  <div id="Home" class="hello">
    
    <div id="Test">
      <!-- <div v-if="check === 0"><NavLogIn /></div>
      <div v-else-if="check === 1"><NavLogOut /></div> -->


      <!--                          Bar                              -->
      <!-- before login -->
      <div v-if="$store.getters.getUser == null"><NavLogIn /></div>
      <!-- after  login -->
      <div v-else-if="$store.getters.getUser != null && $store.getters.getIsS == false"><NavLogOut /></div>

      <!-- login as staff -->
      <div v-else-if="$store.getters.getUser != null && $store.getters.getIsS == true"><stNav /></div>

      <!-- && $store.getters.getIsS == false -->
    </div>

    <!-- use component slide -->
    <slide />
  
    <!-- use component checkavi -->
    <section id="checkavi" style="padding:50px; margin:-350px 50px 50px ">
      <checkavi />
    </section>  

    <!-- use component weltx -->
    <section id="weltx" style="padding:50px; margin:-800px auto auto auto; float:center ">
      <weltx />
    </section>  

        <!--                  check
        login0 -> no user -> regis -> login -> book -> payment
        login0 -> login -> book(ที่เชคว่างไปแล้ว) -> payment
        login1 -> book -> payment -->
  <br><br>

    <!-- use component roomSec -->
    <section id="room" style="padding:50px; margin-top:300px">
      <roomSec />
    </section>

    <!-- use component serviceSec -->
    <section id="services">
      <serviceSec />
    </section>

    <!-- use component contactSec -->
    <section id="contact">
      <contactSec />
    </section>


    <!--           Test button login each users         -->
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
// import components
import NavLogIn from "../Nav.vue";//+
import NavLogOut from "../NavLO.vue";//+
import slide from "./SlidePic.vue";//+
import weltx from "./Weltext.vue";//+
import checkavi from "./CheckAvi.vue";//+
import roomSec from "./RoomSection.vue";//+
import serviceSec from "./Services.vue";//+
import contactSec from "./ContactUs.vue";//+
import stNav from '../Nav_st.vue'



export default {
  name: "Home",
  components: {
    NavLogIn,
    NavLogOut,
    slide,
    weltx,
    checkavi,
    roomSec,
    serviceSec,
    contactSec,
    stNav,
  },
  props: {
    msg: String,
  },
  data() {
    return {
      // ???? same component name
      // slide: 0,
      // didn't use
      sliding: null,
      // just action in button
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
