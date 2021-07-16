<div class="blockreassurance col-sm-12">
    {assign var=numCols value=$blocks|@count}
    {assign var=numColsRemaining_md value=($numCols % 4)}
    {assign var=numColsRemaining_sm value=($numCols % 2)}
    <div class="row">
    {foreach from=$blocks item=$block key=$key name=blocks}
        {assign var=idxCol value=($smarty.foreach.blocks.index + 1)}
        {assign var=sizeCol_md value=3}
        {assign var=offsetCol_md value="offset-md-0"}
        {assign var=sizeCol_sm value=6}
        {assign var=offsetCol_sm value="offset-sm-0"}
        {if $idxCol > ($numCols - $numColsRemaining_md)}
            {if $numColsRemaining_md == 2}
                {if !$smarty.foreach.blocks.last}
                    {assign var=offsetCol_md value="offset-md-3"}
                {/if}
            {else}
                {assign var=sizeCol_md value=(12 / $numColsRemaining_md)}
            {/if}
        {/if}
        {if $idxCol > ($numCols - $numColsRemaining_sm)}
            {if $numColsRemaining_md == 1}
                {assign var=offsetCol_sm value="offset-sm-3"}
            {else}
                {assign var=sizeCol_sm value=(12 / $numColsRemaining_md)}
            {/if}
        {/if}
        <div class="col-md-{$sizeCol_md} {$offsetCol_md} col-sm-{$sizeCol_sm} {$offsetCol_sm} col-xs-12"
            {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} style="cursor:pointer;" onclick="window.open('{$block['link']}')"{/if}>
            
            {if $block['icon'] != 'undefined'}
                <div class="block-icon">
                {if $block['icon']}
                    <img class="svg invisible" src="{$block['icon']}">
                {elseif $block['custom_icon']}
                    <img {if $block['is_svg']}class="svg invisible" {/if}src="{$block['custom_icon']}">
                {/if}
                </div>
            {/if}
            
            <div class="block-title" style="color:{$textColor}">{$block['title']}<div class="border"></div></div>
            <p style="color:{$textColor};">{$block['description'] nofilter}</p>
        </div>
      {if $idxCol % 4 == 0}</div><div class="row">{/if}
    {/foreach}
    </div>
</div>
