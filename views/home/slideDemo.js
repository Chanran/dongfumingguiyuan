$(function(){
     var wrap=document.getElementById('wrap1'),
        btn=document.getElementById('lbkj').getElementsByTagName('div'),
        list=document.getElementById('lb').getElementsByTagName('img'),
        index=0,
        lastIndex = -1,
        timer=null;

      // 调用自动播放函数
        timer=setInterval(autoPlay,2000);

        function autoPlay(){       
            
            index+=1;
            lastIndex += 1;   
            if(index>=list.length){
                index=0;    
            }
            if(lastIndex>=list.length){
                lastIndex = 0;
            }  
            changePic(index); 
        }

      // 定义图片切换函数
        function changePic(index){          
           var slip = $(".slip-box");
           if(index < lastIndex){
               $(".slip-box").stop().animate({right: 252*index + "px"},300);
           }else{
               $(".slip-box").stop().animate({right: 252*index + "px"},300);
           }
           $(".lbkj").eq(index).css("background-image","url(" + __uri("../uploadImg/lbkj-hover.png") + ")");
           $(".lbkj").eq(lastIndex).css("background-image","url(" + __uri("..\/uploadImg\/lbkj1.png") + ")");
        }

     // 鼠标划过整个容器时停止自动播放
        wrap.onmouseover=function(){
            clearInterval(timer);
        }
     // 鼠标离开整个容器时继续播放至下一张
        wrap.onmouseout=function(){
            timer=setInterval(autoPlay,2000);   
        }
     // 遍历所有数字导航实现划过切换至对应的图片
        for(var i=0;i<btn.length;i++){
            btn[i].myIndex=i;
            btn[i].onmouseover=function(){
                clearInterval(timer);
                if(index != this.myIndex){
                    lastIndex = index;
                    index= this.myIndex;     
                    changePic(index);
                    lastIndex = index-1;
                }   
            }   
        }
})