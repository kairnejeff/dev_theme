
{if $carrousels}
    <div id="carousel" data-ride="carousel" class="carousel slide"  data-touch="true">
         <ol class="carousel-indicators">
          {foreach from=$carrousels item=carrousel key=idxSlide}
          <li data-target="#carousel" data-slide-to="{$idxSlide}"{if $idxSlide == 0} class="active"{/if}></li>
          {/foreach}
        </ol>
        <ul class="carousel-inner" role="listbox">
            {foreach from=$carrousels item=carrousel key=idxSlide}
                <li class="carousel-item {if $carrousel.position ==1}active{/if}"" role="option" aria-hidden="false">
                    {assign var="name" value="."|explode:$carrousel.fileName}
                    {if $name[1]|in_array:$img}
                        <img src="{$image_baseurl}{$carrousel.fileName}" alt="{$carrousel.nom}" class="img-thumbnail" />
                    {elseif $name[1]|in_array:$video}
                        <video controls>
                            <source src="{$image_baseurl}{$carrousel.fileName}" type="video/mp4">
                        </video>
                    {/if}
                </li>
            {/foreach}
        </ul>
        {if $carrousels|count >1}
         <div class="direction" aria-label="{l s='Carousel buttons' d='Shop.Theme.Global'}">
          <a class="left carousel-control" href="#carousel" role="button" data-slide="prev" aria-label="{l s='Previous' d='Shop.Theme.Global'}">
            <span class="icon-prev hidden-xs" aria-hidden="true">
              <i class="material-icons">&#xE5CB;</i>
            </span>
          </a>
          <a class="right carousel-control" href="#carousel" role="button" data-slide="next" aria-label="{l s='Next' d='Shop.Theme.Global'}">
            <span class="icon-next" aria-hidden="true">
              <i class="material-icons">&#xE5CC;</i>
            </span>
          </a>
        </div>
        {/if}
    </div>
{/if}