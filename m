Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0AJbM116703
	for <linux-lvm@redhat.com>; Tue, 10 Jan 2006 14:37:22 -0500
Received: from smtp.meme.com (janus.meme.com [69.17.73.118])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0AJbGJ1029174
	for <linux-lvm@redhat.com>; Tue, 10 Jan 2006 14:37:16 -0500
Received: from mofo.meme.com (unknown [192.168.1.2])
	by smtp.meme.com (Postfix) with ESMTP id 552751FFE2
	for <linux-lvm@redhat.com>; Tue, 10 Jan 2006 13:37:08 -0600 (CST)
Received: from mofo (localhost.localdomain [127.0.0.1])
	by mofo.meme.com (Postfix) with ESMTP id DC7256E41C
	for <linux-lvm@redhat.com>; Tue, 10 Jan 2006 13:37:07 -0600 (CST)
Date: Tue, 10 Jan 2006 19:37:07 +0000
From: "Karl O. Pinc" <kop@meme.com>
Message-Id: <1136921827l.2349l.15l@mofo>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] "Can't deactivate volume group" on shutdown
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: linux-lvm@redhat.com

Hi,

When I shutdown (or halt) on the console I get the message:

Can't deactivate volume group "vg00" with 1 open
logical volume(s)

Which seems reasonable because my root partition is a
logical volume, but I'm new to LVM2 and figure
it's better to ask now than suffer wierd data
corruption later.

Is this message normal? Do I have a problem?

Here's more detail:

Debian sarge.  Fresh install.  Linux 2.6 kernel.
(2.8.8-2-686)

/dev/hda 300GB WD ATA drive.  Only disk.
/dev/hda1 400MB /boot
/dev/hda2 299.6GB Extended partition
/dev/hda5 299.6GB Linux LVM
/dev/vg00 volume group with all of /dev/hda5
/dev/vg00/swap 400MB swap
/dev/vg00/root 5GB /
remainder of vg unused

All file systems ext3.

Drive: WDC WD3000JB-00KFA0
(Gnasty WD drive has all jumpers removed
to be lone master.)

System:
400MHz Celeron
IDE interface: Intel Corp. 82371AB/EB/MB PIIX4 IDE (rev 01)

Thanks.

Karl <kop@meme.com>
Free Software:  "You don't pay back, you pay forward."
                  -- Robert A. Heinlein
