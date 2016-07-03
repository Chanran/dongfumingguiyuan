var express = require('express');
var router = express.Router();
var path = require('path');
var app = express();
var conn = require('../conf/db.js');
var bodyParser = require('body-parser');   //接收post参数
var multiparty = require('multiparty');//接收multipart/form-data
var moment = require('moment');  //格式化日期函数
var fs = require('fs');
var session = require('express-session');  //引入session模块
var cookieParser = require('cookie-parser');

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({extended: true}));

//后台权限控制
router.use('/',function(req,res,next){
    if (!req.session.admin){
        console.log("没有登录,已经跳转了!");
        res.redirect('/login');
    }else {
        console.log(1)
        next();
    }
});


router.get('/', function (req, res) {
    res.render('admin/index');
});

/*首页管理*/
router.get('/fontpage/notice', function (req, res) {
    res.render('admin/fontpage/notice');
});
router.get('/fontpage/getNotice', function (req, res) {
    conn.query('select * from config order by id DESC limit 1', function (err, data, fields) {
        if (err) {
            console.log(err);
            res.json({status: 1});
        } else {
            var data = {
                id: data[0].id,
                notice: data[0].notice,
                status: 1
            }
            res.json(data);
        }
    });
});
router.post('/fontpage/editNotice', function (req, res) {

    var id = req.body.id,
        notice = req.body.notice;
    console.log(notice)
    conn.query('update config set notice = ?  where id = ?', [notice, id], function (err) {
        if (err) {
            console.log(err);
            res.json({status: 0});
        } else {
            res.json({status: 1});
        }
    })
});

router.get('/fontpage/slide', function (req, res) {
    res.render('admin/fontpage/slide');
});
router.post('/fontpage/addSlideImg', function (req, res) {

    var form = new multiparty.Form({uploadDir: __dirname + '/../public/uploadImg/multiparty/'});

    form.parse(req, function (err, fields, files) {
        var filesTmp = JSON.stringify(files, null, 2);
        if (err) {
            console.log('parse error: ' + err);
            res.json({status: 0});
        } else {
            console.log('parse files: ' + filesTmp);
            var inputFile = files.image[0];
            var uploadedPath = inputFile.path;
            var dstPath = __dirname + '/../public/uploadImg/multiparty/' + inputFile.originalFilename;
            fs.rename(uploadedPath, dstPath, function (err) {
                if (err) {
                    console.log('rename error: ' + err);
                } else {
                    console.log('rename ok');
                }
            });

            var data = {
                title: '',
                img_name: inputFile.originalFilename,
                img_type: 1,
                status: 1,
                created_at: moment().format('YYYY-MM-DD HH:mm:ss')
            }

            conn.query('insert into img set ? ', data, function (err1, data, fields) {
                if (err1) {
                    console.log(err1);
                    res.json({status: 0});
                } else {
                    conn.query('select id from img order by id DESC limit 1', function (err2, data, fields) {
                        if (err2) {
                            console.log(err2);
                            res.json({status: 0, err: err2});
                        } else {
                            res.json({status: 1, id: data[0].id});
                        }
                    });
                }
            });
        }
    });
});
router.get('/fontpage/addSlideTitle', function (req, res) {
    var title = req.query.title;
    var id = req.query.id;
    conn.query('update img set title = ? where id = ?', [title, id], function (err, data, fields) {
        if (err) {
            console.log(err);
            res.json({status: 0, err: err});
        } else {
            res.json({status: 1});
        }
    })
});


