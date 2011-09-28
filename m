Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8SCYW5P015129
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2011 08:34:32 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8SCYVJr019103
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2011 08:34:31 -0400
Received: by eya28 with SMTP id 28so7257329eya.33
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2011 05:34:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGRgLy72f6WcW90Y9LeGEt4-14NvJeF39EQidF94d8QxeEFPrg@mail.gmail.com>
References: <CAGRgLy72f6WcW90Y9LeGEt4-14NvJeF39EQidF94d8QxeEFPrg@mail.gmail.com>
Date: Wed, 28 Sep 2011 14:34:30 +0200
Message-ID: <CAJJYPdmPH87=Gpu3T9exQYE8uOEr02Hg8FSWzN26mjY0ZgTPsw@mail.gmail.com>
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

2011/9/28 Alexander Lyakas <alex.bolshoy@gmail.com>:
> Hi everybody,
> we started to work with this LVM version, and sometimes we hit an
> issue when using lv_t pointers obtained from lvm_vg_list_lvs() API.
> Here are a couple of examples:
>
> #0 �0x00007f4487816d05 in raise () from /lib/x86_64-linux-gnu/libc.so.6
> (gdb) bt
> #0 �0x00007f4487816d05 in raise () from /lib/x86_64-linux-gnu/libc.so.6
> #1 �0x00007f448781aa47 in abort () from /lib/x86_64-linux-gnu/libc.so.6
> #2 �0x00007f448784fd7b in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #3 �0x00007f448785cd7a in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #4 �0x00007f448785f31e in malloc () from /lib/x86_64-linux-gnu/libc.so.6
> #5 �0x00007f448784e75f in open_memstream () from /lib/x86_64-linux-gnu/libc.so.6

Looks like you hit some internal glibc malloc  integrity selfcheck -
so some memory has been unexpectedly modified - I'd advise to use
valgrind tool to find proper place when the memory is overwritten.

> � � � �if (lv_list != NULL) {
> � � � � � � � �dm_list_iterate_items(lv_list_entry, lv_list) {
> � � � � � � � � � � � �const char * lv_name_from_list = lvm_lv_get_name(lv_list_entry->lv);
> � � � � � � � � � � � �if (strcmp(lv_name_from_list, lv_name) == 0) {
> � � � � � � � � � � � � � � � �lv_handle = lv_list_entry->lv;
> � � � � � � � � � � � � � � � �break;
> � � � � � � � � � � � �}
> � � � � � � � �}
> � � � �}
>
> This is the code that we obtain the lv_t pointers from. Looking at the
> new �lvm_lv_from_name() API, it does exactly the same (without giving
> away copies of the list, names etc). �We started using the new API
> anyways, and did not see any crashes with it (yet).
>
> Is there anything wrong in the way we obtain lv_t pointers? Could this
> be some other issue?


Depends on, what do you do with pointers - you can't use them once you
free vg handle.
But I think valgrind will be here better then 1000 words....

Zdenek
