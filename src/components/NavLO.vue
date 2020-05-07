<template>
  <div>
    <nav
      class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
      id="mainNav"
    >
    <!--                       bar after login                         -->
      <div class="container">
        <button id="btn"  class="navbar-brand js-scroll-trigger" @click="home">Hakuna Hotel</button>
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
              <button id="btn"  class="nav-link js-scroll-trigger" href="/room">Room</button>
            </li>

            <!-- slide to services -->
            <li class="nav-item">
              <button id="btn"  class="nav-link js-scroll-trigger" @click="service"
                >Services</button
              >
            </li>

            <!-- slide to contact -->
            <li class="nav-item">
              <button id="btn"  class="nav-link js-scroll-trigger" href="/contact">Contact</button>
            </li>

            <!-- link to myprofile -->
            <li class="nav-item">
              <button id="btn"  class="nav-link js-scroll-trigger" @click="account">My account</button>
            </li>

            <!-- link to logout(home page) (need fix) -->
            <li class="nav-item">
              <button id="btn"  class="nav-link js-scroll-trigger" @click="home">Sign out</button>
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
      room(){
          this.$router.push('room')
       },
        home(){
          this.$router.push('/')
       },
        service(){
          this.$router.push('service')
       },
       contact(){
          this.$router.push('contact')
       },

       account(){
          this.$router.push('myprofile')
       },

  }
}
</script>


<style scoped>
#btn {
  border: none;
  background-color:transparent;
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
p {
  color: white
}

</style>