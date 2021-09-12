{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 {extends file='customer/page.tpl'}

 {block name='page_header_container'}
    <div class="log-out">
     <a href="{$logout_url}" >
         {l s='Sign out' d='Shop.Theme.Actions'}
     </a>
    </div>
 {/block}
 {block name='page_title'}
 
 {/block}
 
 
 
 {block name='page_content'}
    <div class="block-category my-account">
         <h1 class="h1">  {l s='Mon compte' d='Shop.Theme.Customeraccount'}</h1>
         <img class="category-cover" src="{$urls.img_url}/customer-account-img.jpg" alt="contact us" width="100%"/>
    </div>
   <div class="clearfix"></div>
   <div class="info-blocs">
   <div class="info-bloc">
     <h2 class="infor-bloc-title">{l s='Mes informations' d='Shop.Theme.Customeraccount'}</h2>
     <div class="info-bloc-content">
       <h3 class="font3">{l s='INFORMATIONS DE CONTACT' d='Shop.Theme.Customeraccount'}</h3>
       <div class="row">
         <div class="col-md-6">
           <p>{$customer.firstname} {$customer.lastname}</p>
           <p>{$customer.email}</p>
           <p>{l s='mot de passe' d='Shop.Theme.Customeraccount'} : *****</p>
         </div>
         <div class="col-md-6">
           <a id="identity-link" href="{$urls.pages.identity}">
         <span class="link-item">
           {l s='Modifier' d='Shop.Theme.Customeraccount'}
         </span>
           </a>
         </div>
       </div>
       <div class="button">
         <a class="btn btn-primary" href="{$urls.pages.identity}">
          <span class="link-item">
           {l s='MODIFIER MES INFORMATIONS' d='Shop.Theme.Customeraccount'}
         </span>
         </a>
       </div>
     </div>
   </div>
   <div class="info-bloc">
           <h2 class="infor-bloc-title">{l s='Mes commandes' d='Shop.Theme.Customeraccount'}</h2>
           <div class="info-bloc-content">
               <h3 class="font3">{l s='LISTE DES COMMANDES' d='Shop.Theme.Customeraccount'}</h3>
               {$orders=Order::getCustomerOrders({$customer.id})}
               {if $orders}
                   {foreach from=$orders item=order}
                       <ul>
                           <li>
                               <a href="{url entity = 'order-detail' params = ['id_order'=>$order.id_order]}" data-link-action="view-order-details">
                                   {l s='Commande du' d='Shop.Theme.Customeraccount'} {$order.invoice_date}
                               </a>
                           </li>
                       </ul>
                   {/foreach}
               {/if}
               <div class="button">
                   <a class="btn btn-primary" href="{$urls.pages.history}">
                  <span class="link-item">
                   {l s='GÉRER MES COMMANDES' d='Shop.Theme.Customeraccount'}
                  </span>
                   </a>
               </div>
           </div>
       </div>
   <div class="info-bloc">
     <h2 class="infor-bloc-title">{l s='Mes adresses' d='Shop.Theme.Customeraccount'}</h2>
     <div class="info-bloc-content">
       <h3 class="font3">{l s='ADRESSES DE FACTURATION' d='Shop.Theme.Customeraccount'}</h3>
       <div class="row">
         {foreach $customer.addresses as $address}
           <div class="col-lg-6 col-md-12 col-sm-12">
             {block name='customer_address'}
               {include file='customer/_partials/block-address.tpl' address=$address}
             {/block}
           </div>
         {/foreach}
       </div>
       <div class="button">
         {if $customer.addresses|count}
           <a class="btn btn-primary" id="addresses-link" href="{$urls.pages.addresses}">
           <span class="link-item">
             {l s='GÉRER MES ADRESSES' d='Shop.Theme.Customeraccount'}
           </span>
           </a>
         {else}
           <a class="btn btn-primary" id="address-link" href="{$urls.pages.address}">
           <span class="link-item">
             <i class="material-icons">&#xE567;</i>
             {l s='Add first address' d='Shop.Theme.Customeraccount'}
           </span>
           </a>
         {/if}
       </div>
     </div>
   </div>
   <div class="info-bloc">
         <h2 class="infor-bloc-title">{l s='Newsletters' d='Shop.Theme.Customeraccount'}</h2>
         <div class="info-bloc-content">
             <h3 class="font3">{l s='SOUSCRIPTIONS' d='Shop.Theme.Customeraccount'}</h3>
                {if $customer.newsletter}
                    <p>{l s='Inscrit' d='Shop.Theme.Customeraccount'}</p>
                    <p>{l s='Date d’inscription:' d='Shop.Theme.Customeraccount'}{$customer.newsletter_date_add}</p>
                {else}
                    <p>{l s='Vous n\'êtes inscrits à aucune Newsletter.' d='Shop.Theme.Customeraccount'}</p>
                {/if}
             <div class="button">
                 <a class="btn btn-primary" href="{$urls.pages.identity}">
                  <span class="link-item">
                   {l s='GÉRER MES SOUSCRIPTIONS' d='Shop.Theme.Customeraccount'}
                  </span>
                 </a>
             </div>
         </div>
     </div>
   {if !$configuration.is_catalog}
   <div class="info-bloc">
         <h2 class="infor-bloc-title">{l s='My avoirs' d='Shop.Theme.Customeraccount'}</h2>
         <div class="info-bloc-content">
             <h3 class="font3">{l s='Credit slips' d='Shop.Theme.Customeraccount'}</h3>
             <div class="button">
                 <a class="btn btn-primary" href="{$urls.pages.order_slip}">
                  <span class="link-item">
                   {l s='GÉRER MES AVOIRS' d='Shop.Theme.Customeraccount'}
                  </span>
                 </a>
             </div>
         </div>
     </div>
   {/if}
   {if $configuration.voucher_enabled && !$configuration.is_catalog}
   <div class="info-bloc">
       <h2 class="infor-bloc-title">{l s='My vouchers' d='Shop.Theme.Customeraccount'}</h2>
       <div class="info-bloc-content">
           <h3 class="font3">{l s='Vouchers' d='Shop.Theme.Customeraccount'}</h3>
           <div class="button">
               <a class="btn btn-primary" href="{$urls.pages.discount}">
              <span class="link-item">
               {l s='GÉRER MES CODES PROMOS' d='Shop.Theme.Customeraccount'}
              </span>
               </a>
           </div>
       </div>
   </div>
   {/if}
 
   {if $configuration.return_enabled && !$configuration.is_catalog}
   <div class="info-bloc">
       <h2 class="infor-bloc-title">{l s='My returns' d='Shop.Theme.Customeraccount'}</h2>
       <div class="info-bloc-content">
           <h3 class="font3">{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}</h3>
           <div class="button">
               <a class="btn btn-primary" href="{$urls.pages.order_follow}">
          <span class="link-item">
           {l s='GÉRER LES RETOURS' d='Shop.Theme.Customeraccount'}
          </span>
               </a>
           </div>
       </div>
   </div>
   {/if}
     {block name='display_customer_account'}
         {hook h='displayCustomerAccount'}
     {/block}
   </div>
 {/block}
 
 {block name='page_footer'}
 {/block}
 
 
 
 
 