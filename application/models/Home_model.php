<?php
class Home_model extends CI_Model {

    public function __construct()
    {
            $this->load->database();
             // $this->load->library('config_Writer');
   
   
      }

      public function getAllPost($lastid,$type) {
        $lastid =  $this->db->escape_str($lastid);

        if ($type == 1 ) {
            $minvote = 0;//home
            $typepage = "lol";
        } else if ($type == 2) {
            $minvote = 0;//fresh
            $typepage = "recent";
        } else if ($type == 3) {
            $minvote = 10;//mythic
            $typepage = "legend";
        }
        if ($lastid == 0) {
            $sql = "SELECT * FROM `mim` WHERE nsfW= 0 AND hidden = 0 AND vote >= $minvote ORDER BY id DESC LIMIT 0,20";
        } else {
            $sql = "SELECT * FROM `mim` WHERE nsfW= 0 AND hidden = 0 AND vote >= $minvote AND id < $lastid ORDER BY id DESC LIMIT 0,20";
        }

        $query = $this->db->query($sql);
        $asede = "";
        $nextlastid = 0;
         foreach ($query->result() as $row)
         {
             
            $mim_id = $row->id;
            $nextlastid = $mim_id;
           $poster_id = $row->user_id;
           $query = $this->db->query("SELECT username,verified FROM user WHERE `id` = $poster_id ");
           $rowx = $query->row();

           if (isset($row))
           {
                   $username =  $rowx->username;
                   $verified =  $rowx->verified;
                  
           }
           if ($verified == 1) {
               $verified = "<i class='far fa-check-circle'></i>";
           } else {
               $verified = "";
           }

           $time = $row->time;
           $title = $row->title;
           $content = $row->content;
           $image_url = $row->image_url;
            $source = $row->source;
            if ($source != ""){
                $source = "Sumber : " . $source . "<br>";
            }
           $vote  = $row->vote;
           $nsfw  = $row->nsfw;
           if ($nsfw == 1) {
               $nsfw_bg = "bg-danger";
           } else {
               $nsfw_bg = "";
           }
            
           $asede .= "

           <div class='card w-100' >
           <div class='card-header $nsfw_bg'>
               <b>$username $verified</B> <span class='text-muted'>$time</span>
             </div>
             <div class='row'>
             
             <div class='card-body col-12 col-md-9'>
               <div class='pad5'>
               <h5 class='card-title'>$title</h5>
               <p class='card-text'>$content</p>
           
           </div>
             <img src='$image_url' class='card-img-top' alt='$title'>
             </div>
           
             <div class=' col-12 col-md-3'>
                 <div class='pad5'>
            <p class='card-text pad5'>$source<span class='text-muted'>$vote Vote</span></p>
           
               <div class='row'>
               <div class='col-4 col-md-12'>
                   <div class='pad5'>
               <a href='#' onclick='vote($mim_id)' class='btn btn-primary w-100'>Vote</a>
             </div>
               </div>
               <div class='col-4 col-md-12'>
                   <div class='pad5'>
               <a href='#' onclick='votent($mim_id)' class='btn btn-primary w-100'>Vote'nt</a>
             </div>
               </div>
               <div class='col-4 col-md-12'>
                   <div class='pad5'>
               <a href='#' class='btn btn-secondary w-100' onclick='komen($mim_id)'>Komen</a>
             </div>
             <center><p class='card-text btn-link' onclick='salim()'>Report</p></center>
           
               </div>
              
           
               </div>
             </div>
             </div>
           
           </div>
           
           </div>
           <br>
           ";
         }

         if ($asede == "" ){
             return "<p>Tidak ada lagi mim yang bisa diperlihatkan</p>";
         } else {

             return $asede . "<a href='/$typepage/$nextlastid' class='btn btn-primary w-100'>Selanjutnya</a>";
         }

      }


}
