<?php
    include('../core/header.php');
    include('../core/checklogin_admin.php');

    if (isset($_POST['submit']) && $_POST['submit'] != '') {
        $cid = $con->real_escape_string($_POST['cid']);
        $name = $con->real_escape_string($_POST['name']);
        $desc = $con->real_escape_string($_POST['desc']);
        $active = $con->real_escape_string($_POST['active']);
        $query1 = $con->prepare("UPDATE category AS c SET c.name = ?, c.description = ?, c.active = ? WHERE c.category_id = ?;");
        if ($query1 === false) {
            echo mysqli_error($con);
        }
                    
        $query1->bind_param('ssii', $name, $desc, $active, $cid);
        if ($query1->execute() === false) {
            echo mysqli_error($con);
        } else {
            header("location: index.php");
        }
        $query1->close();               
    } ?>
    <div class="container-xl">
        <div id="editUserModal" class="modal block">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Category</h4>
                            <a class="close" href="./index.php" aria-hidden="true">&times;</a>
                        </div>
                        <div class="modal-body">
                        <?php
                            if (isset($_GET['cid']) && $_GET['cid'] != '') {
                                $cid = $con->real_escape_string($_GET['cid']);
                                $liqry = $con->prepare("SELECT c.category_id, c.name, c.description, c.active FROM category AS c WHERE c.category_id = ? LIMIT 1;");
                                if($liqry === false) {
                                echo mysqli_error($con);
                                } else{
                                    $liqry->bind_param('i', $cid);
                                    $liqry->bind_result($categoryId, $categoryName, $categoryDescription, $categoryActive);
                                    if($liqry->execute()){
                                        $liqry->store_result();
                                        $liqry->fetch();
                                        if($liqry->num_rows == '1'){
                                            echo '<div class="form-group">
                                                      <label>Product ID</label>
                                                      <input type="text" name="cid" class="form-control" value="' . $categoryId . '" readonly>
                                                  </div>
                                                  <div class="form-group">
                                                      <label>Product name</label>
                                                      <input type="text" name="name" class="form-control" value="' . $categoryName . '" required>
                                                  </div>
                                                  <div class="form-group">
                                                      <label>Product description</label>
                                                      <input type="text" name="desc" class="form-control" value="' . $categoryDescription . '" required>
                                                  </div>
                                                  <div class="form-group">
                                                      <label>Product active</label>
                                                      <input type="number" name="active" class="form-control" value="' . $categoryActive . '" required>
                                                  </div>';
                                        }
                                    }
                                }
                                $liqry->close();
                            } ?>								
                        </div>
                        <div class="modal-footer">
                            <a class="btn btn-default" href="./index.php" ">Cancel</a>
                            <input type="submit" name="submit" class="btn btn-info" value="Edit">
                        </div>
                    </form>
                </div>
            </div>
        </div>    
    </div>
<?php
    include('../core/footer.php');
?>