/*公司详情*/
router.get('/company/article', function (req, res) {
    res.render('admin/company/article');
});
router.get('/company/getArticles', function (req, res) {
    conn.query('select * from company order by id DESC limit 1', function (err, articles, fields) {
        if (err) {
            res.json({status: 0});
        } else {
            var data = {
                status: 1,
                id: articles[0].id,
                introduction: articles[0].introduction,
                development: articles[0].development,
                business: articles[0].business
            };
            res.json(data);
        }
    });
});
router.post('/company/editArticles', function (req, res) {

    var introduction = req.body.introduction,
        development = req.body.development,
        business = req.body.business,
        id = req.body.id;

    conn.query('update company set introduction = ? ,development = ? ,business = ? where id = ?', [introduction, development, business, id], function (err, results, fields) {
        if (err) {
            res.json({status: 0});
        } else {
            res.json({status: 1});
        }
    });
});
router.get('/company/contact', function (req, res) {
    res.render('admin/company/contact');
});
router.get('/company/getContact', function (req, res) {
    conn.query('select * from company order by id DESC limit 1', function (err, contacts, fields) {
        if (err) {
            res.json({status: 0});
        } else {
            var data = {
                id: contacts[0].id,
                fix_phone: contacts[0].fix_phone,
                fix_phone_name: contacts[0].fix_phone_name,
                telephone: contacts[0].telephone,
                telephone_name: contacts[0].telephone_name,
                email: contacts[0].email,
                qq: contacts[0].qq,
                qq_group: contacts[0].qq_group,
                wechat: contacts[0].wechat,
                address: contacts[0].address,
                status: 1
            }
            res.json(data);
        }
    });
});
router.post('/company/editContact', function (req, res) {
    var id = req.body.id;
    var data = {
        fix_phone: req.body.fix_phone,
        fix_phone_name: req.body.fix_phone_name,
        telephone: req.body.telephone,
        telephone_name: req.body.telephone_name,
        email: req.body.email,
        qq: req.body.qq,
        qq_group: req.body.qq_group,
        wechat: req.body.wechat,
        address: req.body.address,
    }
    conn.query('update company set ? where id = ' + id, data, function (err, results, fields) {
        if (err) {
            console.log(err);
            res.json({status: 0});
        } else {
            res.json({status: 1});
        }
    });

});


/*龟园详情*/
router.get('/turtle/breed', function (req, res) {
    res.render('admin/turtle/breed');
});
router.post('/turtle/addBreedImg', function (req, res) {
    var form = new multiparty.Form({uploadDir: __dirname + '/../public/uploadImg/multiparty/'});
    form.parse(req, function (err, fields, files) {
        var filesTmp = JSON.stringify(files, null, 2);
        if (err) {
            console.log('parse error: ' + err);
            res.json({status: 0});
        } else {
            console.log('parse files: ' + filesTmp);
            var inputFile = files.image[0];
            var uploadedPath = inputFile.path;
            var dstPath = __dirname + '/../public/uploadImg/multiparty/' + inputFile.originalFilename;
            fs.rename(uploadedPath, dstPath, function (err) {
                if (err) {
                    console.log('rename error: ' + err);
                } else {
                    console.log('rename ok');
                }
            });


            var data = {
                title: '',
                img_name: inputFile.originalFilename,
                img_type: 2,
                status: 1,
                created_at: moment().format('YYYY-MM-DD HH:mm:ss')
            }
            conn.query('insert into img set ? ', data, function (err1) {
                if (err1) {
                    console.log(err1);
                    res.json({status: 0});
                } else {
                    conn.query('select * from img order by id DESC limit 1', function (err2, data, fields) {
                        if (err2) {
                            console.log(err2);
                            res.json({status: 0, err: err2});
                        } else {
                            res.json({status: 1, id: data[0].id});
                        }
                    });
                }
            });
        }
    });
});
router.post('/turtle/addBreedDetails', function (req, res) {
    var title = req.body.title;
    var introduction = req.body.introduction;
    var id = req.body.id;
    conn.query('update img set title = ? where id = ?', [title, id], function (err, data, fields) {
        if (err) {
            console.log(err);
            res.json({status: 0});
        } else {
            conn.query('insert into turtle set ?', {
                name: title,
                introduction: introduction,
                img_id: id
            }, function (err, data, fields) {
                if (err) {
                    console.log(err);
                    res.json({status: 0});
                } else {
                    res.json({status: 1});
                }
            })
        }
    });
});
router.get('/turtle/cultivate', function (req, res) {
    res.render('admin/turtle/cultivate');
});
router.post('/turtle/addCultivateImg', function (req, res) {
    var form = new multiparty.Form({uploadDir: __dirname + '/../public/uploadImg/multiparty/'});

    form.parse(req, function (err, fields, files) {
        var filesTmp = JSON.stringify(files, null, 2);
        if (err) {
            console.log('parse error: ' + err);
            res.json({status: 0});
        } else {
            console.log('parse files: ' + filesTmp);
            var inputFile = files.image[0];
            var uploadedPath = inputFile.path;
            var dstPath = __dirname + '/../public/uploadImg/multiparty/' + inputFile.originalFilename;
            fs.rename(uploadedPath, dstPath, function (err) {
                if (err) {
                    console.log('rename error: ' + err);
                } else {
                    console.log('rename ok');
                }
            });

            var data = {
                title: '',
                img_name: inputFile.originalFilename,
                img_type: 3,
                status: 1,
                created_at: moment().format('YYYY-MM-DD HH:mm:ss')
            }

            conn.query('insert into img set ? ', data, function (err1) {
                if (err1) {
                    console.log(err1);
                    res.json({status: 0});
                } else {
                    conn.query('select id from img order by id DESC limit 1', function (err2, data, fields) {
                        if (err2) {
                            console.log(err2);
                            res.json({status: 0, err: err2});
                        } else {
                            res.json({status: 1, id: data[0].id});
                        }
                    });
                }
            });
        }
    });
});
router.get('/turtle/addCultivateTitle', function (req, res) {
    var title = req.query.title;
    var id = req.query.id;
    conn.query('update img set title = ? where id = ?', [title, id], function (err, data, fields) {
        if (err) {
            console.log(err);
            res.json({status: 0, err: err});
        } else {
            res.json({status: 1});
        }
    })
});
router.get('/turtle/recommand', function (req, res) {
    res.render('admin/turtle/recommand');
});
router.post('/turtle/addRecommandImg', function (req, res) {
    var form = new multiparty.Form({uploadDir: __dirname + '/../public/uploadImg/multiparty/'});

    form.parse(req, function (err, fields, files) {
        var filesTmp = JSON.stringify(files, null, 2);
        if (err) {
            console.log('parse error: ' + err);
            res.json({status: 0});
        } else {
            console.log('parse files: ' + filesTmp);
            var inputFile = files.image[0];
            var uploadedPath = inputFile.path;
            var dstPath = __dirname + '/../public/uploadImg/test/' + inputFile.originalFilename;
            fs.rename(uploadedPath, dstPath, function (err) {
                if (err) {
                    console.log('rename error: ' + err);
                } else {
                    console.log('rename ok');
                }
            });
            var data = {
                title: '',
                img_name: inputFile.originalFilename,
                img_type: 4,
                status: 1,
                created_at: moment().format('YYYY-MM-DD HH:mm:ss')
            }

            conn.query('insert into img set ? ', data, function (err1) {
                if (err1) {
                    console.log(err1);
                    res.json({status: 0});
                } else {
                    conn.query('select id from img order by id DESC limit 1', function (err2, data, fields) {
                        if (err2) {
                            console.log(err2);
                            res.json({status: 0, err: err2});
                        } else {
                            res.json({status: 1, id: data[0].id});
                        }
                    });
                }
            });
        }
    });
});
router.get('/turtle/addRecommandTitle', function (req, res) {
    var title = req.query.title;
    var id = req.query.id;
    conn.query('update img set title = ? where id = ?', [title, id], function (err, data, fields) {
        if (err) {
            console.log(err);
            res.json({status: 0, err: err});
        } else {
            res.json({status: 1});
        }
    })
});

