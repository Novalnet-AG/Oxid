[{include file="headitem.tpl" title="Novalnet Configuration"}]
[{oxscript include="js/libs/jquery.min.js"}]
[{oxscript include=$oViewConf->getModuleUrl('novalnet', 'out/admin/src/js/novalnetconfig.js')}]
<link rel="stylesheet" href="[{$oViewConf->getModuleUrl('novalnet', 'out/admin/src/css/novalnetconfig.css')}]" type="text/css" />

<div align="right">
    <a href="[{oxmultilang ident="NOVALNET_LINK_URL"}]" title="Novalnet AG" target="_new">
        <img src="[{$oViewConf->getModuleUrl('novalnet')}]icon.png" alt="Novalnet" border="0" >
    </a>
</div>
[{if $sNovalnetError != ''}]
    <div id="novalnet_admin_config_error">
        <div style="color:red;">[{ $sNovalnetError }]</div>
    </div>
[{/if}]
<hr/>
<div style="padding:20px;" id="novalnet_config" >
    <form name="myedit" id="myedit" class="novalnet_config_form" action="[{$oViewConf->getSelfLink()}]" method="post">
        <input type="hidden" name="cl" value="novalnetadmincontroller">
        <input type="hidden" name="fnc" value="save">
        [{ $oViewConf->getHiddenSid() }]
        <div class="novalnetCont">
            <div class="novalnet_config_title">
                <span payment_id="global_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_GLOBAL_CONFIGURATION" }]</b>
                <div class="configCnt" style="display:none;" id="global_config">
                    <dl>
                        <dd>
                            <span class="configDesc" id="admin_config_message">[{ oxmultilang ident="NOVALNET_ADMIN_CONFIG_MESSAGE" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_PRODUCT_ACTIVATION_KEY_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" id="novalnet_activation_key" name="aNovalnetConfig[iActivationKey]" value="[{$aNovalnetConfig.iActivationKey}]" />
                            <input type="hidden" id='system_ip' value="[{$oView->getNovalnetIPAddress(true)}]" />
                            <input type="hidden" id='remote_ip' value="[{$oView->getNovalnetIPAddress(false)}]" />
                            <input type="hidden" id='language' value="[{$oView->getNovalnetLanguage()|upper}]" />
                            <input type="hidden" id='ajax_process' value="1" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_PRODUCT_ACTIVATION_KEY_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_VENDOR_ID_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" id="novalnet_vendorid" name="aNovalnetConfig[iVendorId]" value="[{$aNovalnetConfig.iVendorId}]" readonly />
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_AUTHCODE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" id="novalnet_authcode" name="aNovalnetConfig[sAuthCode]" value="[{$aNovalnetConfig.sAuthCode}]" readonly />
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_PRODUCT_ID_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" id="novalnet_productid" name="aNovalnetConfig[iProductId]" value="[{$aNovalnetConfig.iProductId}]" readonly />
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_TARIFF_ID_TITLE" }]</label>
                        </dt>
                        <dd>
                            <select id="novalnet_tariffid"  name="aNovalnetConfig[sTariffId]" value="[{$aNovalnetConfig.sTariffId}]">
                                <option value="" [{if $aNovalnetConfig.sTariffId == ''}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_OPTION_NONE" }]</option>
                            </select>
                            <input type="hidden" id="novalnet_saved_tariff" value="[{$aNovalnetConfig.sTariffId}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TARIFF_ID_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_ACCESS_KEY_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input id="novalnet_accesskey" type="text" name="aNovalnetConfig[sAccessKey]" value="[{$aNovalnetConfig.sAccessKey}]" readonly />
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blTestModeMail]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestModeMail]" value="1" [{if $aNovalnetConfig.blTestModeMail == 1 }]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_MAIL_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_MAIL_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_MANUAL_CHECK_LIMIT_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[dOnholdLimit]" value="[{$aNovalnetConfig.dOnholdLimit}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_MANUAL_CHECK_LIMIT_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_PROXY_SERVER_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sProxy]" value="[{$aNovalnetConfig.sProxy}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_PROXY_SERVER_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_GATEWAY_TIMEOUT_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[iGatewayTimeOut]" value="[{if isset($aNovalnetConfig.iGatewayTimeOut)}][{$aNovalnetConfig.iGatewayTimeOut}][{else}]240[{/if}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_GATEWAY_TIMEOUT_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERRER_ID_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferrerID]" value="[{$aNovalnetConfig.sReferrerID}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERRER_ID_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt class='configTitle'>[{ oxmultilang ident="NOVALNET_LOGO_CONFIGURATION_TITLE" }]</dt>
                        <dd class='configHeadingDesc'>
                            [{ oxmultilang ident="NOVALNET_LOGO_CONFIGURATION_DESCRIPTION" }]
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blPaymentLogo]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blPaymentLogo]" value="1" [{if $aNovalnetConfig.blPaymentLogo == 1 || $aNovalnetConfig.blPaymentLogo == ''}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_CHECKOUT_PAYMENT_LOGO_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_CHECKOUT_PAYMENT_LOGO_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt class='configTitle'>[{ oxmultilang ident="NOVALNET_SUBSCRIPTION_CONFIGURATION_TITLE" }]</dt>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_TARIFF_PERIOD_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sTariffPeriod]" value="[{$aNovalnetConfig.sTariffPeriod}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TARIFF_PERIOD_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_TARIFF_PERIOD2_AMOUNT_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[dTariffPeriod2Amount]" value="[{$aNovalnetConfig.dTariffPeriod2Amount}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TARIFF_PERIOD2_AMOUNT_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_TARIFF_PERIOD2_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sTariffPeriod2]" value="[{$aNovalnetConfig.sTariffPeriod2}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TARIFF_PERIOD2_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt class='configTitle'>[{ oxmultilang ident="NOVALNET_CALLBACKSCRIPT_CONFIGURATION_TITLE" }]</dt>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blCallbackTestMode]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blCallbackTestMode]" value="1" [{if $aNovalnetConfig.blCallbackTestMode == 1}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_CALLBACK_TEST_MODE_TITLE" }]
                        </dd>
                         <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_CALLBACK_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blCallbackMail]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blCallbackMail]" value="1" [{if $aNovalnetConfig.blCallbackMail}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_CALLBACK_ENABLE_MAIL_TITLE" }]
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_CALLBACK_TO_ADDRESS_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sCallbackMailToAddr]" value="[{if  isset($aNovalnetConfig.sCallbackMailToAddr)}][{$aNovalnetConfig.sCallbackMailToAddr}][{/if}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_CALLBACK_TO_ADDRESS_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_CALLBACK_BCC_ADDRESS_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sCallbackMailBccAddr]" value="[{if  isset($aNovalnetConfig.sCallbackMailBccAddr)}][{$aNovalnetConfig.sCallbackMailBccAddr}][{/if}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_CALLBACK_BCC_ADDRESS_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_NOTIFY_URL_TITLE" }]</label>
                        </dt>
                        <dd>
                            [{assign var="oConf" value=$oViewConf->getConfig()}]
                            <input type="text" name="aNovalnetConfig[sNotifyURL]" value="[{if $aNovalnetConfig.sNotifyURL == ''}][{$oConf->getShopUrl()}]?cl=novalnetcallback&fnc=handlerequest[{else}][{$aNovalnetConfig.sNotifyURL}][{/if}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_NOTIFY_URL_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="novalnet_config_title">
                <span payment_id="creditcard_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_CREDITCARD" }]</b>
                <div class="configCnt" style="display:none;" id="creditcard_config">
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blTestmodenovalnetcreditcard]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestmodenovalnetcreditcard]" value="1" [{if $aNovalnetConfig.blTestmodenovalnetcreditcard}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blCC3DActive]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blCC3DActive]" value="1" [{if $aNovalnetConfig.blCC3DActive}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_CREDITCARD_3D_ACTIVE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_CREDITCARD_3D_ACTIVE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blAmexActive]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blAmexActive]" value="1" [{if $aNovalnetConfig.blAmexActive}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_CREDITCARD_AMEX_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_CREDITCARD_AMEX_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blMaestroActive]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blMaestroActive]" value="1" [{if $aNovalnetConfig.blMaestroActive}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_CREDITCARD_MAESTRO_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_CREDITCARD_MAESTRO_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blCartasiActive]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blCartasiActive]" value="1" [{if $aNovalnetConfig.blCartasiActive}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_CREDITCARD_CARTASI_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_CREDITCARD_CARTASI_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_SHOP_TYPE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <select name="aNovalnetConfig[iShopTypenovalnetcreditcard]">
                                <option value="" [{if $aNovalnetConfig.iShopTypenovalnetcreditcard == ''}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_OPTION_NONE" }]</option>
                                <option value="1" [{if $aNovalnetConfig.iShopTypenovalnetcreditcard == 1}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_ONE_CLICK_SHOP" }]</option>
                                <option value="2" [{if $aNovalnetConfig.iShopTypenovalnetcreditcard == 2}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_ZERO_AMOUNT_BOOK" }]</option>
                            </select>
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_SHOP_TYPE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sBuyerNotifynovalnetcreditcard]" value="[{$aNovalnetConfig.sBuyerNotifynovalnetcreditcard}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceOnenovalnetcreditcard]" value="[{$aNovalnetConfig.sReferenceOnenovalnetcreditcard}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceTwonovalnetcreditcard]" value="[{$aNovalnetConfig.sReferenceTwonovalnetcreditcard}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                     <dl>
                        <dt class="configTitle">[{ oxmultilang ident="NOVALNET_IFRAME_CONFIGURATION_TITLE" }]</dt>
                        <dd>
                            [{assign var="sCreditcardLabel" value="font-weight:bold;"}]
                            [{assign var="sCreditcardInput" value="background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset; color: #555; display: block; font-size: 14px; height: 34px; line-height: 1.42857; padding: 6px 12px; transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; width: 75%; font-family: inherit; float: left; color: #555;"}]
                            [{assign var="sCreditcardCss" value="body{font-size:14px;font-family: Raleway,'Helvetica Neue',Helvetica,Arial,sans-serif; margin-bottom: 0;} .label-group{padding-top:10px;text-align:right;width:25%;} .input-group{width:70%;}"}]
                            <table cellpadding="2">
                                <tr>
                                    <th style="text-align:left;" colspan="3">[{ oxmultilang ident="NOVALNET_IFRAME_FIELD_STYLE_CONFIGURATION_TITLE" }]</th>
                                </tr>
                                <tr>
                                    <th style="text-align:left;width:120px;">[{ oxmultilang ident="NOVALNET_IFRAME_FIELD" }]</th>
                                    <th>[{ oxmultilang ident="NOVALNET_IFRAME_LABEL" }]</th>
                                    <th>[{ oxmultilang ident="NOVALNET_IFRAME_INPUT_FIELD" }]</th>
                                </tr>
                                <tr>
                                    <td>[{ oxmultilang ident="NOVALNET_IFRAME_CARD_HOLDER" }]</td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardHolderLabel]" value="[{$aNovalnetConfig.sCreditcardHolderLabel}]" />
                                    </td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardHolderInput]" value="[{$aNovalnetConfig.sCreditcardHolderInput}]" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>[{ oxmultilang ident="NOVALNET_IFRAME_CARD_NUMBER" }]</td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardNumberLabel]" value="[{$aNovalnetConfig.sCreditcardNumberLabel}]" />
                                    </td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardNumberInput]" value="[{$aNovalnetConfig.sCreditcardNumberInput}]" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>[{ oxmultilang ident="NOVALNET_IFRAME_CARD_EXP_DATE" }]</td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardExpLabel]" value="[{$aNovalnetConfig.sCreditcardExpLabel}]" />
                                    </td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardExpInput]" value="[{$aNovalnetConfig.sCreditcardExpInput}]" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>[{ oxmultilang ident="NOVALNET_IFRAME_CARD_CVC" }]</td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardCVCLabel]" value="[{$aNovalnetConfig.sCreditcardCVCLabel}]" />
                                    </td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardCVCInput]" value="[{$aNovalnetConfig.sCreditcardCVCInput}]" />
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <th style="text-align:left;" colspan="2">[{ oxmultilang ident="NOVALNET_IFRAME_STYLE_CONFIGURATION_TITLE" }]</th>
                                </tr>
                                <tr>
                                    <td>[{ oxmultilang ident="NOVALNET_IFRAME_LABEL" }]</td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardDefaultLabel]" value="[{if !isset($aNovalnetConfig.sCreditcardDefaultLabel)}][{$sCreditcardLabel}][{else}][{$aNovalnetConfig.sCreditcardDefaultLabel}][{/if}]" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>[{ oxmultilang ident="NOVALNET_IFRAME_INPUT" }]</td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardDefaultInput]" value="[{if !isset($aNovalnetConfig.sCreditcardDefaultInput)}][{$sCreditcardInput}][{else}][{$aNovalnetConfig.sCreditcardDefaultInput}][{/if}]" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>[{ oxmultilang ident="NOVALNET_IFRAME_CSS" }]</td>
                                    <td>
                                        <input type="text" name="aNovalnetConfig[sCreditcardDefaultCss]" value="[{if !isset($aNovalnetConfig.sCreditcardDefaultCss)}][{$sCreditcardCss}][{else}][{$aNovalnetConfig.sCreditcardDefaultCss}][{/if}]" />
                                    </td>
                                </tr>
                            </table>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="novalnet_config_title">
                <span payment_id="sepa_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_SEPA" }]</b>
                <div class="configCnt" style="display:none;" id="sepa_config">
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blTestmodenovalnetsepa]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestmodenovalnetsepa]" value="1" [{if
                            $aNovalnetConfig.blTestmodenovalnetsepa}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <select name="aNovalnetConfig[iCallbacknovalnetsepa]">
                                <option value="" [{if $aNovalnetConfig.iCallbacknovalnetsepa == ''}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_OPTION_NONE" }]</option>
                                <option value="1" [{if $aNovalnetConfig.iCallbacknovalnetsepa == 1}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_OPTION_CALL" }]</option>
                                <option value="2" [{if $aNovalnetConfig.iCallbacknovalnetsepa == 2}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_OPTION_SMS" }]</option>
                            </select>
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_AMOUNT_LIMIT_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[dCallbackAmountnovalnetsepa]" value="[{$aNovalnetConfig.dCallbackAmountnovalnetsepa}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_AMOUNT_LIMIT_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_SEPA_DUE_DATE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[iDueDatenovalnetsepa]" value="[{$aNovalnetConfig.iDueDatenovalnetsepa}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_SEPA_DUE_DATE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blAutoRefill]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blAutoRefill]" value="1" [{if $aNovalnetConfig.blAutoRefill}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_AUTO_REFILL_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_AUTO_REFILL_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blAutoFillSepa]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blAutoFillSepa]" value="1" [{if $aNovalnetConfig.blAutoFillSepa}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_SEPA_PAYMENT_AUTOFILL_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_SEPA_PAYMENT_AUTOFILL_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_SHOP_TYPE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <select name="aNovalnetConfig[iShopTypenovalnetsepa]">
                                <option value="" [{if $aNovalnetConfig.iShopTypenovalnetsepa == ''}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_OPTION_NONE" }]</option>
                                <option value="1" [{if $aNovalnetConfig.iShopTypenovalnetsepa == 1}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_ONE_CLICK_SHOP" }]</option>
                                <option value="2" [{if $aNovalnetConfig.iShopTypenovalnetsepa == 2}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_ZERO_AMOUNT_BOOK" }]</option>
                            </select>
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_SHOP_TYPE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sBuyerNotifynovalnetsepa]" value="[{$aNovalnetConfig.sBuyerNotifynovalnetsepa}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceOnenovalnetsepa]" value="[{$aNovalnetConfig.sReferenceOnenovalnetsepa}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceTwonovalnetsepa]" value="[{$aNovalnetConfig.sReferenceTwonovalnetsepa}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt class='configTitle'>[{ oxmultilang ident="NOVALNET_GUARANTEE_CONFIGURATION_TITLE" }]</dt>
                        <dd class="configHeadingDesc">[{ oxmultilang ident="NOVALNET_GUARANTEE_CONFIGURATION_DESCRIPTION" }]</dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blGuaranteenovalnetsepa]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blGuaranteenovalnetsepa]" value="1" [{if
                            $aNovalnetConfig.blGuaranteenovalnetsepa}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_GUARANTEE_PAYMENT_TITLE" }]
                        </dd>
                    </dl>
                    <dl>
                        <dt><label>[{ oxmultilang ident="NOVALNET_GUARANTEE_MINIMUM_AMOUNT_TITLE" }]</label></dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[dGuaranteeMinAmountnovalnetsepa]" value="[{$aNovalnetConfig.dGuaranteeMinAmountnovalnetsepa}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_GUARANTEE_MINIMUM_AMOUNT_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt><label>[{ oxmultilang ident="NOVALNET_GUARANTEE_MAXIMUM_AMOUNT_TITLE" }]</label></dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[dGuaranteeMaxAmountnovalnetsepa]" value="[{$aNovalnetConfig.dGuaranteeMaxAmountnovalnetsepa}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_GUARANTEE_MAXIMUM_AMOUNT_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blGuaranteeForcenovalnetsepa]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blGuaranteeForcenovalnetsepa]" value="1" [{if !isset($aNovalnetConfig.blGuaranteeForcenovalnetsepa) || $aNovalnetConfig.blGuaranteeForcenovalnetsepa}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_GUARANTEE_PAYMENT_FORCE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_GUARANTEE_PAYMENT_FORCE_DESCRIPTION" }]</span>
                        <dd>
                    </dl>
                </div>
            </div>
            <div class="novalnet_config_title">
                <span payment_id="invoice_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_INVOICE" }]</b>
                <div class="configCnt" style="display:none;" id="invoice_config">
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blTestmodenovalnetinvoice]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestmodenovalnetinvoice]" value="1" [{if
                            $aNovalnetConfig.blTestmodenovalnetinvoice}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <select name="aNovalnetConfig[iCallbacknovalnetinvoice]">
                                <option value="" [{if $aNovalnetConfig.iCallbacknovalnetinvoice == ''}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_OPTION_NONE" }]</option>
                                <option value="1" [{if $aNovalnetConfig.iCallbacknovalnetinvoice == 1}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_OPTION_CALL" }]</option>
                                <option value="2" [{if $aNovalnetConfig.iCallbacknovalnetinvoice == 2}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_OPTION_SMS" }]</option>
                            </select>
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_AMOUNT_LIMIT_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[dCallbackAmountnovalnetinvoice]" value="[{$aNovalnetConfig.dCallbackAmountnovalnetinvoice}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_FRAUD_MODULE_AMOUNT_LIMIT_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_INVOICE_DUE_DATE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[iDueDatenovalnetinvoice]" value="[{$aNovalnetConfig.iDueDatenovalnetinvoice}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_INVOICE_DUE_DATE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sBuyerNotifynovalnetinvoice]" value="[{$aNovalnetConfig.sBuyerNotifynovalnetinvoice}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceOnenovalnetinvoice]" value="[{$aNovalnetConfig.sReferenceOnenovalnetinvoice}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceTwonovalnetinvoice]" value="[{$aNovalnetConfig.sReferenceTwonovalnetinvoice}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blRefOnenovalnetinvoice]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blRefOnenovalnetinvoice]" value="1" [{if !isset($aNovalnetConfig.blRefOnenovalnetinvoice) || $aNovalnetConfig.blRefOnenovalnetinvoice}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_PAYMENT_REFERENCE_ONE_TITLE" }]
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blRefTwonovalnetinvoice]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blRefTwonovalnetinvoice]" value="1" [{if !isset($aNovalnetConfig.blRefTwonovalnetinvoice) ||  $aNovalnetConfig.blRefTwonovalnetinvoice}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_PAYMENT_REFERENCE_TWO_TITLE" }]
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blRefThreenovalnetinvoice]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blRefThreenovalnetinvoice]" value="1" [{if !isset($aNovalnetConfig.blRefThreenovalnetinvoice) || $aNovalnetConfig.blRefThreenovalnetinvoice}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_PAYMENT_REFERENCE_THREE_TITLE" }]
                        </dd>
                    </dl>
                    <dl>
                        <dt class='configTitle'>[{ oxmultilang ident="NOVALNET_GUARANTEE_CONFIGURATION_TITLE" }]</dt>
                        <dd class="configHeadingDesc">[{ oxmultilang ident="NOVALNET_GUARANTEE_CONFIGURATION_DESCRIPTION" }]</dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blGuaranteenovalnetinvoice]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blGuaranteenovalnetinvoice]" value="1" [{if
                            $aNovalnetConfig.blGuaranteenovalnetinvoice}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_GUARANTEE_PAYMENT_TITLE" }]
                        </dd>
                    </dl>
                    <dl>
                        <dt><label>[{ oxmultilang ident="NOVALNET_GUARANTEE_MINIMUM_AMOUNT_TITLE" }]</label></dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[dGuaranteeMinAmountnovalnetinvoice]" value="[{$aNovalnetConfig.dGuaranteeMinAmountnovalnetinvoice}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_GUARANTEE_MINIMUM_AMOUNT_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt><label>[{ oxmultilang ident="NOVALNET_GUARANTEE_MAXIMUM_AMOUNT_TITLE" }]</label></dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[dGuaranteeMaxAmountnovalnetinvoice]" value="[{$aNovalnetConfig.dGuaranteeMaxAmountnovalnetinvoice}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_GUARANTEE_MAXIMUM_AMOUNT_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blGuaranteeForcenovalnetinvoice]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blGuaranteeForcenovalnetinvoice]" value="1" [{if !isset($aNovalnetConfig.blGuaranteeForcenovalnetinvoice) || $aNovalnetConfig.blGuaranteeForcenovalnetinvoice}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_GUARANTEE_PAYMENT_FORCE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_GUARANTEE_PAYMENT_FORCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="novalnet_config_title">
                <span payment_id="prepayment_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_PREPAYMENT" }]</b>
                <div class="configCnt" style="display:none;" id="prepayment_config">
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blTestmodenovalnetprepayment]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestmodenovalnetprepayment]" value="1" [{if $aNovalnetConfig.blTestmodenovalnetprepayment}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sBuyerNotifynovalnetprepayment]" value="[{$aNovalnetConfig.sBuyerNotifynovalnetprepayment}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                        <dt>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceOnenovalnetprepayment]" value="[{$aNovalnetConfig.sReferenceOnenovalnetprepayment}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceTwonovalnetprepayment]" value="[{$aNovalnetConfig.sReferenceTwonovalnetprepayment}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blRefOnenovalnetprepayment]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blRefOnenovalnetprepayment]" value="1" [{if !isset($aNovalnetConfig.blRefOnenovalnetprepayment) || $aNovalnetConfig.blRefOnenovalnetprepayment}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_PAYMENT_REFERENCE_ONE_TITLE" }]
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blRefTwonovalnetprepayment]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blRefTwonovalnetprepayment]" value="1" [{if !isset($aNovalnetConfig.blRefTwonovalnetprepayment) || $aNovalnetConfig.blRefTwonovalnetprepayment}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_PAYMENT_REFERENCE_TWO_TITLE" }]
                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blRefThreenovalnetprepayment]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blRefThreenovalnetprepayment]" value="1" [{if !isset($aNovalnetConfig.blRefThreenovalnetprepayment) || $aNovalnetConfig.blRefThreenovalnetprepayment}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_PAYMENT_REFERENCE_THREE_TITLE" }]
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="novalnet_config_title">
                <span payment_id="paypal_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_PAYPAL" }]</b>
                <div class="configCnt" style="display:none;" id="paypal_config">
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blTestmodenovalnetpaypal]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestmodenovalnetpaypal]" value="1" [{if $aNovalnetConfig.blTestmodenovalnetpaypal}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_SHOP_TYPE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <select name="aNovalnetConfig[iShopTypenovalnetpaypal]">
                                <option value="" [{if $aNovalnetConfig.iShopTypenovalnetpaypal == ''}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_OPTION_NONE" }]</option>
                                <option value="1" [{if $aNovalnetConfig.iShopTypenovalnetpaypal == 1}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_ONE_CLICK_SHOP" }]</option>
                                <option value="2" [{if $aNovalnetConfig.iShopTypenovalnetpaypal == 2}]selected="selected"[{/if}]>[{ oxmultilang ident="NOVALNET_ZERO_AMOUNT_BOOK" }]</option>
                            </select>
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_SHOP_TYPE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sBuyerNotifynovalnetpaypal]" value="[{$aNovalnetConfig.sBuyerNotifynovalnetpaypal}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceOnenovalnetpaypal]" value="[{$aNovalnetConfig.sReferenceOnenovalnetpaypal}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceTwonovalnetpaypal]" value="[{$aNovalnetConfig.sReferenceTwonovalnetpaypal}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                </div>
                </div>
            </div>
            <div class="novalnet_config_title">
                <span payment_id="instantbank_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_INSTANTBANK" }]</b>
                <div class="configCnt" style="display:none;" id="instantbank_config">
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden"
                            name="aNovalnetConfig[blTestmodenovalnetonlinetransfer]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestmodenovalnetonlinetransfer]" value="1" [{if $aNovalnetConfig.blTestmodenovalnetonlinetransfer}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sBuyerNotifynovalnetonlinetransfer]" value="[{$aNovalnetConfig.sBuyerNotifynovalnetonlinetransfer}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceOnenovalnetonlinetransfer]" value="[{$aNovalnetConfig.sReferenceOnenovalnetonlinetransfer}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceTwonovalnetonlinetransfer]" value="[{$aNovalnetConfig.sReferenceTwonovalnetonlinetransfer}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="novalnet_config_title">
                <span payment_id="ideal_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_IDEAL" }]</b>
                <div class="configCnt" style="display:none;" id="ideal_config">
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blTestmodenovalnetideal]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestmodenovalnetideal]" value="1" [{if $aNovalnetConfig.blTestmodenovalnetideal}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sBuyerNotifynovalnetideal]" value="[{$aNovalnetConfig.sBuyerNotifynovalnetideal}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceOnenovalnetideal]" value="[{$aNovalnetConfig.sReferenceOnenovalnetideal}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceTwonovalnetideal]" value="[{$aNovalnetConfig.sReferenceTwonovalnetideal}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="novalnet_config_title">
                <span payment_id="eps_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_EPS" }]</b>
                <div class="configCnt" style="display:none;" id="eps_config">
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blTestmodenovalneteps]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestmodenovalneteps]" value="1" [{if $aNovalnetConfig.blTestmodenovalneteps}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sBuyerNotifynovalneteps]" value="[{$aNovalnetConfig.sBuyerNotifynovalneteps}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceOnenovalneteps]" value="[{$aNovalnetConfig.sReferenceOnenovalneteps}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceTwonovalneteps]" value="[{$aNovalnetConfig.sReferenceTwonovalneteps}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="novalnet_config_title">
                <span payment_id="giropay_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_GIROPAY" }]</b>
                <div class="configCnt" style="display:none;" id="giropay_config">
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blTestmodenovalnetgiropay]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestmodenovalnetgiropay]" value="1" [{if $aNovalnetConfig.blTestmodenovalnetgiropay}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sBuyerNotifynovalnetgiropay]" value="[{$aNovalnetConfig.sBuyerNotifynovalnetgiropay}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceOnenovalnetgiropay]" value="[{$aNovalnetConfig.sReferenceOnenovalnetgiropay}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceTwonovalnetgiropay]" value="[{$aNovalnetConfig.sReferenceTwonovalnetgiropay}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="novalnet_config_title">
                <span payment_id="przelewy24_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                <b>[{ oxmultilang ident="NOVALNET_PRZELEWY24" }]</b>
                <div class="configCnt" style="display:none;" id="przelewy24_config">
                    <dl>
                        <dt></dt>
                        <dd>
                            <input type="hidden" name="aNovalnetConfig[blTestmodenovalnetprzelewy24]" value="0" />
                            <input type="checkbox" name="aNovalnetConfig[blTestmodenovalnetprzelewy24]" value="1" [{if $aNovalnetConfig.blTestmodenovalnetprzelewy24}]checked="checked"[{/if}] />
                            [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sBuyerNotifynovalnetprzelewy24]" value="[{$aNovalnetConfig.sBuyerNotifynovalnetprzelewy24}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceOnenovalnetprzelewy24]" value="[{$aNovalnetConfig.sReferenceOnenovalnetprzelewy24}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                        </dt>
                        <dd>
                            <input type="text" name="aNovalnetConfig[sReferenceTwonovalnetprzelewy24]" value="[{$aNovalnetConfig.sReferenceTwonovalnetprzelewy24}]" />
                        </dd>
                        <dd>
                            <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                        </dd>
                    </dl>
                </div>
                </div>
                <div class="novalnet_config_title">
                    <span payment_id="barzahlen_config" onclick="novalnetToggleMe(this)" class="down-icon" ></span>
                    <b>[{ oxmultilang ident="NOVALNET_BARZAHLEN" }]</b>
                    <div class="configCnt" style="display:none;" id="barzahlen_config">
                        <dl>
                            <dt></dt>
                            <dd>
                                <input type="hidden" name="aNovalnetConfig[blTestmodenovalnetbarzahlen]" value="0" />
                                <input type="checkbox" name="aNovalnetConfig[blTestmodenovalnetbarzahlen]" value="1" [{if $aNovalnetConfig.blTestmodenovalnetbarzahlen}]checked="checked"[{/if}] />
                                [{ oxmultilang ident="NOVALNET_TEST_MODE_TITLE" }]
                            </dd>
                            <dd>
                                <span class="configDesc">[{ oxmultilang ident="NOVALNET_TEST_MODE_DESCRIPTION" }]</span>
                            </dd>
                        </dl>
						<dl>
							<dt>
								<label>[{ oxmultilang ident="NOVALNET_BARZAHLEN_DUE_DATE_TITLE" }]</label>
							</dt>
							<dd>
								<input type="text" name="aNovalnetConfig[iDueDatenovalnetbarzahlen]" value="[{$aNovalnetConfig.iDueDatenovalnetbarzahlen}]" />
							</dd>
							<dd>
								<span class="configDesc">[{ oxmultilang ident="NOVALNET_BARZAHLEN_DUE_DATE_DESCRIPTION" }]</span>
							</dd>
						</dl>
                        <dl>
                            <dt>
                                <label>[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_TITLE" }]</label>
                            </dt>
                            <dd>
                                <input type="text" name="aNovalnetConfig[sBuyerNotifynovalnetbarzahlen]" value="[{$aNovalnetConfig.sBuyerNotifynovalnetbarzahlen}]" />
                            </dd>
                            <dd>
                                <span class="configDesc">[{ oxmultilang ident="NOVALNET_BUYER_NOTIFICATION_DESCRIPTION" }]</span>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                            <dt>
                            <dt>
                                <label>[{ oxmultilang ident="NOVALNET_REFERENCE_ONE_TITLE" }]</label>
                            </dt>
                            <dd>
                                <input type="text" name="aNovalnetConfig[sReferenceOnenovalnetbarzahlen]" value="[{$aNovalnetConfig.sReferenceOnenovalnetbarzahlen}]" />
                            </dd>
                            <dd>
                                <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <label>[{ oxmultilang ident="NOVALNET_REFERENCE_TWO_TITLE" }]</label>
                            </dt>
                            <dd>
                                <input type="text" name="aNovalnetConfig[sReferenceTwonovalnetbarzahlen]" value="[{$aNovalnetConfig.sReferenceTwonovalnetbarzahlen}]" />
                            </dd>
                            <dd>
                                <span class="configDesc">[{ oxmultilang ident="NOVALNET_REFERENCE_DESCRIPTION" }]</span>
                            </dd>
                        </dl>
                    </div>
                </div>
            <input type="submit" id="novalnet_config_submit" value="[{ oxmultilang ident="GENERAL_SAVE" }]" />
        </div>
    </form>
</div>
[{include file="bottomitem.tpl"}]
