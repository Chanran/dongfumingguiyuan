var express = require('express');
var app = express();
var router = express.Router();
var bodyParser = require('body-parser');   //接收post参数
var moment = require('moment');  //格式化日期函数
var conn = require('../conf/db.js');
var async = require('async');   //异步控制模块
var events = require('events'); //引入events模块
var session = require('express-session');  //引入session模块
var cookieParser = require('cookie-parser');
var conn = require('../conf/db.js'); //数据库连接
var crypto = require('crypto');

//设置session有效时间
router.use(cookieParser());
router.use(bodyParser.json());
router.use(bodyParser.urlencoded({extended: true}));

router.use(session({
    resave: false,
    saveUninitialized: true,
    secret: 'dfidjnmmdsfnklcxjijalkfmfjdsilfj',
    cookie:{maxAge:10*60*1000}  //10分钟的session
}));
//登录验证
router.get('/login', function (req, res, next) {


    if (req.session.admin) {
        res.redirect('admin');
    } else {
        res.render('home/login');
    }
});
router.post('/checkLogin', function (req, res) {

    var name = req.body.name;
    var password = req.body.password;
    var salt = "blue1234";
    var hasher = crypto.createHash("md5");
    hasher.update(password+salt,"UTF8");
    var encryptpassword = hasher.digest('hex');

    conn.query('select admin_name,admin_password from config where id = 1',function(err,data,fields){
        console.log(data);
        if (data[0].admin_name === name && data[0].admin_password === encryptpassword ) {
            req.session.admin = name;
            res.json({status: 1});
        } else {
            res.json({status: 0});
        }
    });

});

/* GET home page. */
router.get('/index', function (req, res) {
    res.render('home/index');
});
router.get('/index/getData', function (req, res) {
     var sqls = {
         //首页联系方式
         'contact':'select fix_phone,fix_phone_name,telephone,telephone_name,email,qq,qq_group,wechat,address from company order by id DESC limit 1',
         //首页公告
         'notice' : 'select notice from config order by id DESC limit 1 ',
         //首页轮播图
         'slider' : 'select id,title,img_name from img where img_type = 1 and status = 1 order by created_at DESC limit 4',
         //首页最新文章
         'latestArticles': 'select id,title,created_at from text order by created_at limit 5',
         //首页龟种图片
         'turtleBreed':'select id,title,img_name from img where img_type = 2 and status = 1 order by created_at DESC limit 10',
         //首页养殖地图片
         'turtleCultivate' : 'select id,title,img_name from img where img_type = 3 and status = 1 order by created_at DESC limit 12',
         //首页龟种图片近期推荐
         'turtleRecommand' : 'select id,title,img_name from img where img_type = 4 and status = 1 order by created_at DESC limit 8',
         //首页龟种图片长年推荐
         'turtleRecommandAllYear' : 'select id,title,img_name from img where img_type = 5 and status = 1 order by created_at DESC limit 8',
         //首页本场要闻
         'newsText' : 'select id,title from text where type_id = 1 order by created_at DESC limit 10',
         //首页市场动态
         'marketText':'select id,title from text where type_id = 2 order by created_at DESC limit 10',
         //首页行业评论
         'commentText' : 'select id,title from text where type_id = 3 order by created_at DESC limit 10',
         //首页养殖交流
         'communicationText' : 'select id,title from text where type_id = 4 order by created_at DESC limit 10'
     }

    var tasks = ['contact','notice','slider','latestArticles','turtleBreed','turtleCultivate','turtleRecommand','turtleRecommandAllYear','newsText','marketText','commentText','communicationText'];
    var result = {};
    async.eachSeries(tasks,function(item,callback){
        //console.log(item+"==>"+sqls[item]);
        conn.query(sqls[item],function(err,data){
            if (err){
                console.log(err);
            }
           //console.log(data);
            result[item] = data;

            /*最新文章日期转化*/
            if (item === 'latestArticles'){
                var i;
                for (i = 0; i < data.length; i++){
                    data[i].created_at = moment(data[i].created_at).format('YYYY-MM-DD');
                }
            }
            if (item === 'communicationText'){
                //console.log(result)
                res.json({status:1,result:result});
            }
            callback(err,data);
        });
    },function(err){
        if (err){
            console.log(err);
        }
    });
});

