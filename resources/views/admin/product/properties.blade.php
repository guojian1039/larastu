<style>
    .select2-container .select2-selection--single {
        height: 30px !important;
    }
    .choose-exist-table {
        width: 100%;
    }
</style>
<div class="card">
    <div class="card-header">
        属性信息
        <a href="/admin/products" class="btn btn-sm btn-default float-right"><i class="fa fa-list"></i> 返回列表</a>
    </div>
    <!-- /.box-header -->
    <div class="card-body" style="padding:18px 0 0">
        <!--<form method="post" action="{{$action}}" id="scaffold" pjax-container>-->
            <table class="table table-hover responsive table-header-gray " id="table-fields" style="margin-top:25px;">
                <thead>
                <tr>
                    <th style="width: 200px">属性项</th>
                    <th>属性值</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                @if($productProperties)
                    @foreach($productProperties as $index => $field)
                        <tr data-id="{{ $field['id'] }}">
                            <td>
                                <input type="hidden" name="id" value="{{ $field['id'] }}">
                                <input type="hidden" name="base_property_id" value="{{$field['base_property_id']}}">
                                <input type="text" @if($field['base_property_id']) readonly @endif name="base_property_title" class="form-control" placeholder="属性项" value="{{$field['title']}}" />
                            </td>
                            <td>
                                @if($field['base_property_id'])
                                    <select style="width: 200px" name="base_property_item_value">
                                        @foreach($field['baseProperty']->items as $item)
                                            <option value="{{ $item->id }}" {{$field['base_property_item_id'] == $item['id'] ? 'selected' : '' }}>{{$item->relvalue}}</option>
                                        @endforeach
                                    </select>
                                @else
                                    <input type="text"  name="base_property_item_value" class="form-control" placeholder="属性项" value="{{$field['prop_value']}}" />
                                @endif
                            </td>
                            <td>
                                <button class="btn btn-sm btn-success table-field-save text-capitalize"><i class="feather icon-save"></i>修改</button>
                                <button class="btn btn-sm btn-danger table-field-remove"><i class="feather icon-trash"></i>删除</button>
                            </td>
                        </tr>
                    @endforeach
                    @endif
                @if($baseProperties)
                    @foreach($baseProperties as $index => $field)
                        <tr>
                            <td>
                                <input type="hidden" name="id" value="0">
                                <input type="hidden" name="base_property_id" value="{{$field['id']}}">
                                <input type="text" readonly name="base_property_title" class="form-control" placeholder="属性项" value="{{$field['title']}}" />
                            </td>
                            <td>
                                <select style="width: 200px" name="base_property_item_value">
                                    @foreach($field['items'] as $item)
                                        <option value="{{ $item->id }}">{{$item->relvalue}}</option>
                                    @endforeach
                                </select>
                            </td>
                            <td><button class="btn btn-sm btn-success table-field-save text-capitalize"><i class="feather icon-save"></i>保存</button></td>
                        </tr>
                    @endforeach
                @endif
                </tbody>
            </table>

            <hr style="margin-top: 0;"/>

            <div class='form-inline d-flex justify-content-between' style="width: 100%; padding: 0 20px 12px;">

                <div class='form-group'>
                    <button type="button" class="btn btn-sm btn-success text-capitalize" id="add-table-field"><i class="feather icon-plus"></i>&nbsp;&nbsp;添加项</button>
                </div>

                <div class="row">


                </div>
            </div>

            <!-- /.box-body -->
            <div class="box-footer d-flex justify-content-between">
                <div></div>
                @if(!$productProperties)
                 <button type="submit" class="btn btn-primary text-capitalize"><i class="feather icon-save"></i>提交</button>
                @endif
            </div>
<!--
        </form>
-->
    </div>

</div>

<template id="table-field-tpl">
    <tr data-id="0">
        <td>
            <input type="hidden" name="id" value="0">
            <input type="hidden" name="base_property_id" value="0">
            <input type="text" name="base_property_title" class="form-control" placeholder="属性名称" />
        </td>
        <td>
            <input type="text" name="base_property_item_value" class="form-control" placeholder="属性值" />
        </td>
        <td>
            <button class="btn btn-sm btn-success table-field-save text-capitalize"><i class="feather icon-save"></i>保存</button>
        </td>
    </tr>
</template>

<script>
    Dcat.ready(function () {
        var tpl = $('#table-field-tpl').html(),
            $fieldsBody = $('#table-fields tbody');

        $('select').select2();

        $('#add-table-field').click(function (event) {
            addField();
        });

        $('#table-fields').on('click', '.table-field-remove', function(event) {

            Dcat.loading();
            var id=$(event.target).closest('tr').data('id');
            if(id>0)
            $.post('{{ $action }}', {property_id: id,'_method':'DELETE'}, function (res) {
                Dcat.loading(false);
            });
            $(event.target).closest('tr').remove();
        });
        $('#table-fields').on('click', '.table-field-save', function(event) {
            //$(event.target).closest('tr').remove();
            var obj=$(event.target).closest('tr');
            var id=obj.find("input[name='id']").val();
            var base_property_id=obj.find("input[name='base_property_id']").val();
            var base_property_title=obj.find("input[name='base_property_title']").val();
            var base_property_item_id=0,base_property_item_value='';
            if(base_property_id>0){
                var base_property_item=obj.find("select[name='base_property_item_value']");
                base_property_item_id=base_property_item.select2('data')[0].id;
                base_property_item_value=base_property_item.select2('data')[0].text;
            }else{
                var base_property_item=obj.find("input[name='base_property_item_value']");
                base_property_item_value=base_property_item.val();
            }

            if(!base_property_item_value || !base_property_title) return;
            var  item={
                id:id,
                base_property_id:base_property_id,
                base_property_title:base_property_title,
                base_property_item_id:base_property_item_id,
                base_property_item_value:base_property_item_value
            }
            Dcat.loading();
            $.post('{{ $action }}', {item: item}, function (res) {
                Dcat.loading(false);
                window.location.href='{{ $action }}';
            });
            console.log(item);

        });
        $('#scaffold').on('submit', function (event) {

            //event.preventDefault();

            if ($table.val() == '') {
                $table.closest('.form-group').addClass('has-error');
                $('#table-name-help').show();

                return false;
            }

            return true;
        });

        function addField(val) {
            val = val || {};
            var idx = getTR().length,
                $field = $(
                    tpl.replace(/__index__/g, idx)
                ),
                i;

            $fieldsBody.append($field);
            //$('select').select2();
        }
        function getTR() {
            return $('#table-fields tbody tr');
        }

    });
</script>