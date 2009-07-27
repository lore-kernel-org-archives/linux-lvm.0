Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6R8uD2r014638
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 04:56:13 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.171])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6R8twci006603
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 04:55:58 -0400
Received: from localhost.housecafe.de ([127.0.0.1] helo=localhost)
	by bogon.housecafe.de with esmtp (Exim 4.69)
	(envelope-from <lists@nerdbynature.de>) id 1MVLzu-0000S2-H2
	for linux-lvm@redhat.com; Mon, 27 Jul 2009 10:55:54 +0200
Date: Mon, 27 Jul 2009 01:55:52 -0700 (PDT)
From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [linux-lvm] lvm2 confused about double UUID
In-Reply-To: <4A6D46E5.2000100@cox.net>
Message-ID: <alpine.DEB.2.01.0907270021420.6426@bogon.housecafe.de>
References: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
	<4A6CF9C0.6020902@cox.net>
	<alpine.DEB.2.01.0907261808300.6426@bogon.housecafe.de>
	<4A6D1739.2040708@cox.net>
	<alpine.DEB.2.01.0907262020090.6426@bogon.housecafe.de>
	<4A6D46E5.2000100@cox.net>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 27 Jul 2009 at 01:19, Ron Johnson wrote:
> Now you're getting beyond my pay grade.

Do you accept virtual beer cans? :-)

> But with uuidgen and tune2fs, you could give sdc1 a new UUID.  That would hose
> lvm, though, and you'd have to do surgery in /etc/lvm.

Hm, tune2fs operates on (filesystem-)superblock, IIRC. I'm still tempted 
to do "pvcreate" on one of the discs, but I need to find out how much 
bytes I have to backup so I can restore if something goes wrong.

> I'd go the safe/sure route and backup sdc2 if possible

Well, I've backup up everything on vg02, but te restore would take a few 
days. Not that it's a production setup, but I still want to avoid this 
scenario.

> (have you written anything new to it since breaking the mirror?),

Yes.

> and start over, dropping it from lvm. refdisking it (is there such a 
> word?), etc, etc.

I'm trying to reproduce what happened on a test system, but I think I 
still fail to understand where LVM looks for "possible PVs to use". I 
tried something in a Xen DomU

# mdadm --create /dev/md0 [...] /dev/loop0 /dev/loop1
# pvcreate /dev/md0
# pvs
  PV         VG   Fmt  Attr PSize  PFree
  /dev/md0        lvm2 --   99.94M 99.94M
# blkid | egrep 'md|loop'
/dev/loop0: UUID="xyIqqj-gOCa-nMzi-Dn4e-swIL-7ZFG-fuwhBf" TYPE="LVM2_member"
/dev/loop1: UUID="xyIqqj-gOCa-nMzi-Dn4e-swIL-7ZFG-fuwhBf" TYPE="LVM2_member"
/dev/md0: UUID="xyIqqj-gOCa-nMzi-Dn4e-swIL-7ZFG-fuwhBf" TYPE="LVM2_member"

Of course, "pvs" still lists only /dev/md0 as an available PV, despite 
both loop0 and loop1 are available to the system - unlike sdb and sdc when 
my mirror was still intact.

I think it's only a naming issue: my mirrordevice was presented as "sdb"
to the system, sdc did not exist yet. Now with the mirror split up, both
sdb and sdc show up - and LVM is of course used to sdb. I don't know why
LVM bothers with sdc at all, though. In the test system I do:

# mdadm --stop /dev/md0
# pvs
[nothing]
# ln -s /dev/loop0 /dev/md0
# pvs
  PV         VG   Fmt  Attr PSize  PFree
  /dev/md0        lvm2 --   99.94M 99.94M 

:-)


...anyway, I try to backup the LVM header in the test box and see how it 
goes.

Thanks,
Christian.
-- 
BOFH excuse #188:

..disk or the processor is on fire.