/*文章内容显示*/
router.get('/showText/:id',function(req,res){
    var id = req.params.id;
    conn.query('update text set read_quantity = read_quantity + 1 where id = '+id,function(err){
       if (err){
           console.log(err)
       }
    });
    res.render('home/showText');
});
router.get('/getText',function(req,res){
    var id = req.query.id;

    conn.query('select * from text where id = '+id,function(err,text,fields){
        //获取文章类型名称
        conn.query('select name from text_type where id = '+text[0].type_id,function(err,type,fields){
            conn.query('select id,title from text where type_id = '+text[0].type_id+' limit 10 ',function(err,otherTexts,fields){
                console.log(id);
                console.log(text);
                if (err){
                    console.log(err);
                    res.json({status:0});
                }else{
                    text[0].created_at = moment(text[0].created_at).format('YYYY-MM-DD');
                    text[0].type_name = type[0].name;
                    text[0].otherTexts = otherTexts;
                    res.json({status:1,text:text[0]});
                }
            });
        });
    });
});
/*显示某一种类图片的全部类型*/
router.get('/showImg/:id',function(req,res){
    res.render('home/showImg');
});
router.get('/getImg',function(req,res){
    var id = req.query.id;

    conn.query('select img_type from img where id = '+id,function(err,imgType,fields){
        //获取文章类型名称
            conn.query('select * from img where status = 1 and img_type = '+imgType[0].img_type+" order by created_at DESC",function(err,imgs,fields){
                //console.log(id);
                console.log(imgs);
                if (err){
                    console.log(err);
                    res.json({status:0});
                }else{
                    for (var i = 0; i < imgs.length; i++){
                        if (parseInt(imgs[i].id) === parseInt(id)){
                            var tmp = imgs[0];
                            imgs[0] = imgs[i];
                            imgs[i] = tmp;
                        }
                    }
                    res.json({status:1,imgs:imgs,nowImgId:id});
                }
            });
    });
});

router.get('/basic', function (req, res) {
    res.render('home/basic');
});

router.get('/basic/getData', function (req, res) {
    conn.query('select introduction,development,business from company order by id DESC limit 1', function (err, company, fields) {
        if (err) {
            console.log(err);
            res.json({status: 0});
        } else {
            var data = {
                introduction: company[0].introduction,
                development: company[0].development,
                business: company[0].business,
                status: 1
            };
            res.json(data);
        }
    })
})

/*龟园展示*/
router.get('/show', function (req, res) {
    res.render('home/show');
});
router.get('/show/getData', function (req, res) {
    var sqls = {
        //首页龟种图片
        'turtleBreed':'select id,title,img_name from img where img_type = 2 and status = 1 order by created_at DESC limit 12',
        //首页养殖地图片
        'turtleCultivate' : 'select id,title,img_name from img where img_type = 3 and status = 1 order by created_at DESC limit 12',
        //首页龟种图片近期推荐
        'turtleRecommand' : 'select id,title,img_name from img where img_type = 4 and status = 1 order by created_at DESC limit 12',
    }

    var tasks = ['turtleBreed','turtleCultivate','turtleRecommand'];
    var result = {};
    async.eachSeries(tasks,function(item,callback){
        //console.log(item+"==>"+sqls[item]);
        conn.query(sqls[item],function(err,data){
            if (err){
                console.log(err);
            }
            //console.log(data);
            result[item] = data;

            if (item === 'turtleRecommand'){
                console.log(result)
                res.json({status:1,result:result});
            }
            callback(err,data);
        });
    },function(err){
        if (err){
            console.log(err);
        }
    });
});


router.get('/variety', function (req, res) {
    res.render('home/variety');
});


/*市场动态*/
router.get('/market', function (req, res) {
    res.render('home/market');
});
router.get('/market/getTotalPages', function (req, res) {
    conn.query('select count(*) as totalPages from text where type_id = 2', function (err, results, fields) {
        var totalPages = Math.ceil(results[0].totalPages / 5); //5篇文章一页
        res.json({totalPages: totalPages});
    });
});
router.get('/market/getData', function (req, res) {

    var nowPage = parseInt(req.query.nowPage);
    var textsOfPage = 5; //5篇文章一页
    var nowOffset;

    //数学不好,推了很久才推出的算法
    if (nowPage === 1) {
        nowOffset = 0;
    } else {
        nowOffset = nowPage + (textsOfPage - 2 ) + (nowPage - 2 ) * (textsOfPage - 1);
    }
    console.log(nowPage);
    console.log(nowOffset);
    conn.query('select * from text where type_id = 2 order by created_at DESC  limit ' + textsOfPage + ' offset ' + nowOffset, function (err, texts, fields) {
        if(err){
            console.log(err);
            res.json({status:0});
        }else{
            for (i = 0; i < texts.length; i++) {
                texts[i].created_at = moment(texts[0].created_at).format('YYYY-MM-DD');  //datetime格式化
                //利用正则表达式去掉html代码里的img标签
                texts[i].content = texts[i].content.toString().replace(/<img[^>]*?\/>/gi,"");
            }
            //console.log(texts);
            res.json({status:1,texts:texts});
        }
    });
});

