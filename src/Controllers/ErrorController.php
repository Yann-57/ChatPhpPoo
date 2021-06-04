<?php

class ErrorController extends Controller
{
    public function index(){
        // Silence is golden
    }

    public function show(Exception $e)
    {
        if($e->getCode())
        {
            $showAction = 'show' . $e->getCode();
            if(method_exists($this, $showAction))
            {
                $this->$showAction($e->getMessage());
            }else{
                $this->show(new Exception("Méthode d'erreur inexistante"));
            }
        }else{
            $this->render("../templates/errors/erreur.php", [
                'errorTitle' => 'Une erreur est survenue',
                'errorMessage' => $e->getMessage()
            ]);
        }
    }

    public function show404(string $message)
    {
        header('HTTP/1.0 404 Not Found');
        $this->render('../templates/errors/erreur.php', [
            'errorTitle' => 'Erreur 404 - Page inexistante',
            'errorMessage' => $message
        ]);
    }

}