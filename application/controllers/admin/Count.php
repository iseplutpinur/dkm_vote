<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Count extends Render_Controller
{
  public function index()
  {
    // Page Settings
    $this->title = 'Data Count';
    $this->navigation = ['Perhitungan Suara'];
    $this->plugins = ['datatables'];

    // Breadcrumb setting
    $this->breadcrumb_1 = 'Dashboard';
    $this->breadcrumb_1_url = base_url();
    $this->breadcrumb_4 = 'Count';
    $this->breadcrumb_4_url = base_url() . 'admin/count/list';
    // content
    $this->content      = 'admin/count/list';

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
    $this->load->model("admin/CountModel", 'model');
    $this->default_template = 'templates/dashboard';
    $this->load->library('plugin');
    $this->load->helper('url');
  }
}
