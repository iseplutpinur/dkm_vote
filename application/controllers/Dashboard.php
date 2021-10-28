<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends Render_Controller
{

	public function index()
	{
		// Page Settings
		$this->title = 'Dashboard';
		$this->navigation = ['Dashboard'];
		$this->plugins = ['datatables'];
		$this->load->library('libs');

		// Breadcrumb setting
		$this->breadcrumb_1 = 'Dashboard';
		$this->breadcrumb_1_url = '#';

		$this->content = 'dashboard/admin';
		$this->data['totalCompany'] = $this->model->getJumlahCompany();
		$this->data['totalResiko'] = $this->model->getJumlahResiko();
		$this->data['totalMembership'] = $this->model->getJumlahMembership();
		$this->data['totalPeristiwa'] = $this->model->getJumlahPeristiwa();
		$this->data['totalPatner'] = $this->model->getJumlahPatner();
		$this->data['totalPengguna'] = $this->model->getJumlahPengguna();
		// Send data to view
		$this->render();
	}

	function __construct()
	{
		parent::__construct();
		$this->sesion->cek_session();
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');

		// Cek session

		// model
		$this->load->model("DashboardModel", 'model');
	}
}

/* End of file Dashboard.php */
/* Location: ./application/controllers/Dashboard.php */