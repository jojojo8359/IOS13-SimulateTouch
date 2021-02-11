from zxtouch.client import zxtouch
from zxtouch.toasttypes import *
import time

device = zxtouch("192.168.0.14")
device.show_toast(TOAST_MESSAGE, "Opening Notes...", 2)
time.sleep(2)
device.show_toast(TOAST_MESSAGE, "Please select an input field! 3...", 1)
time.sleep(1)

device.show_toast(TOAST_MESSAGE, "Please select an input field! 2...", 1)
time.sleep(1)

device.show_toast(TOAST_MESSAGE, "Please select an input field! 1...", 1)
time.sleep(1)

device.show_toast(TOAST_MESSAGE, "Inserting text...", 1.5)
device.insert_text("This text is generated by zxtouch!")
time.sleep(1.5)

device.show_toast(TOAST_WARNING, "Hiding the keyboard...", 1.5)
device.hide_keyboard()
time.sleep(1.5)

device.show_toast(TOAST_WARNING, "Move cursor to the left by 3 position", 1.5)
device.move_cursor(-3)
time.sleep(1.5)

device.show_toast(TOAST_WARNING, "Delete 3 characters...", 1.5)
device.insert_text("\b\b\b")
time.sleep(1.5)

device.show_toast(TOAST_WARNING, "Setting clipboard content to test...", 1.5)
text = device.set_clipboard_text("This content is saved by zxtouch script")
time.sleep(1.5)

device.show_toast(TOAST_WARNING, "Getting clipboard content...", 1.5)
time.sleep(1.5)
text = device.get_text_from_clipboard()[1]
device.show_toast(TOAST_SUCCESS, "content: " + text, 1.5)
time.sleep(1.5)

device.show_toast(TOAST_WARNING, "Pasting clipboard content...", 1.5)
time.sleep(1.5)
text = device.paste_from_clipboard()

device.disconnect()