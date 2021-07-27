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
{block name='product_miniature_item'}
<div itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
  {if isset($position)}<meta itemprop="position" content="{$position}" />{/if}
  <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemprop="item" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">
      {block name='product_thumbnail'}
        {if $product.cover}
          <a href="{$product.url}" class="thumbnail product-thumbnail">
          {assign var="img_webp" value="modules/kj_webp/images/p/webp-img{$product.id_product}.webp"}
          {if file_exists($img_webp)&& $modules.kj_detectdevice.machine !=='Mac'&&$modules.kj_detectdevice.machine !=='iPad'}
              <picture>
                  <source srcset="{$urls.base_url}modules/kj_webp/images/p/webp-img{$product.id_product}.webp" alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}" type="image/webp">
                  <img width="100" height="100" src="{$product.default_image.bySize.large_default.url}" srcset="{$product.cover.bySize.home_default.url} 320w, {$product.cover.bySize.home_default_medium.url} 300w, {$product.cover.bySize.home_default_small.url} 150w " alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}">
              </picture>
              {hook h='displayCategoryProductCaroussel' id_product=$product.id}
              
          {else}
                <img
                        src="{$product.default_image.bySize.large_default.url}"
                        alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                        data-full-size-image-url="{$product.cover.large.url}"
                />
          {/if}
          </a>
        {else}
          <a href="{$product.url}" class="thumbnail product-thumbnail">
            <img src="{$urls.no_picture_image.bySize.home_default.url}" />
          </a>
        {/if}
      {/block}

      <div class="product-description">
        {block name='product_name'}
          {if $page.page_name == 'index'}
            <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}" itemprop="url" content="{$product.url}">{$product.name}</a></h3>
          {else}
            <h2 class="h3 product-title" itemprop="name"><a href="{$product.url}" itemprop="url" content="{$product.url}">{$product.name}</a></h2>
          {/if}
          {if $product.description_short}
            <div id="product-subtitle" itemprop="subtitle">{$product.description_short nofilter}</div>
          {/if} 
          {if $page.page_name == 'index'}
          <a href="{$product.url}" class="recipe">Découvrir la recette</a>
          {/if}
        {/block}

        {block name='product_price_and_shipping'}
        
          {if $product.show_price}
            <div class="product-price-and-shipping">
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}
    
                <span class="regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
                {if $product.discount_type === 'percentage'}
                  <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                {elseif $product.discount_type === 'amount'}
                  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                {/if}
              {/if}
    
              {hook h='displayProductPriceBlock' product=$product type="before_price"}
    
              <span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">{$product.price}</span>
              <div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="invisible">
                <meta itemprop="priceCurrency" content="{$currency.iso_code}" />
                <meta itemprop="price" content="{$product.price_amount}" />
              </div>
    
              {hook h='displayProductPriceBlock' product=$product type='unit_price'}
    
              {hook h='displayProductPriceBlock' product=$product type='weight'}
            </div>
          {/if}
          <div class="add-to-cart-or-refresh">
          <form action="{$urls.pages.cart}" method="post" >
              <input type="hidden" name="token" value="{$static_token}">
              <input type="hidden" name="id_product" value="{$product.id}" class="product_page_product_id">
              <input type="hidden" name="qty" value="1" id="id_product_{$product.id}"> 
              {if !$configuration.is_catalog}
                      {if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
                        <button class="btn add-to-cart" data-button-action="add-to-cart" type="submit" {if !$product.add_to_cart_url}disabled{/if}>
                          <span class="icon-panier-off"></span>
                        </button>
                      {else}
                        <button class="btn add-to-cart" data-button-action="add-to-cart" type="submit" disabled>
                          <span class="icon-panier-off"></span>
                        </button>
                      {/if}
                {/if}
            </form>
          </div>
        {/block}
      </div>
    </div>
  </article>
</div>
{/block}
