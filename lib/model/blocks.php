<?php
/**
 * Created by JetBrains PhpStorm.
 * User: prof
 * Url: about.me/prhf
 * Date: 14.11.12
 * Time: 17:55
 * MasterOfCode ltd.
 */
class Blocks
{

    public static function find($id)
    {
        $db = flyDb::getInstance();
        $q = "SELECT * FROM `block` WHERE id=".(int)$id;
        $result = $db->fetch_row($q);
        return $result;
    }


    public static function getReport($id)
    {
        $db = flyDb::getInstance();
        $q = "SELECT * FROM `block` WHERE report_id=".(int)$id." ORDER BY position";
        $result = $db->fetch_all_rows($q);
        if($result){

        }
        return $result;
    }

}
