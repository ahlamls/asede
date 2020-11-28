<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct()
	{
		parent::__construct();
		  $this->load->model('home_model');
		  $this->load->model('user_model');
	
		//$this->config->load('asede', TRUE);
		$this->load->library('session');
		$this->load->database();
	}

	public function index()
	{
		if (isset($_SESSION['uid'])){
			$uid = $_SESSION['uid'];
			$data['tydacklogin'] = "display:none";
			$data['username'] = $this->user_model->getUserInfo($uid,1);
		   } else {
			$uid = 0;

			 $data['loggedin'] = "display:none";
		   }


		   $data['content'] = $this->home_model->getAllPost(0,1);

			$this->load->view('user/modular/header',$data);
		$this->load->view('user/home',$data);
			$this->load->view('user/modular/footer',$data);
	}
	public function home($id) {
		if (isset($_SESSION['uid'])){
			$uid = $_SESSION['uid'];
			$data['username'] = $this->user_model->getUserInfo($uid,1);
			$data['tydacklogin'] = "display:none";
		   } else {
			$uid = 0;
			 $data['loggedin'] = "display:none";
		   }
		   $data['content'] = $this->home_model->getAllPost($id,1);
			$this->load->view('user/modular/header',$data);
		$this->load->view('user/home',$data);
			$this->load->view('user/modular/footer',$data);
	}

	public function privacy() {
		$this->load->view('user/modular/header');
	$this->load->view('user/privacy');
		$this->load->view('user/modular/footer');
	}

	public function terms() {
		$this->load->view('user/modular/header');
	$this->load->view('user/terms');
		$this->load->view('user/modular/footer');
	}

	public function login() {
		if (isset($_SESSION['uid'])){
			header("Location: /");
			die("Sudah Login");
			$uid = $_SESSION['uid'];
			$data['username'] = $this->user_model->getUserInfo($uid,1);
			$data['tydacklogin'] = "display:none";
		   } else {
			$uid = 0;
			 $data['loggedin'] = "display:none";
		   }

		   if (!isset($_GET['msg'])) {
			$data['msgexist'] = "display:none";
		  $data['msg'] = "";
		  } else {
		  $data['msgexist'] = "";
		  $data['msg'] = htmlentities($_GET['msg']);
		if (strpos($_GET['msg'], "<script>") !== false) {
			die("<h1>ANJAY HEKEL</h1>");
		}  
		}


		$this->load->view('user/modular/header',$data);
	$this->load->view('user/login',$data);
		$this->load->view('user/modular/footer',$data);
	}

	public function handleSulfikar() {
		if (isset($_SESSION['uid'])){
			header("Location: /");
			die("Sudah Login");
			$uid = $_SESSION['uid'];
			$data['username'] = $this->user_model->getUserInfo($uid,1);
			$data['tydacklogin'] = "display:none";
		   } else {
			$uid = 0;
			$data['username'] = "login aja belum goblok";
			 $data['loggedin'] = "display:none";
		   }
		   $uid = $this->user_model->checkLogin();
		if ($uid !== "") {
			$this->session->set_userdata('uid', $uid);
			header("Location: /");
			die("Sukses Login");
		}
	}

	public function logout()
{

	$this->session->sess_destroy();
	header("Location: /");
	  die("sudah logout");
	}

	public function register() {
		$this->load->view('user/modular/header');
	$this->load->view('user/register');
		$this->load->view('user/modular/footer');
	}
}
