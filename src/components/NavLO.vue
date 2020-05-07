<template>
  <div>
    <nav
      class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
      id="mainNav"
    >
    <!--                       bar after login                         -->
      <div class="container">
        <!--             link to home page (need fix)              -->
        <a class="navbar-brand js-scroll-trigger" href="/">Hakuna Hotel</a>

        <!-- Test -->
        <!-- <b-button @click="goHome" type="button">Hakuna Hotel {{c}}</b-button> -->
        <p>{{$store.getters.getUser}}</p>

        <!-- ปุ่มอะไรอะ -->
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

            <!-- slide to room -->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="/#room">Room</a>
            </li>

            <!-- slide to services -->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="/#services">Services</a>
            </li>

            <!-- slide to contact -->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="/#contact">Contact</a>
            </li>

            <!-- link to myprofile -->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="myprofile">My account</a>
            </li>

            <!-- link to logout(home page) (need fix) -->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href='/'>Sign out</a>
              <!-- <b-button @click="logout">lo</b-button> -->
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // c:0
    }
  },
  methode:{
    // for logout need fix
    logout(){
      this.$store.dispatch("AcUser",'owo');
    },
    // goHome(){
    //   this.c++;
    //   // console.log('owo');
    //   // this.$router.push("myprofile");
    // }
  }
}
</script>


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
p {
  color: white
}

</style>