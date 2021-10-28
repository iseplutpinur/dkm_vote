<?php
defined('BASEPATH') or exit('No direct script access allowed');

class KreditModel extends Render_Model
{
  public function api_warung($id_sales, $id = null, $cari=null): ?array
  {
    $status_kredit = 1;
    $this->db->select("b.id_stok_keluar, a.id,
      CONCAT(a.nama_pemilik, ' ', '[', a.kode, ']') as nama,
      a.alamat, (
        select sum((c.jumlah_karton * 12) + c.jumlah_renceng)
          from warung_sales_penjualan as c
        join warung as d on d.id = c.id_warung
        where d.id_sales = '$id_sales' and b.status = $status_kredit and d.id = a.id
      ) as renceng,
      b.id_produk,
      b.id_satuan_harga,
      b.id_stok_keluar,
      b.total_harga,
      b.dibayar,
      b.sisa");
    $this->db->from('warung a');
    $this->db->join('warung_sales_penjualan b', 'a.id = b.id_warung');
    $this->db->where('a.id_sales', $id_sales);
    $this->db->where('b.status', $status_kredit);

    if ($cari != null) {
      $this->db->where("(
      a.kode LIKE '%$cari%' or
      a.nama_pemilik LIKE '%$cari%' or
      a.alamat LIKE '%$cari%' or
      a.no_hp LIKE '%$cari%' or
      a.patokan LIKE '%$cari%'
      )");
    }

    $this->db->group_by('a.id');
    if ($id == null) {
      $db = $this->db->get();
      $length = $db->num_rows();
      $return = $db->result_array();
    } else {
      $this->db->where('a.id', $id);
      $db = $this->db->get();
      $length = $db->num_rows();
      $return = $db->row_array();
    }

    if ($return != null) {
      $stok_keluar = $this->db->select('id as id_stok_keluar')
        ->from('stok_keluar')
        ->where('status', 1)
        ->limit(1)
        ->get()
        ->row_array() ?? ['id_stok_keluar' => null];
      if ($id == null) {
        $rows = [];
        foreach ($return as $row) {
          $rows[] = array_merge($row, [
            'id_sales' => $id_sales,
            'id_stok_keluar' => $stok_keluar['id_stok_keluar'],
          ]);
        }
        $return = $rows;
      } else {
        $return = array_merge($return, [
          'id_sales' => $id_sales,
          'id_stok_keluar' => $stok_keluar['id_stok_keluar'],
        ]);
      }
    }

    $return = ['data' => $return, 'length' => $length];
    return $return;
  }


  public function insertSalesKredit(
    $id_stok_keluar,
    $qty,
    $id_produk,
    $id_satuan_harga,
    $id_warung,
    $harga,
    $total_harga,
    $id_sales
  ) {
    $karton = floor($qty / 12);
    $renceng = $qty % 12;
    $data = [
      'id_stok_keluar' => $id_stok_keluar,
      'id_produk' => $id_produk,
      'id_satuan_harga' => $id_satuan_harga,
      'id_warung' => $id_warung,
      'harga' => $harga,
      'total_harga' => $total_harga,
      'dibayar' => 0,
      'sisa' => $total_harga,
      'status' => 1,
      'jumlah_karton' => $karton,
      'jumlah_renceng' => $renceng,
      'id_sales' => $id_sales,
    ];
    $this->db->insert('warung_sales_penjualan', $data);
    $return = $this->db->insert_id();
    return $return;
  }
}
