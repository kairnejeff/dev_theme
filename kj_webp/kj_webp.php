<?php
if (!defined('_PS_VERSION_')) {
    exit;
}
require_once(dirname(__FILE__).'/../../'.'config/config.inc.php');
class Kj_Webp extends Module
{
    public function __construct() {
        $this->name = 'kj_webp';
        $this->author = 'Jing';
        $this->version = '1.0.0';
        $this->need_instance= 0;
        $this->bootstrap = true;
        $this->tab = 'others';
        parent::__construct();
        $this->ps_versions_compliancy = array(
            'min' => '1.7',
            'max' => _PS_VERSION_
        );
        $this->displayName = $this->l('webp');
        $this->description = $this->l('change photo into webp');
    }

    public function install(){
        if (parent::install() && $this->registerHook('actionWatermark')
            && $this->registerHook('actionProductUpdate')
            && $this->registerHook('actionProductDelete')
            && $this->registerHook('actionCategoryAdd')
            && $this->registerHook('actionCategoryUpdate')
            && $this->registerHook('actionCategoryDelete')) {
            return true;
        }
        return false;
    }

    public function uninstall()
    {
        /* Deletes Module */
        if (parent::uninstall()) {
            return true;
        }
        return false;
    }

    public function _displayForm(){
        $defaultLang = (int)Configuration::get('PS_LANG_DEFAULT');
        $fields_form = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Settings'),
                    'icon' => 'icon-cogs'
                ),
                'input' => array(
                    array(
                        'type' => 'switch',
                        'label' => $this->getTranslator()->trans('Category', array(), 'Admin.Global'),
                        'name' => 'category',
                        'is_bool' => true,
                        'desc' => $this->trans('Generate webp images of category cover .', array(), 'Modules.Banner.Admin'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->getTranslator()->trans('Yes', array(), 'Admin.Global')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->getTranslator()->trans('No', array(), 'Admin.Global')
                            )
                        ),
                    ),
                    array(
                        'type' => 'switch',
                        'label' => $this->getTranslator()->trans('Category', array(), 'Admin.Global'),
                        'name' => 'product',
                        'is_bool' => true,
                        'desc' => $this->trans('Generate webp images of product cover .', array(), 'Modules.Banner.Admin'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->getTranslator()->trans('Yes', array(), 'Admin.Global')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->getTranslator()->trans('No', array(), 'Admin.Global')
                            )
                        ),
                    )
                ),
                'submit' => array(
                    'title' => $this->l('Save')
                )
            ),
        );
        $helper = new HelperForm();
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->default_form_language =$defaultLang;
        $helper->module = $this;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') ? Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') : 0;
        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitStoreConf';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false).'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->tpl_vars = array(
            'uri' => $this->getPathUri(),
            'fields_value' => $this->getConfigFieldsValues(),
        );

        return $helper->generateForm(array($fields_form));
    }

    public function getContent()
    {
        if(Tools::isSubmit('submitStoreConf')){
            Configuration::updateValue('category', Tools::getValue('category'));
            Configuration::updateValue('product', Tools::getValue('product'));
            $nbproduct=0;
            $nbcategory=0;
            if(Tools::getValue('product')==1){
                $nbproduct=$this->generateAllProductWebp();
            }
            if(Tools::getValue('category')==1){
                $nbcategory=$this->generateAllCategoryWebp();
            }
            $html=$this->displayConfirmation($this->trans($nbcategory.' categories image have been generated;'. $nbproduct. 'products images have been generated', array(), 'Admin.Notifications.Success'));
        }else{
            $html= '';
        }

        return  $html.$this->_displayForm();
    }

    public function getConfigFieldsValues()
    {
        $fields = array();
        $fields['category']=Tools::getValue('category');
        $fields['product']=Tools::getValue('product');
        return $fields;
    }


    public function hookActionWatermark($params)
    {
        $product_id = $params['id_product'];
        $image = Product::getCover( $product_id);
        $file = dirname(__FILE__).'/../../img/p/'.Image::getImgFolderStatic($image['id_image']).$image['id_image'].'-home_default.jpg';
        if(file_exists($file)){
            //echo "Le fichier $file existe.";
            $file_webp = (dirname(__FILE__).DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'p'.DIRECTORY_SEPARATOR.'webp-img'.$product_id.'.webp');
            //dump($file_webp);
           $this->generate_webp_image($file, $file_webp, 60);
        }else{
            Tools::displayError();
        }

    }

    public function hookActionProductUpdate($params)
    {
        $product_id = $params['id_product'];
        $image = Product::getCover( $product_id);
        $file = dirname(__FILE__).'/../../img/p/'.Image::getImgFolderStatic($image['id_image']).$image['id_image'].'-home_default.jpg';
        if(file_exists($file)){
            //echo "Le fichier $file existe.";
            $file_webp = (dirname(__FILE__).DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'p'.DIRECTORY_SEPARATOR.'webp-img'.$product_id.'.webp');
            //dump($file_webp);
            $this->generate_webp_image($file, $file_webp, 60);
        }else{
            Tools::displayError();
        }
    }

    public function hookActionProductDelete($params)
    {
        $product_id = $params['id_product'];
        $file_webp = (dirname(__FILE__).DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'p'.DIRECTORY_SEPARATOR.'webp-img'.$product_id.'.webp');
        @unlink($file_webp);
    }

    public function hookActionCategoryAdd($params)
    {
        $category=$params['category'];
        $id_category=$category->id_category;
        $image=$category->id_image;
        $file = dirname(__FILE__).'/../../img/c/'.$image.'-category_default.jpg';
        if(file_exists($file)){
            //echo "Le fichier $file existe.";
            $file_webp = (dirname(__FILE__).DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'c'.DIRECTORY_SEPARATOR.'webp-img'.$id_category.'.webp');
            //dump($file_webp);
            $this->generate_webp_image($file, $file_webp, 60);
        }else{
            Tools::displayError();
        }
    }
    public function hookActionCategoryUpdate($params)
    {
        $category=$params['category'];
        $id_category=$category->id_category;
        $image=$category->id_image;
        $file = dirname(__FILE__).'/../../img/c/'.$image.'-category_default.jpg';
        if(file_exists($file)){
            //echo "Le fichier $file existe.";
            $file_webp = (dirname(__FILE__).DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'c'.DIRECTORY_SEPARATOR.'webp-img'.$id_category.'.webp');
            //dump($file_webp);
            $this->generate_webp_image($file, $file_webp, 60);
        }else{
            Tools::displayError();
        }
    }

    public function hookActionCategoryDelete($params)
    {
        $category=$params['category'];
        $id_category=$category->id_category;
        $file_webp = (dirname(__FILE__).DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'c'.DIRECTORY_SEPARATOR.'webp-img'.$id_category.'.webp');
        @unlink($file_webp);
    }

    public function generateAllProductWebp()
    {
        $nb_img = 0;
        $products = Db::getInstance()->executeS('SELECT * FROM '._DB_PREFIX_.'product WHERE `active`=1');
        foreach($products as $p){
            $image = Product::getCover($p['id_product']);
            $file = dirname(__FILE__).'/../../img/p/'.Image::getImgFolderStatic($image['id_image']).$image['id_image'].'-home_default.jpg';
            $nb_img++;
            if(file_exists($file)){
                //echo "Le fichier $file existe.";
                $file_webp = (dirname(__FILE__).DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'p'.DIRECTORY_SEPARATOR.'webp-img'.$p['id_product'].'.webp');
                $this->generate_webp_image($file, $file_webp, 60);
            }
        }
        return $nb_img;
    }


    public function generateAllCategoryWebp()
    {
        $nb_img = 0;
        $sql='SELECT DISTINCT c.id_category FROM' ._DB_PREFIX_.'category_lang l,'  ._DB_PREFIX_.'category c
                where l.id_category=c.id_category
                and c.active=1
                and l.id_shop = '.(int)$this->context->shop->id;
        $categorys = Db::getInstance()->executeS($sql);
        foreach($categorys as $c){
            $id_category=$c['id_category'];
            $file = dirname(__FILE__).'/../../img/c/'.$id_category.'-category_default.jpg';
            $nb_img++;
            if(file_exists($file)){
                $file_webp = (dirname(__FILE__).DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'c'.DIRECTORY_SEPARATOR.'webp-img'.$id_category.'.webp');
                $this->generate_webp_image($file, $file_webp, 60);
            }
        }
        return $nb_img;
    }

    public function getimgsuffix($name) {
        $info = getimagesize($name);
        $suffix = false;
        if($mime = $info['mime']){
            $suffix = explode('/',$mime)[1];
        }
        return $suffix;
    }

    public function generate_webp_image($file,$output_file, $compression_quality)
    {
        // check if file exists
        if (!file_exists($file)) {
            return false;
        }

        $file_type = $this->getimgsuffix($file);
        if (function_exists('imagewebp')) {

            switch ($file_type) {
                case 'jpeg':
                case 'jpg':
                    $image = imagecreatefromjpeg($file);
                    break;

                case 'png':
                    $image = imagecreatefrompng($file);
                    imagepalettetotruecolor($image);
                    imagealphablending($image, true);
                    imagesavealpha($image, true);
                    break;

                case 'gif':
                    $image = imagecreatefromgif($file);
                    break;
                default:
                    return false;
            }

            // Save the image
            $result = imagewebp($image, $output_file, $compression_quality);
            if (false === $result) {
                return false;
            }

            // Free up memory
            imagedestroy($image);

            return $output_file;
        } elseif (class_exists('Imagick')) {
            $image = new Imagick();
            $image->readImage($file);

            if ($file_type === 'png') {
                $image->setImageFormat('webp');
                $image->setImageCompressionQuality($compression_quality);
                $image->setOption('webp:lossless', 'true');
            }

            $image->writeImage($output_file);
            return $output_file;
        }

        return false;
    }

}