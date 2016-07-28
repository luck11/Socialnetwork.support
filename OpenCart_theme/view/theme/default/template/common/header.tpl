<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
  <link rel="shortcut icon" href=«img/favicon.ico" type="image/x-icon">
  <link rel="icon" href=«img/favicon.ico" type="image/x-icon">
<meta charset="UTF-8" />
<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div id="container">
  <div id="header">
    <div class="container">
      <div id="top">
      </div>
      <div class="nst-s">
      <?php if (!$logged) { ?>
      <a href="index.php?route=account/login"  style="margin-left: 73px; color: #003366;"><?php echo $enter;?></a> / <a href="index.php?route=account/register" style="color: #003366;"><?php echo $reg;?></a>
      <?php } else { ?>
      <?php echo $text_logged; ?>
      <?php } ?>
</div>
      <div class="wrapper">
        <dl id="country-select" class="dropdown">
          <?php if($lang == 'ru'){ ?>
          <dt><a href="javascript:void(0);"><span><span style="background-position:0px -660px" id="lang"></span><span></span><span></span></span></a></dt>
          <?php }else{ ?>
          <dt><a href="javascript:void(0);"><span><span style="background-position:0px -44px" id="lang"></span><span></span><span></span></span></a></dt>
          <?php } ?>
          <dd>
            <ul style="display: none;">
              <?php if($lang == 'en'){ ?>
              <li><a  href="javascript:void(0);"><span style="background-position:0px -660px" onclick="selectRu();"></span></a></li>
              <?php }else{ ?>
              <li><a  href="javascript:void(0);"><span style="background-position:0px -44px" onclick="selectEn();"></span></a></li>
            <?php } ?>
            </ul>
          </dd>
        </dl>
      </div>
      <?php if ($logo) { ?>
      <div id="logo">
        <?php if ($home == $og_url) { ?>
        <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
        <?php } else { ?>
        <a href="../"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
      <?php echo $language; ?>
      <?php echo $currency; ?>
      <?php echo $cart; ?>
      <div id="google_translate_element" style="display: none; "></div>
      <form id="language_send" action="index.php?route=module/language" method="post">
        <input type="hidden" value="" id="language_code" name="language_code">
        <input type="hidden" value="" id="redirect" name="redirect">
      </form>
      <div id="search">
        <div class="button-search"></div>
        <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
      </div>
      <div id="welcome">
        <?php if (!$logged) { ?>
        <?php echo $text_welcome; ?>
        <?php } else { ?>
        <?php echo $text_logged; ?>
        <?php } ?>
      </div>
      <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
    </div>
    </div>

<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><?php if ($category['active']) { ?>
	<a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
	<?php } else { ?>
	<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
	<?php } ?>
	
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<?php } ?>
<div id="notification"></div>

  <style>

    .dropdown dd, .dropdown dt, .dropdown ul {
      margin: 0px;
      padding: 0px;
    }
    .dropdown dd ul li a span:first-child, .dropdown dt a span span:first-child {
      background-image: url('http://i.imgur.com/OQiDoZe.png');
      background-repeat: no-repeat;
      width: 16px;
      height: 11px;
      display: inline-block;
      margin:5px;
      vertical-align: top;
    }
    .dropdown dt a span {
      cursor: pointer;
      display: block;
      padding: 5px;
      white-space: nowrap;
    }
    .dropdown dt a img {
      position: relative;
      z-index: 1;
    }
    .dropdown dt a span span:first-child:before {
      position: absolute;
      content: '';
      width: 15px;
      height: 10px;
      box-shadow: 0 1px 1px rgba(0,0,0,0.2) inset;
    }
    .dropdown dt a span span {
      display: inline-block;
      padding: 0;
    }
    .dropdown dt a span span:first-child {
      padding: 0;
    }
    .dropdown dd {
      position: relative;
    }
    .dropdown a, .dropdown a:visited {
      color: #4a535f;
      text-decoration: none;
      outline: none;
    }
    .dropdown a:hover {
      color: #5d4617;
    }
    .dropdown dt a:hover, .dropdown dt a:focus {
      color: #5d4617;
    }




    li a {
      font-size:13px;
    }

    li a span:nth-child(2) {
      line-height: 2em;
    }
    .dropdown dd ul::-webkit-scrollbar-track {
      -webkit-box-shadow: inset 0 0 1px rgba(0,0,0,0.3);
      border-left:1px solid rgba(0,0,0,0.1);
    }
    .dropdown dd ul::-webkit-scrollbar-thumb {
      background: rgba(0,0,0,0.4);
      /*-webkit-box-shadow: inset 0 0 1px rgba(0,0,0,0.5), 1px 0 0 #5cace9 inset, 2px 0 0 #b3d5ee inset;
          border-radius:10px;*/
    }
    .dropdown dd ul::-webkit-scrollbar-thumb:window-inactive {
      background: blue;
    }
    .dropdown span.value {
      display: none;
    }
    .dropdown dd ul li a {
      padding: 5px;
      display: block;
      font-size: 12px !important;
    }
    .dropdown dd ul li a:hover {
      background-color: rgba(0,0,0,0.05);
    }
    dl.dropdown {
      display: inline-block;
      width: 36px;
      margin: -3px 0 0 1px;
    }
    dl.dropdown span:nth-child(3) {
      color: rgba(0,0,0,0.4)
    }
    dl.dropdown > span:nth-child(2) {
      overflow: hidden;
      white-space: nowrap;
      display: inline-block;
    }
    dl.dropdown span:nth-child(3) {
      float: right;
    }
    dl.dropdown dt span:nth-child(2) {
      color: rgba(0, 0, 0, 0.6);
      font-size: 14px;
      font-weight: bold;
      line-height: 1.6em;
    }
    dl.dropdown dt span:nth-child(3) {
      display: none;
    }
    .countryFlag {
      padding: 0;
      background-image: url("http://i.imgur.com/OQiDoZe.png");
      background-repeat: no-repeat;
      display: inline-block;
      height: 11px;
      margin-right: 4px;
      width: 16px;
      cursor: pointer;
      white-space: nowrap;
      -moz-border-bottom-colors: none;
      -moz-border-left-colors: none;
      -moz-border-right-colors: none;
      -moz-border-top-colors: none;
      border-color: #BFBFC1 #B6B6B6 #969696;
      border-image: none;
      border-radius: 2px 2px 2px 2px;
      border-style: solid;
      border-width: 1px;
      box-shadow: 0 1px 1px rgba(0, 0, 0, 0.09);
    }
    /*.countryFlag:before {*/
    /*-moz-border-bottom-colors: none;*/
    /*-moz-border-left-colors: none;*/
    /*-moz-border-right-colors: none;*/
    /*-moz-border-top-colors: none;*/
    /*background: linear-gradient(to bottom, #FFFFFF 0%, #EEEEEE 100%) repeat scroll 0 0 transparent;*/
    /*border-color: #BFBFC1 #B6B6B6 #969696;*/
    /*border-image: none;*/
    /*border-radius: 2px 2px 2px 2px;*/
    /*border-style: solid;*/
    /*border-width: 1px;*/
    /*box-shadow: 0 1px 1px rgba(0, 0, 0, 0.09);*/
    /*display: block;*/
    /*overflow: hidden;*/
    /*padding-right: 20px;*/
    /*position: relative;*/
    /*width: 25px;*/
/*}*/



    dl#country-select li{
      list-style: none;
    }


    dl#country-select {
      position: absolute;
      left: 153px;
      top: 25px;
    }


    dl#country-select ul {
      background: #fff;
    }

    dl#country-select {
      position: absolute;
      left: 193px;
      top: 25px;
    }
  </style>

  <script>
