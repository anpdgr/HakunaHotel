<template>
<div style="margin:auto">
    <div class="row">
      <div class="col-lg-8 mx-auto">
        <h2 style="text-align:center">Our room type</h2>
        <p style="font-size:100%; text-align:center" class="lead">
         The 236 spacious and comfortable rooms and suites at the Hakuna Hotel include several different room types (Deluxe Urban Room, Deluxe Ocean Room, Premier Ocean Room, Urban Junior Suite, Ocean Junior Suite and Marina Suite) to provide the perfect accommodation option for the different needs of our guests, whatever the reason for their stay. Our luxury hotel near Paradise beach is an oasis of comfort.
        </p>
      </div>
  </div>


  <!-- <div>
  เอามาวางตรงนี้ จะเอามาลองง
    <a href='booking'> <button>Check available</button> </a>
    <br>
    <button v-on:click="check = 1">Login as customer</button>
    <a href='shome'> <button>Login as staff</button> </a>
    <a href='mhome'> <button>Login as manager</button> </a>
  </div> --> 
 
  <!-- room card -->
  <div> 
    <b-row>
      <b-col v-for='(item,index) in items'  :key = 'index' style="flex: 30%; margin:30px 10px">
        <!-- <div   v-for='image in images' :key = 'image' > -->
          <div class="container">
            <div>
                <img
                  :src='item.img'
                  class="image"
                />
                <div class="overlay">
                    <div class="text">
                      
                      <h5>{{item.type}}</h5>
                      <p>price : {{item.price}}</p>
                       
                      <b-button  variant="outline-secondary" @click="index1 = index" v-b-modal.modal-scrollable>view more</b-button>
                      <b-modal  v-if="index===index1" id="modal-scrollable" size="lg" scrollable hide-footer hide-header style="padding:100px;">
                        <b-button style="float:right" href="#review">see review</b-button>
                        <!-- {{index}} -->
                        <h5>{{item.type}}</h5>
                        <p>price per night : {{item.price}} </p>
                        <img :src="item.img" style="width:100%"/>
                        <p class="my-4" ><b>Description</b><br>{{item.des}} </p>
                        <section id="review">
                          
                          <h5>Review</h5>
                          
                        </section>
                        
                      </b-modal>
                      
                    </div>
                </div>
            </div>
          </div>
        <!-- </div> -->
      </b-col>
      
    </b-row>
  </div>
</div>
</template>

<style scoped>
.image {
  
  width:380px;
  height:250px;
}

.container {
  position: relative;
  width:380px;
  height:250px;
  float: center;
}


.container:hover .overlay {
  opacity: 0.95;
}

.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  width:400px;
  height:250px;
  opacity: 0;
  transition: .5s ease;
  background-color: #77503b ;
}
 
 /* 9c472f  77503b b98672 2a2818 513f2a cd986b  */

.text {
  color: white;
  
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
  width:340px;
}
</style>

