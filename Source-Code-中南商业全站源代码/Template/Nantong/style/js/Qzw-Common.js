//document.domain="795.com.cn";

//ѡ� v2.0
;(function($){ 
	$.fn.extend({
		qTab:function(time,time1){ 
			 if($(this).length>1){
		 		$(this).each(function(){ new tab(this,time,time1); });
			 }else{ 
				new tab(this,time,time1); 
			 }
		} 
	});
 
 function tab(_this,time,time1){
		this.isuf=function(str){return (typeof str==='undefined');}
		if(this.isuf(_this))return false;			    //ִ�ж��󲻵�Ϊ��
		if(this.isuf(time))time=0;	
		if(!this.isuf(time1))time=parseInt(Math.random()*(time1-time+1)+time1); 
		var _self=this; 
		this.siv;
		this.idx=0;
		this.ic=$(_this).find('a[rel]').length;
		if(this.ic<=1)return false;						 //���ֻ��һ��ѡ���򲻰�
		this.cs=$(_this).find('a[class]').attr('class'); 
		  
		if(!this.isuf($(_this).attr('rel')))return false;  //�����ظ���
	    $(_this).attr('rel',Math.random());
	    
		$(_this).find('a[rel]').each(function(i){  
				if(!_self.isuf($(this).attr('rel'))){
					$(this).bind('mouseover',function(){
											if(time>0)_self.stop();
											if(!_self.isuf(_self.cs)){
												$(this).siblings('.'+_self.cs).removeClass(_self.cs);
												$(this).addClass(_self.cs);  
											}
											$(this).siblings().each(function(){$('#'+$(this).attr('rel')).hide();});
											$('#'+$(this).attr('rel')).show();
										})
							.bind('mouseout',function(){ 
												if(time>0){ _self.sel(i);_self.start();}	
		   								  }); 
				}
		});

		this.sel=function(index){
			if(!this.isuf($(_this).find('a[rel]').attr('rel'))){
				this.idx++; 
				if(index !=null)this.idx=index;
				if(this.idx >= this.ic)this.idx=0; //���¿�ʼѭ��
				
				if(!this.isuf(this.cs)){
					$(_this).find('a[class='+this.cs+']').removeClass(this.cs);
					$(_this).find('a[rel]').eq(this.idx).addClass(this.cs);  
				}
				$(_this).find('a[rel]').each(function(){ $('#'+$(this).attr('rel')).hide();});
				$('#'+$(_this).find('a[rel]').eq(this.idx).attr('rel')).show();
			}
		}					
			 
		this.stop= function(){ window.clearInterval(this.siv); }						//ֹͣ		
		this.start=function(){ this.siv=setInterval(function(){ _self.sel();},time); }	//��ʼ 
		if(time>0)this.start();															//����
	}; 
	
})(jQuery);

;(function($){ 
	$.fn.extend({
           Point:function(){ 
             this.each(function(){
                var _this=$(this),t=_this.attr('alt');
                _this.hover(function(){
                     if(t){
                        if($('#point').length==0)$('body').append("<div class='qtip' id='point'></div>"); 
                        var P=$('#point'),x,y,w;P.html(t);
                        var D=$(document);offset={dw:D.width(),pw:P.width()+10,ph:P.height()+10,o:_this.offset(),th:_this.height()};
                        //if((w=_this.width())>200)w=200;width:w,
                        if((offset.o.left+offset.pw)>offset.dw)x=offset.o.left-offset.pw;else x=offset.o.left;
                        if(offset.o.top<offset.ph)y=offset.o.top+offset.th;else y=offset.o.top-offset.ph;
                        P.css({left:x,top:y}).fadeIn("slow"); 
                     }
                },function(){ $('#point').hide(); }); 
              });
           }
    });
 })(jQuery);
 
 
