<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pemilih extends Render_Controller
{
    public function index()
    {
        // Page Settings
        $this->title = 'Data Pemilih';
        $this->navigation = ['Pemilih'];
        $this->plugins = ['datatables'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_4 = 'Pemilih';
        $this->breadcrumb_4_url = base_url() . 'admin/pemilih/list';
        // content
        $this->content      = 'admin/pemilih/list';

        // Send data to view
        $this->render();
    }

    public function ajax_data()
    {
        $order = ['order' => $this->input->post('order'), 'columns' => $this->input->post('columns')];
        $start = $this->input->post('start');
        $draw = $this->input->post('draw');
        $draw = $draw == null ? 1 : $draw;
        $length = $this->input->post('length');
        $cari = $this->input->post('search');

        if (isset($cari['value'])) {
            $_cari = $cari['value'];
        } else {
            $_cari = null;
        }

        $kategori = $this->input->post('kategori');
        $kelas = $this->input->post('kelas');
        $filter = [
            'kategori' => $kategori,
            'kelas' => $kelas,
        ];

        $data = $this->model->getAllData($draw, $length, $start, $_cari, $order, $filter)->result_array();
        $count = $this->model->getAllData(null, null, null, $_cari, $order, $filter)->num_rows();

        $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
    }


    public function getList()
    {
        $result = $this->model->getList();
        $code = $result ? 200 : 500;
        $this->output_json($result, $code);
    }

    public function insert()
    {
        $this->db->trans_start();
        $npp = $this->input->post("npp");
        $nama = $this->input->post("nama");
        $keterangan = $this->input->post("keterangan");
        $status = $this->input->post("status");
        $user_id = $this->id;
        $result = $this->model->insert($user_id, $nama, $npp, $keterangan,  $status);

        $this->db->trans_complete();
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function update()
    {
        $id = $this->input->post("id");
        $npp = $this->input->post("npp");
        $nama = $this->input->post("nama");
        $keterangan = $this->input->post("keterangan");
        $status = $this->input->post("status");
        $user_id = $this->id;
        $result = $this->model->update($id, $user_id, $nama, $npp, $keterangan,  $status);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function delete()
    {
        $id = $this->input->post("id");
        $result = $this->model->delete($this->id, $id);
        $code = $result ? 200 : 500;
        $this->output_json(["data" => $result], $code);
    }

    public function undang_pdf($id = null)
    {
        // get data
        $data = $this->model->dataPemilih($id);
        $header = '
        <body style="font-family:Arial">
        <div class="header">
            <center>
                <h3><span style="text-align:center; ">Undangan Pemilihan Ketua Umum DKM Ulilalbab</span></h3>
                <p style="font-size:11px; margin-top:-10px;">AYO MEMILIH PILIH SESUAI DENGAN HATI NURANI ANDA</p></center>
            </center>
            <hr>
        </div>
        ';
        $body = "
        {$header}
        <table width=\"100%\" style=\"font-weight:bold; font-size:14px;\">
        <tr>
            <td>NPP</td>
            <td>:</td>
            <td>{$data->npp}</td>
        </tr>
        <tr>
            <td>Nama</td>
            <td>:</td>
            <td>{$data->nama}</td>
        </tr>
        <tr>
            <td>Token</td>
            <td>:</td>
            <td>{$data->token}</td>
        </tr>
        <tr>
            <td>Status Pemilihan</td>
            <td>:</td>
            <td>{$data->sudah_pilih}</td>
        </tr>
        <tr>
            <td>Keterangan</td>
            <td>:</td>
            <td>{$data->keterangan}</td>
        </tr>
    </table>
    </div>
    </body>
        ";


        // document name
        $doc_name = "{$data->nama} ({$data->npp})  - Undagan Pemilihan Ketua Umum";

        $this->create_pdf([
            'html' => $body,
            'doc_name' => $doc_name,
            'paper_size' => 'A5'
        ]);
    }





























    public function cari()
    {
        $key = $this->input->post('q');
        // jika inputan ada
        if ($key) {
            $this->output_json([
                "results" => $this->model->cari($key)
            ]);
        } else {
            $this->output_json([
                "results" => []
            ]);
        }
    }

    public function noUrut()
    {
        $kelas_id = $this->input->post('kelas_id');
        $result = $this->model->noUrut($kelas_id);
        $code = $result ? 200 : 500;
        $this->output_json($result, $code);
    }

    public function cekNoUrut()
    {
        $kelas_id = $this->input->post('kelas_id');
        $no = $this->input->post('no');
        $result = $this->model->cekNoUrut($kelas_id, $no);
        $this->output_json($result, 200);
    }



    function __construct()
    {
        parent::__construct();
        $this->sesion->cek_session();
        $akses = ['Super Admin'];
        $get_lv = $this->session->userdata('data')['level'];
        if (!in_array($get_lv, $akses)) {
            redirect('my404', 'refresh');
        }
        $this->id = $this->session->userdata('data')['id'];
        $this->photo_path = './files/admin/pemilih/';
        $this->load->model("admin/PemilihModel", 'model');
        $this->default_template = 'templates/dashboard';
        $this->load->library('plugin');
        $this->load->helper('url');
    }
}
