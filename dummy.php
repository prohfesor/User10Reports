<?php
/**
 * Created by JetBrains PhpStorm.
 * User: prof
 * Url: about.me/prhf
 * Date: 14.11.12
 * Time: 18:42
 * MasterOfCode ltd.
 */

require_once("config/init.php");

$db->exec("Truncate block_data");
$aBlocks = $db->fetch_all_rows("select * from `block`");
foreach($aBlocks as $block){
    $i = $block->id;
    switch($block->type){
        case 'custom':
            $db->exec("delete from block_data where `block_id`={$i}");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ($i , 'name', 'Sales')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$i} , 'data', '$58,941')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$i} , 'source', 'Google Analytics')");
            break;
        case 'image':
            $db->exec("delete from block_data where `block_id`={$i}");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$i} , 'picture', 'image-3510.png')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$i} , 'caption', 'This is a caption on the image block, which can go up to 140 characters, but no more than that. Short and sweet.')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$i} , 'source', 'Google Analytics')");
            break;
        case 'list':
            $db->exec("delete from block_data where `block_id`={$i}");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$block->id} , 'name', 'Top Traffic Sources')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$block->id} , 'line1', 'Direct')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$block->id} , 'line2', 'Organic Search')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$block->id} , 'line3', 'Social Media')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$block->id} , 'line4', 'Email')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$block->id} , 'source', 'Google Analytics')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$block->id} , 'list', 'square')");
            break;
        case 'quote':
            $db->exec("delete from block_data where `block_id`={$i}");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$block->id} , 'quote', 'Ive never before experienced a product this awesome before. Im pumped to use it daily.')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$block->id} , 'source', 'Google Analytics')");
            break;
        case 'status':
            $db->exec("delete from block_data where `block_id`={$i}");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$i} , 'name', 'Project Schedule')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$i} , 'status', 'Behind')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$i} , 'source', '')");
            $db->exec("insert into block_data (`block_id`, `key`, `value`) VALUES ({$i} , 'color', 'red')");
            break;
    }
}