;(function($){
    $.fn.extend({
        qVCode:function(){
           if($(this).next('img').length==0){
                var self=this;
                $(this).unbind('focus');
                $(this).css('background','');
                var vcode = '/vcode.aspx?80.25.4..22.1',tid=$(this).attr('id');
                $(this).after($('<img>').attr({id:tid+'_vli',src:'/Images/lond.gif'}));
                var img=new Image();
                $(img).load(function(){
                       self.after($('<img>')
                                    .attr({src:vcode,alt:'����ͼƬˢ��'})
                                    .css({'vertical-align':'bottom'})
                                    .click(function(){ this.src=vcode+Math.random();self.focus();}));
                       $('#'+tid+'_vli').hide();
                }).attr('src',vcode);
            }
        }
    });
})(jQuery);


//������Ϣ
;(function($){
	$.fn.extend({
		qScroll:function(time){
			new scroll(this,time);
		} 
	});

	function scroll(id,time){  
		if(typeof id==='undefined')return false; 
		if(typeof time==='undefined')time=3000;
		if(time<100)time=100;
		var _self=this; 
		this.addol=[];
		this.idx=0; 
		this._t= (typeof id==='object'?id:$('#'+id));
		this.siv; 
		this.ic=this._t.find('ul li').length; 
		if(this.ic<=1)return false;
		this._t.find('ul li').hide().eq(0).slideDown('normal');//��ʼʱ��ʾ��һ������  
		this._t.append($('<ol></ol>'));		//��������Բ��ڵ�
		this.showsel=function(index){       //�ƶ�λ��
			this.idx++;
			if(index!=null)this.idx=index;
			if(this.idx == this.ic)this.idx=0; //���¿�ʼѭ��
			this._t.find('ul li').hide().eq(this.idx).slideDown('normal');//���Ӷ���
			this._t.find('ol li a').removeClass('active').eq(this.idx).addClass('active');//Բ�㶯�� 
		}  
		this.stop= function(){ window.clearInterval(this.siv); } //ֹͣ
		this.start= function(){ this.siv=setInterval(function(){ _self.showsel();},time);  }//��ʼ
		//������¼��� �ƶ�������ʱֹͣ
		this._t.find('ul li').each(function(){ $(this).bind('mouseover',function(){ _self.stop();}).bind('mouseout',function(){ _self.start();}); _self.addol.push(_self.idx++); });
		this.idx=0; 
		//��������Բ�� �����¼�
		$.each(this.addol,function(i,n){_self._t.find('ol').append($('<li></li>').append($('<a href=\'javascript:void(0);\'></a>').click(function(){ _self.showsel(i);})));});
		this._t.find('ol li a').eq(0).addClass('active');//��ʼʱѡ�е�һ��Բ�� 
		this.start();//����  
	} 
})(jQuery);




 


