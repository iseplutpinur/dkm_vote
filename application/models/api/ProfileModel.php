<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ProfileModel extends Render_Model
{
  public function getProfileBody($user_id)
  {
    $return = $this->db->select("
      user_nama as nama,
      user_tgl_lahir as tanggal_lahir,
      user_jk as jenis_kelamin,
      user_phone as no_hp,
      user_foto as foto,
      user_email as email")
      ->from('users')
      ->where('user_id', $user_id)
      ->get()->row_array();
    return $return;
  }

  public function UpdateProfile(
    $user_id,
    $user_nama,
    $user_tgl_lahir,
    $user_jk,
    $user_phone,
    $user_foto,
    $user_email,
    $user_passwoord
  ) {
    $data = [
      'user_nama' => $user_nama,
      'user_tgl_lahir' => $user_tgl_lahir,
      'user_jk' => $user_jk,
      'user_phone' => $user_phone,
      'user_foto' => $user_foto,
      'user_email' => $user_email,
      'updated_at' => Date('Y-m-d h:i:s')
    ];

    $return = false;
    $code = 0;

    // cek profile
    $get_db = $this->db->select('user_email')
      ->from('users')
      ->where('user_email', $user_email)
      ->where('user_id <>', $user_id)
      ->get();

    if ($get_db->num_rows() == 0) {
      if (!in_array($user_passwoord, ['', null])) {
        $data['user_password'] = $this->b_password->bcrypt_hash($user_passwoord);
      }
      $this->db->where('user_id', $user_id);
      $return = $this->db->update('users', $data);
      $code = 1;
    }

    return [
      'code' => $code,
      'result' => $return
    ];
  }

  public function getSumWarung($id_sales): int
  {
    $result = $this->db->select("count(*) as total")
      ->from('warung')
      ->where('id_sales', $id_sales)
      ->get()
      ->row_array();
    $result = $result ?? ['total' => 0];
    return $result['total'];
  }

  public function getSumPenjualanThisMonth($id_sales): array
  {
    $start = Date('Y-m-01');
    $end = Date('Y-m-d');
    $result = $this->db->select("((sum(jumlah_karton) * 12) + sum(jumlah_renceng)) as total")
      ->from('warung_sales_penjualan')
      ->where('id_sales', $id_sales)
      ->where("(created_at between '$start' and '$end')")
      ->get()
      ->row_array();
    $result = $result ?? ['total' => 0];
    return [
      'karton' => floor($result['total'] / 12),
      'renceng' => $result['total'] % 12,
      'start_date' => $start,
      'end_date' => $end
    ];
  }
}
