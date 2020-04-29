<template>
  <div id="all" >
    <NavLO/>
      <!-- <div>
          <p>My profile</p>

          <a href='/'> <button>HOME</button> </a> 
          <br>       
          <a href='cedit'> <button>Edit profile</button> </a>
          bookhis
          <a href='mybook'> <button>Book history</button> </a>
      </div> -->

      <div id='sidemenu'>
        <div id="head">
         <p>Your profile</p>
         <b-img id='pic' src=@/assets/social.jpg  ></b-img>
         <p>username</p>
        </div>
        <div id="menu">
           <router-link to='cedit'> Edit profile </router-link>
           <router-link to='mybook'> Book history</router-link>
        </div>
      </div>
      <div>
        <router-view style="margin-left:20px"></router-view>
      </div>
      

  </div>

</template>

<style scoped>
#all{
  margin: 100px 50px;
  
}
#pic{
  width: 78px;
  height: 78px;
  align-items: center;
  
}
#sidemenu{
  margin: auto 60px;
  width: 100px;
  align: center;
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