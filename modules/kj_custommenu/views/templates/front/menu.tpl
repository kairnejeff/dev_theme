<div  class="menu js-top-menu position-static hidden-sm-down" id="_desktop_top_menu">
<button type="button" id="menu-close" class="hidden-md-up" data-dismiss="menu" aria-label="Fermer">
    <span aria-hidden="true"><i class="material-icons">close</i></span>
</button>
<ul class="top-menu" data-child="1">
    {foreach from=$items item=item}
        <li class="menu-item">
            {if !$item.is_single}
                <button type="button" class="hidden-md-up menu-next"  aria-label="Next">
                    <span aria-hidden="true" class="hidden-md-up"><i class="material-icons">chevron_right</i></span>
                </button>
                <span class="menu-item-title dropdown-item">{$item.name_item}</span>
                <div class="menu-blocks popover sub-menu js-sub-menu collapse">
                    <button type="button" class="hidden-md-up menu-before"  aria-label="Next">
                    <span aria-hidden="true" class="hidden-md-up"><i class="material-icons">chevron_left</i></span>
                    </button>
                {foreach from=$item.list_block item=block}
                    <div class="menu-block">
                        <span class="menu-block-name">{$block.block.name_block}</span>
                            <div class="recipe-ingredient">
                            {if sizeof($block.block.children)!=0}
                                {foreach from=$block.block.children item=block}
                                    <div class="menu-block-child">
                                        <span class="menu-block-child-name">{$block.name_block nofilter}</span>
                                        <ul class="menu-block-child-link">
                                            {foreach from=$block.list_link item=link}
                                                {if $link.link.type=='custom'}
                                                    <i><span class="obflink menulink {if isset($link.link.current)}current{/if}" data-o="{base64_encode($link.link.url)}">{$link.link.libelle_link}</span></i>
                                                {else}
                                                    <i><a href="{$link.link.url}" class="menulink {if isset($link.link.current)}current{/if}">{$link.link.libelle_link}</a></i>
                                                {/if}

                                            {/foreach}
                                        </ul>
                                    </div>
                                {/foreach}
                            {else}
                                <ul class="menu-block-link">
                                    {foreach from=$block.block.list_link item=link}
                                        <i><a href="{$link.link.url}" class="menulink {if isset($link.link.current)} current{/if}">{$link.link.libelle_link}</a></i>
                                    {/foreach}
                                </ul>
                            {/if}
                            </div>
                    </div>
                {/foreach}
                <div class="menu-block"> <img src="https://www.karinejeff.fr/img/cms/nous-connaitre/02-qualite.jpg"/></div>
                </div>
            {else}
                <span class="menu-item-title"><a href="{$item.link.url}" class="menulink {if isset($item.link.current)}current{/if}">{$item.name_item}</a></span>
            {/if}
        </li>
    {/foreach}
</ul>
<div id="_mobile_user_info"></div>
</div>