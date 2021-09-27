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
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
<div class="container">
  <div class="row">
    {block name='hook_footer_before'}
      {hook h='displayFooterBefore'}
    {/block}
  </div>
</div>
<div class="footer-container">
  <div class="container">
    <div class="row">
      <div class="col-md-2 col-xs-12">
        <img class="logo" src="{$urls.theme_assets}img/logo-karine-jeff-small.svg" alt="logo-small Karine&Jeff"/>
      </div>
      <div class="col-md-7 col-xs-12">
        <div class="row">
        {block name='hook_footer'}
          {hook h='displayFooter'}
        {/block}
        </div>
      </div>
      <div class="col-md-3 col-xs-12 right right-block">
        {block name='hook_footer_after'}
          {hook h='displayFooterAfter'}
        {/block}
        <div class="block-truspilot">
          <!-- TrustBox widget - Mini -->
          <div class="trustpilot-widget" data-locale="fr-FR" data-template-id="53aa8807dec7e10d38f59f32" data-businessunit-id="603ce71821527000016deb69" data-style-height="150px" data-style-width="225px" data-theme="light">
          <a href="https://fr.trustpilot.com/review/karinejeff.fr" target="_blank" rel="noopener">Trustpilot</a>
          </div>
          <!-- End TrustBox widget -->
        </div>
        <div class="block-yuka">
          <span class="yuka"><img src="{$urls.theme_assets}img/yuka.png"/></span>
          <p class="yuka-note">Nos produits sont excellents sur yuka (moyenne 82/100)</p>
        </div>
        <div class="membre">
          <a href="{$urls.base_url}content/25-abonnement-passion-nature">Devenir membre du club k&j</a>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <p class="text-sm-center">
          {block name='copyright_link'}
            {l s='%copyright% %year% - %kj% %right%' sprintf=['%kj%' => 'Karine & Jeff','%right%'=>'Tous droits réservés', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
          {/block}
          <a href="" class="mention">Mentions légales</a>
        </p>
      </div>
    </div>
  </div>
</div>
