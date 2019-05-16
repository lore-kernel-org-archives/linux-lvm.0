Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 483D719936
	for <linux-lvm@redhat.com>; Thu, 16 May 2019 09:04:45 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BB299F736
	for <linux-lvm@redhat.com>; Thu, 16 May 2019 09:04:14 +0000 (UTC)
Message-Id: <5CDD277F020000F90006616F@prv1-mh.provo.novell.com>
Date: Thu, 16 May 2019 03:03:59 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] "lvconvert --mirrors 1 --stripes 3 vgtest/lvtest"
 command succeeds, but no stripes
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
To: linux-lvm@redhat.com

Hello Guys,

I found lvconvert command (in lvm lvm2-2.02.120) did not handle "--stripes" option correctly.
The reproduce steps are as below,
# vgcreate vgtest /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/vdf /dev/vdg
# lvcreate -n lvtest -L 8G vgtest
# lvconvert --mirrors 1 --stripes 3 vgtest/lvtest
# lvs -o+stripes
  LV     VG     Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert #Str
  lvtest vgtest rwi-a-r--- 8.00g                                    12.21               2

But if you create LV using lvcreate command directly, the command succeeds with stripes.
e.g.
# lvcreate --mirrors 1 --stripes 3 -L 4G vgtest
# lvs -o+stripes
  LV     VG     Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert #Str
  lvol0  vgtest rwi-a-r--- 4.01g                                    8.67                6

I also use lvm2-2.02.180 to reproduce this issue, the lvconvert command works like before,
but the command will print out a message, like that,
# lvconvert --mirrors 1 --stripes 3 vgtest/lvtest
  Command does not accept option: --stripes 3.

Why do we can not use lvconvert to do like that, design issue? but lvcreate can do that.
What limitations are there between mirrors and stripes?

Thanks
Gang
