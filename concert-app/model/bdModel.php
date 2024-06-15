<?php
        define("DB_HOST", $_ENV["DB_DATABASE_HOST"]);
        define("DB_USER", $_ENV["DB_DATABASE_USER"]);
        define("DB_PASSWORD", $_ENV["DB_DATABASE_PASSWORD"]);
        define("DB_NAME", $_ENV["DB_DATABASE"]);
        
    class bd{

        protected $conexion;

        public function __construct(){
            $this->conexion = new PDO('mysql:host='. DB_HOST .';dbname='. DB_NAME, DB_USER, DB_PASSWORD);
        }
    }
?>