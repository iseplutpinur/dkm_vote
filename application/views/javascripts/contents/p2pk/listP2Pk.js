$(function () {

    function dynamic() {
        const table_html = $('#dt_basic');
        table_html.dataTable()
    }
    dynamic();

    $("#btn-tambah").click(() => {
        $("#myModalLabel").text("Tambah List Company");
        $('#id').val("");
        $('#client').val("");
        $('#pic').val("");
        $('#resiko').val("");
        $('#status').val("");
    });

    // tambah dan ubah
    // $("#form").submit(function (ev) {
    //     if($("#id").val() != ""){
    //     ev.preventDefault();
    //     const form = new FormData(this);
    //     $.LoadingOverlay("show");
    //     Toast.fire({
    //         icon: 'success',
    //         title: 'Data berhasil disimpan'
    //     })
    //     $.LoadingOverlay("hide");
    //     $('#myModal').modal('toggle')
    //     }
    // });

    // hapus
    $('#OkCheck').click(() => {
        let id = $("#idCheck").val()
        $.LoadingOverlay("show");
        Toast.fire({
            icon: 'success',
            title: 'Data berhasil dihapus'
        })
        $('#ModalCheck').modal('toggle')
        $.LoadingOverlay("hide");
    })

})

// Click Hapus
const Hapus = (id) => {
    $("#idCheck").val(id)
    $("#LabelCheck").text('Form Hapus')
    $("#ContentCheck").text('Apakah anda yakin akan menghapus data ini?')
    $('#ModalCheck').modal('toggle')
}

// Click Ubah
const Ubah = (id) => {
    $.LoadingOverlay("show");
    $("#myModalLabel").text("Ubah List Company");
    $('#id').val("1");
    $('#client').val("PT PAL-1");
    $('#pic').val("Wawan");
    $('#resiko').val("High");
    $('#status').val("Aktif");
    $('#myModal').modal('toggle')
    $.LoadingOverlay("hide");
}

function handleToltipFromDatatable({ element = '', title = '' }) {
    const el = $(element);
    el.tooltip({ title: title == null ? '' : title });
    el.mouseenter(function () {
        $(this).tooltip('show');
    });
    el.mouseout(function () {
        $(this).tooltip('hide');
    });
}