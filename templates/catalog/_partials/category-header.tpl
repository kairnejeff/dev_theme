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
<div id="js-product-list-header">
    {if $listing.pagination.items_shown_from == 1}
        <div class="block-category card card-block">
            <h1 class="h1">{$category.name}</h1>
            {if $category.image.large.url}
                <div class="category-cover">
                    {assign var="img_webp" value="modules/kj_webp/images/c/webp-img{$category.id}.webp"}
                    {if file_exists($img_webp)&& $modules.kj_detectdevice.machine !=='Mac'&&$modules.kj_detectdevice.machine !=='iPad'}
                        <picture>
                            <source srcset="{$urls.base_url}modules/kj_webp/images/c/webp-img{$category.id}.webp" alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}" type="image/webp">
                            <img src="{$category.image.bySize.category_default.url}" alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}">
                        </picture>
                    {else}
                        <img src="{$category.image.bySize.category_default.url}" alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}">
                    {/if}
                </div>
            {/if}
        </div>
    {/if}
</div>

