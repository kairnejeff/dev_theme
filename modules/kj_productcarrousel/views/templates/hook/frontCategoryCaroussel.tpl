
{* {if $carrousels}

      <div class="carousel-inner" role="listbox">
          {foreach from=$carrousels item=carrousel key=idxSlide}
                  {assign var="name" value="."|explode:$carrousel.fileName}
                  {if $name[1]|in_array:$img}
                      <img src="{$image_baseurl}{$carrousel.fileName}" alt="{$carrousel.nom}"/>
                  {elseif $name[1]|in_array:$video}
                      <video controls>
                          <source src="{$image_baseurl}{$carrousel.fileName}" type="video/mp4">
                      </video>
                  {/if}
          {/foreach}
      </div>
{/if} *}