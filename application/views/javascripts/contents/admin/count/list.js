$(function () {
    function dynamic(datas = {
        kategori: null,
        kelas: null,
    }) {
        let filter = null;
        if (datas.kategori != null && datas.kelas != null) {
            filter = {
                kategori: datas.kategori,
                kelas: datas.kelas,
            }
        }
        const table_html = $('#dt_basic');
        table_html.dataTable().fnDestroy()
        const new_table = table_html.DataTable({
            "ajax": {
                "url": "<?= base_url()?>admin/count/ajax_data/",
                "data": datas,
                "type": 'POST'
            },
            "processing": true,
            "serverSide": true,
            "responsive": true,
            "lengthChange": true,
            "autoWidth": false,
            "columns": [
                { "data": null },
                { "data": "no_urut" },
                { "data": "nama" },
                { "data": "jumlah_suara" },
            ],
            order: [
                [1, 'asc']
            ],
            columnDefs: [{
                orderable: false,
                targets: [0]
            }],
        });
        new_table.on('draw.dt', function () {
            var PageInfo = table_html.DataTable().page.info();
            new_table.column(0, {
                page: 'current'
            }).nodes().each(function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            });
        });
    }
    dynamic();

    $("#btn-tambah").click(() => {
        $("#tambahModalTitle").text("Tambah Pemilih");
        $('#id').val('');
        $('#nama').val('');
        $('#npp').val('');
        $('#keterangan').val('');
        $('#status').val('1');
    });

    // tambah dan ubah
    $("#fmain").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>admin/count/' + ($("#id").val() == "" ? 'insert' : 'update'),
            data: form,
            cache: false,
            contentType: false,
            processData: false,
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil disimpan'
            })
            dynamic();
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Data gagal disimpan'
            })
        }).always(() => {
            $.LoadingOverlay("hide");
            $('#tambahModal').modal('toggle')
        })
    });

    // hapus
    $('#OkCheck').click(() => {
        let id = $("#idCheck").val()
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>admin/count/delete',
            data: {
                id: id
            }
        }).done((data) => {
            Toast.fire({
                icon: 'success',
                title: 'Data berhasil dihapus'
            })
            dynamic();
        }).fail(($xhr) => {
            Toast.fire({
                icon: 'error',
                title: 'Data gagal dihapus'
            })
        }).always(() => {
            $('#ModalCheck').modal('toggle')
            $.LoadingOverlay("hide");
        })
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
const Ubah = (datas) => {
    const data = datas.dataset;
    $('#id').val(data.id);
    $('#npp').val(data.npp);
    $('#nama').val(data.nama);
    $('#keterangan').val(data.keterangan);
    $('#status').val(data.status);
    $("#tambahModalTitle").text("Ubah Pemilih");
}