<?php
if (!defined('_PS_VERSION_')) {
    exit;
}
class Kj_DetectDevice extends Module
{
    public function __construct() {
        $this->name = 'kj_detectdevice';
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
        $this->displayName = $this->l('Detect Device');
        $this->description = $this->l('Displays user divice in all tpl');
    }

    public function install(){
        if (parent::install() && $this->registerHook('actionFrontControllerSetVariables')
        ) {
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
    public function hookActionFrontControllerSetVariables()
    {
        //echo $this->getUserMachine();die;
        return array(
            "machine" =>$this->getUserMachine()
        );
    }

    public function getUserMachine(){
        $user=$_SERVER['HTTP_USER_AGENT'];
        if(stristr($user,'Macintosh')){$machine="Mac";}
        elseif(stristr($user,'Win')){$machine="Win";}

        elseif(stristr($user,'iPhone')){$machine="iPhone";}
        elseif(stristr($user,'iPod')){$machine="iPod";}
        elseif(stristr($user,'Android')){$machine="Android";}
        elseif(stristr($user,'iPad')){$machine="iPad";}

        else{$machine="Linux";}
        return $machine;
    }

    
}