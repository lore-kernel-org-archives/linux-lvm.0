Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p99JkDhv003563
	for <linux-lvm@redhat.com>; Sun, 9 Oct 2011 15:46:13 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p99Jk9cn028784
	for <linux-lvm@redhat.com>; Sun, 9 Oct 2011 15:46:09 -0400
Received: by iakk32 with SMTP id k32so9575277iak.33
	for <linux-lvm@redhat.com>; Sun, 09 Oct 2011 12:46:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJJYPdmPH87=Gpu3T9exQYE8uOEr02Hg8FSWzN26mjY0ZgTPsw@mail.gmail.com>
References: <CAGRgLy72f6WcW90Y9LeGEt4-14NvJeF39EQidF94d8QxeEFPrg@mail.gmail.com>
	<CAJJYPdmPH87=Gpu3T9exQYE8uOEr02Hg8FSWzN26mjY0ZgTPsw@mail.gmail.com>
Date: Sun, 9 Oct 2011 21:46:08 +0200
Message-ID: <CAGRgLy4TkBvCT=DmpmXH5L=A3dcdhp_bbapHPdZ-y6uVjXkP8Q@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
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
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hello Zdenek,

I have done several runs with Valgrind, but unfortunately this problem
did not reproduce yet.

There are, however, several other observations from Valgrind and
non-Valgrind runs.

1) The following warning from Valgrind has appeared a couple of times:
==25539== Syscall param stat(file_name) points to unaddressable byte(s)
==25539==    at 0x61BE715: _xstat (xstat.c:38)
==25539==    by 0x50E016F: _insert (in /lib/liblvm2app.so.2.2)
==25539==    by 0x50E07CD: _full_scan (in /lib/liblvm2app.so.2.2)
==25539==    by 0x50E5DA8: persistent_filter_wipe (in /lib/liblvm2app.so.2.2)
==25539==    by 0x50E11D9: dev_iter_create (in /lib/liblvm2app.so.2.2)
==25539==    by 0x50D765C: lvmcache_label_scan (in /lib/liblvm2app.so.2.2)
==25539==    by 0x5109773: _vg_read (in /lib/liblvm2app.so.2.2)
==25539==    by 0x5109CDB: vg_read_internal (in /lib/liblvm2app.so.2.2)
==25539==    by 0x5109EE4: vg_read (in /lib/liblvm2app.so.2.2)
==25539==    by 0x50D2B74: lvm_vg_open (in /lib/liblvm2app.so.2.2)
==25539==  Address 0x0 is not stack'd, malloc'd or (recently) free'd
==25539==

2) Another warning from Valgrind
==25539== Warning: noted but unhandled ioctl 0x1261 with no size/direction hints
==25539==    This could cause spurious value errors to appear.
==25539==    See README_MISSING_SYSCALL_OR_IOCTL for guidance on
writing a proper wrapper.

3) With the new LVM version (88) there are a lot of error messages like:
semid 32997377: semop failed for cookie 0xd4d4ab7: incorrect semaphore state
Failed to set a proper state for notification semaphore identified by
cookie value 223169207 (0xd4d4ab7) to initialize waiting for incoming
notifications.

These messages mostly turn up after calling lvm_vg_close() after
removing an LV, and sometimes after activating an LV. I did not
compile LVM with debug info yet, to see who causes these messages
there.

4) Internal error: Maps lock 260780032 < unlock 260796416
This message also happens on lvm_vg_close(), right before the previous
error message

5) Additional error that is now frequently seen in syslog
Oct  5 06:49:54 i-0000067c prog: Wiping cache of LVM-capable devices
Oct  5 06:49:54 i-0000067c prog: device-mapper: status ioctl failed:
Invalid argument
Oct  5 06:49:54 i-0000067c prog: Failed to get state of mapped device
Oct  5 06:49:54 i-0000067c prog: device-mapper: status ioctl failed:
Invalid argument
Oct  5 06:49:54 i-0000067c prog: Failed to get state of mapped device
Oct  5 06:49:54 i-0000067c prog: device-mapper: status ioctl failed:
Invalid argument
Oct  5 06:49:54 i-0000067c prog: Failed to get state of mapped device
Oct  5 06:49:54 i-0000067c prog: device-mapper: status ioctl failed:
Invalid argument

I realize that there are several directions to follow here. So I would
really appreciate if you could advise what seems to look like a real
issue out of these. I will also continue trying to reproduce the
original segfault.

Thanks for your help,
  Alex.



On Wed, Sep 28, 2011@2:34 PM, Zdenek Kabelac
<zdenek.kabelac@gmail.com> wrote:
> 2011/9/28 Alexander Lyakas <alex.bolshoy@gmail.com>:
>> Hi everybody,
>> we started to work with this LVM version, and sometimes we hit an
>> issue when using lv_t pointers obtained from lvm_vg_list_lvs() API.
>> Here are a couple of examples:
>>
>> #0 �0x00007f4487816d05 in raise () from /lib/x86_64-linux-gnu/libc.so.6
>> (gdb) bt
>> #0 �0x00007f4487816d05 in raise () from /lib/x86_64-linux-gnu/libc.so.6
>> #1 �0x00007f448781aa47 in abort () from /lib/x86_64-linux-gnu/libc.so.6
>> #2 �0x00007f448784fd7b in ?? () from /lib/x86_64-linux-gnu/libc.so.6
>> #3 �0x00007f448785cd7a in ?? () from /lib/x86_64-linux-gnu/libc.so.6
>> #4 �0x00007f448785f31e in malloc () from /lib/x86_64-linux-gnu/libc.so.6
>> #5 �0x00007f448784e75f in open_memstream () from /lib/x86_64-linux-gnu/libc.so.6
>
> Looks like you hit some internal glibc malloc �integrity selfcheck -
> so some memory has been unexpectedly modified - I'd advise to use
> valgrind tool to find proper place when the memory is overwritten.
>
>> � � � �if (lv_list != NULL) {
>> � � � � � � � �dm_list_iterate_items(lv_list_entry, lv_list) {
>> � � � � � � � � � � � �const char * lv_name_from_list = lvm_lv_get_name(lv_list_entry->lv);
>> � � � � � � � � � � � �if (strcmp(lv_name_from_list, lv_name) == 0) {
>> � � � � � � � � � � � � � � � �lv_handle = lv_list_entry->lv;
>> � � � � � � � � � � � � � � � �break;
>> � � � � � � � � � � � �}
>> � � � � � � � �}
>> � � � �}
>>
>> This is the code that we obtain the lv_t pointers from. Looking at the
>> new �lvm_lv_from_name() API, it does exactly the same (without giving
>> away copies of the list, names etc). �We started using the new API
>> anyways, and did not see any crashes with it (yet).
>>
>> Is there anything wrong in the way we obtain lv_t pointers? Could this
>> be some other issue?
>
>
> Depends on, what do you do with pointers - you can't use them once you
> free vg handle.
> But I think valgrind will be here better then 1000 words....
>
> Zdenek
>
