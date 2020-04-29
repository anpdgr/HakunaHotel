<template>
<div>
    <NavLO/>
    <!-- Side navigation -->
    <div class="sidenav">
      <div id="head">
         <b-img id='pic' src=@/assets/social.jpg  ></b-img>
         <p style="font-size:20px; color: #818181;">username</p>
      </div>
      <div id='menu' >
        <a style="font-size:20px;" href="/cedit">Edit profile</a>
        <a style="font-size:20px;" href="/mybook">Book history</a>
        <a style="font-size:20px;" href="/">Sign out</a>
      </div>
    </div>
</div>
</template>

<style scoped> 
#menu{
  margin-left:70px ;
  text-align: left;
}
#pic{
  width: 85px;
  height: 85px;
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
import NavLO from '../NavLO.vue'
export default {
  components:{
        NavLO
    }
  
}
</script>