//�õ�Ƭ
;(function($){
	$.fn.extend({
		qSlidePlay:function(time){
			 if($(this).length>1){
		 		$(this).each(function(){ new SlidePlay(this,time); });
			 }else{
				new SlidePlay(this,time);
			 }
		} 
	});
	
	function SlidePlay(o,time){  
		if(typeof $(o).attr('rel')!=='undefined')return false;
		$(o).attr('rel',Math.random());
		var self=this;
		this.Ul=$(o).children('ul');
		this.LI=this.Ul.children('li');
		this.C={L:this.LI.length,H:parseInt(this.Ul.height())/2,W:parseInt(this.Ul.width())/2}; 
		this.Ol=$(o).find('ol li'); 
	
		this.Title=function(i){return this.LI.eq(i).find('img').attr('title');}
		//�״���ʾ����˵�� ������ڵĻ�
		this.SP=this.Ul.append("<span class='slide-title' style='width:"+(this.C.W*2)+"px'>"+(this.Title(0)||'')+"</span>").find('span').css('bottom',this.Title(0)?'0':'-25px');
		
		if(this.Ol.length==0){ //û��ָ���������ӻ�����ͼ�򴴽�չ�����
		    this.Ul.append('<ol class=\'slide-index\'></ol>'); 
		    this.LI.each(function(i){self.Ul.children('ol').append('<a>'+(i+1)+'</a>');});
		    this.Ol=this.Ul.find('ol a'); 
		}
	    this.Siv; this.I=1; this.Z=1; this.X;
		
		this.LI.hover(function(){self.Stop();},function(){self.Start();});              //�������ͼƬ����ֹͣ
		this.Ol.each(function(i){ $(this).hover(function(){self.Stop();self.Sel(i);},function(){ self.Start();});}); //��������������Ӳ���ֹͣ
		this.Ol.eq(0).addClass('slide-best');  
	
		this.Sel=function(i){
		        var isX=i<this.I-1;     //�Ƿ�Ϊ�û�����漴�������
				if(i!=null)this.I=i;
				if(this.I==0)this.I=this.C.L;
				if(this.I>this.C.L)this.I=1;
				var sf = this.LI, 
				    x = (this.I==this.C.L?0:this.I), 
				    m = parseInt(Math.random()*9)%2==0,  //�����ŵ�β��ʱ���¿�ʼ
				    d = m?{'top':0 ,opacity:'toggle'}:{'left':0,opacity:'toggle'}, 
				    t = 600; 
				
				this.Ol.removeClass('slide-best').eq(x).addClass('slide-best');
		        
				this.SP.html('').animate({bottom:'-25px'},t/2,function(){ //ͼƬ˵������
				    var tl=self.Title(isX?i:x);
				    if(tl)self.SP.html(tl).animate({bottom:0},t);
				});
				
				sf.eq(x).css({'z-index':self.Z-1}).css(d).show();
				
				sf.eq(isX?this.X:this.I-1).css('z-index',self.Z) //���ص�ǰ
									.animate(m?{top:'-'+self.C.H,opacity:'toggle'}:{left:'-'+self.C.W,opacity:'toggle'},t,function(){
										$(this).css('z-index',self.Z-1).animate(d,t,function(){ $(this).hide();});
									});
									
				sf.eq(isX?i:x).css('z-index',self.Z-1) //��ʾ��һ��
							.animate(m?{top:self.C.H,opacity:'toggle'}:{left:self.C.W,opacity:'toggle'},t,function(){
								$(this).css('z-index',self.Z+1).animate(d,t);	
							});		
							
				this.X=x; this.Z++; this.I++;
		}
		this.Stop=function(){ window.clearInterval(this.Siv); }						    //ֹͣ		
		this.Start=function(){ this.Siv=setInterval(function(){ self.Sel();},time); }	//��ʼ 
		this.Start(); 
	}
})(jQuery);


//SELECTѡ���� 
;(function($){
	$.fn.extend({ 
		OptionAdd:function(t,v){ $(this).get(0).options.add(new Option(t,v)); },
		OptionValue:function(){ return $(this).get(0).options[$(this).get(0).selectedIndex].value;},
		OptionText:function(){ return $(this).get(0).options[$(this).get(0).selectedIndex].text;},
		OptionSel:function(i){ if(i>=0 && i<=$(this).get(0).options.length)$(this).get(0).options[i].selected="selected";}, 
		OptionSelV:function(v){ for(var i=0;i<$(this).get(0).options.length;i++){if($(this).get(0).options[i].value==v)$(this).OptionSel(i);} }
	}); 
 })(jQuery);
 
 
//�ַ���ʽ����
(function($){
    $.fn.extend({
		qCsPlay:function(opc,time,dx,fn){ //opc:json������ʽ  time:�ֲ�ͣ��ʱ��  dx:�ֲ�����  fn:���ź�ִ�к���
			 if($(this).length>1){
		 		$(this).each(function(){ new CSPlay(this,opc,time,dx,fn); });
			 }else{ 
				new CSPlay(this,opc,time,dx,fn);
			 }
		} 
	});
    function CSPlay(_this,opc,time,dx,fn){  
        if(_this.length==0)return false;    
        var thiscs=$(_this).css('background-color');  
        if(!Qzw._u(opc))opc=[{'background-color':'red'},{'background-color': ((thiscs.indexOf('255)')>0 || thiscs=='#ffffff')?'':thiscs) }]; 
        if(!Qzw._u(time))time=100;
        if(!Qzw._u(dx))dx=2;
        var _self=this; 
	    this.siv;
	    this.idx=0;
	    this.pdx=0; 
	    this.sel=function(){ 
	        this.idx++;
	        $(_this).css(opc[this.idx-1]); 
	        if(this.idx>=opc.length){
	            this.pdx++;
	            this.idx=0;
	            if(this.pdx>=dx)this.stop();
	        }
	    }
	    this.stop= function(){ window.clearInterval(this.siv);if($.isFunction(fn))fn(); }//ֹͣ		
		this.start=function(){ this.siv=setInterval(function(){ _self.sel();},time); }	 //��ʼ 
		this.start();
    }
})(jQuery);


