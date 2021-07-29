 {extends file=$layout}

 {block name='content'}
 
   <section id="main">
 
     {block name='page_content_container'}
        <section id="content" class="page-content page-cms page-cms-{$cms.id}">
      
          {block name='cms_content'}
            {$cms.content nofilter}
          {/block}
      
          {block name='hook_cms_dispute_information'}
            {hook h='displayCMSDisputeInformation'}
          {/block}
      
          {block name='hook_cms_print_button'}
            {hook h='displayCMSPrintButton'}
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
 