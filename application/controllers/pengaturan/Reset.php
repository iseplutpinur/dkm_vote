<?php
defined('BASEPATH') or exit('No direct script access allowed');

class HakAkses extends Render_Controller
{


  public function index()
  {
    // Page Settings
    $this->title           = 'Pengaturan Hak Akses';
    $this->content           = 'pengaturan/hakakses';
    $this->navigation         = ['Pengaturan', 'Hak Akses'];
    $this->plugins           = ['datatables', 'datatables-btn'];

    // Breadcrumb setting
    $this->breadcrumb_1       = 'Dashboard';
    $this->breadcrumb_1_url     = base_url() . 'dashboard';
    $this->breadcrumb_2       = 'Pengaturan';
    $this->breadcrumb_2_url     = '#';
    $this->breadcrumb_3       = 'Hak Akses';
    $this->breadcrumb_3_url     = '#';

    // Send data to view
    $this->data['records']       = $this->hakAkses->getAllData();
    $this->data['level']       = $this->hakAkses->getDataLevel();
    $this->data['parent']       = $this->hakAkses->getDataParent();

    $this->render();
  }

  function __construct()
  {
    parent::__construct();
    $this->sesion->cek_session();
    if ($this->session->userdata('data')['level'] != 'Super Admin') {
      redirect('my404', 'refresh');
    }
    $this->load->model('pengaturan/hakAksesModel', 'hakAkses');
    $this->default_template = 'templates/dashboard';
    $this->load->library('plugin');
    $this->load->helper('url');
  }
}

/* End of file HakAkses.php */
/* Location: ./application/controllers/pengaturan/HakAkses.php */