//Boxy�������չ����
jQuery.fn.qbox=function(options){
    var node = this.get(0).nodeName.toLowerCase();
    var self=this;
    if (node == 'a') {
        $(this).attr('onclick','').unbind('click').click(function(){return false;});
        options = $.extend({src:this.get(0).getAttribute('href'),beforeUnload:function(){ $(self).unbind('click').click(function(){return $(this).qbox(options);});}},options||{}); 
    }
   qBox.iFLoad(options);
   return false;
}
var qBox=function(){};
jQuery.extend(qBox,{
    aDgs:[],
    iFrame:function(op){ 
			op = jQuery.extend({title:'��ʾ',w:320,h:200,src:'about:blank',modal:false,fixed:false,unloadOnHide:true},op),fm=parseInt(Math.random()*(1000*987));
			var dialog = new Boxy("<b id=\"ld"+fm+"\">���ڼ��أ����Ժ�....</b><iframe id=\"_"+fm+"\" style=\"width:0;height:0;display:none;padding:0;\" src="+op.src+" frameborder=\"0\" scrolling=\"no\"></iframe>",op);   
	      
	        jQuery("#_"+fm).load(function(){   
               dialog.resize(op.w,op.h,function(){}); 
                  jQuery("#ld"+fm).hide();
                  jQuery("#_"+fm).css('display','');
            }); 
			qBox.aDgs.push(dialog);
			return false;
	}, 
    Close:function(){ 
			qBox.aDgs[qBox.aDgs.length-1].hide();
			return false
	},
	iFSrc:function(op){
			 op = jQuery.extend({w:320,h:200,src:'about:blank'},op); 
			 var B=qBox.aDgs[qBox.aDgs.length-1],C=B.getContent();
			 B.setTitle(op.title);   
			 jQuery(C).attr({'src':op.src}).load(function(){   
			       B.tween(op.w,op.h);  
			 });  
			 return false;

	},  
	iFLoad:function(options){ 
		    var sr= jQuery(this).attr("href");
			var op = jQuery.extend({src:sr},options);
			qBox.iFrame(op); 
		    return false;
	}
});

function Request(key){
    var _WLS = window.location.search;
    if(_WLS){ 
       (new RegExp("[\\?|&]"+key+"=([\\w\\u4e00-\\u9fa5\\%]*)&?","ig")).exec(_WLS);
       return decodeURIComponent(RegExp.$1);  
    }
    return "";
}

function Qzw(){};
jQuery.extend(Qzw,{
    //��ΪUNDEFINED
    _u:function(o){return o!=undefined;},
    Length:function(str){return Qzw._u(str)?str.replace(/\s*/g, "").length:0;},
    Rg:function(r,v){return r.test(v);},
    //��Ϊ��
    IsNull:function(str){ return Qzw.Length(str)>0;}, 
    //��JSON��ʽ���ַ���װ��ΪJSON
    Json:function(o){return eval('('+o+')');}, 
    londing:function(){
        if($("#_lond_msg").length==0)$("body").append("<div id=\"_lond_msg\" style=\"background:none repeat scroll 0 0 #FFFEEE;border:1px solid #FFE3AA;color:#2117db;background-image:url(/Images/sub-lond.gif);background-position:5px 3px;background-repeat:no-repeat;padding:3px 20px 3px 25px;z-index:999;position:fixed;top:5px;left:45%;font-size:12px;\">�����ύ,���Ժ󡭡�</div>");
    },
    rmlond:function(){ $("#_lond_msg").fadeOut("slow",function(){$(this).remove();}); } 
});

function Tip(){   
    var self=this;
    if($('#qtip').length==0)$('body').append("<div class='qtip' id='qtip'></div>");  
    this.QT = $('#qtip');
  }
