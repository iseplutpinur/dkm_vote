$(function () {
    function dynamic() {
        $.LoadingOverlay("show");
        $.ajax({
            method: 'POST',
            url: '<?= base_url() ?>data-master/jatuhTempo/getData',
            data: null
        }).done((data) => {
            if (data.data) {
                data = data.data;
                $('#id').val(data.id);
                $('#jumlah_hari').val(data.jumlah_hari);
                $('#status').val(data.status);
                $('#tanggal').val(data.updated_at != null ? data.updated_at : data.created_at);
            } else {
                Toast.fire({
                    icon: 'error',
                    title: 'Data Error.'
                })
            }
        }).fail(($xhr) => {
            $('#id').val('');
            $('#jumlah_hari').val('');
            $('#status').val('');
            $('#tanggal').val(`<?= date('Y-m-d H:m:s') ?>`);
        }).always(() => {
            $.LoadingOverlay("hide");
        })
    }
    dynamic();

    $("#reset").click(() => {
        dynamic();
    });

    // tambah dan ubah
    $("#form").submit(function (ev) {
        ev.preventDefault();
        const form = new FormData(this);
        $.LoadingOverlay("show");
        $.ajax({
            method: 'post',
            url: '<?= base_url() ?>data-master/jatuhTempo/' + ($("#id").val() == "" ? 'insert' : 'update'),
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
            $('#myModal').modal('toggle')
        })
    });

})
