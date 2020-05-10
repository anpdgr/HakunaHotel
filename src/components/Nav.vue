<template>
  <div id="body">
    <nav class="navbar navbar-expand-lg fixed-top" id="mainNav">

      <!--                       bar before login                         -->
      <div class="container">

        <!-- Home -->
        <button id="btn" class="navbar-brand js-scroll-trigger" @click="home">Hakuna Hotel</button>
        <!-- just show global state
        <p>{{$store.getters.getUser}}</p> -->

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

            <!-- slide to room  !!Can't use!!-->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#room">Room</a>
              <!-- <button id="btn" class="nav-link js-scroll-trigger" @click="room">Room</button> -->
            </li>


            <!-- slide to services  !!Can't use!!-->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#services">Services</a>
              <!-- <button id="btn" class="nav-link js-scroll-trigger" @click="sv">Services</button> -->
            </li>

            <!-- slide to contact   !!Can't use!!-->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
              <!-- <button id="btn" class="nav-link js-scroll-trigger" @click="ct">Contact</button> -->
            </li>

            <!-- link to register form -->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="regis">Sign up</button>
            </li>

            <!-- link to login -->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="login">Sign in</button>
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
  background-color: transparent;
  padding: 0px;
  font-size: 16px;
  cursor: pointer;
  display: inline-block;
  color: white;
  margin-top: 8px;
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
  color: white;
}
#mainNav {
  background-color: #513f2a;
}
</style>

<script>
export default {
  methods: {
    room() {
      this.$router.push("/#room");
    },
    sv() {
      this.$router.push("/#services");
    },
    ct() {
      this.$router.push("/#contact");
    },
    home() {
      this.$router.push("/");
    },
    regis() {
      this.$router.push("/register");
    },
    login() {
      this.$router.push("/login");
    }
  }
};
</script>