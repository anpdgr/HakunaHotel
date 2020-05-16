<template>
  <div>
    <!-- User Interface controls -->
    <STnav />
    <Side />
    <div id="all">
      <div id="summary" style="float:right">
        <!-- ปุ่ม summary status ห้อง -->
      <b-button id="show-btn"  variant="success"   @click="showModal">see summary</b-button>

      <b-modal ref="my-modal" hide-footer title="room summary" size="lg">
        <!-- chart -->
        <div class="chart-wrapper" >
          <chart :options="chartOptionsBar" style="float:center"></chart>
        </div>
      </b-modal>
    </div>
      <h1>Room</h1>
      <b-row>
        <b-col lg="4" class="my-1">
          <b-form style="margin-left:10px">
            <b-form-group
              label="Room type:"
              label-cols-sm="6"
              label-align-sm="right"
              label-size="sm"
              label-for="selectType"
              class="mb-0"
            >
            <!-- filter type  -->
              <b-input-group size="sm">
                <b-form-select
                  v-model="selected_type"
                  id="selectType"
                  :options="type_options"
                  class="w-75"
                  @change="onSelect"
                >
                </b-form-select>
              </b-input-group>
            </b-form-group>
          </b-form>
        </b-col>

      <!-- <b-col lg="4" class="my-1">
              <b-form-group
                label="Per page"
                label-cols-sm="9"
                label-align-sm="right"
                label-size="sm"
                label-for="perPageSelect"
                class="mb-0"
              >
                <b-form-select
                  v-model="perPage"
                  id="perPageSelect"
                  size="sm"
                  :options="pageOptions"
                  style=" width:120px"
                ></b-form-select>
              </b-form-group>
            </b-col> -->

      </b-row>
<br>
      <!-- Main table element -->
      <b-table
        id="my-table"
        show-empty
        stacked="md"
        :items="items"
        :fields="fields"
        :current-page="currentPage"
        :per-page="perPage"
        :filter="filter"
        @filtered="onFiltered"
        
      >
      </b-table>
      <!-- pagination -->
      <b-col class="my-1">
        <b-pagination
          v-model="currentPage"
          :total-rows="totalRows"
          :per-page="perPage"
          pills
          align="center"
          class="my-0"
          aria-controls="my-table"
        ></b-pagination>
        <br />
        <hr />
      </b-col>
    </div>
  </div>
</template>

<script>

import STnav from "../Nav_st.vue";
import Side from "./Side_statusH.vue";
export default {
  components: {
    STnav,
    Side,
  },
  data() {
    return {
      chartOptionsBar: {
            xAxis: {
                data: ['avaiable', 'reserved']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                type: 'bar',
                data: [200, 47]
                }
            ],
            title: {
                text: 'Number of room',
                x: 'center',
                textStyle: {
                fontSize: 24
                }
            },
            color: ['#127ac2']
        },
        // fix!!!
        // post roomtype name's data
      type_options: [{value:"",
                      text:""}],
      // post room detail
      items: [
        {
          roomid:"",
          type:"",
          available:"",
          tel:""
        }
      ],
      rtype:[],
      // rtype:{name:[null]},
      fields: [
        { key: "RoomType_Name", sortable: true },
        { key: "Room_ID", sortable: true },
        { key: "Telephone_No", sortable: true },
        { key: "Available", sortable: true },
      ],

      //totalRows: 1,
      currentPage: 1,
      perPage: 10,
      pageOptions: [5, 10, 15],
      selected_type: "",
      sortDesc: false,
      sortDirection: "asc",
      filter: "",
      filterOn: [],
      sortOptions: ["Dic", "G", "O"],
    };
  },
  computed: {
    totalRows() {
      return this.items.length;
    },
    
  },
  mounted() {
    // Set the initial number of items
    
    this.totalRows = this.items.length;
    this.fetchRoom();
    this.fetchRoomType();
    // fixxxxx
    this.fetchType_op();
  },
  methods: {
    
    // fix
    fetchType_op(){
      for(var i = 0; i<=this.rtype.length; i++){
        if(i==0){
            this.type_options[i].value = null;
            this.type_options[i].text = "All";
        }
        else{
          // this.type_options.append({value:this.rtype[i-1],text:this.rtype[i-1]});
            this.type_options[i].value = this.rtype[i-1];
            this.type_options[i].text = this.rtype[i-1];
        }
      }
    },
    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    },
    onSelect() {
      this.filter = this.selected_type;
    },
    showModal() {
      this.$refs['my-modal'].show()
    },
    hideModal() {
      this.$refs['my-modal'].hide()
    },
    fetchRoom(){
      var formData = this.toFormData(this.items);
      this.axios
      .post(
        "http://hakuna-hotel.kmutt.me/phpapi/Room.php?action=read",formData)
        .then(response => {
        this.items = response.data.data;
          if (response.data.error) {
            console.log(response.data.error);
          } else {
            console.log(response.data.message);
            }
        });
    },
    fetchRoomType(){
      var formData = this.toFormData(this.rtype);
      this.axios
      .post(
        "http://hakuna-hotel.kmutt.me/phpapi/RoomType.php?action=read",formData)
        .then(response => {
            // console.log(response.data.data);
          for(var i = 0; i<response.data.data.length; i++){
            this.rtype[i] = response.data.data[i].RoomType_Name;
          }
          // console.log(this.rtype);
          if (response.data.error) {
            console.log(response.data.error);
          } else {
            console.log(response.data.message);
            }
        });
    },
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
    }
  },

};
</script>

<style>
#all {
  margin: 100px 100px auto 300px;
}
.chart-wrapper {
  width: 100%;
  height: 500px;
}
</style>
