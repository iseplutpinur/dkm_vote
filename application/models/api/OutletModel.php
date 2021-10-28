<?php
defined('BASEPATH') or exit('No direct script access allowed');

class OutletModel extends Render_Model
{
  public function getKode($id_kecamatan = 0)
  {
    $get_kode_kecamatan = $this->db->select('kode')->get_where('kecamatan', ['id' => $id_kecamatan])->row_array();
    $kode_kecamatan = $get_kode_kecamatan['kode'];

    $this->db->select('RIGHT(warung.kode,5) as kode', FALSE);
    $this->db->order_by('id', 'DESC');
    $this->db->limit(1);
    $query = $this->db->get('warung');  //cek dulu apakah ada sudah ada kode di tabel.    
    if ($query->num_rows() <> 0) {

        $data = $query->row();
        $kode = intval($data->kode) + 1;
    } else {
        $kode = 1;
    }
    $batas = str_pad($kode, 5, "0", STR_PAD_LEFT);
    $kodetampil = "BD-" . $kode_kecamatan . "-" . $batas;
    return $kodetampil;
  }

  public function insertOutlet(
    $id_sales,
    $pemilik,
    $warung,
    $alamat,
    $no_hp,
    $patokan
  ) {
    $get_detail = $this->db->get_where('warung', ['id_sales' => $id_sales]);
    if($get_detail->num_rows() > 0){
      $id_kecamatan = $get_detail->row_array()['id_kecamatan'];
    }else{
      $id_kecamatan = 5; // 5 is default
    }
    $kode = $this->getKode($id_kecamatan);
    $data = [
      'kode'  => $kode,
      'nama_warung' => $warung,
      'nama_pemilik' => $pemilik,
      'alamat' => $alamat,
      'no_hp' => $no_hp,
      'patokan' => $patokan,
      'id_sales' => $id_sales,
      'status' => 1
    ];
    $this->db->insert('warung', $data);
    $return = $this->db->insert_id();
    return $return;
  }
}
