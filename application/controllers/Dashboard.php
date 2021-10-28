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

		if ($this->level == 'Super Admin') {
			$this->content = 'dashboard/admin';
			$this->data['totalCompany'] = $this->model->getJumlahCompany();
			$this->data['totalResiko'] = $this->model->getJumlahResiko();
			$this->data['totalMembership'] = $this->model->getJumlahMembership();
			$this->data['totalPeristiwa'] = $this->model->getJumlahPeristiwa();
			$this->data['totalPatner'] = $this->model->getJumlahPatner();
			$this->data['totalPengguna'] = $this->model->getJumlahPengguna();

			// jumlah pemilih
			// jumlah calon
			// jumlah sudah pilih
			// jumlah belum pilih

		} else {
			$this->title = 'List Calon Ketua';
			$this->content = 'dashboard/pemilih';
			$this->data['calons'] = $this->model->getCalon($this->id);
			// var_dump($this->data['calons']);
			// die;
		}

		// Send data to view
		$this->render();
	}

	public function pilih()
	{
		$id_calon = $this->input->post('id');
		$id_pemilih = $this->id;
		$result = $this->model->pilihSimpan($id_pemilih, $id_calon);
		$this->output_json($result, 200);
	}

	function __construct()
	{
		parent::__construct();
		$this->sesion->cek_session();
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');
		$this->level = $this->session->userdata('data')['level'];
		$this->id = $this->session->userdata('data')['id'];
		// Cek session

		// model
		$this->load->model("DashboardModel", 'model');
	}
}

/* End of file Dashboard.php */
/* Location: ./application/controllers/Dashboard.php */