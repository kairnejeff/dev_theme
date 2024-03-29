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
{block name='breadcrumb'}
{/block}

{block name='content'}
  <section id="main">

    {block name='product_list_header'}
      <h2 id="js-product-list-header" class="h2">{$listing.label}</h2>
    {/block}

    <section id="products">
      {if $listing.products|count}

        <div>
          {block name='product_list_top'}
            {include file='catalog/_partials/products-top.tpl' listing=$listing}
          {/block}
        </div>

        {block name='product_list_active_filters'}
          <div id="" class="hidden-sm-down">
            {$listing.rendered_active_filters nofilter}
          </div>
        {/block}

        {block name='product_grid_controle'}
          {include file='catalog/_partials/product_grid_controle.tpl'}
        {/block}
          {block name='product_list'}
            {include file='catalog/_partials/products.tpl' listing=$listing}
          {/block}

          {* <div class="info-detailed-title" role="button" data-toggle="collapse" data-target="#know" aria-expanded="false" aria-controls="collapseOne">
          <h2 class="font3 text-uppercase">En savoir plus</h2> 
          <i class="material-icons">expand_more</i>
          </div>
          <div id="know" class="info-detail-content collapse">
              {foreach from=$product.features item=feature}
                  {if ($feature.name == "En savoir plus")}
                      <p>{$feature.value|escape:'html':'UTF-8'}</p>
                  {/if}
              {/foreach}
          </div>
        </div> *}

        <div id="js-product-list-bottom">
          {block name='product_list_bottom'}
            {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
          {/block}

        </div>

      {else}
        <div id="js-product-list-top"></div>

        <div id="js-product-list">
          {include file='errors/not-found.tpl'}
        </div>

        <div id="js-product-list-bottom">
        
        </div>
      {/if}
      
    </section>

    {hook h="displayFooterCategory"}
    
    </section>
{/block}
