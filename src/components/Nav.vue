<template>
  <div id="body">
    <nav
      class="navbar navbar-expand-lg fixed-top"
      id="mainNav"
    >
      <div class="container">
        <button id="btn" class="navbar-brand js-scroll-trigger"  @click="home">Hakuna Hotel</button>
        <p>{{$store.getters.getUser}}</p>
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
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger"  @click="room">Room</button>
            </li>
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger"  @click="service"
                >Services</button
              >
            </li>
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger"  @click="contact">Contact</button>
            </li>
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger"  @click="regis">Sign up</button>
            </li>
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