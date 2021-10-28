function switchDetail(id) {
  $('.detail').each(function () {
    $(this).fadeOut();
  })
  $('#detail_calon_' + id).fadeIn()
}

// Click Ubah
const Pilih = (datas) => {
  const data = datas.dataset;
  $('#id').val(data.id);
  $('#title').html('Apakah anda yakin akan memilih ' + data.nama);
}

$("#fmain").submit(function (ev) {
  ev.preventDefault();
  const form = new FormData(this);
  $.LoadingOverlay("show");
  $.ajax({
    method: 'post',
    url: '<?= base_url() ?>dashboard/pilih',
    data: form,
    cache: false,
    contentType: false,
    processData: false,
  }).done((data) => {
    Toast.fire({
      icon: 'success',
      title: 'Data berhasil disimpan'
    })

    setTimeout(() => {
      document.location.reload();
    }, 300);
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