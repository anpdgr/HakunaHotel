<template>
  <div>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">

     <!--                       bar after login                         -->
      <div class="container">
         <!--             link to home page               -->
        <button id="btn" class="navbar-brand js-scroll-trigger" @click="home">Hakuna Hotel</button>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarResponsive"
          aria-controls="navbarResponsive"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">

            <!-- slide to room   !!Can't use!!-->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="room">Room</button>
            </li>

            <!-- slide to services   !!Can't use!!-->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="sv">Services</button>
            </li>
            
            <!-- slide to contact   !!Can't use!!-->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="ct">Contact</button>
            </li>

            <!-- link to my profile -->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="myprofile">{{$store.getters.getUser}}</button>
            </li>
            
            <!-- Sign out -->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="logout">Sign out</button>
            </li>

          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>

<style scoped>
#mainNav {
  padding: 15px 16px;
}
#btn {
  border: none;
  background-color: transparent;
  padding: 0px;
  font-size: 16px;
  cursor: pointer;
  display: inline-block;
}
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


<script>
export default {
  // auto event เมื่อเรียกใช้หน้า login
  mounted() {
    this.anchorHashCheck();
  },
   methods:{
    //  ทำไรง่ะ
      anchorHashCheck() {
      if (window.location.hash === this.$route.hash) {
        const el = document.getElementById(this.$route.hash.slice(1));
        if (el) {
          window.scrollTo(0, el.offsetTop);
        }
      }
    },
    logout() {
      this.makeToast('success','you already sign out');
      setTimeout(() => {
        this.$store.dispatch("AcUser", null);
        this.home();
      }, 1500);
    },
    room() {
      this.$router.push("/#room");
    },
    sv() {
      this.$router.push("/#services");
    },
    ct() {
      this.$router.push("/#contact");
    },
    myprofile() {
      this.$router.push("/myprofile");
    },
    home() {
      this.$router.push("/");
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
      });
    },
  }
};
</script>