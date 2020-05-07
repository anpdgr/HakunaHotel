<template>
    <div>
     <b-card style="max-width: 10rem; float:left; margin: auto 50px"   class="text-center" > 
        <div vertical >
            <button class="btn" @click="book()"><p style="color:#2688D9">Booking</p></button><br><br>
            <a class="btn" @click="room()"><p style="color:#2688D9">Room</p></a><br><br>
            <a class="btn" @click="code()"><p style="color:#2688D9">Code Promotion</p></a><br><br>
            <a class="btn" @click="team()"><p style="color:#2688D9">Our team</p></a>
        </div>
     </b-card>
    </div>
</template>

<script>
export default {
   methods:{
        book(){
          this.$router.push('bookstatus')
       },
        room(){
          this.$router.push('roomstatus')
       },
        code(){
          this.$router.push('addcode')
       },
        team(){
          this.$router.push('ourteam')
       },
       
   }
}
</script>

<style scoped>
.btn {
  border: none;
  background-color: inherit;
  padding: 0px;
  font-size: 16px;
  cursor: pointer;
  display: inline-block;
}
</style>