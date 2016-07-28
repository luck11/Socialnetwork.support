<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"  class="form-accaunt" ><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="index.php?route=account/forgotten" method="post" enctype="multipart/form-data">

    <h2>Ваш E-Mail</h2>
    <div class="content" style="
    border: 0;
    padding-left: 0;
">
      <table class="form">
        <tbody><tr>

          <td><input type="text" name="email" value=""></td>
        </tr>
        </tbody></table>
    </div>
    <div class="buttons" style="
    padding-left: 0;
">
      <div class="left"><a href="index.php?route=account/login" class="button">Назад</a></div>
      <div class="right" style="
    margin-right: 462px !important;
">
        <input type="submit" value="Продолжить" class="button">
      </div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>