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
        $q .= " ORDER BY `created` DESC";
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
            $result->share = Share::getReport($id);
            //check shorturl
            if(empty($result->link)){
                $result->link = self::getShortlink($id);
            }
        }
        return $result;
    }


    public static function getShortlink($id)
    {
        $db = flyDb::getInstance();
        $url = 'http://'.$_SERVER['SERVER_NAME']."/view/".(int)$id."/";
        $lnk = google_shortener($url); //vgdShorten( $url );
        if(!empty($lnk)){
            $q = "UPDATE `report` SET link=".flySqlUtil::prepareString($lnk)." WHERE id=".(int)$id;
            $db->exec($q);
            return $lnk;
        } else {
            return false;
        }
    }


    public static function create($object){
        $db = flyDb::getInstance();
        //get user by email
        $user_id = User::idByEmail($object->email);
        //save report
        $q = "INSERT INTO `report` (`name`, `user_id`, `date_from`, `date_to`) VALUES
                (".flySqlUtil::prepareString($object->name).",
                 ".(int)$user_id.",
                 ".flySqlUtil::prepareString($object->date_from).",
                 ".flySqlUtil::prepareString($object->date_to).")";
        $db->exec($q);
        $i = $db->last_insert_id;
        //save blocks
        foreach($object->blocks as $position=>$block){
            $q = "INSERT INTO `block` (`report_id`, `type`, `position`) VALUES (
                    ".(int)$i.",
                    ".flySqlUtil::prepareString($block->type).",
                    ".(int)$position.")";
            $db->exec($q);
            $block->id = $db->last_insert_id;
            //fix list
            if(is_array($block->list)){
                foreach($block->list as $k=>$list_item){
                    $line = 'line'.$k;
                    $block->$line = $list_item;
                }
                unset($block->list);
            }
            //save blocks data
            foreach($block as $key=>$value){
                if($key=="report_id" || $key=="type"){
                    continue;
                }
                $q = "INSERT INTO `block_data` (`block_id`, `key`, `value`) VALUES (
                    ".(int)$block->id.",
                    ".flySqlUtil::prepareString($key).",
                    ".flySqlUtil::prepareString($value).")";
                $db->exec($q);
            }
        }
        return self::find($i);
    }


    public static function delete($id){
        $db = flyDb::getInstance();
        $q = "DELETE FROM `report` WHERE id=".(int)$id;
        $db->exec($q);
    }

}
