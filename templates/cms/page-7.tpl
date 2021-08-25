{extends file=$layout}

{block name='breadcrumb'}
{/block}

 {block name='content'}
 
   <section id="main">
 
     {block name='page_content_container'}
        <section id="content" class="page-content page-cms page-cms-{$cms.id}">
      
          {block name='cms_content'}
            {$cms.content nofilter}
            <div class="row">
            <div class="col-md-4">
            <p>Touver un point de vente</p>
            <p>points de vente Karine & Jeff en France</p>
            <select name="store" id="store">
            <option value="">Filtrer par distributeur</option>
            </select>
            <button id="localise">Autour de moi</button>
            </div>
            <div class="col-md-8">
              <iframe src="https://www.google.com/maps/d/u/0/embed?mid=1TOZ2gMcO1hYoxQlTO7qkHdlZKeBwDJOO" width="640" height="480"></iframe>
            </div>
            </div>
           
          {/block}
      
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
 