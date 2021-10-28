<?php
defined('BASEPATH') or exit('No direct script access allowed');

class PartnerModel extends Render_Model
{
    public function getAllData($draw = null, $show = null, $start = null, $cari = null, $order = null)
    {
        // PIlih tabel
        $this->db->select("a.*, IF(a.status = '0' , 'Tidak Aktif', IF(a.status = '1' , 'Aktif', 'Tidak Diketahui')) as status_str");
        $this->db->from("partner a");
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


    public function getPartner($id)
    {
        $result = $this->db->get_where("partner", ['id' => $id])->row_array();
        return $result;
    }


    public function insert($nama, $lokasi, $status, $no_telepon, $email)
    {
        $result = $this->db->insert("partner", [
            'nama' => $nama,
            'lokasi' => $lokasi,
            'status' => $status,
            'no_telepon' => $no_telepon,
            'email' => $email,
            'created_at' => date("Y-m-d H:i:s"),
        ]);

        return $result;
    }


    public function update($id, $nama, $lokasi, $status, $no_telepon, $email)
    {
        $this->db->where('id', $id);
        $result = $this->db->update('partner', [
            'nama' => $nama,
            'lokasi' => $lokasi,
            'status' => $status,
            'no_telepon' => $no_telepon,
            'email' => $email,
            'updated_at' => date("Y-m-d H:i:s")
        ]);
        return $result;
    }


    public function delete($id)
    {
        $this->db->where('id', $id);
        $result = $this->db->update('partner', [
            'status' => '3',
            'updated_at' => date("Y-m-d H:i:s"),
            'deleted_at' => date("Y-m-d H:i:s")
        ]);
        return $result;
    }
}
