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


    public static function update($object){
        $db = flyDb::getInstance();
        //get user by email
        $user_id = User::idByEmail($object->email);
        $id = intval($object->id);
        //save report
        $q = "UPDATE `report` SET
                 `name` = ".flySqlUtil::prepareString($object->name).",
                 `user_id` = ".(int)$user_id.",
                 `date_from` = ".flySqlUtil::prepareString($object->date_from).",
                 `date_to` = ".flySqlUtil::prepareString($object->date_to)."
                WHERE id=".$id;
        $db->exec($q);
        //delete old blocks
        $aBlockId = $db->fetch_column("SELECT id FROM `block` WHERE report_id=".$id);
        $aNewBlockId = array();
        foreach($object->blocks as $block){
            if(isset($block->id) && 0<$block->id){
                $aNewBlockId[] = $block->id;
            }
        }
        foreach($aBlockId as $block_id){
            if(!in_array($block_id, $aNewBlockId)){
                $q = "DELETE FROM `block` WHERE id=".intval($block_id);
                $db->exec($q);
            }
        }
        //save blocks
        foreach($object->blocks as $position=>$block){
            if(empty($block->id)){
                $q = "INSERT INTO `block` (`report_id`, `type`, `position`) VALUES (
                    ".(int)$id.",
                    ".flySqlUtil::prepareString($block->type).",
                    ".(int)$position.")";
                $db->exec($q);
                $block->id = $db->last_insert_id;
                $object->blocks[$position]->id = $db->last_insert_id;
            } else {
                $q = "UPDATE `block` SET
                        `report_id` = ".(int)$id.",
                        `type` = ".flySqlUtil::prepareString($block->type).",
                        `position` = ".flySqlUtil::prepareString($block->position)."
                        WHERE id=".intval($block->id);
                $db->exec($q);
            }
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
                if($key=="id" || $key=="report_id" || $key=="type"){
                    continue;
                }
                $data_id = $db->fetch_value("SELECT id FROM `block_data`
                            WHERE
                                `block_id`='".intval($block->id)."' AND
                                `key`=".flySqlUtil::prepareString($key)
                            );
                if(!$data_id){
                    $q = "INSERT INTO `block_data` (`block_id`, `key`, `value`) VALUES (
                    ".intval($block->id).",
                    ".flySqlUtil::prepareString($key).",
                    ".flySqlUtil::prepareString($value).")";
                } else {
                    $q = "UPDATE `block_data` SET
                             `value` = ".flySqlUtil::prepareString($value)."
                            WHERE
                             id = ".$data_id ;
                }
                $db->exec($q);
            }
        }
        return self::find($id);
    }


    public static function delete($id){
        $db = flyDb::getInstance();
        $q = "DELETE FROM `report` WHERE id=".(int)$id;
        $db->exec($q);
    }

}
