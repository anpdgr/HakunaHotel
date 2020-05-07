<template>
  <div id="body">
    <nav
      class="navbar navbar-expand-lg fixed-top"
      id="mainNav"
    >
    <!--                       bar before login                         -->
      <div class="container">
<<<<<<< HEAD
        <button id="btn" class="navbar-brand js-scroll-trigger"  @click="home">Hakuna Hotel</button>
=======
        <!--             link to home page (need fix)                   -->
        <a class="navbar-brand js-scroll-trigger" href="/">Hakuna Hotel</a>
        <!-- just show global state -->
>>>>>>> a7f4cf5ffc5df0fec6fe5799f1887f207fde137b
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
              <button id="btn" class="nav-link js-scroll-trigger"  @click="room">Room</button>
            </li>

            <!-- slide to services -->
            <li class="nav-item">
<<<<<<< HEAD
              <button id="btn" class="nav-link js-scroll-trigger"  @click="service"
                >Services</button
              >
=======
              <a class="nav-link js-scroll-trigger" href="/#services">Services</a>
>>>>>>> a7f4cf5ffc5df0fec6fe5799f1887f207fde137b
            </li>

            <!-- slide to contact -->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger"  @click="contact">Contact</button>
            </li>

            <!-- link to register form -->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger"  @click="regis">Sign up</button>
            </li>

            <!-- link to login -->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger"  @click="login">Sign in</button>
            </li>
            
          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>

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
  color:white;
}
#mainNav{
  background-color:#513f2a;
}
</style>

<script>
export default {
   methods:{
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

       regis(){
          this.$router.push('register')
       },
       login(){
          this.$router.push('login')
       },
       
   }
}
</script>