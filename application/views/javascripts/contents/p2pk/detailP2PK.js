$(function () {

    function dynamic() {
        $('#v-planning').css("display", "");
        $('#btn-planning').removeClass("btn-outline-primary");
        $('#btn-planning').addClass("btn-primary");
        $('#v-audit').css("display", "none");
        $('#v-report').css("display", "none");
    }
    dynamic();

    $("#btn-planning").click(() => {
        $('#v-planning').css("display", "");
        $('#btn-planning').removeClass("btn-outline-primary");
        $('#btn-planning').addClass("btn-primary");
        $('#v-audit').css("display", "none");
        $('#btn-audit').removeClass("btn-primary");
        $('#btn-audit').addClass("btn-outline-primary");
        $('#v-report').css("display", "none");
        $('#btn-report').removeClass("btn-primary");
        $('#btn-report').addClass("btn-outline-primary");
    });

    $("#btn-audit").click(() => {
        $('#v-planning').css("display", "none");
        $('#btn-planning').removeClass("btn-primary");
        $('#btn-planning').addClass("btn-outline-primary");
        $('#v-audit').css("display", "");
        $('#btn-audit').removeClass("btn-outline-primary");
        $('#btn-audit').addClass("btn-primary");
        $('#v-report').css("display", "none");
        $('#btn-report').removeClass("btn-primary");
        $('#btn-report').addClass("btn-outline-primary");
    });

    $("#btn-report").click(() => {
        $('#v-planning').css("display", "none");
        $('#btn-planning').removeClass("btn-primary");
        $('#btn-planning').addClass("btn-outline-primary");
        $('#v-audit').css("display", "none");
        $('#btn-audit').removeClass("btn-primary");
        $('#btn-audit').addClass("btn-outline-primary");
        $('#v-report').css("display", "");
        $('#btn-report').removeClass("btn-outline-primary");
        $('#btn-report').addClass("btn-primary");
    });

    let number = 1;
    $('#btn-add-file').click((ev) => {
        number = number + 1;
        ev.preventDefault();
        $('#list-doc').append(`
        <div class="row doc-${number}" id="list-${number}">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="doc">Attach Doc</label>
                    <div class="row m-1">
                        <div class="col-md-8">
                            <input type="file" class="form-control" id="doc[]" name="doc[]" placeholder="Attach Doc" />
                        </div>
                        <div class="col-md-4">
                            <button type="button" class="btn btn-danger del-list" data-id='${number}' id="btn-del-file"><i class="fa fa-minus"></i> Hapus File</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        `)
        $('.del-list').click(function(){
            $(`#list-${$(this).data('id')}`).remove()
        })
    });    
    

    let numbers = 1;
    $('#btn-add-file-audit').click((ev) => {
        numbers = numbers + 1;
        ev.preventDefault();
        $('#list-doc-audit').append(`
        <div class="row list-doc-audit-${numbers}" id="list-doc-audit-${numbers}">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="doc">Attach Doc</label>
                    <div class="row m-1">
                        <div class="col-md-8">
                            <input type="file" class="form-control" id="doc-audit[]" name="doc-audit[]" placeholder="Attach Doc" />
                        </div>
                        <div class="col-md-4">
                            <button type="button" class="btn btn-danger del-list" data-id='${numbers}' id="btn-del-file-audit"><i class="fa fa-minus"></i> Hapus File</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        `)
        $('.del-list').click(function(){
            $(`#list-doc-audit-${$(this).data('id')}`).remove()
        })
    });    
    
})
