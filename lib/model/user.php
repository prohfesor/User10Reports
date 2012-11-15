<?php
/**
 * Created by JetBrains PhpStorm.
 * User: prof
 * Date: 14.11.12
 * Time: 16:15
 */
class User
{

    public static function find($id)
    {
        $db = flyDb::getInstance();
        $q = "SELECT * FROM `user` WHERE id=".(int)$id;
        $result = $db->fetch_row($q);
        return $result;
    }


    public static function idByEmail($email)
    {
        $db = flyDb::getInstance();
        $found = $db->fetch_value("SELECT id FROM `user` WHERE email=".flySqlUtil::prepareString($email) );
        if(!$found){
            $q = "INSERT INTO `user` SET email=".flySqlUtil::prepareString($email);
            $db->exec($q);
            $found = $db->last_insert_id;
        }
        return $found;
    }

}
