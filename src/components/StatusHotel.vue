<template>
  <div>
    <b-card v-for='i in obj' :key='i' title="Staff">
      <b-card-text>
        My name is {{i.name}}, {{i.age}} years old.
      </b-card-text>
    </b-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
          obj: [
      { name: 'Ant' , age:19},
      { name: 'Proy' ,age:20}
    ]
    };
  },
};
</script>

<style></style>

- เป็นตารางห้องๆ บอกสเตตัสบลาๆ มีfilter - ถ้าถึงวัน checkin ก็มีปุ่ม checkin -
ถ้า checkin แล้วมีปุ่ม checkout - ถ้าเกินวัน checkin ก็ตัดการจองเอง
