<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <!--                       bar after login as staff                        -->
      <div class="container">
        <!--             link to home page               -->
        <button id="btn" class="navbar-brand js-scroll-trigger" @click="home">Hakuna Hotel</button>
        <!-- คือไรง่ะ -->
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
            <!-- link to Hotel management -->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="booktus">Hotel management</button>
            </li>
            <!-- link to My account -->
            <li class="nav-item">
              <button id="btn" class="nav-link js-scroll-trigger" @click="account">{{$store.getters.getUser}}</button>
            </li>
            <!-- link to home page if sign out -->
            <li class="nav-item">
              <button
                id="btn"
                v-on:click="check=0"
                class="nav-link js-scroll-trigger"
                @click="logout"
              >Sign out</button>
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
#btn {
  border: none;
  background-color: transparent;
  padding: 0px;
  font-size: 16px;
  cursor: pointer;
  display: inline-block;
}
</style>

<script>
export default {
  name: "STNav",
  methods: {
    //  method for เปลี่ยนหน้า
    booktus() {
      this.$router.push("bookstatus");
    },
    home() {
      this.$router.push("/");
    },
    account() {
      this.$router.push("shome");
    },
    logout() {
      this.makeToast('success','you already sign out');
      setTimeout(() => {
        this.$store.dispatch("AcUser", null);
        this.$store.dispatch("AcIsS", false);
        this.$store.dispatch("AcSRole", null);
        this.home();
      }, 1500);
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center"
      });
    }
  }
};
</script>