jQuery.extend(Tip,{ 
        A:function (obj){Tip();$(obj).find("*[qtip]").each(function(){Tip.B(this);});}, 
        B:function (o){  
            $(o).bind("focus",function(){ 
                    self.QT.hide();
                    var op = $.extend({msg:'',rg:{t:'',v:''}},eval('('+ $(this).attr("qtip")+')')),offset= $(this).offset(),w=parseInt($(this).width()); 
                    if(op.msg){
                        self.QT.css('width',(w>100?w:100)-6);
                        self.QT.html(op.msg);
                        var h=parseInt(QT.height());
                        self.QT.css({left:offset.left,top:offset.top-h-12,color:''}).fadeIn("slow"); 
                    }
                }).bind("blur" ,function(){ self.QT.hide(); });
        },            
        V:function(obj){ 
             Tip(); var isf=true;
             $(obj).find("*[qtip]").each(function(){ 
                        var op= $.extend({msg:'',rg:{t:'',v:''}},eval('('+ $(this).attr("qtip")+')')) ,offset= $(this).offset(); 
                        if(op.rg.t){
                            if(op.rg.t(this)){
                                var w=parseInt($(this).width()); 
                                self.QT.css('width', (w>100?w:100)-6);
                                self.QT.html(op.rg.v);
                                var h=parseInt(QT.height());
                                QT.css({left:offset.left,top:offset.top-h-12,color:'red'}).fadeIn("slow");  
                                $(this).unbind();
                                if(this.id=='tbvcode') $(this).qVCode();
                                $(this).qCsPlay();
                                $(this).focus().bind("blur" ,function(){  self.QT.hide(); Tip.B(this); });
                                return isf=false;
                            }
                        }
            }); 
            return isf;
        } 
 });
     
  
function _Ajax(_data,_type,_dataType,_cache,fnsuccess){
    $.ajax({url:'/ajax.aspx',data:_data,global:false,async:false,timeout:1000*60,type:_type,dataType:_dataType,cache:_cache,success:fnsuccess,error:function(XMLHttpRequest,textStatus,errorThrown){alert("Exception Request.");}});
}


function doSearch(u){
	var sPv = $("#sProvince").OptionValue();
	if(sPv!=0){
		location.href = "/cy/"+u+"/"+sPv+","+$("#sCity").OptionValue()+"/";
	}
}

//function City(pid){ 
//    $("#sCity").get(0).options.length=0; 
//	$("#sCity").OptionAdd("londing","0");
//	$.ajax({
//		cache:true,
//		url:"/ajax.aspx?key=city&pid="+pid,
//		dataType:"json",
//		success:function(msg){
//			$("#sCity").get(0).options.length=0; 
//			$("#sCity").OptionAdd("���в���","0");
//			$(msg).each(function(){$("#sCity").OptionAdd(this.text,this.value);}); }
//	});
//}

function City(pid){ 
    OpAdd('#sCity','city',pid,'','����');
}

function OpAdd(obj,op,id,fn,txt){
    $(obj).get(0).options.length=0; 
	$(obj).OptionAdd("loading","0");
	$.ajax({
		cache:true,
		type: "get",
		url: "/ajax.aspx",
		data: "key="+op+"&pid="+id, 
		dataType:"json",
		success:function(msg){
			$(obj).get(0).options.length=0; 
			if(Qzw._u(txt))$(obj).OptionAdd(txt,"0"); 
			$((msg instanceof Array)?msg: Qzw.Json(msg.M||'[]')).each(function(){ if(this.text)$(obj).OptionAdd(this.text,this.value);});
			if($.isFunction(fn))fn();
		}
	});
}

function Login(id){ qBox.iFrame({title:'��¼',w:370,h:140,src:'/login.html'+(id?"#"+id:'')});return false;}
function Out(){AJAX("/cp.aspx?op=out");if($("#login1").length==1){ $("#login1").show();$("#login2").hide();}return false;   }


function __Submit(_this){  
        
        if(!Tip.V(_this))return false;  
        $(_this).ajaxSubmit(options);  
        return false;  
}
  
