<?php 
class ControllerPaymentWebtransfercard extends Controller {
	private $error = array(); 

	public function index() {
		$this->language->load('payment/webtransfercard');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('webtransfercard', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_successful'] = $this->language->get('text_successful');
		$this->data['text_declined'] = $this->language->get('text_declined');
		$this->data['text_off'] = $this->language->get('text_off');

		$this->data['webtransfercard_shop_id_text'] = $this->language->get('webtransfercard_shop_id_text');
		$this->data['webtransfercard_secret_key_text'] = $this->language->get('webtransfercard_secret_key_text');
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_order_status'] = $this->language->get('entry_order_status');
		$this->data['entry_status'] = $this->language->get('entry_status');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['merchant'])) {
			$this->data['error_merchant'] = $this->error['merchant'];
		} else {
			$this->data['error_merchant'] = '';
		}

 		if (isset($this->error['password'])) {
			$this->data['error_password'] = $this->error['password'];
		} else {
			$this->data['error_password'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/webtransfercard', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
				
		$this->data['action'] = $this->url->link('payment/webtransfercard', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['webtransfercard_shop_id'])) {
			$this->data['webtransfercard_shop_id'] = $this->request->post['webtransfercard_shop_id'];
		} else {
			$this->data['webtransfercard_shop_id'] = $this->config->get('webtransfercard_shop_id');
		}
		
		if (isset($this->request->post['webtransfercard_secret_key'])) {
			$this->data['webtransfercard_secret_key'] = $this->request->post['webtransfercard_secret_key'];
		} else {
			$this->data['webtransfercard_secret_key'] = $this->config->get('webtransfercard_secret_key');
		}
		
		$this->data['callback'] = HTTP_CATALOG . 'index.php?route=payment/webtransfercard/callback';
		$this->data['fail_url'] = HTTP_CATALOG . 'index.php?route=payment/webtransfercard/fail';
		$this->data['success_url'] = HTTP_CATALOG . 'index.php?route=payment/webtransfercard/success';

		if (isset($this->request->post['webtransfercard_geo_zone_id'])) {
			$this->data['webtransfercard_geo_zone_id'] = $this->request->post['webtransfercard_geo_zone_id'];
		} else {
			$this->data['webtransfercard_geo_zone_id'] = $this->config->get('webtransfercard_geo_zone_id');
		} 

		$this->load->model('localisation/geo_zone');
										
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['webtransfercard_status'])) {
			$this->data['webtransfercard_status'] = $this->request->post['webtransfercard_status'];
		} else {
			$this->data['webtransfercard_status'] = $this->config->get('webtransfercard_status');
		}
		if (isset($this->request->post['webtransfercard_order_status_id'])) {
			$this->data['webtransfercard_order_status_id'] = $this->request->post['webtransfercard_order_status_id'];
		} else {
			$this->data['webtransfercard_order_status_id'] = $this->config->get('webtransfercard_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$this->template = 'payment/webtransfercard.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/webtransfercard')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['webtransfercard_shop_id']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}
		
		if (!$this->request->post['webtransfercard_secret_key']) {
			$this->error['password'] = $this->language->get('error_password');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>
