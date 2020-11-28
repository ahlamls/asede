<?php
class User_model extends CI_Model {

    public function __construct()
    {
            $this->load->database();
             // $this->load->library('config_Writer');
   
   
      }

      public function checkLogin() {
        $username =  $this->db->escape_str($_POST['username']);
        $password =  $this->db->escape_str(hash("sha512", $_POST['password']));
        $sql = "SELECT id FROM `user` WHERE `username` = '$username' AND `password` = '$password'";
        $query = $this->db->query($sql);
        $row = $query->row();

        if (isset($row))
        {
              return $row->id;
              
        } else {
            $error = " Username atau Password salah . silahkan coba lagi (bukan gacha)";
            header("Location: /sulfikar/?msg=$error");
            die($error);
        }
    }

        public function getUserInfo($uid,$type) {
            $id = $this->db->escape_str($uid);
            $query = $this->db->query("SELECT * FROM `user` WHERE `id` = '$id'");
      
             $row = $query->row();
      
             if (isset($row))
             {
                   if ($type == 1) {
                     return $row->username;
                   } else if ($type == 2) {
                     return $row->email;
                   } else if ($type == 3) {
                     return $row->nohp;
                   } else if ($type == 4) {
                     return $row->bio;
                   } else if ($type == 5) {
                     return $row->ua;
                   } else if ($type == 6) {
                     return $row->verified;
                   }  else if ($type == 7) {
                     return $row->post_limit;
                   }   else if ($type == 8) {
                     return $row->banned;
                   }    else if ($type == 9) {
                    return $row->banned_reason;
                  } else {
                     return "Invalid Type";
                   }
             } else {
               die("User Tidak ada");
             }
        }
     

      }




