<style>
    .db-hover:hover {
        transform: scale(1.03);
        box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
    }
</style>

<div class="row">

    <div class="col-12 col-sm-6 col-md-4">
        <a href="<?= base_url() ?>p2pk/listP2PK" class="db-hover info-box text-decoration-none text-dark btn">
            <img src="<?= base_url() ?>files/dashboard/p2pk.png" alt="" style="width: 75px; height: 75px;">
            <div class="info-box-content info-box-content text-left ml-3">
                <span class="info-box-text font-weight-bold text-uppercase">P2PK</span>
                <span class="info-box-number">

                </span>
            </div>
        </a>
    </div>

    <div class="col-12 col-sm-6 col-md-4">
        <a href="<?= base_url() ?>p2pk/listP2PK" class="db-hover info-box text-decoration-none text-dark btn">
            <img src="<?= base_url() ?>files/dashboard/spm.png" alt="" style="width: 75px; height: 75px;">
            <div class="info-box-content info-box-content text-left ml-3">
                <span class="info-box-text font-weight-bold text-uppercase">SPM</span>
                <span class="info-box-number">

                </span>
            </div>
        </a>
    </div>

    <div class="col-12 col-sm-6 col-md-4">
        <a href="<?= base_url() ?>p2pk/listP2PK" class="db-hover info-box text-decoration-none text-dark btn">
            <img src="<?= base_url() ?>files/dashboard/repository.png" alt="" style="width: 75px; height: 75px;">
            <div class="info-box-content info-box-content text-left ml-3">
                <span class="info-box-text font-weight-bold text-uppercase">REPOSITORY</span>
                <span class="info-box-number">

                </span>
            </div>
        </a>
    </div>

    <div class="col-12 col-sm-6 col-md-4">
        <a href="<?= base_url() ?>p2pk/listP2PK" class="db-hover info-box text-decoration-none text-dark btn">
            <img src="<?= base_url() ?>files/dashboard/activity.png" alt="" style="width: 75px; height: 75px;">
            <div class="info-box-content info-box-content text-left ml-3">
                <span class="info-box-text font-weight-bold text-uppercase">activity</span>
                <span class="info-box-number">

                </span>
            </div>
        </a>
    </div>

    <div class="col-12 col-sm-6 col-md-4">
        <a href="<?= base_url() ?>pengaturan/profile" class="db-hover info-box text-decoration-none text-dark btn">
            <img src="<?= base_url() ?>files/dashboard/user.png" alt="" style="width: 75px; height: 75px;">
            <div class="info-box-content info-box-content text-left ml-3">
                <span class="info-box-text font-weight-bold text-uppercase">users</span>
                <span class="info-box-number">

                </span>
            </div>
        </a>
    </div>

    <div class="col-12 col-sm-6 col-md-4">
        <a href="<?= base_url() ?>data-master/company" class="db-hover info-box text-decoration-none text-dark btn">
            <img src="<?= base_url() ?>files/dashboard/master.png" alt="" style="width: 75px; height: 75px;">
            <div class="info-box-content info-box-content text-left ml-3">
                <span class="info-box-text font-weight-bold text-uppercase">master</span>
                <span class="info-box-number">

                </span>
            </div>
        </a>
    </div>
</div>

<hr>

<div class="row">
    <div class="col-12">
        <h6>Data Statistik</h6>
    </div>

    <div class="col-12 col-sm-6 col-md-4">
        <a href="<?= base_url() ?>data-master/partner" class="db-hover info-box text-decoration-none text-dark btn">
            <img src="<?= base_url() ?>files/dashboard/partner.png" alt="" style="width: 75px; height: 75px;">
            <div class="info-box-content info-box-content text-left ml-3">
                <span class="info-box-text text-capitalize">Jumlah Partner</span>
                <span class="info-box-number mt-0">
                    <?= $totalPatner; ?>
                </span>
            </div>
        </a>
    </div>

    <div class="col-12 col-sm-6 col-md-4">
        <a href="<?= base_url() ?>pengaturan/profile" class="db-hover info-box text-decoration-none text-dark btn">
            <img src="<?= base_url() ?>files/dashboard/pengguna.png" alt="" style="width: 75px; height: 75px;">
            <div class="info-box-content info-box-content text-left ml-3">
                <span class="info-box-text text-capitalize">Jumlah Client</span>
                <span class="info-box-number mt-0">
                    <?= $totalPengguna; ?>
                </span>
            </div>
        </a>
    </div>

    <div class="col-12 col-sm-6 col-md-4">
        <a href="<?= base_url() ?>data-master/company" class="db-hover info-box text-decoration-none text-dark btn">
            <img src="<?= base_url() ?>files/dashboard/company.png" alt="" style="width: 75px; height: 75px;">
            <div class="info-box-content info-box-content text-left ml-3">
                <span class="info-box-text text-capitalize">Jumlah Pengguna</span>
                <span class="info-box-number mt-0">
                    <?= $totalCompany; ?>
                </span>
            </div>
        </a>
    </div>
</div>