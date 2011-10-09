Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p99M0VWJ032194
	for <linux-lvm@redhat.com>; Sun, 9 Oct 2011 18:00:31 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p99M0QUL008216
	for <linux-lvm@redhat.com>; Sun, 9 Oct 2011 18:00:27 -0400
Received: by eye27 with SMTP id 27so1123963eye.33
	for <linux-lvm@redhat.com>; Sun, 09 Oct 2011 15:00:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGRgLy4TkBvCT=DmpmXH5L=A3dcdhp_bbapHPdZ-y6uVjXkP8Q@mail.gmail.com>
References: <CAGRgLy72f6WcW90Y9LeGEt4-14NvJeF39EQidF94d8QxeEFPrg@mail.gmail.com>
	<CAJJYPdmPH87=Gpu3T9exQYE8uOEr02Hg8FSWzN26mjY0ZgTPsw@mail.gmail.com>
	<CAGRgLy4TkBvCT=DmpmXH5L=A3dcdhp_bbapHPdZ-y6uVjXkP8Q@mail.gmail.com>
Date: Mon, 10 Oct 2011 00:00:26 +0200
Message-ID: <CAJJYPd=2Z65uc3uze7Y+9V330rz9-9AaR9xpNjQAzsN9Axw_AQ@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM2.2.02.88 - segfault when using lv_t pointers
	obtained from lvm_vg_list_lvs
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
Content-Type: text/plain; charset="utf-8"
To: Alexander Lyakas <alex.bolshoy@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

2011/10/9 Alexander Lyakas <alex.bolshoy@gmail.com>:
> Hello Zdenek,
>
> I have done several runs with Valgrind, but unfortunately this problem
> did not reproduce yet.
>
> There are, however, several other observations from Valgrind and
> non-Valgrind runs.
>
> 1) The following warning from Valgrind has appeared a couple of times:
> ==25539== Syscall param stat(file_name) points to unaddressable byte(s)
> ==25539== � �at 0x61BE715: _xstat (xstat.c:38)
> ==25539== � �by 0x50E016F: _insert (in /lib/liblvm2app.so.2.2)

You will surely need to compile lvm  with:
--enable-debug --enable-valgrind-pool




> 2) Another warning from Valgrind
> ==25539== Warning: noted but unhandled ioctl 0x1261 with no size/direction hints
> ==25539== � �This could cause spurious value errors to appear.
> ==25539== � �See README_MISSING_SYSCALL_OR_IOCTL for guidance on
> writing a proper wrapper.

Some ioctl are not known to tje valgrind.

>
> 3) With the new LVM version (88) there are a lot of error messages like:
> semid 32997377: semop failed for cookie 0xd4d4ab7: incorrect semaphore state
> Failed to set a proper state for notification semaphore identified by
> cookie value 223169207 (0xd4d4ab7) to initialize waiting for incoming
> notifications.

Certainly strange


> 4) Internal error: Maps lock 260780032 < unlock 260796416
> This message also happens on lvm_vg_close(), right before the previous
> error message

This maps lock tests are disabled with valgrind compilation, since
valgrind is allocating unexpected memory.


> 5) Additional error that is now frequently seen in syslog
> Oct �5 06:49:54 i-0000067c prog: Wiping cache of LVM-capable devices
> Oct �5 06:49:54 i-0000067c prog: device-mapper: status ioctl failed:
> Invalid argument

Check kernel log (dmesg) what is going on here - possible accessing
non-existing device ?

Zdenek
