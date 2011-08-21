Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p7LIEb18020363
	for <linux-lvm@redhat.com>; Sun, 21 Aug 2011 14:14:37 -0400
Received: from mail-iy0-f170.google.com (mail-iy0-f170.google.com
	[209.85.210.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7LIEbIN030538
	for <linux-lvm@redhat.com>; Sun, 21 Aug 2011 14:14:37 -0400
Received: by iye16 with SMTP id 16so9716525iye.29
	for <linux-lvm@redhat.com>; Sun, 21 Aug 2011 11:14:37 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 21 Aug 2011 21:14:36 +0300
Message-ID: <CAGRgLy7Q+Rd9-z_Wz6WGsEy5OmvtjaSBQNZ_Ez0uVxMXFM5j_g@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Subject: [linux-lvm] lvm_vg_create_lv_linear() stuck in dm_udev_wait()
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Greetings all,
on stock ubuntu natty, using liblvm 2.02.66, sometimes
lvm_vg_create_lv_linear () gets stuck in the following stack.

#0  0x00007f3b9636a0f7 in semop () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007f3b9606863c in dm_udev_wait () from /lib/libdevmapper.so.1.02.1
#2  0x00007f3b973df41b in ?? () from /lib/liblvm2app.so.2.2
#3  0x00007f3b973e012e in ?? () from /lib/liblvm2app.so.2.2
#4  0x00007f3b97399aec in ?? () from /lib/liblvm2app.so.2.2
#5  0x00007f3b9739b02b in ?? () from /lib/liblvm2app.so.2.2
#6  0x00007f3b9739bb7e in ?? () from /lib/liblvm2app.so.2.2
#7  0x00007f3b973e4c51 in ?? () from /lib/liblvm2app.so.2.2
#8  0x00007f3b973b9238 in ?? () from /lib/liblvm2app.so.2.2
#9  0x00007f3b973b9e36 in ?? () from /lib/liblvm2app.so.2.2
#10 0x00007f3b973c2118 in ?? () from /lib/liblvm2app.so.2.2
#11 0x00007f3b973989ba in lvm_vg_create_lv_linear () from /lib/liblvm2app.so.2.2
...

I realize that somehow it is related to udev synchronization. In my
application, I have a udev monitor for "block" subsystem type, but
currently it does nothing with the events it receives (it calls
udev_monitor_receive_device(), udev_device_get_action() and then
udev_device_unref() for every event. I plan in the future to use it
for waking up other threads.

Can somebody pls advise on how to investigate this issue. It does not
happen always.

Thanks,
   Alex.