<script>
export default {
  data(){
    return{
      index1:0,
      items:[
        { type: "Delux Executive King Bed", limit:4,price:4957,
          des:'Sitting over ten stories, all Deluxe Executive King Bed Rooms are equipped with gorgeous views of the bay and her golden coastline. Fitted with enough class and esteem, each room is a companion to comfortability and intimacy. Upscale room design with a perfect amount of space is trivial features compared to the handsome furnishings and fixtures adorning this charming space. Service: -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Babysitter -Gym -Spa -Sauna -Access for disabled people -Jaccuzzi -Wifi',
          img:require('@/assets/delux_e_k.jpg')
        },
        
        { type: "Delux Executive Twin Bed",limit:4,price:4957,
          des:'Sitting over ten stories, all Deluxe Executive Twin Bed Rooms are equipped with gorgeous views of the bay and her golden coastline. Fitted with enough class and esteem, each room is a companion to comfortability and intimacy. Upscale room design with a perfect amount of space is trivial features compared to the handsome furnishings and fixtures adorning this charming space. Service: -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Babysitter -Gym -Spa -Sauna -Access for disabled people -Baby cots -Wifi',
          img:require('@/assets/delux_e_tw.jpg')},
        
        { type: "Delux Urban King Bed",limit:4,price:4494,
          des:'Complete with sweeping cityscape views enjoy a quiet and comfortable escape high above the hustle and bustle of the city. Stocked with all the luxury accommodations needed for an unforgettable retreat such as lavish furniture, gentle down bedding, inventive decorations and state of the art bathroom fixtures, this room calls to guests who want to get away in style. Service: -Wifi -Tourist Information / Ticket sale -Laundry service -Gym -Air conditioning -Spa -Sauna -Baby cots -Free Parking -Free outdoor bus parking',
          img:require('@/assets/delux_u_k.jpg')},
        
        { type: "Delux Urban Twin Bed",limit:4,price:4494,
          des: 'Complete with sweeping cityscape views, enjoy a quiet and comfortable escape high above the hustle and bustle of the city. Stocked with all the luxury accommodations needed for an unforgettable retreat such as lavish furniture, gentle down bedding, inventive decorations and state of the art bathroom fixtures, this room calls to guests who want to get away in style. Service: -Wifi -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Gym -Spa -Sauna -Baby cots -Free Parking -Free outdoor parking',
          img:require('@/assets/delux_u_tw.jpg')},

        { type: "Premier Lux King Bed",limit:4,price:7472,
          des: 'Boasting bathtubs of marble and balconies with remarkable views the Premier Lux King Bed. Room are beaming with glitz and glamour. Overlooking tantalizing sea views hundreds of feet into the sky, each room is embellished with playful floorplans and artistic decor. Escape into a world of plush sophistication and modern design, readily equipped to provide irreplaceable and everlasting memories. - Complimentary Wi-Fi - Personalized check - in and check – out - Concierge service - Open Daily 07:00 hrs. – 21:00 hrs. - Breakfast at The living from 07:00 hrs. –11:00 hrs. - Afternoon tea from 14:00 hrs. – 16:00 hrs. - Happy hours from 17.30 hrs. – 19:30 hrs. - All day refreshments: coffee, tea, soft drinks, cookies and snacks - Two hours per stay complimentary usage of The Living Board Room (Upon availability) - Complimentary late check out until 16:00 hrs. (Upon availability) - Complimentary pressing service 2 items per day (Non - accumulative) - Complimentary local call (Mobile phone excluded) Service: -Wifi -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Gym -Spa -Safety box -Sauna -Babysitter -Bath',
          img:require('@/assets/pre_k.jpg')},

        { type: "Premier Lux Twin Bed", limit:4,price:7472,
          des: 'Boasting bathtubs of marble and balconies with remarkable views the Premier Lux Twin BedRoom are beaming with glitz and glamour. Overlooking tantalizing sea views hundreds of feet into the sky, each room is embellished with playful floorplans and artistic decor. Escape into a world of plush sophistication and modern design, readily equipped to provide irreplaceable and everlasting memories. - Complimentary Wi-Fi - Personalized check - in and check – out - Concierge service - Open Daily 07:00 hrs. – 21:00 hrs. - Breakfast at The living from 07:00 hrs. –11:00 hrs. - Afternoon tea from 14:00 hrs. – 16:00 hrs. - Happy hours from 17.30 hrs. – 19:30 hrs. - All day refreshments: coffee, tea, soft drinks, cookies and snacks - Two hours per stay complimentary usage of The Living Board Room (Upon availability) - Complimentary late check out until 16:00 hrs. (Upon availability) - Complimentary pressing service 2 items per day (Non - accumulative) - Complimentary local call (Mobile phone excluded) Service: -Wifi -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Gym -Spa -Sauna -Baby cots -Free Parking -Bath',
          img:require('@/assets/pre_tw.jpg')},

        { type: "Ocean Junior Suite", limit:4,price:8765,
          des: 'Generous spaces, and equally generous views of the sea adorn these opulently furnished suites. Picture perfect rooms, outfitted to inspire all those who enter, the Ocean Junior Suite will have guests wishing they never had to leave. Beautifully devised and impeccably designed, every inch is a testament to refinement in the art of hospitality. Pristine bathrooms of marble with furnishings that will have you melting into an abyss of plush euphoria are just inklings of the grandeur this suites has to offer. - Complimentary Wi-Fi - Personalized check - in and check – out - Concierge service - Open Daily 07:00 hrs. – 21:00 hrs. - Breakfast at The living from 07:00 hrs. –11:00 hrs. - Afternoon tea from 14:00 hrs. – 16:00 hrs. - Happy hours from 17.30 hrs. – 19:30 hrs. - All day refreshments: coffee, tea, soft drinks, cookies and snacks - Two hours per stay complimentary usage of The Living Board Room (Upon availability) - Complimentary late check out until 16:00 hrs. (Upon availability) - Complimentary pressing service 2 items per day (Non - accumulative) - Complimentary local call (Mobile phone excluded) Service: -Wifi -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Gym -Spa -Sauna -Baby cots -Free Parking -Bath',
          img:require('@/assets/ocean.jpg')},

        { type: "Marina Suite", limit:4,price:15806,
          des: 'How can you describe a sight which takes your breath away...Masterfully conceived, this stately and palatial room is the pinnacle of luxury and class. Crowning the highest floor of Mytt Beach, this supreme suite in the sky offers commanding and unmatched views of the bay and all of Pattaya and beyond. Everything that defines 5 star accommodation can be found smartly fitted from wall to wall, floor to ceiling in this embodiment of perfection. The Marina suite sits upon the precipice of elegance and opulence for all of Pattaya to gaze at from below. Inside find seating and beds fit for kings, ample amenities and space to entertain, and marble bathrooms fixed with the finest fixtures you can find outside of a palace. This suite is a reflection of the ambition in class and grace Mytt Beach stands for. - Complimentary Wi-Fi - Personalized check - in and check – out - Concierge service - Open Daily 07:00 hrs. – 21:00 hrs. - Breakfast at The living from 07:00 hrs. –11:00 hrs. - Afternoon tea from 14:00 hrs. – 16:00 hrs. - Happy hours from 17.30 hrs. – 19:30 hrs. - All day refreshments: coffee, tea, soft drinks, cookies and snacks - Two hours per stay complimentary usage of The Living Board Room (Upon availability) - Complimentary late check out until 16:00 hrs. (Upon availability) - Complimentary pressing service 2 items per day (Non - accumulative) - Complimentary local call (Mobile phone excluded) Service: -Wifi -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Gym -Spa -Sauna -Access for disabled people -Baby cots -Bath',
          img:require('@/assets/marina.jpg')}

      ]
    }

  },
  methods:{
    scrollIntoView(evt) {
      evt.preventDefault();
      const href = evt.target.getAttribute("href");
      const el = href ? document.querySelector(href) : null;
      if (el) {
        this.$refs.content.scrollTop = el.offsetTop;
      }
    }
  }
}
</script>