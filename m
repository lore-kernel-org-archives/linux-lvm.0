Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9UMbA7B031313
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 17:37:10 -0500
Received: from hsb102.xlccorp.com (hsb102.xlccorp.com [66.37.197.102])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9UMauoW019730
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 17:36:59 -0500
Received: from hsb102.xlccorp.com (localhost.localdomain [127.0.0.1])
	by hsb102.xlccorp.com (8.12.5/8.12.5) with ESMTP id k9UMaqcT010252
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 17:36:52 -0500
Received: (from nobody@localhost)
	by hsb102.xlccorp.com (8.12.5/8.12.5/Submit) id k9UMapv3010250
	for linux-lvm@redhat.com; Mon, 30 Oct 2006 17:36:51 -0500
Message-ID: <1162247811.45467e83cae80@webmail.highstream.net>
Date: Mon, 30 Oct 2006 17:36:51 -0500
From: brianmas@highstream.net
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] "cloning" from ide to sata drive, can't find root 
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

I did a straight up mirroring of a drive doing dd if=/dev/hda of=/dev/sda where
the src is an ide drive and target a sata drive and not unexpectedly it can't
find the root device on boot.

Typing out the error message ...

[snip]
Reading all physical volumes this may take a while ...
No volume groups found
Unable to find Volume Group "VolGroup00"
[snip]

I used a rescue disc distro and used dd to extract info subtible for
vgcfgrestore,
after which I did some other finagaling with vgchange and I can mount the volume
and view the data on it, so it's there, vgscan/pvscan and lvscan all show it ...
but as mentioned boot it's just not picked up on boot so it can be mounted as
'/'. I thought I fixed it with the vgcfgrestore (changing /dev/hda2 to
/dev/sda2) but obviously not ... any guidance is appreciated.

thank you,
brian
