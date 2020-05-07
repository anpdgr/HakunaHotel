<template>
  <div id="body">
    <nav
      class="navbar navbar-expand-lg fixed-top"
      id="mainNav"
    >
    <!--                       bar before login                         -->
      <div class="container">
        <!--             link to home page (need fix)                   -->
        <a class="navbar-brand js-scroll-trigger" href="/">Hakuna Hotel</a>
        <!-- just show global state -->
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

            <!-- link to register form -->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="register">Sign up</a>
            </li>

            <!-- link to login -->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="login">Sign in</a>
            </li>
            
          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>

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
  color:white;
}
#mainNav{
  background-color:#513f2a;
}
</style>