<div class="row">
    <div class="col-lg-6">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <div class="d-flex justify-content-between w-100">
                    <h3 class="card-title">Perhitungan Suara Calon Ketua</h3>
                    <div>
                        <a href="<?= base_url() ?>admin/Count/export_pdf" class="btn btn-danger btn-sm"><i class="fas fa-file-pdf"></i> Export PDF</a>
                        <a href="<?= base_url() ?>admin/Count/export_excel" class="btn btn-success btn-sm"><i class="fas fa-file-excel"></i> Export Excel</a>
                    </div>
                </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="dt_basic" class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <!-- <th>No</th> -->
                            <th style="max-width: 75px;">No Urut</th>
                            <th>Nama</th>
                            <th style="max-width: 100px;">Jumlah Suara</th>
                        </tr>
                    </thead>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
    </div>
</div>