var options={  
        dataType:'json',
        timeout:90000,
        error:function(XMLHttpRequest,textStatus,errorThrown){
            var text=XMLHttpRequest.responseText;
            text = (textStatus=="error"? (!Qzw._u($(text).get(1))? text : $(text).get(1).innerHTML) : null) || " �ύ��ʱ��������ϣ����Ժ����ԡ�" ;
            Boxy.alert("<div style=\"color:red;font-size:14px\">"+text.replace(/<[^>]*>/ig,"")+"</div>", function(){$(":submit").attr("disabled","");},{title: "����",modal:false,fixed:false});
            Qzw.rmlond(); 
        }, 
        beforeSubmit:function(formData,jqForm,options) {  
             $(jqForm).find(':submit').attr('disabled','disabled');
             Qzw.londing();
             return true; 
        },
        success:function(rT, statusText, xhr, $form) { //E(bool):false(����)��M(string): ��ʾ��Ϣ��R(url):�ض��� 
           var op=$.extend({E:false,M:'',R:'',A:true,fn:function(){},$f:$form.attr('id')},rT||{});   
               op.fn(op); 
               if(op.M)alert(op.M);
               if(op.E){ 
                   $form.find('input:text').val('');
                   $form.find('select').each(function(){$(this).OptionSel(0);});
                   $form.find('textarea').val('');
                   $form.find('input:radio').eq(0).attr('checked',true);
               } 
               $form.find(':submit').attr('disabled',''); 
               Qzw.rmlond(); 
        }  
 } 
    
 
$(document).ready(function(){    
	//$("head").append("<link href=\"/javascript/boxy/css/boxy.css\" rel=\"stylesheet\" type=\"text/css\" />");
   // $("#Time").html(new Date().toLocaleString());
   // setInterval(function(){$("#Time").html(new Date().toLocaleString());},1000);  
    
	//$("#body a").attr("target","_blank"); 
	$("#nav").qTab();			//����
	$("#tip1").qTab(5000); 
	$(".tab").qTab(5000,8000);	//ѡ�
	$("#new1").qScroll();		//������Ϣ��qScroll(��ָ��ͣ��ʱ��/����); 
	$(".help").Point();
	$("form[rel='cp']").submit(function(){ return __Submit(this);}); 
	Tip.A('form');//��ʾ
	  
	
	$("#sProvince").bind("change",function(){
	    OpAdd($(this).next('select'),'city',$(this).OptionValue(),'','����');
	   // City($(this).OptionValue());
	 
	 });//��������
	
	$("#butpc").bind("click",function(){
		var	p = $("#sProvince").OptionValue(),c=$("#sCity").OptionValue();
		if(p!=0 || c!=0)location.href="/cy/search/0,"+p+","+c+",0,0/";
	}); 
	
	$("#buts").click(function(){
		var sr=$("#tbsearch").val();
		if(sr.replace(/\s+/g,"").length!=0)location.href="/Search.html?type=3&q="+sr;
	}); 
	 
    //��֤��
    $("#tbvcode").focus(function(){  $(this).qVCode(); });
         
           
     $(".topnav li").mouseover(function(){
        $(this).find("span").addClass("subhover");
        $(this).find(".subnav").slideDown('fast').show();
        $(this).hover(function() {},function(){ $(this).find("ul.subnav").slideUp('slow');$(".subhover").removeClass("subhover");}); 
    });
});

function AJAX(T,F,eF){ 
   try{
   Qzw.londing();
   var D=(!(typeof T == 'string')?$(T).attr("href"):T).split("?"); 
   $.ajax({type:'post',url:D[0],data:D[1],timeout:90000,dataType:'json',
   error:function(x,t,e){ if(t=="error" || t=='timeout'){Qzw.rmlond();if(jQuery.isFunction(eF))eF();else alert("Request error or timeout.");}},
   success:function(msg){ 
       var op=$.extend({E:false,M:'',R:'',A:true,fn:function(){}},msg||{});   
       if(jQuery.isFunction(F))F(); 
       op.fn(T,op);
       Qzw.rmlond();
   }});
   }catch(e){alert("�������"+(e.description||e));}
   return false;
}