/*
  function googleTranslateElementInit() {
  new google.translate.TranslateElement({
  pageLanguage: $('html').attr('lang')
  }, 'google_translate_element');
  }

  $(document).on('change','#google_translate_element select',function(e){
    if($(this).val()=='ru'){
      $('#redirect').val(location.href);
      $('#language_code').val('ru');
      $('#language_send').submit();
    } else if($(this).val()=='en'){
      $('#redirect').val(location.href);
      $('#language_code').val('en');
      $('#language_send').submit();
    }
  });
*/
  function selectRu(){
    $('#redirect').val(location.href);
    $('#language_code').val('ru');
    $('#language_send').submit();
  }

  function selectEn(){
    $('#redirect').val(location.href);
    $('#language_code').val('en');
    $('#language_send').submit();
  }


  function setCountry(code){
    if(code || code==''){
      var text = jQuery('a[cunt_code="'+code+'"]').html();
      $(".dropdown dt a span").html(text);
    }
  }
  $(document).ready(function() {
    $(".dropdown img.flag").addClass("flagvisibility");

    $(".dropdown dt a").click(function() {
      $(".dropdown dd ul").toggle();
    });

    $(".dropdown dd ul li a").click(function() {
      //console.log($(this).html())
      var text = $(this).html();
      $(".dropdown dt a span").html(text);
      $(".dropdown dd ul").hide();
      $("#result").html("Selected value is: " + getSelectedValue("country-select"));
    });

    function getSelectedValue(id) {
      //console.log(id,$("#" + id).find("dt a span.value").html())
      return $("#" + id).find("dt a span.value").html();
    }

    $(document).bind('click', function(e) {
      var $clicked = $(e.target);
      if (! $clicked.parents().hasClass("dropdown"))
        $(".dropdown dd ul").hide();
    });


    $("#flagSwitcher").click(function() {
      $(".dropdown img.flag").toggleClass("flagvisibility");
    });
  });


  function getCookie(name) {
    var matches = document.cookie.match(new RegExp(
            "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
  }
  </script>
  <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

