$(document).ready(function () {
    $('.lnr-heart').click(function () {
        var porduct_id=$(this).parent().data('id');
        if($(this).parent().hasClass('is-active')){
            axios.delete('/products/'+porduct_id+'/favorite').then(function () {
                swal('取消成功','','success').then(function () {
                    location.reload();
                })
            }) ;
        }
        else {
            axios.post('/products/'+porduct_id+'/favorite').then(function () {
                swal('收藏成功','','success').then(function () {
                    location.reload();
                })
            },function (error) {

                if(error.response && error.response.status===401){
                    swal('请先登录','','error').then(function () {
                        location.href='/login';
                    })
                }else if(error.response && error.response.data.message){
                    swal(error.response.data.message,'','error');
                }else{
                    swal('系统错误','','error');
                }

            })
        }

    })
    $('.lnr-cart').click(function (e) {
        var product_id=$(this).parent().data('id');
        e.stopPropagation();
        storeCart(product_id);
    });
    function storeCart(sku_id) {
        axios.post('/cart',{
            amount:1,
            sku_id:sku_id
        }).then(function () {
            swal('加入购物车成功','','success').then(function () {
                location.href='/cart';
            })
        },function (error) {
            if(error.response && error.response.status===401){
                swal('请先登录','','error').then(function () {
                    location.href='/login';
                })
            }else if(error.response && error.response.data.message){
                swal(error.response.data.message,'','error');
            }else{
                swal('系统错误','','error');
            }
        });
        /*
        axios.post('/cart/add',{
            product_id:product_id
        }).then(function () {
            swal('加入购物车成功','','success').then(function () {
                location.href='/cart';
            })
        },function (error) {
            if(error.response && error.response.status===401){
                swal('请先登录','','error').then(function () {
                    location.href='/login';
                })
            }else if(error.response && error.response.data.message){
                swal(error.response.data.message,'','error');
            }else{
                swal('系统错误','','error');
            }
        });
        */
    }
});