<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<section class="content-area-1">

  <div class="container">

    <h4 class="clrtr not-animated" data-animate="fadeInUp" data-delay="200">служба  поддержки социальной сети
    </h4>
    <h5 class="clrtr2 not-animated" data-animate="fadeInDown" data-delay="400">форма обратной связи
    </h5>

    <div class="crtx"></div>

    <div class="col-md-8 mg-c">
      <div class="col-lg-12 col-sm-12 col-md-12">
        <p class="pps1 no-arr">
          Через форму обратной связи на этой странице, вы можете отправить отзыв о работе поддержки, жалобу на действия сотрудника поддержки, заявку на размещение рекламного баннера или свои предложения по совершенствованию работы службы поддержки. Форма обратной связи на этой странице не предназначена для отправки запросов в службу поддержки. Если вы отправите запрос через форму,
          он не будет рассмотрен

        </p>
      </div>

    </div>

  </div>

</section>

<div id="content" class="form-stlr"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="content">
      <b><?php echo $entry_surname; ?></b><br />
      <input type="text" name="surname" value="<?php echo $surname; ?>" />
      <br />
      <?php if ($error_surname) { ?>
      <span class="error"><?php echo $error_surname; ?></span>
      <?php } ?>
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="<?php echo $name; ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_project_id; ?></b><br />
    <input type="text" name="project_id" value="<?php echo $project_id; ?>" />
    <br />
    <?php if ($error_project_id) { ?>
    <span class="error"><?php echo $error_project_id; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_enquiry; ?></b><br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
      <div class="fileform">
        <div class="selectbutton">Прикрепить файл</div>
        <input id="upload" type="file" name="upload" />
      </div>
    </div>
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
    <br />
    <img src="index.php?route=information/contact/captcha" alt="" style="margin-top: 20px;" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>
    <div class="buttons">
      <div class="right" style="float: none;"><input type="submit" value="<?php echo $button_continue; ?>" class="button" style="
    margin: 0 auto;
    display: block;
    font-size: 17px;
    padding: 25px 60px;
"> /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>

<style>

  section.content-area-1 {
    background: #e1eefe;
    padding-bottom: 29px;
    padding-top: 75px;
  }

  h5 {
    text-align: center;
    font-size: 25px;
    margin-top: 30px;
    margin-bottom: 30px;
  }

  .clrtr2 {
    font-size: 42px;
    color: #3a546b;
    text-transform: uppercase;
    font-weight: normal;
    text-shadow: 0.1px -1px 0 rgba(255, 255, 255, 0.9);
  }

  .mg-c {
    margin: 0 auto !important;
    width: 100%;
    max-width: 798px;
    float: none;
  }
  .col-md-8 {
    width: 66.66666667%;
  }

  .no-arr {
    width: 100%;
    max-width: 100%;
    text-align: center;
    padding-left: 0;
  }
  .pps1 {
    color: #3a546b;
    font-size: 19px;
    max-width: 316px;
    margin: 0 auto;
    margin-left: 4px;
    padding-left: 54px;
    margin-bottom: 40px;
  }


  section.content-area-1 .container {
    width: 100%;
  }


  section.content-area-1 h4 {
    font-size: 25.6px;
    color: #3a546b;
    text-transform: uppercase;
    font-weight: normal;
    line-height: 37px;
    text-align: center;
    padding-left: 0 !important;
    width: 100% !important;
  }


  section.content-area-1 h5 {
    margin-top: -22px !important;
  }



  section.content-area-1 .pps1 {
    text-align: center !important;
    width: 100% !important;
    max-width: 100% !important;
    padding: 0 !important;
  }

  #container {
    width: 100% !important;
  }

  section.content-area-1 {
    background: #e1eefe;
    padding-bottom: 29px;
    padding-top: 40px;
  }

  .fileform .selectbutton {
    background-color: inherit;
    border: 0;
    border-radius: 2px;
    color: #3A556B;
    float: left;
    text-align: left !important;
    font-size: 14px;
    font-weight: bold;
    height: 20px;
    line-height: 15px;
    overflow: hidden;
    padding: 0;
    text-align: center;
    vertical-align: middle;
    width: 100%;
    line-height: 20px !important;
  }


  .fileform {
    background-color: #FFFFFF;
    border: none;
    border-radius: 2px;
    cursor: pointer;
    height: 26px;
    overflow: hidden;
    padding: 2px;
    position: relative;
    text-align: left;
    vertical-align: middle;
    width: 230px;
    margin-top: 15px;
  }

  .fileform #upload {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    -moz-opacity: 0;
    filter: alpha(opacity=0);
    opacity: 0;
    font-size: 150px;
    height: 30px;
    z-index: 20;
  }

</style>