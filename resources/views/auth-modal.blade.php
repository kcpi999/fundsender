<!-- modal -->
<div class="modal fade auth-modal" id="auth-modal" role="dialog" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                {{-- <button type="button" class="close" data-dismiss="modal">×</button> --}}
                <h3 class="modal-title">
                    <ul class="nav nav-tabs modal-tabs-handler">
                        <li class="active"><a data-toggle="tab" href="#tab-auth">Authenticate</a></li>
                        <li><a data-toggle="tab" href="#tab-reg">Register</a></li>
                    </ul>
                </h3>
            </div>

            <div class="tab-content">
                <div id="tab-auth" class="tab-pane fade in active">
                    <form class="form-horizontal" id="auth-form" method="POST" action="/login">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="col-sm-12">E-mail:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" name="email" placeholder="Enter your e-mail">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">Password:</label>
                                <div class="col-sm-12">
                                    <input type="password" class="form-control" name="password" placeholder="Enter password">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn-lg btn-success" >Log me in</button>
                        </div>
                    </form>
                </div>

                <div id="tab-reg" class="tab-pane fade">
                    <form class="form-horizontal" id="reg-form" method="POST" action="/register">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="col-sm-12">Name:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" name="name" placeholder="Your name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">E-mail:</label>
                                <div class="col-sm-12">
                                    <input type="email" class="form-control" name="email" placeholder="Your e-mail">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">Password <span class="text-muted">(8 symbols min)</span>:</label>
                                <div class="col-sm-12">
                                    <input id="password" type="password" class="form-control" name="password" placeholder="Choose password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">Repeat password:</label>
                                <div class="col-sm-12">
                                    <input id="password_confirmation" type="password" class="form-control" name="password_confirmation" placeholder="Repeat password">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn-lg btn-success" >Register me</button>
                        </div>
                    </form>
                </div>


            </div>

        </div>
    </div>
</div>
<!-- end modal-->
