<?php
defined('BASEPATH') or exit('No direct script access allowed');

class TipeKontakModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("tipe_contact a");
        $this->db->where("a.status <> 3");

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
            $this->db->where("(
                a.nama LIKE '%$cari%' or
                a.lokasi LIKE '%$cari%' or
                IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) LIKE '%$cari%')");
        }

        // pagination
        if ($show != null && $start != null) {
            $this->db->limit($show, $start);
        }

        $result = $this->db->get();
        return $result;
    }


    public function getTipeKontak($id)
    {
        $result = $this->db->get_where("tipe_contact", ['id' => $id])->row_array();
        return $result;
    }


    public function insert($nama, $keterangan, $status)
    {
        $result = $this->db->insert("tipe_contact", [
            'nama' => $nama,
            'keterangan' => $keterangan,
            'status' => $status
        ]);

        return $result;
    }


    public function update($id, $nama, $keterangan, $status)
    {
        $this->db->where('id', $id);
        $result = $this->db->update('tipe_contact', [
            'nama' => $nama,
            'keterangan' => $keterangan,
            'status' => $status
        ]);
        return $result;
    }


    public function delete($id)
    {
        $this->db->where('id', $id);
        $result = $this->db->update('tipe_contact', [
            'status' => 3,
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        return $result;
    }
}
