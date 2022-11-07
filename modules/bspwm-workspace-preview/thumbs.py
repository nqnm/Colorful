from PIL import ImageDraw, ImageTk, ImageFont

def generate(screenshot, desktop, conf):
    w, h = int(conf['width']), int(conf['height'])

    # Scale the image
    thumb = screenshot.resize((w, h))
    draw = ImageDraw.Draw(thumb)
    
    font = ImageFont.truetype(conf['font-location'], int(conf['font-size']))
    text_w, text_h = draw.textsize(desktop, font)
    
    # Pad the text
    padx = int(conf['text-pad-x'])
    pady = int(conf['text-pad-y'])

    draw.rectangle([0, h-text_h-2*pady, text_w+2*padx, h], outline=None, fill=conf['text-bg'])
    draw.text((padx, h-text_h-pady), desktop, conf['text-fg'], font=font)

    return ImageTk.PhotoImage(thumb)
