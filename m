Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p718Chd5019631
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2011 04:12:43 -0400
Received: from mail-qw0-f46.google.com (mail-qw0-f46.google.com
	[209.85.216.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p718CgNV032609
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2011 04:12:42 -0400
Received: by qwk3 with SMTP id 3so3646611qwk.33
	for <linux-lvm@redhat.com>; Mon, 01 Aug 2011 01:12:42 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 1 Aug 2011 11:12:42 +0300
Message-ID: <CAGRgLy4Qk1r7Zd-uOZc7araf2tpfFLgGGigv7xyzfvrkMo2hmQ@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm_t handles and thread-safety
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
To: linux-lvm@redhat.com

Hello everybody,
I am using stock ubuntu natty with lvmlib 2.02.66.

In my application I would like to have several threads, each operating
on a different VG.

When I tried to share the same lvm_t handle between the threads, very
soon I got segmentation faults in dm_hash operations. Looking at the
code, I indeed saw that the contents of lvm_t are used without
synchronization.

So I tried to use a lvm_t handle per thread. Quite soon I ran into the
following scenario:
- when a thread calls lvm_init(), this function calls init_locking().
By default LVM uses file-based locking. So init_file_locking() is
called. This function resets the global _lock_list structure. So any
previous locks are forgotten.
- as a result, when another thread wants to unlock a previously-locked
VG, it scans the _lock_list, does not find the lock there and returns
an error (although lvm_vg_close() hides that error by always returning
0).
- however, the dm_hash that contains the locked VG name is not updated
and still contains that name. So the user thinks that the VG got
unlocked, but dm_hash thinks otherwise. Since now there is no way to
unlock this VG (it�s file-lock was forgotten), the dm_hash entry
cannot be removed. This might prevent locking other VGs (because of VG
lock order enforcement), but from the user�s point of view, he should
be able to lock new VGs.

Can somebody of the lvmlib developers please comment on those issues?
Basically, as I see it, my application should use a single lvm_t
handle and do not share access to it, or synchronize all access
between lvm_vg_create/lvm_vg_open and lvm_vg_close.

Are there any plans or intentions to provide some support for
threading with lvmlib?

Thanks,
  Alex.
