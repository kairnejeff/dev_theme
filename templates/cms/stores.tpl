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
          {block name='cms_content'}
            <div class="row">
            <div class="col-md-4">
            <p class="h3">Touver un point de vente</p>
            <p class="nb-stores">3600 points de vente Karine & Jeff en France</p>
            <select name="id-group" id="group">
              <option value="">Filtrer par distributeur</option>
              {foreach $groups as $group}
                <option value="{$group.id_group_store}">{$group.name}</option>
              {/foreach}
            </select>
            <button id="localise">Autour de moi</button>
            </div>
            <div class="col-md-8">
              <iframe src="https://www.google.com/maps/d/u/0/embed?mid=1TOZ2gMcO1hYoxQlTO7qkHdlZKeBwDJOO" width="100%" height="400"></iframe>
            </div>
            </div>
           
          {/block}
          <div id="stores-filter" class="col-md-10 offset-md-1">
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
 


