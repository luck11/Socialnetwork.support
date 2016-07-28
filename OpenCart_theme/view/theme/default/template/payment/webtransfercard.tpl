<style>
	body {
		display: none;
	}
</style>
<div class="content">
<form action="<?php echo $action; ?>" method="post"  id="payments">
	<input type="hidden" name="shop_id" value="<?php echo $shop_id; ?>" >
	<input type="hidden" name="order_id" value="<?php echo $order_id; ?>" >
	<input type="hidden" name="order_sum" value="<?php echo $order_sum; ?>" >
	<input type="hidden" name="currency_id" value="<?php echo $currency_id; ?>">
	<input type="hidden" name="order_description" value="<?php echo $order_description; ?>">
	<input type="hidden" name="signature" value="<?php echo $signature; ?>">
	<div class="buttons">
		<div class="right">
			<input type="submit" value="Оплатить" class="button" />
		</div>
	</div>
</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
   $('#payments').submit();
 });

</script>

