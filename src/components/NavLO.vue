<template>
  <div>
    <nav
      class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
      id="mainNav"
    >
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="/">Hakuna Hotel</a>
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
              <a class="nav-link js-scroll-trigger" href="#room">Room</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#services"
                >Services</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="register">My profile</a>
            </li>

            <li class="nav-item">
              <a v-on:click="check=0" class="nav-link js-scroll-trigger" href='/'>Sign out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>
