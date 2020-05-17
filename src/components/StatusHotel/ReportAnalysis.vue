<template>
  <div>
    <STnav />
    <Side style="margin-top:100px" />
    <div id="all">
      <h1 style="margin-top:30px; ">
        Report Analysis
      </h1>
      <div id="1">
        <b-container fluid style="margin-top:20px; width:900px ">
          <h5 style="margin-top:30px; float:left;">
            1. Number of booking of each room types.
          </h5>
          <b-table
            id="first-table"
            stacked="md"
            :items="items1"
            :fields="fields1"
            style="margin-top:30px"
          >
          </b-table>
        </b-container>
      </div>

      <div id="2">
        <b-container fluid style="margin-top:20px; width:900px">
          <h5 style="margin-top:30px; float:left;">
            2. Number of booking of each room types in January 2020.
          </h5>
          <b-table
            id="second-table"
            stacked="md"
            :items="items2"
            :fields="fields2"
            style="margin-top:30px"
          >
          </b-table>
        </b-container>
      </div>

      <div id="3">
        <b-container fluid style="margin-top:20px; width:900px">
          <h5 style="margin-top:30px; float:left;">
            3. Rating of each room types.
          </h5>
          <b-table
            id="third-table"
            stacked="md"
            :items="items3"
            :fields="fields3"
            style="margin-top:30px"
          >
          </b-table>
        </b-container>
      </div>

      <div id="4">
        <b-container fluid style="margin-top:20px; width:900px">
          <h5 style="margin-top:30px; float:left;">
            4. Top 5 code promotions which were used most.
          </h5>
          <b-table
            id="fourth-table"
            stacked="md"
            :items="items4"
            :fields="fields4"
            style="margin-top:30px"
          >
          </b-table>
        </b-container>
      </div>

      <div id="5">
        <b-container fluid style="margin-top:20px; width:900px">
          <h5 style="margin-top:30px; float:left;">
            5. Top 5 Staff with highest salary.
          </h5>
          <b-table
            id="fifth-table"
            stacked="md"
            :items="items5"
            :fields="fields5"
            style="margin-top:30px"
          >
          </b-table>
        </b-container>
      </div>

      <div id="6">
        <b-container fluid style="margin-top:20px; width:900px">
          <h5 style="margin-top:30px; float:left;">
            6. Number of employees of each position.
          </h5>
          <div class="chart-wrapper">
            <chart :options="chartOptionsBar" style="float:center;"></chart>
          </div>
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
        { key: "Num_Book", label: "Number of booking", sortable: true },
      ],
      items3: [],
      fields3: [
        { key: "Room_Type", label: "Room type", sortable: true },
        { key: "Rating", label: "Rating", sortable: true },
      ],
      items4: [],
      fields4: [
        { key: "Code_Name", label: "Code name" },
        { key: "NoUsed", label: "Number of using" },
      ],
      items5: [],
      fields5: [
        { key: "Staff_Name", label: "Staff name" },
        { key: "Salary", label: "Salary" },
      ],
      
      chartOptionsBar: {
        xAxis: {
          data: ["Housekeeper", "Dev","..."],
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            type: "bar",
            data: [15, 20, 50],
          },
        ],
        color: ["#b98672"],
      },
    };
  },
};
</script>

<style>
#all {
  margin: 20px 100px auto 300px;
}
</style>