/*常年推荐*/
router.get('/turtle/recommandAllYear', function (req, res) {
    res.render('admin/turtle/recommandAllYear');
});
router.post('/turtle/addRecommandAllYearImg', function (req, res) {
    var form = new multiparty.Form({uploadDir: __dirname + '/../public/uploadImg/multiparty/'});

    form.parse(req, function (err, fields, files) {
        var filesTmp = JSON.stringify(files, null, 2);
        if (err) {
            console.log('parse error: ' + err);
            res.json({status: 0});
        } else {
            console.log('parse files: ' + filesTmp);
            var inputFile = files.image[0];
            var uploadedPath = inputFile.path;
            var dstPath = uploadedPath;
            fs.rename(uploadedPath, dstPath, function (err) {
                if (err) {
                    console.log('rename error: ' + err);
                } else {
                    console.log('rename ok');
                }
            });

            var data = {
                title: '',
                img_name: inputFile.originalFilename,
                img_type: 5,
                status: 1,
                created_at: moment().format('YYYY-MM-DD HH:mm:ss')
            }

            conn.query('insert into img set ? ', data, function (err1) {
                console.log(data)
                if (err1) {
                    console.log(err1);
                    res.json({status: 0});
                } else {
                    conn.query('select id from img order by id DESC limit 1', function (err2, data, fields) {
                        if (err2) {
                            console.log(err2);
                            res.json({status: 0, err: err2});
                        } else {
                            res.json({status: 1, id: data[0].id});
                        }
                    });
                }
            });
        }
    });
});
router.get('/turtle/addRecommandAllYearTitle', function (req, res) {
    var title = req.query.title;
    var id = req.query.id;
    conn.query('update img set title = ? where id = ?', [title, id], function (err, data, fields) {
        if (err) {
            console.log(err);
            res.json({status: 0, err: err});
        } else {
            res.json({status: 1});
        }
    })
});

