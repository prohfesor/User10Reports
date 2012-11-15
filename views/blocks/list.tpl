<li class="with-list" title="{$block->data['source']}">
    <span class="area">{$block->data['name']}</span>
    <ul class="{$block->data['list_type']|default:"square"}">
        {if !empty($block->data['line0'])}<li><span>{$block->data['line0']}</span></li>{/if}
        {if !empty($block->data['line1'])}<li><span>{$block->data['line1']}</span></li>{/if}
        {if !empty($block->data['line2'])}<li><span>{$block->data['line2']}</span></li>{/if}
        {if !empty($block->data['line3'])}<li><span>{$block->data['line3']}</span></li>{/if}
        {if !empty($block->data['line4'])}<li><span>{$block->data['line4']}</span></li>{/if}
        {if !empty($block->data['line5'])}<li><span>{$block->data['line5']}</span></li>{/if}
        {if !empty($block->data['line6'])}<li><span>{$block->data['line6']}</span></li>{/if}
    </ul>
</li>