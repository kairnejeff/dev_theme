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

    <div class="row product-container coffret_noel">

      <div class="col-md-6 image">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
            {/block}
          </section>
        {/block}
      </div>
      <div class="col-md-6 content">
        {block name='page_header_container'}
          {block name='page_header'}
            <div class="title_product">
              <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
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
              </form>
              {/block}
          </div>
        </div>
      </div>
    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories coffret_noel container clearfix">
          <div class="products" itemscope itemtype="http://schema.org/ItemList">
            {foreach from=$accessories item="product_accessory" key="position"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position}
              {/block}
            {/foreach}
             <div itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
            {if isset($position)}<meta itemprop="position" content="7" />{/if}
            <article class="product-miniature totebag js-product-miniature">
              <div class="thumbnail-container">
                {block name='product_thumbnail'}
                  
                          <img
                                  class="product-img"
                                  src="https://www.karinejeff.fr/205-large_default/totebags-myrtille.jpg"
                                  alt="Tote bag"
                          />
                
                {/block}

                <div class="product-description">
                  {block name='product_name'}
                    <h2 class="h3 product-title" itemprop="name"><a>tote bag</a></h2> 
                  {/block}
                </div>
              </div>
            </article> 
          </div>
          </div>
        </section>
      {/if}
    {/block}
    
    <div class="actu">
        {* <div class="info-actu origin">
          <h2> D'où viennent nos produits ? </h2>
          <div class="flex">
            <div class="provenance">
              <img src="{$urls.img_url}provenance.png"/>
            </div>
            <div class="text-info">
            {if $product.source != NULL}
              {$product.source nofilter}
            {/if}
            </div>
          </div>
        </div> *}

        <div class="info-actu secret">
          <h2> Notre secret de cuisine </h2>
          <div class="flex">
            <div class="text-info">
            {if $product.secret != NULL}
              {$product.secret nofilter}
            {/if}
            </div>
            <div class="secret_cuisine">
              <img src="{$urls.img_url}secret.jpg"/>
            </div>
          </div>
        </div>

        <div class="info-actu bocaux">
          <h2> Engagement </h2>
          <div class="flex">
            <div class="recyclage">
              <img src="{$urls.img_url}recyclage.jpg"/>
            </div>
            <div class="text-info">
            <p> Responsables jusqu’au bocal, nous tenons à privilégier les bocaux en verre pour le conditionnement et la présentation de nos recettes.
              C’est un engagement fort, permettant à la fois le recyclage et la réalité visible de notre cuisine qualitative en appréciant textures et couleurs.
              Enfin, nous avons la volonté de favoriser la filière verre en ne pratiquant pas de consigne ce qui de plus bénéficie à l’environnement à l’appui d’un bilan carbone maîtrisé. </p>
            </div>
          </div>
        </div>
    </div>
 

    <div class="boutique">
      
      {assign var="breadcrumbLength" value=(count($breadcrumb.links)-2)}
     
      <button> <a href= {$breadcrumb.links[$breadcrumbLength].url}> Retour à la catégorie </a> </button>
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


