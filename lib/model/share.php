<?php
/**
 * Created by JetBrains PhpStorm.
 * User: prof
 * Url: about.me/prhf
 * Date: 14.11.12
 * Time: 17:55
 * MasterOfCode ltd.
 */
class Share
{

    public static function find($id)
    {
        $db = flyDb::getInstance();
        $q = "SELECT * FROM `report_share` WHERE id=".(int)$id;
        $result = $db->fetch_row($q);
        return $result;
    }


    public static function getReport($id)
    {
        $db = flyDb::getInstance();
        $q = "SELECT * FROM `report_share` WHERE report_id=".(int)$id." ORDER BY created DESC";
        $result = $db->fetch_all_rows($q);
        return $result;
    }


    public static function addShare($id, $email)
    {
        $db = flyDb::getInstance();
        $q = "INSERT INTO `report_share` SET email=".flySqlUtil::prepareString($email).", report_id=".(int)$id;
        $result = $db->exec($q);
        return $result;
    }

}
