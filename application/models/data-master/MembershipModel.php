<?php
defined('BASEPATH') or exit('No direct script access allowed');

class MembershipModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("jenis_membership a");
        $this->db->where("a.status <>", 3);

        // order by
        if ($order['order'] != null) {
            $columns = $order['columns'];
            $dir = $order['order'][0]['dir'];
            $order = $order['order'][0]['column'];
            $columns = $columns[$order];

            $order_colum = $columns['data'];
            $this->db->order_by($order_colum, $dir);
        }

        // initial data table
        if ($draw == 1) {
            $this->db->limit(10, 0);
        }

        // pencarian
        if ($cari != null) {
            $this->db->where("(a.nama LIKE '%$cari%' or a.keterangan LIKE '%$cari%' or IF(a.status = '2' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }

    public function getMembership($id)
    {
        $result = $this->db->get_where("jenis_membership", ['id' => $id])->row_array();
        return $result;
    }

    public function insert($nama, $keterangan, $status)
    {
        $this->db->trans_start();
        // $id_level = $this->insert_level($nama);

        $this->db->reset_query();
        $result = $this->db->insert("jenis_membership", [
            'nama' => $nama,
            'keterangan' => $keterangan,
            'status' => $status,
            // 'id_level' =>  0,
            'created_at' => date("Y-m-d H:i:s"),
        ]);
        $this->db->trans_complete();

        return $result;
    }


    public function update($id, $nama, $keterangan, $status)
    {
        $this->db->trans_start();
        // $id_level = $this->db->select('id_level')
        //     ->from('jenis_membership')
        //     ->where('id', $id)
        //     ->get()->row_array();
        // $id_level = isset($id_level['id_level']) ? $id_level['id_level'] : null;
        // if ($id_level == null) {
        //     $id_level = $this->insert_level($nama);
        // } else {
        //     $this->update_level($id_level, $nama);
        // }

        $this->db->reset_query();
        $this->db->where('id', $id);
        $result = $this->db->update('jenis_membership', [
            'nama' => $nama,
            'keterangan' => $keterangan,
            'status' => $status,
            // 'id_level' => 0,
            'updated_at' => date("Y-m-d H:i:s")
        ]);

        $this->db->trans_complete();
        return $result;
    }

    private function insert_level($nama)
    {
        $this->db->insert('level', [
            'lev_nama' => $nama,
            'lev_keterangan' => "Level Untuk Jenis Membership $nama",
            'lev_status' => 'Aktif'
        ]);

        return  $this->db->insert_id();
    }

    private function update_level($id, $nama)
    {
        $this->db->where('lev_id', $id);
        return $this->db->update('level', [
            'lev_nama' => $nama,
            'lev_keterangan' => "Level Untuk Jenis Membership $nama",
            'lev_status' => 'Aktif'
        ]);
    }

    private function delete_level($id)
    {
        $this->db->where('lev_id', $id);
        return  $this->db->delete('level');
    }

    public function delete($id)
    {
        // $this->db->where('id', $id);
        $this->db->trans_start();
        // $id_level = $this->db->select('id_level')
        //     ->from('jenis_membership')
        //     ->where('id', $id)
        //     ->get()->row_array();
        // $id_level = isset($id_level['id_level']) ? $id_level['id_level'] : null;
        // if ($id_level != null) {
        //     $this->delete_level($id);
        // }

        $this->db->reset_query();
        $this->db->where('id', $id);
        $result = $this->db->update('jenis_membership', [
            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        $this->db->trans_complete();
        return $result;
    }
}
