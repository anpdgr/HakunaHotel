<template>
<!-- EditStaff+Checkin+AddCode+StatusHotel -->
<div>
    <stNav/>
    <!-- Side navigation -->
    <div class="sidenav">
      <div id="head">
         <b-img id='pic' src=@/assets/security.jpg  ></b-img>
        <br />
        <br />
         <button id="btn" style="font-size:20px; color: #818181;" @click="account">{{$store.getters.getUser}}</button>
      </div>
      <div id='menu' >
        <button id="btn" style="font-size:20px; color:#2688D9" @click="edit">Edit profile</button><br><br>
        <button id="btn" style="font-size:20px; color:#2688D9" @click="logout">Sign out</button>
        <!--อย่าลืม check in -->
      </div>
    </div>
</div>
</template>

<style scoped> 
#btn {
  border: none;
  background-color:transparent;
  padding: 0px;
  font-size: 16px;
  cursor: pointer;
  align-items: center;
  display: inline-block;
  
}
#menu{
  margin-left:70px ;
  text-align: left;
}
#pic{
  width: 120px;
  height: 120px;
  align-items: center;
}
#head{
  margin: 50px;
}

.sidenav {
  height: 100%; /* Full-height: remove this if you want "auto" height */
  width: 300px; /* Set the width of the sidebar */
  position: fixed; /* Fixed Sidebar (stay in place on scroll) */
  z-index: 1; /* Stay on top */
  top: 0; /* Stay at the top */
  left: 0;
  background-color:white;
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 20px;
  margin-top:50px;
  
}

/* The navigation menu links */
.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
  color: #f1f1f1;
}

/* On smaller screens, where height is less than 450px, change the style of the sidebar (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}



</style>

<script>
import stNav from '../Nav_st.vue'
export default {
  components:{
        stNav
    },
    methods:{
        account(){
          this.$router.push('shome')
       },
        home(){
          this.$router.push('/')
       },
        edit(){
          this.$router.push('sedit')
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
  
}
</script>