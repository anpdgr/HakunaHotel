<template>
    <div>
     <b-card style="max-width: 10rem; float:left; margin: auto 50px"   class="text-center" > 
        <div vertical >
           <!-- link to booking  -->
            <button class="btn" @click="book()"><p style="color:#2688D9">Booking</p></button><br><br>
            <!-- link to room  -->
            <button class="btn" @click="room()"><p style="color:#2688D9">Room</p></button><br><br>
            <!-- link to code Promotion  -->
            <button class="btn" @click="code()"><p style="color:#2688D9">Code Promotion</p></button><br><br>
            <!-- link to our team -->
            <button class="btn" @click="team()" v-if="$store.getters.getSRole == 'Manager'"><p style="color:#2688D9">Our team</p></button><br><br>
            <!-- link to Report -->
            <button class="btn" @click="reportAna()" v-if="$store.getters.getSRole == 'Manager'"><p style="color:#2688D9">Report Analysis</p></button>
        </div>
     </b-card>
    </div>
</template>

<script>
export default {
   methods:{
      // for เปลี่ยนหน้า
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
       reportAna(){
          this.$router.push('report')
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