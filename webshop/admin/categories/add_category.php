<?php
    include($_SERVER['DOCUMENT_ROOT'] . 'admin/core/header.php');
    include($_SERVER['DOCUMENT_ROOT'] . 'admin/core/checklogin_admin.php');

    if (isset($_POST['submit']) && $_POST['submit'] != "") {
        $name = $con->real_escape_string($_POST['name']);
        $desc = $con->real_escape_string($_POST['desc']);
        $active = $con->real_escape_string($_POST['active']);

        $liqry = $con->prepare("INSERT INTO category (name, description, active) VALUES (?,?,?)");
        if($liqry === false) {
           echo mysqli_error($con);
        } else {
            $liqry->bind_param('ssi', $name, $desc, $active);
            if($liqry->execute()) {
                header("location: index");
            }
        }
        $liqry->close();
    }
?>
    <div class="container-xl">
        <div id="addUserModal" class="modal block">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Category</h4>
                            <a class="close" href="./index" aria-hidden="true">&times;</a>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Category name</label>
                                <input type="text" class="form-control" name="name" value="" required>
                            </div>
                            <div class="form-group">
                                <label>Category description</label>
                                <input type="text" class="form-control" name="desc" value="" required>
                            </div>
                            <div class="form-group">
                                <label>Category active</label>
                                <?php 
                                $activeqry = $con->prepare("SELECT active_id, active_type FROM active;");
                                $activeqry->bind_result($activeId, $activeType);
                                            
                                if ($activeqry->execute()) {
                                    $activeqry->store_result();
                                
                                    echo '<select name="active" class="form-control" value="' . $activeId . '">';
                                    while ($activeqry->fetch()) {   
                                    ?>
                                    <option value="<?php echo $activeId; ?>"><?php echo $activeType; ?></option>
                                    <?php
                                }
                                echo '</select>';
                            } ?>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <a class="btn btn-default" href="./index" ">Cancel</a>
                            <input type="submit" name="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>    
    </div>
<?php
    include($_SERVER['DOCUMENT_ROOT'] . 'admin/core/footer.php');
?>