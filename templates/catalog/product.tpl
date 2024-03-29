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
              <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
            {/block}
            {if $product.description_short}
              <div id="product-subtitle" itemprop="subtitle">{$product.description_short nofilter}</div>
            {/if} 
          {/block}
          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}

          <div class="product-information">
          {block name='product_description'}
            <div id="product-description-{$product.id}" itemprop="description">{$product.description nofilter}</div>
          {/block}

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

                  <div class="product-special-info">
                    <div class="label-bio"><img src="{$urls.img_url}/logo-bio-europeen.svg" /></div>
                  </div>

                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block}

                  {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                  {block name='product_refresh'}{/block}
                </form>
              {/block}
            </div>
        </div>
      </div>
    </div>
    <div class="info-all row clearfix">	
		<div class="info-detailed col-md-6">
		{if isset($product.features)}
      <div class="info-detailed-title" role="button" data-toggle="collapse" data-target="#composition" aria-expanded="false" aria-controls="collapseOne">
			<h2 class="font3 text-uppercase">Ingrédients / composition</h2>
      <i class="material-icons hidden-md-up">expand_more</i>
      </div>
      <div id="composition" class="info-detail-content collapse">
        {foreach from=$product.features item=feature}
          {if ($feature.name == "Ingrédients")}
            <p>{$feature.value|escape:'html':'UTF-8'}</p>
            <p>*ingrédients issus de l'agriculture biologique <br />
              Certifié Ecocert SAS. 32600</p>
          {/if}
        {/foreach}
      </div>
      <div class="info-detailed-title" role="button" data-toggle="collapse" data-target="#allergenes" aria-expanded="false" aria-controls="collapseOne">
			<h2 class="font3 text-uppercase">Allergènes</h2>
      <i class="material-icons hidden-md-up">expand_more</i>
      </div>
      <div id="allergenes" class="info-detail-content collapse">
        {foreach from=$product.features item=feature}
          {if ($feature.name == "Allergènes")}
            <p>{$feature.value|escape:'html':'UTF-8'}</p>
          {/if}
        {/foreach}
      </div>

      <div class="info-detailed-title" role="button" data-toggle="collapse" data-target="#preperation" aria-expanded="false" aria-controls="collapseOne">
			<h2 class="font3 text-uppercase">Préparation</h2>
      <i class="material-icons hidden-md-up">expand_more</i>
      </div>
      <div id="preperation" class="info-detail-content collapse">
			{foreach from=$product.features item=feature}
				{if ($feature.name == "Suggestions d'utilisation")}
					<p>{$feature.value|escape:'html':'UTF-8'}</p>
				{/if}
			{/foreach}
      </div>
			
      <div class="info-detailed-title" role="button" data-toggle="collapse" data-target="#history" aria-expanded="false" aria-controls="collapseOne">
			<h2 class="font3 text-uppercase">Histoire de la recette</h2> 
      <i class="material-icons hidden-md-up">expand_more</i>
      </div>
      <div id="history" class="info-detail-content collapse">
			{foreach from=$product.features item=feature}
				{if ($feature.name == "Histoire de la recette")}
					<p>{$feature.value|escape:'html':'UTF-8'}</p>
				{/if}
			{/foreach}
      </div>
		{/if}
		</div>
		<div class="info-detailed col-md-6">
		{if isset($product.features)}
      <div class="info-detailed-title" role="button" data-toggle="collapse" data-target="#mentions" aria-expanded="false" aria-controls="collapseOne"">
			<h2 class="font3 text-uppercase">Mentions</h2>
      <i class="material-icons hidden-md-up">expand_more</i>
      </div>
      <div id="mentions" class="info-detail-content collapse">
			{foreach from=$product.features item=feature}
				{if ($feature.name == "Mentions Spéciales")}
					<div>{$feature.value|escape:'html':'UTF-8'}</div>
				{/if}
			{/foreach}		
			<div>Valeurs nutritionnelles / 100g / ml</div>
			<table>
			{foreach from=$product.features item=feature}
				<tr class="grey">
				{if ($feature.name == "Energie kcal/100g")}
					<td>{$feature.name|escape:'htmlall':'UTF-8'|cat:" "}</td><td>{$feature.value|escape:'html':'UTF-8'}</td>
				{/if}
				</tr>
				<tr>
				{if ($feature.name == "Energie kJ/100g")}
					<td>{$feature.name|escape:'htmlall':'UTF-8'|cat:" "}</td><td>{$feature.value|escape:'html':'UTF-8'}</td>
				{/if}
				</tr>
				<tr class="grey">
				{if ($feature.name == "Matière grasse")}
					<td>{$feature.name|escape:'htmlall':'UTF-8'|cat:" "}</td><td>{$feature.value|escape:'html':'UTF-8'}</td>
				{/if}
				</tr>
				<tr>
				{if ($feature.name == "Acides gras saturés")}
					<td>dont Acides gras saturés</td><td>{$feature.value|escape:'html':'UTF-8'}</td>
				{/if}
				</tr>
				<tr class="grey">
				{if ($feature.name == "Glucides")}
					<td>{$feature.name|escape:'htmlall':'UTF-8'|cat:" "}</td><td>{$feature.value|escape:'html':'UTF-8'}</td>
				{/if}	
				</tr>
				<tr>
				{if ($feature.name == "Sucres")}
					<td>dont Sucres</td><td>{$feature.value|escape:'html':'UTF-8'}</td>
				{/if}	
				</tr>
				<tr class="grey">
				{if ($feature.name == "Fibres")}
					<td>{$feature.name|escape:'htmlall':'UTF-8'|cat:" "}</td><td>{$feature.value|escape:'html':'UTF-8'}</td>
				{/if}	
				</tr>
				<tr>
				{if ($feature.name == "Protéines")}
					<td>{$feature.name|escape:'htmlall':'UTF-8'|cat:" "}</td><td>{$feature.value|escape:'html':'UTF-8'}</td>
				{/if}	
				</tr>
				<tr class="grey">
				{if ($feature.name == "Sel")}
					<td>{$feature.name|escape:'htmlall':'UTF-8'|cat:" "}</td><td>{$feature.value|escape:'html':'UTF-8'}</td>
				{/if}	
				</tr>
			{/foreach}	
			</table>
      </div>
		{/if}	
		</div>
  </div>
  {if $product.custom_field_lang_wysiwyg != NULL}
  <div class="info-all row clearfix">	
    <div class="col-md-12">
      <div class="collapse-icons" role="button" data-toggle="collapse" data-target="#product-savoir-plus" aria-expanded="false" aria-controls="collapseOne">
        <h2 class="font3 text-uppercase">En savoir plus</h2>
        <i class="material-icons add">expand_more</i>
        <i class="material-icons remove">expand_less</i>
      </div>
      <div id="product-savoir-plus" aria-expanded="false" class="collapse">
         {$product.custom_field_lang_wysiwyg nofilter}
      </div>
    </div>
  </div>
  {/if}
    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
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