/*养殖交流*/
router.get('/communication', function (req, res) {
    res.render('home/communication');
});
router.get('/communication/getTotalPages', function (req, res) {
    conn.query('select count(*) as totalPages from text where type_id = 4', function (err, results, fields) {
        var totalPages = Math.ceil(results[0].totalPages / 6); //5篇文章一页
        console.log(results)
        res.json({totalPages: totalPages});
    });

});
router.get('/communication/getData', function (req, res) {

    var nowPage = parseInt(req.query.nowPage);
    var textsOfPage = 5; //5篇文章一页
    var nowOffset;

    //数学不好,推了很久才推出的算法
    if (nowPage === 1) {
        nowOffset = 0;
    } else {
        nowOffset = nowPage + (textsOfPage - 2 ) + (nowPage - 2 ) * (textsOfPage - 1);
    }
    console.log(nowPage)
    console.log(nowOffset)
    conn.query('select * from text where type_id = 4 order by created_at DESC  limit ' + textsOfPage + ' offset ' + nowOffset, function (err, texts, fields) {
        if(err){
            console.log(err);
            res.json({status:0});
        }else{
            for (i = 0; i < texts.length; i++) {
                texts[i].created_at = moment(texts[0].created_at).format('YYYY-MM-DD');  //datetime格式化
                //利用正则表达式去掉html代码里的img标签
                texts[i].content = texts[i].content.toString().replace(/<img[^>]*?\/>/gi,"");
            }
            console.log(texts);
            res.json({status:1,texts:texts});
        }
    });
});

/*本场要闻*/
router.get('/news', function (req, res) {
    res.render('home/news');
});
router.get('/news/getTotalPages', function (req, res) {
    conn.query('select count(*) as totalPages from text where type_id = 1', function (err, results, fields) {
        var totalPages = Math.ceil(results[0].totalPages / 5); //5篇文章一页
        res.json({totalPages: totalPages});
    });
});
router.get('/news/getData', function (req, res) {

    var nowPage = parseInt(req.query.nowPage);
    var textsOfPage = 5; //5篇文章一页
    var nowOffset;

    //数学不好,推了很久才推出的算法
    if (nowPage === 1) {
        nowOffset = 0;
    } else {
        nowOffset = nowPage + (textsOfPage - 2 ) + (nowPage - 2 ) * (textsOfPage - 1);
    }
    console.log(nowPage)
    console.log(nowOffset)
    conn.query('select * from text where type_id = 1 order by created_at DESC  limit ' + textsOfPage + ' offset ' + nowOffset, function (err, texts, fields) {
        if(err){
            console.log(err);
            res.json({status:0});
        }else{
            for (i = 0; i < texts.length; i++) {
                texts[i].created_at = moment(texts[0].created_at).format('YYYY-MM-DD');  //datetime格式化
                //利用正则表达式去掉html代码里的img标签
                texts[i].content = texts[i].content.toString().replace(/<img[^>]*?\/>/gi,"");
            }
            console.log(texts);
            res.json({status:1,texts:texts});
        }
    });
});

/*龟友留言*/
router.get('/message', function (req, res) {
    res.render('home/message');
});
//添加留言
router.post('/message/addMessage', function (req, res) {
    var data = {
        guest_name: req.body.guest_name,
        email: req.body.email,
        comment: req.body.comment,
        comment_at: moment().format('YYYY-MM-DD HH:mm:ss'),
        reply : '',
        reply_at : moment().format('YYYY-MM-DD HH:mm:ss'),
        is_show : 0,
        status:1
    };
    conn.query('insert into exchange set ?',data,function(err,data,fields){
        if (err) {
            console.log(err);
            res.json({status:0});
        }else{
            res.json({status:1})
        }
    });
});
router.get('/message/getTotalPages', function (req, res) {
    conn.query('select count(*) as totalPages from exchange where is_show = 1', function (err, results, fields) {
        var totalPages = Math.ceil(results[0].totalPages / 3); //3个评论一页
        res.json({totalPages: totalPages});
    });
});
router.get('/message/getData', function (req, res) {

    var nowPage = parseInt(req.query.nowPage);
    var textsOfPage = 3; //3个评论一页
    var nowOffset;

    //数学不好,推了很久才推出的算法
    if (nowPage === 1) {
        nowOffset = 0;
    } else {
        nowOffset = nowPage + (textsOfPage - 2 ) + (nowPage - 2 ) * (textsOfPage - 1);
    }
    console.log(nowPage)
    console.log(nowOffset)
    conn.query('select * from exchange where is_show = 1 order by comment_at DESC  limit ' + textsOfPage + ' offset ' + nowOffset, function (err, messages, fields) {
        if(err){
            console.log(err);
            res.json({status:0});
        }else{
            for (i = 0; i < messages.length; i++) {
                messages[i].comment_at = moment(messages[i].comment_at).format('YYYY-MM-DD HH:mm:ss');
                messages[i].reply_at = moment(messages[i].reply_at).format('YYYY-MM-DD HH:mm:ss');
            }
            console.log(messages);
            res.json({status:1,messages:messages});
        }
    });
});


/*联系我们*/
router.get('/contact', function (req, res) {
    res.render('home/contact');
});
router.get('/contact/getData',function(req,res){
    var contact_sql_params = ' fix_phone,fix_phone_name,telephone,telephone_name,email,qq,qq_group,wechat,address ';

    conn.query('select ' + contact_sql_params + ' from company order by id DESC limit 1', function (err, contact) {
            console.log(contact)
            if (err){
                console.log(err);
                res.json({status:0});
            }else{
                res.json({contact:contact[0],status:1});
            }
    })
});

module.exports = router;