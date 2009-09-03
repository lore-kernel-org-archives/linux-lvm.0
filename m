Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n83DRoE7002370
	for <linux-lvm@redhat.com>; Thu, 3 Sep 2009 09:27:50 -0400
Received: from mail-ew0-f211.google.com (mail-ew0-f211.google.com
	[209.85.219.211])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n83DRdSv027165
	for <linux-lvm@redhat.com>; Thu, 3 Sep 2009 09:27:40 -0400
Received: by ewy7 with SMTP id 7so489726ewy.7
	for <linux-lvm@redhat.com>; Thu, 03 Sep 2009 06:27:39 -0700 (PDT)
MIME-Version: 1.0
From: Eugene Vilensky <evilensky@gmail.com>
Date: Thu, 3 Sep 2009 08:27:18 -0500
Message-ID: <f4f537b50909030627i9117a53lbef23eddeb3a87e6@mail.gmail.com>
Subject: [linux-lvm] vg availability during boot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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

Greetings,

I have a host that refuses to recognize my san-attached logical
volumes during boot.  When mounting from /etc/fstab, it drops out of
boot complaining that the LVs in question have an invalid superblock
and need to be fsck-ed, however because the lv is "mounted" the fsck
cannot proceed.

I commented out the entries, rebooted, and noticed that the LVs in the
VG in question are "NOT AVAILABLE."  A vgchange -a y vgname later and
everything is working perfectly.

This is my first RHEL5 san-attached host; might I have missed some
sort of 'vg persistency' settings by doing the same things I've been
doing on RHEL4?

Thanks,
