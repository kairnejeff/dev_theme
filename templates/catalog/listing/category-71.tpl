{extends file=$layout}

{block name='content'}
    <section id="main">

        {block name='product_list_header'}
            {include file='catalog/_partials/category-header.tpl' listing=$listing category=$category}
            {if $category.description}
                <div id="category-description" class="text-muted">{$category.description nofilter}</div>
            {/if}
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

                <div>
                    {block name='product_list'}
                        {include file='catalog/_partials/products.tpl' listing=$listing}
                    {/block}
                </div>

                <div id="js-product-list-bottom">
                    {block name='product_list_bottom'}
                        {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
                    {/block}
                </div>

            {else}
                <div id="js-product-list-top"></div>

                <div id="js-product-list-bottom"></div>
            {/if}
        </section>
	<div class="page-home"  style="margin-top: -40px;>
	<div class="custom-text">
        <div id="custom-text">
            <div id="custom-text-container" style="color: #232323; font-weight: 400; font-size: 1.1em; text-align: left;">
                <p class="font2" style="color: #232323; font-weight: 400; font-size: 1.1em;">Le rythme de vie actuel nous amène souvent à manger sur le pouce.</p>
                <p class="font2" style="color: #232323; font-weight: 400; font-size: 1.1em;">Mais comment faire un repas agréable, sain et équilibré quand on n'a pas de temps à perdre ?</p>
                <p class="font2" style="color: #232323; font-weight: 400; font-size: 1.1em;">Pour répondre à cette question, Karine & Jeff a créé un concept inédit dans l'univers des plats cuisinés : le bento.</p>
                <p class="font2" style="color: #232323; font-weight: 400; font-size: 1.1em;">Le bento, c'est la réunion, dans un même bocal, de plusieurs recettes associant légumes de saison, légumineuses et céréales. C'est un repas complet et équilibré, savoureux et original, 100 % bio, facile à transporter, facile à consommer.</p>
                <p class="font2" style="color: #232323; font-weight: 400; font-size: 1.1em;">Élaborés à partir de produits de saison, les bentos sont disponibles en édition limitée.</p>
            </div>
        </div>
        {if $listing.products|count}
        {else}
            <p class="font2" style="color: #8B2A6D; font-weight: 400; font-size: 1.3em; text-align:center">La prochaine collection de bentos sera disponible le 7 Juillet 2021.</p>
        {/if}
	</div>
	</div>
    </section>
{/block}


