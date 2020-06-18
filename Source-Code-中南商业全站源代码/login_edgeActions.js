/***********************
* Adobe Edge Animate コンポジションアクション
*
* この文件を编辑する際には注意が必要です。必ず関数シグニチャと
* 「Edge」评论开始、 Adobe Edge 内からこれらのアクションを
* 保持运行状态。 
*
***********************/
(function($, Edge, compId){
var Composition = Edge.Composition, Symbol = Edge.Symbol; //Edge别名使用

   //Edge symbol: 'stage'
   (function(symbolName) {
      
      
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 3750, function(sym, e) {
         // Navigate to a new URL in the current window
         // (replace "_self" with appropriate target attribute for a new window)
         window.open("home/index.html", "_self");

      });
      //Edge binding end

   })("stage");
   //Edge symbol end:'stage'

})(jQuery, AdobeEdge, "login");