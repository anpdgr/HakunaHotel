<template>
  <div>
    <nav
      class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
      id="mainNav"
    >
      <div class="container">
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
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="booktus">Hotel status</button>
            </li>
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="account">My account</button>
            </li>

            <li class="nav-item">
              <button id="btn" v-on:click="check=0" class="nav-link js-scroll-trigger" @click="home">Sign out</button>
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
  color: #42b983;
}
</style>

<script>
export default {
   methods:{
        booktus(){
          this.$router.push('bookstatus')
       },
        home(){
          this.$router.push('/')
       },
        account(){
          this.$router.push('mhome')
       },
       
   }
}
</script>