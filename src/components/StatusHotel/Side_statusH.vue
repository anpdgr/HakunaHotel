<template>
    <div>
     <b-card style="max-width: 10rem; float:left; margin: auto 50px"   class="text-center" > 
        <div vertical >
            <button class="btn" @click="book()"><p style="color:#2688D9">Booking</p></button><br><br>
            <button class="btn" @click="room()"><p style="color:#2688D9">Room</p></button><br><br>
            <button class="btn" @click="code()"><p style="color:#2688D9">Code Promotion</p></button><br><br>
            <button class="btn" @click="team()"><p style="color:#2688D9">Our team</p></button>
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