<div class="">
    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between w-100">
                <h3 class="card-title">Detail P2PK</h3>
                <div class="row">
                    <div class="col-md-12">
                        <!-- <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" id="btn-tambah"><i class="fa fa-plus"></i> Tambah</button> -->
                    </div>
                </div>

            </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body">

            <div class="informasi-head">
                <div class="card">
                    <div class="card-body">
                        <table id="" class="table table-bordered table-striped table-hover">
                            <tbody>
                                <tr>
                                    <td>Client</td>
                                    <td><?= $send['client'] ?></td>
                                </tr>
                                <tr>
                                    <td>PIC</td>
                                    <td><?= $send['pic'] ?></td>
                                </tr>
                                <tr>
                                    <td>Resiko</td>
                                    <td><?= $send['resiko'] ?></td>
                                </tr>
                                <tr>
                                    <td>Status</td>
                                    <td><?= $send['status'] ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="tombol">
                <div class="d-md-flex justify-content-around">
                    <button class="btn btn-outline-primary btn-block m-1" type="button" id="btn-planning">PLANNING</button>
                    <button class="btn btn-outline-primary btn-block m-1" type="button" id="btn-audit">PROSES AUDIT</button>
                    <button class="btn btn-outline-primary btn-block m-1" type="button" id="btn-report">REPORT</button>
                </div>
            </div>

            <div class="planning m-1" id="v-planning">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body ">
                            <h3 class="text-center">Planning</h3>
                            <form id="form-planning" method="" action="" enctype="multipart/form-data">
                                <input type="hidden" name="id" id="id">

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="judul">Title</label>
                                            <input type="text" class="form-control" id="judul" name="judul" placeholder="Title" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="deskripsi">Description</label>
                                            <textarea name="deskripsi" id="deskripsi" rows="3" class="form-control" placeholder="Description"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-doc" id="list-doc">
                                    <div class="row doc-1">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="doc">Attach Doc</label>
                                                <div class="row m-1">
                                                    <div class="col-md-8">
                                                        <input type="file" class="form-control" id="doc[]" name="doc[]" placeholder="Attach Doc" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <button type="button" class="btn btn-success" data-id='1' id="btn-add-file"><i class="fa fa-plus"></i> Tambah file baru</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary">
                                    Submit
                                </button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">
                                    Cancel
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="audit m-1" id="v-audit">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body ">
                            <h3 class="text-center">Proses Audit</h3>
                            <form id="form-audit" method="" action="" enctype="multipart/form-data">
                                <input type="hidden" name="id" id="id">

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="judul">Title</label>
                                            <input type="text" class="form-control" id="judul" name="judul" placeholder="Title" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="deskripsi">Description</label>
                                            <textarea name="deskripsi" id="deskripsi" rows="3" class="form-control" placeholder="Description"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-doc-audit" id="list-doc-audit">
                                    <div class="row doc-1">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="doc">Attach Doc</label>
                                                <div class="row m-1">
                                                    <div class="col-md-8">
                                                        <input type="file" class="form-control" id="doc-audit[]" name="doc-audit[]" placeholder="Attach Doc" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <button type="button" class="btn btn-success" data-id='1' id="btn-add-file-audit"><i class="fa fa-plus"></i> Tambah file baru</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary">
                                    Submit
                                </button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">
                                    Cancel
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="report m-1" id="v-report">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body ">
                            <h3 class="text-center">Report</h3>
                            <form id="form-report" method="" action="" enctype="multipart/form-data">
                                <input type="hidden" name="id" id="id">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Report Phase</th>
                                                    <th scope="col">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Phase 1</td>
                                                    <td>Waiting for Document</td>
                                                </tr>
                                                <tr>
                                                    <td>Phase 2</td>
                                                    <td>Waiting for Document</td>
                                                </tr>
                                                <tr>
                                                    <td>Phase 3</td>
                                                    <td>Waiting for Document</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="judul">Title</label>
                                            <input type="text" class="form-control" id="judul" name="judul" placeholder="Title" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="deskripsi">Description</label>
                                            <textarea name="deskripsi" id="deskripsi" rows="3" class="form-control" placeholder="Description"></textarea>
                                        </div>
                                    </div>
                                </div> -->

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <h3 for="">Draft Report</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="" class="table table-bordered table-striped table-hover">
                                            <thead>
                                                <th>Report Phase</th>
                                                <th>Approval</th>
                                                <th>Nama Draft</th>
                                                <th>File</th>
                                                <th>Tanggal Upload</th>
                                                <th>Tanggal Approval Diminta</th>
                                                <th>Text</th>
                                                <th>Tanggal Komentar</th>
                                                <th>Status</th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>

                                                        <select class="form-control" id="phase-1" name="phase-1">
                                                            <option value="">Pilih Phase</option>
                                                            <option value="1">Phase 1</option>
                                                            <option value="2">Phase 2</option>
                                                            <option value="3">Phase 3</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <div class="form-group">
                                                            <select class="form-control" id="approval-1" name="approval-1">
                                                                <option value="">Pilih Approval</option>
                                                                <option value="A">Tuan A</option>
                                                                <option value="B">Tuan B</option>
                                                                <option value="C">Tuan C</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" name="nama_draft" id="nama_draft" placeholder="Nama Draft">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group">
                                                            <input type="file" class="form-control" id="draf-1" name="draf-1" placeholder="File 1" />
                                                        </div>
                                                    </td>
                                                    <td>12-01-2021</td>
                                                    <td>12-01-2021</td>
                                                    <td><a href="Komen Draft 2.docs" download>Komen Draft 2.docs</a></td>
                                                    <td>12-01-2021</td>
                                                    <td>Waiting for Document</td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                        <select class="form-control" id="phase-1" name="phase-1">
                                                            <option value="">Pilih Phase</option>
                                                            <option value="1">Phase 1</option>
                                                            <option value="2">Phase 2</option>
                                                            <option value="3">Phase 3</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <div class="form-group">
                                                            <select class="form-control" id="approval-1" name="approval-1">
                                                                <option value="">Pilih Approval</option>
                                                                <option value="A">Tuan A</option>
                                                                <option value="B">Tuan B</option>
                                                                <option value="C">Tuan C</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" name="nama_draft" id="nama_draft" placeholder="Nama Draft">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group">
                                                            <input type="file" class="form-control" id="draf-1" name="draf-1" placeholder="File 1" />
                                                        </div>
                                                    </td>
                                                    <td>12-01-2021</td>
                                                    <td>12-01-2021</td>
                                                    <td><a href="Komen Draft 2.docs" download>Komen Draft 2.docs</a></td>
                                                    <td>12-01-2021</td>
                                                    <td>Waiting for Document</td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                        <select class="form-control" id="phase-1" name="phase-1">
                                                            <option value="">Pilih Phase</option>
                                                            <option value="1">Phase 1</option>
                                                            <option value="2">Phase 2</option>
                                                            <option value="3">Phase 3</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <div class="form-group">
                                                            <select class="form-control" id="approval-1" name="approval-1">
                                                                <option value="">Pilih Approval</option>
                                                                <option value="A">Tuan A</option>
                                                                <option value="B">Tuan B</option>
                                                                <option value="C">Tuan C</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" name="nama_draft" id="nama_draft" placeholder="Nama Draft">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group">
                                                            <input type="file" class="form-control" id="draf-1" name="draf-1" placeholder="File 1" />
                                                        </div>
                                                    </td>
                                                    <td>12-01-2021</td>
                                                    <td>12-01-2021</td>
                                                    <td><a href="Komen Draft 2.docs" download>Komen Draft 2.docs</a></td>
                                                    <td>12-01-2021</td>
                                                    <td>Waiting for Document</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="jk">Draft Report 1</label>
                                            <input type="file" class="form-control" id="draf-1" name="draf-1" placeholder="Draft Report 1" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="status-1">Approval</label>
                                            <select class="form-control" id="status-1" name="status-1">
                                                <option value="">Pilih Approval</option>
                                                <option value="Request">Request</option>
                                                <option value="Approve">Approve</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="jk">Draft Report 2</label>
                                            <input type="file" class="form-control" id="draf-2" name="draf-2" placeholder="Draft Report 2" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="status-2">Approval</label>
                                            <select class="form-control" id="status-2" name="status-2">
                                                <option value="">Pilih Approval</option>
                                                <option value="Request">Request</option>
                                                <option value="Approve">Approve</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="jk">Draft Report Final</label>
                                            <input type="file" class="form-control" id="draf-final" name="draf-final" placeholder="Draft Report Final" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="status-final">Approval</label>
                                            <select class="form-control" id="status-final" name="status-final">
                                                <option value="">Pilih Approval</option>
                                                <option value="Request">Request</option>
                                                <option value="Approve">Approve</option>
                                            </select>
                                        </div>
                                    </div>
                                </div> -->

                                <button type="submit" class="btn btn-primary">
                                    Submit
                                </button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">
                                    Cancel
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.card-body -->
    </div>
</div>