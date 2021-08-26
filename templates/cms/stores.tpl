{extends file=$layout}

{block name='breadcrumb'}
{/block}

 {block name='content'}
 
   <section id="cms">
 
     {block name='page_content_container'}
        <section id="content" class="page-content page-cms">
          <div class="header">
          <img class="header-image" src="{$urls.theme_assets}img/point-vente.png" alt="point vente" />
          <h1>Nous sommes ici</h1>
          </div>
          <p>Vous souhaitez distribuer nos produits : <a href="https://pro.karinejeff.fr/">Visitez notre plateforme à destination des professionnels.</a></p>
          {block name='cms_content'}
            <div class="row">
            <div class="col-md-4">
            <p>Trouver un point de vente</p>
            <p>3600 points de vente Karine & Jeff en France</p>
            <div class="selection_vente"> 
              <select name="id-group" id="group">
                <option value="">Filtrer par distributeur</option>
                {foreach $groups as $group}
                  <option value="{$group.id_group_store}">{$group.name}</option>
                {/foreach}
              </select>
              <button id="localise">
                Autour de moi
                <img src="../../img/autour-de-moi.png" />
              </button>
            </div>
            </div>
            <div class="col-md-8">
              <iframe src="https://www.google.com/maps/d/u/0/embed?mid=1TOZ2gMcO1hYoxQlTO7qkHdlZKeBwDJOO" width="640" height="480"></iframe>
            </div>
            </div>
           
          {/block}
          <div id="stores-filter">
          </div>
        </section>
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
 


