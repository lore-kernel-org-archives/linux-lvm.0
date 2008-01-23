Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0NLYGho011802
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 16:34:17 -0500
Received: from australis.nwra.com (australis.nwra.com [66.92.245.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0NLXmWQ015181
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 16:33:53 -0500
Message-ID: <3617.69.9.10.34.1201124025.squirrel@mail.nwra.com>
Date: Wed, 23 Jan 2008 14:33:45 -0700 (MST)
From: "Jim Secan" <jim@nwra.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Recovering LVM Volume
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
To: linux-lvm@redhat.com

The issue is trying to mount a drive that was the primary internal HD for
a system with a failed motherboard.  The disk was built using FC3, and has
a a /boot partition and one under LVM control.  When I try to mount this
disk as a USB drive from a CentOS system, I can't mount the LVM-controlled
partition because it has the same LVM volume/group name as the disk in the
CentOS system.

I have seen several discussions of this, and I want to make sure that what
I think needs to be done is indeed as complicated as it sounds.  There
appear to be two options: (1) rename the LVM volume on the CentOS primary
drive (I'll call this the internal HD) or (2) rename the LVM volume on the
now-USB drive.  In a perfect world, one would be able to just rename the
now-USB drive's LVM volume/group/whatever names so that it differs from
those on the current system and move forward from there.  It sounds like
this simple approach is impossible, and that one of the following must be
done.

1.  Rename the volume on the internal HD.  This can be done using
vgrename, but then you have to make sure you catch all references to the
original name in various system files such as fstab and grub.conf.  I've
also seen references to having to "expand, modify, and repackage" initrd. 
I have no idea how to do this, and it sounds like a "go there carefully"
sort of thing.  I also worry if there's other files I don't know about
that must be changed or I've just "bricked" my CentOS system.  Not going
here.

2.  Rename the volume on the USB HD.  This requires me to power down the
CentOS system, open the box, disconnect the internal HD, boot to the
installation CD in rescue mode, use lvm commands to rename the USB HD, and
then put everything back together again.  This sounds overly complicated,
but necessary.

So, have I understood all this correctly?  Are these the only two ways in
which this problem can be surmounted, and if so which is the safest.  I'm
thinking that I want to rename the internal HD to something other than the
default setting anyway, but I really don't like the idea that I might miss
changing the name in some important file or script that will bite me
later.
