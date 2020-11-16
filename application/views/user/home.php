
    <div class="alert alert-info" role="alert">
  Website asede masih dalam tahap beta . Sebagian fitur belum aktif dan sempurna
</div>

    <div class="alert alert-success" role="alert">
    Download Aplikasi asede untuk Android (<span id="baoncikadap"></span>)
</div>

<div class="row">

<div class="col-12 col-md-8 pad5">

<?= $content ?>


</div>

<div class="col-12 col-md-4 pad5">
<hr>
<h3>Tentang asede</h3>
<p>
asede adalah situs untuk berbagi meme (dibaca mim) tanpa rasa khawatir di report , begal mark , grup/page angud seperti di platform lain. kami mendukung free speech atau bebas untuk memberikan pendapat . disini anda tidak akan pernah di banned karena memiliki pendapat 
</p>
<!-- script -->
<script>
window.onload = function(e) {
            handledlsubtext()
            };
function salim() {
  alert("asw lu pereport");
}

function handledlsubtext() {
  subtext = document.getElementById("baoncikadap");
  rand = Math.floor(Math.random() * 10);
  if (rand == 1) {
    subtext.innerHTML = "Tidak seberat genshin impact";
  } else if (rand == 2) {
    subtext.innerHTML = "Support all hp termasuk j2 prime";
  } else if (rand == 3) {
    subtext.innerHTML = "ukuran kecil banget";
  } else if (rand == 4) {
    subtext.innerHTML = "support hp burn in dan jamur";
  } else if (rand == 5) {
    subtext.innerHTML = "tidak akan dibegal dan dibisu mark";
  } else if (rand == 6) {
    subtext.innerHTML = "support limbah jepang bahkan limbah sampah sekalipun";
  } else if (rand == 7) {
    subtext.innerHTML = "gak tau males pengen pake aplikasi";
  } else if (rand == 8) {
    subtext.innerHTML = "hari gini masih pake website? wassalam";
  } else if (rand == 9) {
    subtext.innerHTML = "tidak seburik FF 8 bit tanpa pintu";
  }
}
</script>

<!-- modol -->
<!-- Modol komen -->
<div class="modal fade" id="komenModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable">
<div class="modal-content">
  <div class="modal-header text-white bg-danger">
    <h5 class="modal-title " id="exampleModalLabel">Komentar "FF vs Bensin Impek"</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="modal-body" id="komenBody">

  <form class="row">
<div class="form-group col-9">

<input type="text" placeholder="Isi Komentar" class="form-control" id="staticEmail2" >
</div>
<div class="form-group col-3">

<button type="submit" class="btn btn-success w-100">Kirim</button>
</div>
<hr>
<div class="padkomen">
<p><b>HenryNasution</b> <span class="text-muted" >00:00:00 00-00-0000</span><br>
Ngaco Kamu

</div>

<div class="padkomen">
<p><b>RoniHartono</b> <span class="text-muted" >00:00:00 00-00-0000</span><br>
Kamu Bohong

</div>

</form>

  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>

  </div>
</div>
</div>
</div>
