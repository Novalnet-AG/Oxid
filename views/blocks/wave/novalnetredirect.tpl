<dl>
	<dt>
		<input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
		<label for="payment_[{$sPaymentID}]"><b>[{$paymentmethod->oxpayments__oxdesc->value}]
	 [{if $paymentmethod->getPrice()}]
		[{assign var="oPaymentPrice" value=$paymentmethod->getPrice()}]
		[{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge')}]
			([{oxprice price=$oPaymentPrice->getNettoPrice() currency=$currency}]
			[{if $oPaymentPrice->getVatValue() > 0}]
				[{oxmultilang ident="PLUS_VAT"}] [{oxprice price=$oPaymentPrice->getVatValue() currency=$currency}]
			[{/if}])
		 [{else}]
				([{oxprice price=$oPaymentPrice->getBruttoPrice() currency=$currency}])
		 [{/if}]
	  [{/if}]
	  </b></label>
	  [{if $oView->getNovalnetConfig('blPaymentLogo')}]
	   <span>
		<img src="[{$oViewConf->getModuleUrl('novalnet','out/img/')}][{$sPaymentID}].png" alt="[{$paymentmethod->oxpayments__oxdesc->value}]"/>
	   </span>   
	   [{/if}]
	</dt>   
<dd class="payment-option[{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}] activePayment[{/if}]">        
 [{block name="checkout_payment_longdesc"}]
        <div class="desc"> 
			[{if $paymentmethod->oxpayments__oxlongdesc->value|trim}]
				[{ $paymentmethod->oxpayments__oxlongdesc->getRawValue()}]<br>
			[{/if}]
			
			[{if $oView->getNovalnetNotification($sPaymentID) != '' }]
				<br>[{$oView->getNovalnetNotification($sPaymentID)}]
			[{/if}]
			
			[{if $oView->getNovalnetTestmode($sPaymentID) }]
				<br><span style="color:red">[{ oxmultilang ident='NOVALNET_TEST_MODE_MESSAGE' }]</span><br>
			[{/if}]
	   </div>		 
 [{/block}]         
 </dd>
 </dl>
