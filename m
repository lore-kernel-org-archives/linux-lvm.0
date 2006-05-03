Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k43I2l7u031763
	for <linux-lvm@redhat.com>; Wed, 3 May 2006 14:02:47 -0400
Received: from nz-out-0102.google.com (nz-out-0102.google.com [64.233.162.206])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k43I2e7E022970
	for <linux-lvm@redhat.com>; Wed, 3 May 2006 14:02:40 -0400
Received: by nz-out-0102.google.com with SMTP id m7so264798nzf
	for <linux-lvm@redhat.com>; Wed, 03 May 2006 11:02:40 -0700 (PDT)
Message-ID: <64b6db970605031102m8dd3db9s8444cbfc868f73d6@mail.gmail.com>
Date: Wed, 3 May 2006 19:02:38 +0100
From: "Nick Gushlow" <nick.gushlow@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM Volumes No Longer Mount
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I'm having problems with all the LVM volumes on my system after a
forced reset (complete system hang forced the reset).  I want to give
as much info as possible so I'll use pastebin to keep the email
shorter, if you want me to add the pastebin entries to an email I can.

I spent some time on the irc channel earlier and despite pjc's efforts
(thanks) a resolution was not found.

----------------------------------------------------------------------------------------------

After the forced reset attempts at mounting any of the LVs give the
following error:

[root@cattlewash ~]# mount /home
mount: special device /dev/vg1/Home does not exist

My initial diagnosis of the problem was that 2 disks (yes I know
unlikely!) had failed and lost labels and partition tables -
http://guswrk.pastebin.com/696211.

I now realise that it's not just the one VG & LV covering those disks
but all LVs - one VG/LV covering two disks, and one VG with several
LVs on a partition on another disk; and that those disks were setup
without partitions.  It should be noted that this was done years ago
following instructions off a site so I've no idea what I did when
setting things up.

An fdisk of the disk with the an LVM partition and several LVs reports
right, but gpart doesn't - http://guswrk.pastebin.com/696208

The odd thing about this all is that pvscan, vgscan & lvscan seem to
report things ok. - http://guswrk.pastebin.com/696212

I tried using vgmknodes but then after running it attempts at mounting LVs gave:

mount: /dev/vg2/ftp: can't read superblock

The original mounting error message returns after a reboot of the system.

And lvm dumpconfig gives - http://guswrk.pastebin.com/696195

I'm really at a loss as to what to do to recover the LVs. If I can at
least recover the LVs in  vg1 I'd be happy. I thought about doing an
export then importing again, but I guess if it's the metadata that's
hosed then this won't help.

Anyone got any ideas that could help me?

--
Nick
