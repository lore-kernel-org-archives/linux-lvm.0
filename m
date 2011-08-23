Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7NBihvY032340
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2011 07:44:43 -0400
Received: from mail-vx0-f174.google.com (mail-vx0-f174.google.com
	[209.85.220.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7NBigSR004679
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2011 07:44:42 -0400
Received: by vxi9 with SMTP id 9so9191vxi.33
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2011 04:44:42 -0700 (PDT)
Message-ID: <4E5392A6.6000201@redhat.com>
Date: Tue, 23 Aug 2011 13:44:38 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CAGRgLy7Q+Rd9-z_Wz6WGsEy5OmvtjaSBQNZ_Ez0uVxMXFM5j_g@mail.gmail.com>
In-Reply-To: <CAGRgLy7Q+Rd9-z_Wz6WGsEy5OmvtjaSBQNZ_Ez0uVxMXFM5j_g@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm_vg_create_lv_linear() stuck in dm_udev_wait()
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alexander Lyakas <alex.bolshoy@gmail.com>

Dne 21.8.2011 20:14, Alexander Lyakas napsal(a):
> Greetings all,
> on stock ubuntu natty, using liblvm 2.02.66, sometimes
> lvm_vg_create_lv_linear () gets stuck in the following stack.
> 
> #0  0x00007f3b9636a0f7 in semop () from /lib/x86_64-linux-gnu/libc.so.6
> #1  0x00007f3b9606863c in dm_udev_wait () from /lib/libdevmapper.so.1.02.1
> #2  0x00007f3b973df41b in ?? () from /lib/liblvm2app.so.2.2
>

dmsetup udevcomplete_all

this should finish the execution of this command.

> 
> I realize that somehow it is related to udev synchronization. In my
> application, I have a udev monitor for "block" subsystem type, but
> currently it does nothing with the events it receives (it calls
> udev_monitor_receive_device(), udev_device_get_action() and then
> udev_device_unref() for every event. I plan in the future to use it
> for waking up other threads.
> 
> Can somebody pls advise on how to investigate this issue. It does not
> happen always.


My assumption is - you Debian system is using non-upstream Debian deviation of
udev rules and those are broken (I guess some related discussion might be googled)

Another issue which is currently being explored is the namespace usage - but I
think this is not related to the problem you are seeing.

Anyway I'd strongly suggest to use newer lvm package (either build form CVS)
or at least  Debian unstable version - as 2.02.66 is very old one.

Zdenek
