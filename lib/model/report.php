<?php
/**
 * Created by JetBrains PhpStorm.
 * User: prof
 * Url: about.me/prhf
 * Date: 14.11.12
 * Time: 16:19
 * MasterOfCode ltd.
 */
class Report
{

    public static function getList($limit =0, $offset =0)
    {
        $db = flyDb::getInstance();
        $q = "SELECT * FROM report";
        if($limit)
        {
            $q .= " LIMIT ".(int)$limit;
        }
        if($limit && $offset)
        {
            $q .= " LIMIT ".(int)$limit.", ".(int)$offset;
        }
        $result = $db->fetch_all_rows($q);
        foreach($result as $k=>$report){
            $report->user = User::find($report->user_id);
            $result[$k] = $report;
        }
        return $result;
    }


    public static function find($id)
    {
        $db = flyDb::getInstance();
        $q = "SELECT * FROM `report` WHERE id=".(int)$id;
        $result = $db->fetch_row($q);
        if($result){
            $result->user = User::find($result->user_id);
            $result->blocks = Blocks::getReport($id);
        }
        return $result;
    }

}
