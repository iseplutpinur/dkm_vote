<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ListP2PK extends Render_Controller
{
    public function index()
    {
        // Page Settings
        $this->title = 'List P2PK';
        $this->navigation = ['P2PK dan sub', 'ListP2PK'];
        $this->plugins = ['datatables'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'P2PK dan sub';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = 'ListP2PK';
        $this->breadcrumb_3_url = base_url() . 'p2pk/listP2PK';

        // content
        $this->content      = 'p2pk/listP2PK';

        // Send data to view
        $this->render();
    }

    public function detail($get)
    {
        // Page Settings
        $this->title = 'List P2PK';
        $this->navigation = ['P2PK dan sub', 'ListP2PK'];
        $this->plugins = ['datatables'];

        // Breadcrumb setting
        $this->breadcrumb_1 = 'Dashboard';
        $this->breadcrumb_1_url = base_url();
        $this->breadcrumb_2 = 'P2PK dan sub';
        $this->breadcrumb_2_url = '#';
        $this->breadcrumb_3 = 'ListP2PK';
        $this->breadcrumb_3_url = base_url() . 'p2pk/detailP2PK';

        // content
        $this->content      = 'p2pk/detailP2PK';

        $this->data['gets'] = $get;
        $this->data['send'] = [
            "id" => 1,
            "client" => 'client',
            "pic" => 'pic',
            "resiko" => 'resiko',
            "status" => 'status',
        ];

        // Send data to view
        $this->render();
    }

    function __construct()
    {
        parent::__construct();
        // Cek session
        $this->sesion->cek_session();
        if ($this->session->userdata('data')['level'] != 'Super Admin') {
			redirect('my404', 'refresh');
		}

        $this->load->model("p2pk/ListP2PKModel", 'model');
        $this->default_template = 'templates/dashboard';
        $this->load->library('plugin');
        $this->load->helper('url');
    }
}
