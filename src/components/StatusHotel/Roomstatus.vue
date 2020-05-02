<template>
  <div>
    <STnav/>
    <Side/>
    <div id="all">
      <h1>Room</h1>
      <b-form inline style="float:center">
        <b-form-select id="filST" v-model="filter_status" :options="status_options" style="margin-top:40px; margin-right:30px"></b-form-select>
        <b-form-select id="filTY" v-model="filter_type" :options="type_options" style="margin-top:40px"></b-form-select>
      </b-form>
      <div class="mt-3" style="float:left">Room Status: <strong>{{ filter_status }}</strong></div>
      <div class="mt-3" style="float:left">Room type: <strong>{{ filter_type }}</strong></div>

        <div>
            <b-table
            :items="items"
            :fields="fields"
            :filter="filter_status"
            :filterIncludedFields="filterOn"
            :sort-by.sync="sortBy"
            :sort-desc.sync="sortDesc"
            responsive="sm"
            @filtered="onFiltered"
            ></b-table>

            <div>
            Sorting By: <b>{{ sortBy }}</b>, Sort Direction:
            <b>{{ sortDesc ? 'Descending' : 'Ascending' }}</b>
            </div>
        </div>
    </div>
  </div>
</template>





<script>
import STnav from '../Nav_st.vue'
import Side from './Side_statusH.vue'
export default {
  components:{
        STnav,
        Side
    },
    data() {
      return {
        selected_type: null,
        selected_status: null,

        type_options: [
          { value: null, text: 'Room type' },
          { value: 'All', text: 'All' },
          { value: 'Dulux Urban Twin Bed', text: 'Dulux Urban Twin Bed' },
          { value: 'Dulux Urban King Bed', text: 'Dulux Urban King Bed' },
          { value: 'Dulux Executive Twin Bed', text: 'Dulux Executive Twin Bed' },
          { value: 'Dulux Executive Twin Bed', text: 'Dulux Executive Twin Bed'},
          { value: 'Premier Lux Twin Bed', text: 'Premier Lux Twin Bed' },
          { value: 'Premier Lux King Bed', text: 'Premier Lux King Bed' },
          { value: 'Urban Junior Suite', text: 'Urban Junior Suite' },
          { value: 'Ocean Junior Suite', text: 'Ocean Junior Suite'},
          { value: 'Marina Suite', text: 'Marina Suite'}
        ],

        status_options: [
          { value: null, text: 'Room status' },
          { value: 'All', text: 'All' },
          { value: 'Available', text: 'Available' },
          { value: 'Reserved', text: 'Reserved' },
        ],

//สมมติข้อมูลมาก่อน
        sortBy: 'RoomID',
        sortDesc: false,
        fields: [
          { key: 'Type', sortable: true },
          { key: 'RoomID', sortable: true },
          { key: 'Tel', sortable: true },
          { key: 'Status', sortable: true },
        ],
        items: [
          { Type:'Premier Lux Twin Bed',RoomID: 10000 , Tel: '02-4445555',Status: 'avialable' },
          { Type:'Ocean Junior Suite',RoomID: 10001 , Tel: '02-3322441',Status: 'avialable', },
          { Type:'Dulux Urban King Bed',RoomID: 10002 , Tel: '02-3322455',Status: 'Reserve',},
          { Type:'Dulux Urban King Bed',RoomID: 10003 , Tel: '02-6724550',Status: 'Reserve' },
          { Type:'Ocean Junior Suite',RoomID: 10004 , Tel: '02-3388441',Status: 'avialable', },
          { Type:'Urban Junior Suite',RoomID: 10005 , Tel: '02-0022455',Status: 'Reserve',},
          { Type:'Dulux Urban King Bed',RoomID: 10006 , Tel: '02-6024550',Status: 'avialable' },
        ]
      }
    }
}
  
</script>

<style>
#all{
  margin: 100px 100px auto 300px;
  
}

</style>



-บอกว่ามีห้องไรบ้าง + เบอร์
-บอกว่าห้องไหนว่าง , พักอยู่ 