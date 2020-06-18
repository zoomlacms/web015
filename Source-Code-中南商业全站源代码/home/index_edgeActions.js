
(function($,Edge,compId){var Composition=Edge.Composition,Symbol=Edge.Symbol;
//Edge symbol: 'stage'
(function(symbolName){Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",1000,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",0,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",3000,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",2000,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",4000,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",5000,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",6000,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",7000,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindSymbolAction(compId,symbolName,"creationComplete",function(sym,e){$("<link>").attr({rel:"stylesheet",type:"text/css",href:"global.css"}).appendTo("head");});
//Edge binding end
})("stage");
//Edge symbol end:'stage'

//=========================================================

//Edge symbol: 'Symbol_1'
(function(symbolName){})("Symbol_1");
//Edge symbol end:'Symbol_1'

//=========================================================

//Edge symbol: 'Symbol_2'
(function(symbolName){})("Symbol_2");
//Edge symbol end:'Symbol_2'

//=========================================================

//Edge symbol: 'Symbol_3'
(function(symbolName){Symbol.bindElementAction(compId,symbolName,"${_bg5Copy2}","mouseover",function(sym,e){sym.getParentSymbol().play("B4");sym.getParentSymbol().play("B4");$("#Stage_Symbol_3_bg5Copy2").css("background","url(images/bg5_hover.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg4Copy2}","mouseover",function(sym,e){sym.getParentSymbol().play("B3");sym.getParentSymbol().play("B3");$("#Stage_Symbol_3_bg4Copy2").css("background","url(images/bg4_hover.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg3Copy2}","mouseover",function(sym,e){sym.getParentSymbol().play("B2");sym.getParentSymbol().play("B2");$("#Stage_Symbol_3_bg3Copy2").css("background","url(images/bg3_hover.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg2Copy2}","mouseover",function(sym,e){sym.getParentSymbol().play("B1");sym.getParentSymbol().play("B1");$("#Stage_Symbol_3_bg2Copy2").css("background","url(images/bg2_hover.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg1Copy2}","mouseover",function(sym,e){sym.getParentSymbol().play("B7");sym.getParentSymbol().play("B7");$("#Stage_Symbol_3_bg1Copy2").css("background","url(images/bg1_hover.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg6Copy2}","mouseover",function(sym,e){sym.getParentSymbol().play("B5");sym.getParentSymbol().play("B5");$("#Stage_Symbol_3_bg6Copy2").css("background","url(images/bg6_hover.jpg) left no-repeat")});
//Edge binding end
    //Symbol.bindElementAction(compId,symbolName,"${_bg7Copy2}","mouseover",function(sym,e){sym.getParentSymbol().play("B6");sym.getParentSymbol().play("B6");$("#Stage_Symbol_3_bg7Copy2").css("background","url(images/bg7_hover.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg5Copy2}","mouseout",function(sym,e){$("#Stage_Symbol_3_bg5Copy2").css("background","url(images/bg5.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg4Copy2}","mouseout",function(sym,e){$("#Stage_Symbol_3_bg4Copy2").css("background","url(images/bg4.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg3Copy2}","mouseout",function(sym,e){$("#Stage_Symbol_3_bg3Copy2").css("background","url(images/bg3.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg2Copy2}","mouseout",function(sym,e){$("#Stage_Symbol_3_bg2Copy2").css("background","url(images/bg2.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg1Copy2}","mouseout",function(sym,e){$("#Stage_Symbol_3_bg1Copy2").css("background","url(images/bg1.jpg) left no-repeat")});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_bg6Copy2}","mouseout",function(sym,e){$("#Stage_Symbol_3_bg6Copy2").css("background","url(images/bg6.jpg) left no-repeat")});
//Edge binding end
  //Symbol.bindElementAction(compId,symbolName,"${_bg7Copy2}","mouseout",function(sym,e){$("#Stage_Symbol_3_bg7Copy2").css("background","url(images/bg7.jpg) left no-repeat")});
//Edge binding end
})("Symbol_3");
//Edge symbol end:'Symbol_3'
})(jQuery,AdobeEdge,"EDGE-21292065");