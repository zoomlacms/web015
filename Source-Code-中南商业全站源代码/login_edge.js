/**
 * Adobe Edge: symbol definitions
 */
(function($, Edge, compId){
//images folder
var im='images/';

var fonts = {};
   fonts['allerta, sans-serif']='<script src=\"http://use.edgefonts.net/allerta:n4:all.js\"></script>';
   fonts['allan, sans-serif']='<script src=\"http://use.edgefonts.net/allan:n7:all.js\"></script>';
   fonts['fugaz-one, sans-serif']='<script src=\"http://use.edgefonts.net/fugaz-one:n4:all.js\"></script>';


var resources = [
];
var symbols = {
"stage": {
   version: "2.0.1",
   minimumCompatibleVersion: "2.0.0",
   build: "2.0.1.268",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
         dom: [
         {
            id:'logo1',
            type:'image',
            rect:['45%','214px','205px','70px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"logo1.png",'0px','0px','205.03px','auto']
         },
         {
            id:'Text',
            type:'text',
            rect:['50%','239px','auto','auto','auto','auto'],
            text:"五彩事业 颠峰领航",
            font:['Lucida Console, Monaco, monospace',24,"rgba(0,0,0,1)","normal","none",""]
         },
         {
            id:'Text2',
            type:'text',
            rect:['43%','420px','336px','auto','auto','auto'],
            text:"构建中国商业地产新楷模！",
            align:"left",
            font:['fugaz-one, sans-serif',24,"rgba(252,239,239,1.00)","normal","none","normal"]
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_logo1}": [
            ["style", "top", '320px'],
            ["style", "background-size", [205.03,'auto'], {valueTemplate:'@@0@@px @@1@@'} ],
            ["style", "left", '45%'],
            ["style", "opacity", '1']
         ],
         "${_Text2}": [
            ["style", "top", '420px'],
            ["style", "width", '336px'],
            ["color", "color", 'rgba(252,239,239,1.00)'],
            ["style", "font-family", 'fugaz-one, sans-serif'],
            ["style", "left", '44.44%'],
            ["style", "font-size", '24px']
         ],
         "${_Text}": [
            ["style", "top", '278px'],
            ["color", "color", 'rgba(167,33,33,1.00)'],
            ["style", "opacity", '0'],
            ["style", "left", '17.45%'],
            ["style", "font-family", 'Lucida Console, Monaco, monospace']
         ],
         "${_Stage}": [
            ["color", "background-color", 'rgba(255,255,255,1)'],
            ["style", "min-width", '19.3%'],
            ["style", "overflow", 'hidden'],
            ["style", "height", '100%'],
            ["gradient", "background-image", [270,[['rgba(120,82,177,1.00)',0],['rgba(255,255,255,1.00)',100]]]],
            ["style", "width", '100%']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 3750,
         autoPlay: true,
         labels: {
            "Label 1": 3750
         },
         timeline: [
            { id: "eid66", tween: [ "style", "${_Text2}", "left", '43%', { fromValue: '44.44%'}], position: 2464, duration: 36 },
            { id: "eid63", tween: [ "style", "${_Text2}", "left", '40.63%', { fromValue: '43%'}], position: 2500, duration: 1250 },
            { id: "eid51", tween: [ "style", "${_logo1}", "opacity", '0.4621875', { fromValue: '1'}], position: 0, duration: 2425 },
            { id: "eid52", tween: [ "style", "${_logo1}", "opacity", '0', { fromValue: '0.4621875'}], position: 2425, duration: 75 },
            { id: "eid61", tween: [ "style", "${_Text2}", "font-size", '34px', { fromValue: '24px'}], position: 2500, duration: 1250 },
            { id: "eid60", tween: [ "style", "${_logo1}", "top", '165px', { fromValue: '320px'}], position: 155, duration: 2345 },
            { id: "eid58", tween: [ "style", "${_Text2}", "top", '426px', { fromValue: '420px'}], position: 2500, duration: 1250 },
            { id: "eid53", tween: [ "color", "${_Text}", "color", 'rgba(167,33,33,1.00)', { animationColorSpace: 'RGB', valueTemplate: undefined, fromValue: 'rgba(167,33,33,1.00)'}], position: 2500, duration: 0 },
            { id: "eid62", tween: [ "style", "${_Text2}", "width", '432px', { fromValue: '336px'}], position: 2500, duration: 1250 },
            { id: "eid56", tween: [ "style", "${_Text}", "left", '17.45%', { fromValue: '17.45%'}], position: 2500, duration: 0 },
            { id: "eid57", tween: [ "style", "${_Text}", "top", '278px', { fromValue: '278px'}], position: 2500, duration: 0 }         ]
      }
   }
}
};


Edge.registerCompositionDefn(compId, symbols, fonts, resources);

/**
 * Adobe Edge DOM Ready Event Handler
 */
$(window).ready(function() {
     Edge.launchComposition(compId);
});
})(jQuery, AdobeEdge, "login");
