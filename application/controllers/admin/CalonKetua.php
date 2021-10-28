<?php
defined('BASEPATH') or exit('No direct script access allowed');

class CalonKetua extends Render_Controller
{
  public function index()
  {
    // Page Settings
    $this->title = 'Calon Ketua';
    $this->navigation = ['Calon Ketua'];
    $this->plugins = ['datatables'];

    // Breadcrumb setting
    $this->breadcrumb_1 = 'Dashboard';
    $this->breadcrumb_1_url = base_url();
    $this->breadcrumb_2 = 'Users';
    $this->breadcrumb_2_url = '#';
    $this->breadcrumb_3 = 'Users';
    $this->breadcrumb_3_url = base_url() . 'admin/CalonKetua';
    $this->content      = 'admin/calon_ketua/list';

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

    $partner = $this->input->post('partner');
    $filter = [
      'partner' => $partner,
    ];

    $data = $this->model->getAllData($draw, $length, $start, $_cari, $order, $filter)->result_array();
    $count = $this->model->getAllData(null, null, null, $_cari, $order, null, $filter)->num_rows();

    $this->output_json(['recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data]);
  }

  public function simpan()
  {
    $this->load->library('form_validation');
    $this->form_validation->set_error_delimiters('', '');
    $this->form_validation->set_rules('id', 'id Calon', 'trim|required|numeric');
    $this->form_validation->set_rules('npm', 'npm', 'trim|required');
    $this->form_validation->set_rules('nama', 'Nama', 'trim|required');
    $this->form_validation->set_rules('no_urut', 'No Urut', 'trim|required|numeric');
    $this->form_validation->set_rules('visi', 'Visi', 'trim|required');
    $this->form_validation->set_rules('misi', 'Misi', 'trim|required');
    $this->form_validation->set_rules('status', 'Status', 'trim|required|numeric');

    if ($this->form_validation->run() == FALSE) {
      $this->output_json([
        'status' => false,
        'data' => null,
        'message' => validation_errors()
      ], 400);
    } else {
      $id = $this->input->post('id');
      $npm = $this->input->post('npm');
      $nama = $this->input->post('nama');
      $no_urut = $this->input->post('no_urut');
      $visi = $this->input->post('visi', false);
      $misi = $this->input->post('misi', false);
      $status = $this->input->post('status');
      $is_ubah = $this->input->post('is-ubah:');

      $result = $this->model->simpan($id, $npm, $nama, $no_urut, $visi, $misi, $status, $is_ubah);

      $code = $result != null ? 200 : 400;
      $status = $result != null;
      $this->output_json([
        'status' => $status,
        'length' => 1,
        'data' =>  $result,
        'message' => $status ? 'Data berhasil ditambahkan' : 'Data gagal ditambahkan'
      ], $code);
    }
  }


  public function tambah($id = null)
  {
    // Page Settings
    $this->title = is_null($id) ? 'Tambah Calon ketua' : 'Ubah Calon ketua';
    $this->navigation = ['Calon Ketua'];
    $this->plugins = ['datatables', 'select2', 'summernote'];

    // Breadcrumb setting
    $this->breadcrumb_1 = 'Dashboard';
    $this->breadcrumb_1_url = base_url();
    $this->breadcrumb_2 = 'Calon Ketua';
    $this->breadcrumb_2_url = base_url() . 'admin/CalonKetua';
    $this->breadcrumb_3 = 'Tambah';
    $this->breadcrumb_3_url = base_url() . 'admin/CalonKetua/tambah';
    $this->data['isUbah'] = $id != null;

    // content
    $this->content      = 'admin/calon_ketua/tambah';

    $ceknew = $this->model->cekNew($id);
    if ($ceknew == null) {
      redirect('/admin/calon_ketua/profile');
      return;
    }


    $this->data['getID'] = $ceknew['id'];
    $this->data['profile'] = $ceknew;
    $this->data['isUbah'] = $id != null;

    // Send data to view
    $this->render();
  }


  public function delete()
  {
    $this->load->library('form_validation');
    $this->form_validation->set_error_delimiters('', '');
    $this->form_validation->set_rules('id_calon', 'Id Calon', 'trim|required|numeric');
    if ($this->form_validation->run() == FALSE) {
      $this->output_json([
        'status' => false,
        'data' => null,
        'message' => validation_errors()
      ], 400);
    } else {
      $id = $this->input->post('id_calon');
      $result = $this->model->delete($id);

      $code = $result != null ? 200 : 400;
      $status = $result != null;
      $this->output_json([
        'status' => $status,
        'length' => 1,
        'data' =>  $result,
        'message' => $status ? 'Data berhasil dihapus' : 'Data gagal dihapus'
      ], $code);
    }
  }


  function __construct()
  {
    parent::__construct();
    // Cek session
    $this->sesion->cek_session();
    $akses = ['Super Admin'];
    $get_lv = $this->session->userdata('data')['level'];
    if (!in_array($get_lv, $akses)) {
      redirect('my404', 'refresh');
    }

    $this->load->model("admin/CalonKetuaModel", 'model');
    $this->default_template = 'templates/dashboard';
    $this->load->library('plugin');
    $this->load->helper('url');
  }
}
