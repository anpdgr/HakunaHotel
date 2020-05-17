<template>
  <div>
    <STnav />
    <Side style="margin-top:100px" />
    <div id="all">
      <h1 style="margin-top:30px; padding-right:130px">
        Report Analysis
      </h1>
      <div id="1">
        <h5 style="margin-top:30px; float:left;">
          1. ลำดับ Room type ที่ถูกจองในปี 2019
          เรียงจากจำนวนครั้งที่จองจากมากไปน้อย
        </h5>
        <b-container fluid style="margin-top:20px;">
          <b-table
            id="my-table"
            stacked="md"
            :items="items1"
            :fields="fields1"
            style="margin-top:30px"
          >
          </b-table>
        </b-container>
      </div>

      <div id="2">
        <h5 style="margin-top:30px; float:left;">
          2. ลำดับของ Room type เรียงจาก Rating
        </h5>
        <b-container fluid style="margin-top:20px;">
          <b-table
            id="my-table"
            stacked="md"
            :items="items2"
            :fields="fields2"
            style="margin-top:30px"
          >
          </b-table>
        </b-container>
      </div>
    </div>
  </div>
</template>

<script>
import STnav from "../Nav_st.vue";
import Side from "./Side_statusH.vue";
export default {
  components: { STnav, Side },
  data() {
    return {
      items1: [],
      fields1: [
        { key: "Room_Type", label: "Room type", sortable: true },
        { key: "Num_Book", label: "Number of booking", sortable: true },
      ],
      items2: [],
      fields2: [
        { key: "Room_Type", label: "Room type", sortable: true },
        { key: "Rating", label: "Rating", sortable: true },
      ],
    };
  },
};
</script>

<style>
#all {
  margin: 20px 100px auto 300px;
}
</style>
