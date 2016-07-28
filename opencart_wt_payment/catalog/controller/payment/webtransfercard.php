<?php
class ControllerPaymentWebtransfercard extends Controller {
	protected function index() {
    	$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->data['button_back'] = $this->language->get('button_back');

		$this->data['action'] = 'https://webtransfercard.com/ru/payment/select'; // for test

		$this->load->model('checkout/order');

		$this->load->model('account/order');

		$order_product_info = $this->model_account_order->getOrderProducts($this->session->data['order_id']);

		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

		$this->load->language('payment/webtransfercard');
//var_dump($this->session->data);exit;
	$this->data['shop_id'] = $this->config->get('webtransfercard_shop_id');
	$this->data['order_id'] = $this->session->data['order_id'];
	$this->data['order_sum'] = number_format($order_info['total'], 2, '.', '');
	$this->data['currency_id'] = '840';
	$this->data['order_description'] = $order_product_info[0]['name'];
		$array = array(
			'shop_id' => $this->data['shop_id'],
			'order_id' => $this->data['order_id'],
			'order_sum' => $this->data['order_sum'],
			'currency_id' => $this->data['currency_id'],
			'order_description' => $this->data['order_description'],
		);  

	$this->data['signature'] = $this->getSignature($array);
		
	$this->load->model('setting/extension');

		$this->template = $this->config->get('config_template') . '/template/payment/webtransfercard.tpl';

	$this->render();
	}
	
	private function getSignature($arHash){
        $collect = [];
        foreach($arHash as $key => $value) {
            if ($key != 'sig') {
                if (is_array($value))
                    $value = json_encode($value);
                $collect[] = $key . "=" . $value;
            }
        }
        sort($collect);

        $current = md5(implode("", $collect) . $this->config->get('webtransfercard_secret_key'));
        return $current;
    }

	public function fail() {

		$this->redirect($this->url->link('checkout/fail', '', 'SSL'));

		return TRUE;
	}

	public function success() {

		$this->redirect($this->url->link('checkout/success', '', 'SSL'));


		return TRUE;
	}

	public function callback() {
		$this->log->write('webtransfercard POST' . ' ' .http_build_query($this->request->post));

		$this->load->model('checkout/order');

 		$order_id = $this->request->post['order_id'];
		$service_id = $this->request->post['service_id'];
		$order_sum = $this->request->post['order_sum'];
		$currency_id = $this->request->post['currency_id'];
		$status = $this->request->post['status'];
		$order_description = $this->request->post['order_description'];
		$payment_system = $this->request->post['payment_system'];
		$sig = $this->request->post['sig'];

		$this->log->write('webtransfercard ' . $order_id .' '. $service_id .' '. $order_sum .' '. $currency_id .' '. $status .' '. $order_description .' '. $payment_system .' '. $sig);

		$array = array(
			'order_id'=>$order_id,
			'service_id' => $service_id,
			'order_sum' => round($order_sum, 2),
			'currency_id' => $currency_id,
			'status' => $status,
			'order_description' => $order_description,
			'payment_system' => $payment_system,
		);
		$signature = $this->getSignature($array);
		$this->log->write('webtransfercard signature' . $signature);
if($status == 'done'){
		if ($signature == $sig) {
			$this->model_checkout_order->confirm($order_id, $this->config->get('webtransfercard_order_status_id'), 'webtransfercard');
			$this->model_checkout_order->update($order_id, $this->config->get('webtransfercard_order_status_id'), 'webtransfercard', TRUE);
		}
		else{
				$this->log->write('webtransfercard ошибка сигнатуры ' . ' ' .http_build_query($this->request->post));
				exit;
			}
		}else{
				$this->log->write('webtransfercard транзакция прошла не успешно ' . ' ' .http_build_query($this->request->post));
				exit;
			}

		$this->response->setOutput(header("HTTP/1.0 200 OK"));
	}
}

?>
