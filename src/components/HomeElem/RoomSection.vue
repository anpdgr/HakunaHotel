<template>
<div>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 mx-auto">
        <h2>Our room type</h2>
        <p class="lead">
          This is a great place to talk about your webpage. This template is
          purposefully unstyled so you can use it as a boilerplate or starting
          point for you own landing page designs! This template features:
        </p>
      </div>
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
    <div v-for='item in items' :key = 'item' class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          <img
            v-bind:src ="DXK"
            alt="DUT"
            style="width:350px;height:240px;"
          />
        </div>
        <div class="flip-card-back">
          <h1>{{item.type}}</h1>
          <p>price : {{item.price}}</p>
          <p>We love that guy</p>
        </div>
      </div>
      <div v-if="item===3">
        <br>
      </div>
    </div>
  </div>
</div>
</template>

<style scoped>
/* flip card */
.flip-card {
  background-color: transparent;
  width: 300px;
  height: 200px;
  border: 1px solid #f1f1f1;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #bbb;
  color: black;
}

/* Style the back side */
.flip-card-back {
  background-color: dodgerblue;
  color: white;
  transform: rotateY(180deg);
}
</style>

<script>
export default {
  data(){
    return{
      img:{
        DXK: 'assets/delux_ub_tw.jpg'


      },
      items:[
        { type: "Dulux Executive King Bed", limit:4,price:4957,
          des:'Sitting over ten stories, all Deluxe Executive King Bed Rooms are equipped with gorgeous views of the bay and her golden coastline. Fitted with enough class and esteem, each room is a companion to comfortability and intimacy. Upscale room design with a perfect amount of space is trivial features compared to the handsome furnishings and fixtures adorning this charming space. Service: -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Babysitter -Gym -Spa -Sauna -Access for disabled people -Jaccuzzi -Wifi'},
        
        { type: "Dulux Executive Twin Bed",limit:4,price:4957,
          des:'Sitting over ten stories, all Deluxe Executive Twin Bed Rooms are equipped with gorgeous views of the bay and her golden coastline. Fitted with enough class and esteem, each room is a companion to comfortability and intimacy. Upscale room design with a perfect amount of space is trivial features compared to the handsome furnishings and fixtures adorning this charming space. Service: -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Babysitter -Gym -Spa -Sauna -Access for disabled people -Baby cots -Wifi'},
        
        { type: "Dulux Urban King Bed",limit:4,price:4494,
          des:'Complete with sweeping cityscape views enjoy a quiet and comfortable escape high above the hustle and bustle of the city. Stocked with all the luxury accommodations needed for an unforgettable retreat such as lavish furniture, gentle down bedding, inventive decorations and state of the art bathroom fixtures, this room calls to guests who want to get away in style. Service: -Wifi -Tourist Information / Ticket sale -Laundry service -Gym -Air conditioning -Spa -Sauna -Baby cots -Free Parking -Free outdoor bus parking'},
        
        { type: "Dulux Urban Twin Bed",limit:4,price:4494,
          des: 'Complete with sweeping cityscape views, enjoy a quiet and comfortable escape high above the hustle and bustle of the city. Stocked with all the luxury accommodations needed for an unforgettable retreat such as lavish furniture, gentle down bedding, inventive decorations and state of the art bathroom fixtures, this room calls to guests who want to get away in style. Service: -Wifi -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Gym -Spa -Sauna -Baby cots -Free Parking -Free outdoor parking'},
        
        { type: "Premier Lux Twin Bed", limit:4,price:7472,
          des: 'Boasting bathtubs of marble and balconies with remarkable views the Premier Lux Twin BedRoom are beaming with glitz and glamour. Overlooking tantalizing sea views hundreds of feet into the sky, each room is embellished with playful floorplans and artistic decor. Escape into a world of plush sophistication and modern design, readily equipped to provide irreplaceable and everlasting memories. - Complimentary Wi-Fi - Personalized check - in and check – out - Concierge service - Open Daily 07:00 hrs. – 21:00 hrs. - Breakfast at The living from 07:00 hrs. –11:00 hrs. - Afternoon tea from 14:00 hrs. – 16:00 hrs. - Happy hours from 17.30 hrs. – 19:30 hrs. - All day refreshments: coffee, tea, soft drinks, cookies and snacks - Two hours per stay complimentary usage of The Living Board Room (Upon availability) - Complimentary late check out until 16:00 hrs. (Upon availability) - Complimentary pressing service 2 items per day (Non - accumulative) - Complimentary local call (Mobile phone excluded) Service: -Wifi -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Gym -Spa -Sauna -Baby cots -Free Parking -Bath'},
        
        { type: "Premier Lux King Bed",limit:4,price:7472,
          des: 'Boasting bathtubs of marble and balconies with remarkable views the Premier Lux King Bed. Room are beaming with glitz and glamour. Overlooking tantalizing sea views hundreds of feet into the sky, each room is embellished with playful floorplans and artistic decor. Escape into a world of plush sophistication and modern design, readily equipped to provide irreplaceable and everlasting memories. - Complimentary Wi-Fi - Personalized check - in and check – out - Concierge service - Open Daily 07:00 hrs. – 21:00 hrs. - Breakfast at The living from 07:00 hrs. –11:00 hrs. - Afternoon tea from 14:00 hrs. – 16:00 hrs. - Happy hours from 17.30 hrs. – 19:30 hrs. - All day refreshments: coffee, tea, soft drinks, cookies and snacks - Two hours per stay complimentary usage of The Living Board Room (Upon availability) - Complimentary late check out until 16:00 hrs. (Upon availability) - Complimentary pressing service 2 items per day (Non - accumulative) - Complimentary local call (Mobile phone excluded) Service: -Wifi -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Gym -Spa -Safety box -Sauna -Babysitter -Bath'},
        
        { type: "Ocean Junior Suite", limit:4,price:8765,
          des: 'Generous spaces, and equally generous views of the sea adorn these opulently furnished suites. Picture perfect rooms, outfitted to inspire all those who enter, the Ocean Junior Suite will have guests wishing they never had to leave. Beautifully devised and impeccably designed, every inch is a testament to refinement in the art of hospitality. Pristine bathrooms of marble with furnishings that will have you melting into an abyss of plush euphoria are just inklings of the grandeur this suites has to offer. - Complimentary Wi-Fi - Personalized check - in and check – out - Concierge service - Open Daily 07:00 hrs. – 21:00 hrs. - Breakfast at The living from 07:00 hrs. –11:00 hrs. - Afternoon tea from 14:00 hrs. – 16:00 hrs. - Happy hours from 17.30 hrs. – 19:30 hrs. - All day refreshments: coffee, tea, soft drinks, cookies and snacks - Two hours per stay complimentary usage of The Living Board Room (Upon availability) - Complimentary late check out until 16:00 hrs. (Upon availability) - Complimentary pressing service 2 items per day (Non - accumulative) - Complimentary local call (Mobile phone excluded) Service: -Wifi -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Gym -Spa -Sauna -Baby cots -Free Parking -Bath'},
        
        { type: "Marina Suite", limit:4,price:15806,
          des: 'How can you describe a sight which takes your breath away...Masterfully conceived, this stately and palatial room is the pinnacle of luxury and class. Crowning the highest floor of Mytt Beach, this supreme suite in the sky offers commanding and unmatched views of the bay and all of Pattaya and beyond. Everything that defines 5 star accommodation can be found smartly fitted from wall to wall, floor to ceiling in this embodiment of perfection. The Marina suite sits upon the precipice of elegance and opulence for all of Pattaya to gaze at from below. Inside find seating and beds fit for kings, ample amenities and space to entertain, and marble bathrooms fixed with the finest fixtures you can find outside of a palace. This suite is a reflection of the ambition in class and grace Mytt Beach stands for. - Complimentary Wi-Fi - Personalized check - in and check – out - Concierge service - Open Daily 07:00 hrs. – 21:00 hrs. - Breakfast at The living from 07:00 hrs. –11:00 hrs. - Afternoon tea from 14:00 hrs. – 16:00 hrs. - Happy hours from 17.30 hrs. – 19:30 hrs. - All day refreshments: coffee, tea, soft drinks, cookies and snacks - Two hours per stay complimentary usage of The Living Board Room (Upon availability) - Complimentary late check out until 16:00 hrs. (Upon availability) - Complimentary pressing service 2 items per day (Non - accumulative) - Complimentary local call (Mobile phone excluded) Service: -Wifi -Tourist Information / Ticket sale -Laundry / Dry Cleaner -Air conditioning -Gym -Spa -Sauna -Access for disabled people -Baby cots -Bath'},

      ]
    }

  }
}
</script>