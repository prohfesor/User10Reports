<div style="width: 180px; height: 169px; padding: 31px 0 0 20px; background: #F2F2F2;" title="{$block->data['source']}">
    <span style="font-size: 10px; color: #999; text-transform: uppercase;">{$block->data['name']}</span>
    <ul style="padding: 0; margin: 0;">
    {if !empty($block->data['line0'])}<li><span>{$block->data['line0']}</span></li>{/if}
    {if !empty($block->data['line1'])}<li><span>{$block->data['line1']}</span></li>{/if}
    {if !empty($block->data['line2'])}<li><span>{$block->data['line2']}</span></li>{/if}
    {if !empty($block->data['line3'])}<li><span>{$block->data['line3']}</span></li>{/if}
    {if !empty($block->data['line4'])}<li><span>{$block->data['line4']}</span></li>{/if}
    {if !empty($block->data['line5'])}<li><span>{$block->data['line5']}</span></li>{/if}
    {if !empty($block->data['line6'])}<li><span>{$block->data['line6']}</span></li>{/if}
    </ul>
</div>