/*文章管理*/
router.get('/article/article', function (req, res) {
    res.render('admin/article/article');

});
//接收初始化数据
router.get('/article/article/textType', function (req, res) {
    /*数据库查询*/
    conn.query("select * from text_type limit 4", function (err, text_type) {
        if (err) {
            console.log(err);
            conn.end();
            res.json({});
        }
        ;
        conn.query("select * from text where type_id = 1", function (err, text) {
            if (err) {
                console.log(err);
                conn.end();
                res.json({});
            } else {
                for (i = 0; i < text.length; i++) {
                    text[i].created_at = moment(text[0].created_at).format('YYYY-MM-DD HH:mm:ss');  //datetime格式化
                }
                res.json({text: text, text_type: text_type});
            }

        });
    });
});
//文章查询
router.get('/article/article/text', function (req, res) {
    var type_id = req.query.type_id;
    //console.log(type_id);
    conn.query("select * from text where type_id = " + type_id, function (err, text) {
        if (err) {
            console.log(err);
            conn.end();
        } else {
            //转化时间格式
            for (article in text) {
                article.created_at = new Date().valueOf(text.created_at);  //格式化datetime
            }
            res.json(text);
        }
    });
});
//添加文章
router.post('/article/article/addArticle', function (req, res) {
    var type_id = req.body.type_id,
        title = req.body.title,
        content = req.body.content;
    var read_quentity = 0;
    var created_at = moment().format('YYYY-MM-DD HH:mm:ss');

    if (title == "" || content == "") {
        res.json({status: 0});
    } else {
        data = {
            type_id: type_id,
            title: title,
            content: content,
            read_quantity: read_quentity,
            created_at: created_at
        };
        //console.log(data);
        conn.query("INSERT INTO text SET ?", data, function (err, results, fields) {
            if (err) {
                console.log(err);
                conn.end();
                res.json({status: 0});

            } else {
                res.json({status: 1})
            }
        });
    }
});


/*龟友互动*/
router.get('/exchange', function (req, res) {
    res.render('admin/exchange/msgboard');
});

router.get('/exchange/getTotalPages', function (req, res) {
    conn.query('select count(*) as totalPages from exchange where status <> 2', function (err, results, fields) {
        var totalPages = Math.ceil(results[0].totalPages / 2);
        res.json({totalPages: totalPages});
    });

});
router.get('/exchange/getMsgData', function (req, res) {

    var nowPage = parseInt(req.query.nowPage);
    var msgsOfPage = 2;
    var nowOffset;

    //数学不好,推了很久才推出的算法
    if (nowPage === 1) {
        nowOffset = 0;
    } else {
        nowOffset = nowPage + (msgsOfPage - 2 ) + (nowPage - 2 ) * (msgsOfPage - 1);
    }
    console.log(nowPage)
    console.log(nowOffset)
    conn.query('select * from exchange where status <> 2 order by comment_at DESC , reply_at DESC  limit ' + msgsOfPage + ' offset ' + nowOffset, function (err, msgs, fields) {
        for (i = 0; i < msgs.length; i++) {
            msgs[i].comment_at = moment(msgs[0].comment_at).format('YYYY-MM-DD HH:mm:ss');  //datetime格式化
            msgs[i].reply_at = moment(msgs[0].reply_at).format('YYYY-MM-DD HH:mm:ss');  //datetime格式化
        }
        console.log(msgs);
        res.json(msgs);
    });
});
router.post('/exchange/reply', function (req, res) {
    var msg_id = req.body.msg_id;
    var reply = req.body.reply_content;

    conn.query('update exchange set reply = ? where id = ? ', [reply, msg_id], function (err, result, fields) {
        //console.log(result);
        if (err) {
            res.json({status: 0});
        } else {
            res.json({status: 1});
        }
    });
});
router.get('/exchange/del', function (req, res) {
    var msg_id = req.params.msg_id;
    conn.query('udpate exchange set status = 2 where id = ?', [msg_id], function (err, result, fields) {
        if (err) {
            res.json({status: 0});
        } else {
            res.json({status: 1});
        }
    })
});
router.get('/exchange/show', function (req, res) {
    var msg_id = req.query.msg_id;
    var showOrNot = parseInt(req.query.showOrNot);

    if (showOrNot === 1) {
        conn.query('update exchange set is_show = 1 where id = ?', [msg_id], function (err) {
            if (err) {
                res.json({status: 0});
            } else {
                res.json({status: 1});
            }
        })
    } else if (showOrNot === 0) {
        conn.query('update exchange set is_show = 0 where id = ?', [msg_id], function (err) {
            if (err) {
                res.json({status: 0});
            } else {
                res.json({status: 1});
            }
        })
    }
});
/*网站管理*/
router.get('/site/statics', function (req, res) {
    res.render('admin/site/statics');
});

module.exports = router;