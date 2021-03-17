<?php

require(dirname(__FILE__).'/../../'.'config/config.inc.php');
class ConvertisseurWebp
{
    private $file;
    private $output_file;
    private $compression_quality;

    public function __construct($img,$output_file, $compression_quality) {
        $this->file=$img;
        $this->output_file=$output_file;
        $this->compression_quality=$compression_quality;
        $this->generate_webp_image();
    }

    public function generate_webp_image()
    {
        // check if file exists
        if (!file_exists($this->file)) {
            return false;
        }

        // If output file already exists return path
        //$output_file = $file . '.webp';
        if (file_exists($this->output_file)) {
            return $this->output_file;
        }

        $file_type = strtolower(pathinfo($this->file, PATHINFO_EXTENSION));

        if (function_exists('imagewebp')) {

            switch ($file_type) {
                case 'jpeg':
                case 'jpg':
                    $image = imagecreatefromjpeg($this->file);
                    break;

                case 'png':
                    $image = imagecreatefrompng($this->file);
                    imagepalettetotruecolor($image);
                    imagealphablending($image, true);
                    imagesavealpha($image, true);
                    break;

                case 'gif':
                    $image = imagecreatefromgif($this->file);
                    break;
                default:
                    return false;
            }

            // Save the image
            $result = imagewebp($image, $this->output_file, $this->compression_quality);
            if (false === $result) {
                return false;
            }

            // Free up memory
            imagedestroy($image);

            return $this->output_file;
        } elseif (class_exists('Imagick')) {
            $image = new Imagick();
            $image->readImage($this->file);

            if ($file_type === 'png') {
                $image->setImageFormat('webp');
                $image->setImageCompressionQuality($this->compression_quality);
                $image->setOption('webp:lossless', 'true');
            }

            $image->writeImage($this->output_file);
            return $this->output_file;
        }

        return false;
    }
}