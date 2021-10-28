<?php


defined('BASEPATH') or exit('No direct script access allowed');

class Tes extends Render_Controller
{
  public function pdf()
  {

    // bisa di panggil di seluruh classs yang exstends Render controler
    $this->create_pdf([
      'html' => '<h1> html biasa </h1>',
      'doc_name' => 'nama doument', // opsional default: document
      'paper_size' => 'A3', // opsional default: A4
      'orientation' => 'landscape' // opsional default: potrait
    ]);
  }
}
