Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8FHIeC9026607
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2011 13:18:40 -0400
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8FHIcgd027526
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2011 13:18:39 -0400
Received: by bkbzt4 with SMTP id zt4so3577858bkb.33
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2011 10:18:38 -0700 (PDT)
MIME-Version: 1.0
From: Dusty Mabe <dustymabe@gmail.com>
Date: Thu, 15 Sep 2011 13:18:18 -0400
Message-ID: <CAFfJ-R6vS6H8pb70Q6D_TOaVG0U8+tN86eehkbULa-4ADbEXVQ@mail.gmail.com>
Subject: [linux-lvm] lvmconvert --merge acting failing to remove devices
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
To: linux-lvm@redhat.com

Hi,

I am on a basic CentOS 6 install (kernel-2.6.32-71.el6.x86_64 and
lvm2-2.02.72-8.el6.x86_64) . I took an lvm snapshot of an lv (that
contains my root fs). After erasing a few rpms I "reverted" my changes
by doing an lvmconvert --merge back to the original. Since the root fs
is mounted the merge is done the next time the lv is activated. I then
rebooted my machine so that the merge would happen. After boot I can
see the merge did happen but I still have the other dm devices
vgroot-lvroot-real vgroot-snap and vgroot-snap-cow. Is it a bug that
lvm is not cleaning up these devices?

Note that doing the lvconvert --merge  on an lv that is not mounted
will result in the dm devices being removed and the snapshot lv being
removed.


Thanks for any help!

Dusty Mabe
