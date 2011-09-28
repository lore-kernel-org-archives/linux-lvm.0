Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8SAGaVs008087
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2011 06:16:36 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8SAGZcJ018879
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2011 06:16:35 -0400
Received: by iaqq3 with SMTP id q3so10354355iaq.33
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2011 03:16:35 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 28 Sep 2011 13:16:35 +0300
Message-ID: <CAGRgLy72f6WcW90Y9LeGEt4-14NvJeF39EQidF94d8QxeEFPrg@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Subject: [linux-lvm] LVM2.2.02.88 - segfault when using lv_t pointers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>

Hi everybody,
we started to work with this LVM version, and sometimes we hit an
issue when using lv_t pointers obtained from lvm_vg_list_lvs() API.
Here are a couple of examples:

#0  0x00007f4487816d05 in raise () from /lib/x86_64-linux-gnu/libc.so.6
(gdb) bt
#0  0x00007f4487816d05 in raise () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007f448781aa47 in abort () from /lib/x86_64-linux-gnu/libc.so.6
#2  0x00007f448784fd7b in ?? () from /lib/x86_64-linux-gnu/libc.so.6
#3  0x00007f448785cd7a in ?? () from /lib/x86_64-linux-gnu/libc.so.6
#4  0x00007f448785f31e in malloc () from /lib/x86_64-linux-gnu/libc.so.6
#5  0x00007f448784e75f in open_memstream () from /lib/x86_64-linux-gnu/libc.so.6
#6  0x00007f44878c3deb in __vsyslog_chk () from /lib/x86_64-linux-gnu/libc.so.6
#7  0x00007f448893619b in print_log () from /lib/liblvm2app.so.2.2
#8  0x00007f4488948b23 in lv_from_lvid () from /lib/liblvm2app.so.2.2
#9  0x00007f44889139ed in _lv_activate () from /lib/liblvm2app.so.2.2
#10 0x00007f4488914cc4 in lv_activate_with_filter () from /lib/liblvm2app.so.2.2
#11 0x00007f448896718c in _file_lock_resource () from /lib/liblvm2app.so.2.2
#12 0x00007f4488934654 in _lock_vol () from /lib/liblvm2app.so.2.2
#13 0x00007f4488935226 in lock_vol () from /lib/liblvm2app.so.2.2
#14 0x00007f4488910e84 in lvm_lv_activate () from /lib/liblvm2app.so.2.2
...

#0  0x00007fec62e7c1ae in ?? () from /lib/x86_64-linux-gnu/libc.so.6
(gdb) bt
#0  0x00007fec62e7c1ae in ?? () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007fec62e7e31e in malloc () from /lib/x86_64-linux-gnu/libc.so.6
#2  0x00007fec62be59de in dm_task_create () from /lib/libdevmapper.so.1.02.1
#3  0x00007fec64430a68 in _setup_task () from /lib/liblvm2app.so.2.2
#4  0x00007fec64430c7a in _info_run () from /lib/liblvm2app.so.2.2
#5  0x00007fec64430e54 in _info () from /lib/liblvm2app.so.2.2
#6  0x00007fec644324de in dev_manager_info () from /lib/liblvm2app.so.2.2
#7  0x00007fec643e5e10 in lv_info () from /lib/liblvm2app.so.2.2
#8  0x00007fec643e782c in lv_deactivate () from /lib/liblvm2app.so.2.2
#9  0x00007fec6443a2ef in _file_lock_resource () from /lib/liblvm2app.so.2.2
#10 0x00007fec64407654 in _lock_vol () from /lib/liblvm2app.so.2.2
#11 0x00007fec64408226 in lock_vol () from /lib/liblvm2app.so.2.2
#12 0x00007fec6440ff27 in lv_remove_single () from /lib/liblvm2app.so.2.2
#13 0x00007fec643e3d13 in lvm_vg_remove_lv () from /lib/liblvm2app.so.2.2
...

Old versions of liblvm we were using did not had the
lvm_lv_from_name() API, so we implemented this using a very
rudimentary code below:
	struct dm_list * lv_list = NULL;
	lv_t lv_handle = NULL;
	lv_list_t * lv_list_entry = NULL;

	lv_list = lvm_vg_list_lvs(vg_handle);
	if (lv_list != NULL) {
		dm_list_iterate_items(lv_list_entry, lv_list) {
			const char * lv_name_from_list = lvm_lv_get_name(lv_list_entry->lv);
			if (strcmp(lv_name_from_list, lv_name) == 0) {
				lv_handle = lv_list_entry->lv;
				break;
			}
		}
	}

This is the code that we obtain the lv_t pointers from. Looking at the
new  lvm_lv_from_name() API, it does exactly the same (without giving
away copies of the list, names etc).  We started using the new API
anyways, and did not see any crashes with it (yet).

Is there anything wrong in the way we obtain lv_t pointers? Could this
be some other issue?

Thanks,
  Alex.
