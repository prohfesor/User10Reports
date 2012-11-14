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

}
