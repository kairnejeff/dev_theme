{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
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
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="row product-container">
      <div class="col-md-6">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
              <div class="scroll-box-arrows">
                <i class="material-icons left">&#xE314;</i>
                <i class="material-icons right">&#xE315;</i>
              </div>

            {/block}
          </section>
        {/block}
        </div>
        <div class="col-md-6">
          {block name='page_header_container'}
            {block name='page_header'}
              <div class="title_product">
                <h2 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h2>
                {if $product.description_short}
                  <div id="product-subtitle" itemprop="subtitle">{$product.description_short nofilter}</div>
                {/if}
              </div>
            {/block} 
          {/block}

          <div class="product-information">
          {block name='product_description'}
            <div id="product-description-{$product.id}" itemprop="description">{$product.description nofilter}</div>
          {/block}

          <div id="history" class="info-detail-content">
            {foreach from=$product.features item=feature}
              {if ($feature.name == "Suggestions d'utilisation")}
                <p>{$feature.value|escape:'html':'UTF-8'}</p>
              {/if}
            {/foreach}
          </div>

            {if $product.is_customizable && count($product.customizations.fields)}
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
            {/if}

            <div class="product-actions">
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}
                  
                  

                  <div class="info-all row clearfix">	
                    <div class="info-detailed col-md-12">

                      <nav id="main-menu" class="main-menu" >
                        <ul>
                          <li class="menu-tab active"><a href="#/composition">Ingrédients</a></li>
                          <li class="menu-tab"><a href="#/mentions">Valeurs Nutritives</a></li>
                          <li class="menu-tab"><a href="#/histoire">En Savoir Plus</a></li>
                          <li class="menu-tab"><a href="#/avis">Avis</a></li>
                        </ul>
                      </nav>

                    <div class="info-detailed-titler active col-md-6">
                      {if isset($product.features)}
                        <div class="info-detailed-title" >
                          <div id="ingredient" class="info-detail-content">
                          {foreach from=$product.features item=feature}
                            {if ($feature.name == "Ingrédients")}
                              <p>{$feature.value|escape:'html':'UTF-8'}</p>
                              <p>*ingrédients issus de l'agriculture biologique <br/>
                                Certifié Ecocert SAS. 32600</p>
                            {/if}
                          {/foreach}
                        </div>
                        </div>
                        
                        <div id="allergenes" class="info-detail-content">
                          {foreach from=$product.features item=feature}
                            {if ($feature.name == "Allergènes")}
                              <p>{$feature.value|escape:'html':'UTF-8'}</p>
                            {/if}
                          {/foreach}
                        </div>
                    </div>

                    <div class="info-detailed-titler nut col-md-6">
                      {if isset($product.features)}
                      <div class="info-detailed-title">
                      </div>
                      <div id="mentions" class="info-detail-content">
                      {foreach from=$product.features item=feature}
                        {if ($feature.name == "Mentions Spéciales")}
                          <div>{$feature.value|escape:'html':'UTF-8'}</div>
                        {/if}
                      {/foreach}	
                      <div>Pour 100g </div>

                      <div class="info-nutrition">
                        <ul class="list-nutrition"> 
                          <li class="nutrition kj">
                            <ul>
                                <li class="number color_nutrition"> 
                            {foreach from=$product.features item=feature}
                              {if ($feature.name == "Energie kcal/100g")}
                                {if $feature.value <= 360}
                                    <span class="green_color">{$feature.value|escape:'html':'UTF-8'} kcal </span>
                                    {else}
                                    <span class="red_color">{$feature.value|escape:'html':'UTF-8'} kcal </span>
                                {/if}
                              {/if}
                              {if ($feature.name == "Energie kJ/100g")}
                                <span class="green_color">{$feature.value|escape:'html':'UTF-8'} kj </span>
                              {/if}
                            {/foreach}
                                  </li>
                                <li class="label-nutrition">Calories</li>
                              </ul>
                          </li>
                            
                        {foreach from=$product.features item=feature}

                          {if ($feature.name == "Matière grasse" )}
                            <li class="nutrition">
                              <ul>
                                {if $feature.value <= 10}
                                  <li class="number green">{$feature.value|escape:'html':'UTF-8'} g</li>
                                  {else}
                                  <li class="number red">{$feature.value|escape:'html':'UTF-8'} g</li>
                                {/if}

                                  <li class="label-nutrition">Matière grasse</li>
                              </ul>
                            </li>
                          {/if}

                          {if ($feature.name == "Acides gras saturés" )}
                            <li class="nutrition">
                              <ul>
                                {if $feature.value <= 3}
                                  <li class="number green">{$feature.value|escape:'html':'UTF-8'} g</li>
                                  {else}
                                  <li class="number red">{$feature.value|escape:'html':'UTF-8'} g</li>
                                  {/if}
                                  <li class="label-nutrition">Acides gras saturés</li>
                              </ul>
                            </li>
                          {/if}

                          {if ($feature.name == "Glucides" )}
                          <li class="nutrition">
                            <ul>
                            {if $feature.value <= 10}
                                <li class="number green">{$feature.value|escape:'html':'UTF-8'} g</li>
                                {else}
                                <li class="number red">{$feature.value|escape:'html':'UTF-8'} g</li>
                              {/if}

                                <li class="label-nutrition">Glucides</li>
                            </ul>
                          </li>
                        {/if}

                        {if ($feature.name == "Sucres" )}
                          <li class="nutrition">
                            <ul>
                              {if $feature.value <= 18}
                                <li class="number green">{$feature.value|escape:'html':'UTF-8'} g</li>
                                {else}
                                <li class="number red">{$feature.value|escape:'html':'UTF-8'} g</li>
                              {/if}

                                <li class="label-nutrition">Sucres</li>
                            </ul>
                          </li>
                        {/if}

                        {if ($feature.name == "Fibres" )}
                          <li class="nutrition">
                            <ul>
                                <li class="number green">{$feature.value|escape:'html':'UTF-8'} g</li>
                                <li class="label-nutrition">Fibres</li>
                              
                            </ul>
                          </li>
                        {/if}

                        {if ($feature.name == "Protéines" )}
                          <li class="nutrition">
                            <ul>
                              {if $feature.value <= 8}
                                <li class="number green">{$feature.value|escape:'html':'UTF-8'} g</li>
                                {else}
                                <li class="number red">{$feature.value|escape:'html':'UTF-8'} g</li>

                              {/if}
                                <li class="label-nutrition">Protéines</li>
                            </ul>
                          </li>
                        {/if}

                        {if ($feature.name == "Sel" )}  
                        <li class="nutrition">
                            <ul>
                              {if $feature.value <= 0.92}
                                <li class="number green">{$feature.value|escape:'html':'UTF-8'} g</li>
                                {else}
                                <li class="number red">{$feature.value|escape:'html':'UTF-8'} g</li>
                              {/if}
                                
                              <li class="label-nutrition">Sel</li>
                              
                            </ul>
                          </li>
                        {/if}                       
                      {/foreach}
                      </ul>
                      </div>
                      </div>
                    {/if}	
                    </div>

                    <div class="info-detailed-titler col-md-6">
                      <div class="info-detailed-title">
                      </div>
                      <div id="en_savoir_plus" class="info-detail-content">
                          <p> {$product.custom_field_lang_wysiwyg nofilter}</p>
                      </div>
                    </div>

                      <div class="info-detailed-titler col-md-6">
                      <div class="info-detailed-title">
                      </div>
                      <div id="avis_truspilot info-detail-content ">
                        <div class="data-hidden d-none">
                          {if !empty($combinations)}
                              <div id="combinaison-attributes" data-attributes="[{$combinations|json_encode}]"></div>
                        {/if}
                        </div>
                        <!-- TrustBox widget - Product Reviews -->
                        <div id="trustbox-widget" class="trustpilot-widget" data-locale="fr-FR" data-template-id="544a426205dc0a09088833c6" data-businessunit-id="603ce71821527000016deb69" data-style-height="300px" data-style-width="100%" data-theme="light" data-sku="{if empty($combinations)}{$product.reference}{/if}" data-review-languages="fr" data-no-reviews="hide">
                          <a href="https://fr.trustpilot.com/review/karinejeff.fr" target="_blank" rel="noopener">Trustpilot</a>
                        </div>
                        <!-- End TrustBox widget -->
                      </div>
                      </div>
                      </div>
                    
                    {/if}
                    </div>
                    </div>

                  {* <div class="product-special-info">
                    <div class="label-bio"><img src="{$urls.img_url}/logo-bio-europeen.svg" /></div>
                  </div>

                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block} *}

                  {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                  {block name='product_refresh'}{/block}
                </form>
              {/block}
            </div>
        </div>
      </div>
    </div>
    
    <div class="actu">
        <div class="info-actu origin">
          <h2> D'où viennent nos produits ? </h2>
          <div class="flex">
            <div class="provenance">
              <img src="{$urls.img_url}provenance.png"/>
              <div class="text-info">
                {if $product.source != NULL}
                  {$product.source nofilter}
                {/if}
              </div>
            </div>
          </div>
        </div>

        <div class="info-actu secret">
          <h2> Notre secret de cuisine </h2>
          <div class="flex">
            <div class="secret_cuisine">
              <div class="text-info">
                {if $product.secret != NULL}
                  {$product.secret nofilter}
                {/if}
              </div>
              <img src="{$urls.img_url}secret.png"/>
            </div>
          </div>
        </div>

        <div class="info-actu bocaux">
          <h2> Recyclage </h2>
          <div class="flex">
            <div class="recyclage">
              <img src="{$urls.img_url}recyclage.png"/>
              <div class="text-info">
                <p> Les emballages : bocaux en verre recyclables </p>
              </div>
            </div>
          </div>
        </div>
    </div>
  </div>

 
    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories container clearfix">
          <p class="h5 text-uppercase">
          <span>{l s='You might also like' d='Shop.Theme.Catalog'}</span>
          </p>
          <div class="products" itemscope itemtype="http://schema.org/ItemList">
            {foreach from=$accessories item="product_accessory" key="position"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    <div class="boutique">
      
      {assign var="breadcrumbLength" value=(count($breadcrumb.links)-2)}
     
      <button> <a href= {$breadcrumb.links[$breadcrumbLength].url}> {$breadcrumb.links[$breadcrumbLength].title} </a> </button>
    </div>

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
