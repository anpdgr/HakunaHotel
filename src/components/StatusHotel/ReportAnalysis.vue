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
            1. Number of room of each room types in 2020.
          </h5>
          <b-table
            id="first-table"
            stacked="md"
            :items="items1"
            :fields="fields1"
            style="margin-top:30px"
            bordered
            hover
          >
          </b-table>
        </b-container>
      </div>

      <div id="2">
        <b-container fluid style="margin-top:20px; width:900px">
          <h5 style="margin-top:30px; float:left;">
            2. Number of booking of each room types in May 2020.
          </h5>
          <b-table
            id="second-table"
            stacked="md"
            :items="items2"
            :fields="fields2"
            style="margin-top:30px"
                        bordered
            hover
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
                        bordered
            hover
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
                        bordered
            hover
          >
          </b-table>
        </b-container>
      </div>

      <!-- <div id="5">
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
      </div> -->

      <div id="6">
        <b-container fluid style="margin-top:20px; width:900px">
          <h5 style="margin-top:30px; float:left;">
            5. Number of employees of each position.
          </h5>
          <div class="chart-wrapper">
            <chart :options="chartOptionsBar" ></chart>
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
        { key: "RoomType_Name", label: "Room type", sortable: true },
        { key: "Number_of_Booking", label: "Number of booking", sortable: true },
      ],
      items2: [],
      fields2: [
        { key: "RoomType_Name", label: "Room type", sortable: true },
        { key: "Num_of_Booking", label: "Number of booking", sortable: true },
      ],
      items3: [],
      fields3: [
        { key: "RoomType_Name", label: "Room type", sortable: true },
        { key: "AVGRating", label: "Rating", sortable: true },
      ],
      items4: [],
      fields4: [
        { key: "Code_Name", label: "Code name" },
        { key: "Number_of_Using", label: "Number of using" },
      ],
      items5: [],
      fields5: [
        { key: "Staff_Name", label: "Staff name" },
        { key: "Salary", label: "Salary" },
      ],
      
      chartOptionsBar: {
        xAxis: {
          data: [],
        },
        yAxis: {
          type: "value",
        },
        series: 
          {
            type: "bar",
            data: [],
          },
        
        color: ["#b98672"],
      },
    };
  },
  mounted(){
      this.fetchReport();
  },
  methods:{
  fetchReport(){
    this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/report.php?action=TopRoomType")
        .then((response) => {
          this.items1=response.data.data;
        });
    this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/report.php?action=May")
        .then((response) => {
          this.items2=response.data.data;
        });
    this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/report.php?action=RoomRating")
        .then((response) => {
          this.items3=response.data.data;
        });
    this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/report.php?action=useCode")
        .then((response) => {
          this.items4=response.data.data;
        });
    this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/report.php?action=staff")
        .then((response) => {
          var data1=[];
          var data2=[];
          for(var i=0; i<response.data.data.length; i++){
          data1.push(response.data.data[i].Position);
          data2.push(parseInt(response.data.data[i].Num_of_Staff));
        }
        console.log(data1);
          this.chartOptionsBar.xAxis.data=data1;
          this.chartOptionsBar.series.data=data2;
        });
        
  },
  }
};

</script>

<style>
#all {
  margin: 20px 100px auto 300px;
}
</style>
