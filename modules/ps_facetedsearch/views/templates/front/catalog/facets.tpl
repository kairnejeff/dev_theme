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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
 {if $displayedFacets|count}
  <div id="search_filters">
    <div id="filtre-name" class="hidden-md-up" data-target="#facet_section" data-toggle="collapse" aria-expanded="false">
      <p class="facet-title">
        <span class="material-icons">manage_search</span>
        <span class="filtre-sr">Filtrer</span>
      </p>
    </div>
    {block name='facets_clearall_button'}
      {if $activeFilters|count}
        <div id="_desktop_search_filters_clear_all" class="hidden-sm-down clear-all-wrapper">
          <a href="{$clear_all_link}" class="btn btn-tertiary js-search-filters-clear-all">
            <i class="material-icons">&#xE14C;</i>
            {l s='Clear all' d='Shop.Theme.Actions'}
          </a>
        </div>
      {/if}
    {/block}
    <div id="facet_section" class="mobile-collapse" >
    {foreach from=$displayedFacets item="facet"}
      <section class="facet clearfix">
        <p class="facet-title">{$facet.label}</p>
        {assign var=_expand_id value=10|mt_rand:100000}
        {assign var=_collapse value=true}
        {foreach from=$facet.filters item="filter"}
          {if $filter.active}{assign var=_collapse value=false}{/if}
        {/foreach}

        {if in_array($facet.widgetType, ['radio', 'checkbox'])}
          {block name='facet_item_other'}
            <ul id="facet_{$_expand_id}">
              {foreach from=$facet.filters key=filter_key item="filter"}
                {if !$filter.displayed}
                  {continue}
                {/if}

                <div class="form-check-filtre">
                  <input class="form-check-filtre-input {if $filter.active} checked {/if}" type="checkbox" name='{$facet.label}' value="{$filter.label}"
                {if $filter.active }checked{/if}>
                      {if $filter.magnitude and $show_quantities}
                        <span class="magnitude">({$filter.magnitude})</span>
                      {/if}
                   <label class="form-check-filtre-label">
                    {$filter.label}
                  </label>
                </div>
              {/foreach}
            </ul>
          {/block}

        {elseif $facet.widgetType == 'dropdown'}
          {block name='facet_item_dropdown'}
            <ul id="facet_{$_expand_id}" class="collapse{if !$_collapse} in{/if}">
              <li>
                <div class="col-sm-12 col-xs-12 col-md-12 facet-dropdown dropdown">
                  <a class="select-title" rel="nofollow" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {$active_found = false}
                    <span>
                      {foreach from=$facet.filters item="filter"}
                        {if $filter.active}
                          {$filter.label}
                          {if $filter.magnitude and $show_quantities}
                            ({$filter.magnitude})
                          {/if}
                          {$active_found = true}
                        {/if}
                      {/foreach}
                      {if !$active_found}
                        {l s='(no filter)' d='Shop.Theme.Global'}
                      {/if}
                    </span>
                    <i class="material-icons float-xs-right">&#xE5C5;</i>
                  </a>
                  <div class="dropdown-menu">
                    {foreach from=$facet.filters item="filter"}
                      {if !$filter.active}
                        <a
                          rel="nofollow"
                          href="{$filter.nextEncodedFacetsURL}"
                          class="select-list js-search-link"
                        >
                          {$filter.label}
                          {if $filter.magnitude and $show_quantities}
                            ({$filter.magnitude})
                          {/if}
                        </a>
                      {/if}
                    {/foreach}
                  </div>
                </div>
              </li>
            </ul>
          {/block}

        {elseif $facet.widgetType == 'slider'}
          {block name='facet_item_slider'}
            {foreach from=$facet.filters item="filter"}
              <ul id="facet_{$_expand_id}"
                class="faceted-slider collapse{if !$_collapse} in{/if}"
                data-slider-min="{$facet.properties.min}"
                data-slider-max="{$facet.properties.max}"
                data-slider-id="{$_expand_id}"
                data-slider-values="{$filter.value|@json_encode}"
                data-slider-unit="{$facet.properties.unit}"
                data-slider-label="{$facet.label}"
                data-slider-specifications="{$facet.properties.specifications|@json_encode}"
                data-slider-encoded-url="{$filter.nextEncodedFacetsURL}"
              >
                <li>
                  <p id="facet_label_{$_expand_id}">
                    {$filter.label}
                  </p>

                  <div id="slider-range_{$_expand_id}"></div>
                </li>
              </ul>
            {/foreach}
          {/block}
        {/if}
      </section>
    {/foreach}
    <div class="button-filtre">
    <button id ="category-filtre" class="btn-primary">Appliquer</button>
    </div>
    </div>
  </div>
{/if}
