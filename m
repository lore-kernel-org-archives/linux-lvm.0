Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l99GgCQc027688
	for <linux-lvm@redhat.com>; Tue, 9 Oct 2007 12:42:12 -0400
Received: from NNMC-FE-02.med.navy.mil ([199.208.122.248])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l99GfaJ5029805
	for <linux-lvm@redhat.com>; Tue, 9 Oct 2007 12:41:36 -0400
Date: Tue, 09 Oct 2007 12:37:02 -0400
From: Andrew Stewart <stewarta@nmrc.navy.mil>
Message-ID: <C331266E.158D%stewarta@nmrc.navy.mil>
In-Reply-To: <20071008133449.BA78273366@hormel.redhat.com>
Mime-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] Rescuing files from a LVM partition
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

(I apologize if this is a repost.. I was a bit impatient and fired this
email off to the group before my account was actually activated, so I have
no idea whether it went through or not)

I have two servers running FC3.  The first machine (called Orca) has died
due to what is likely a problem on the logic board or power supply.
Unfortunately there are some critical files that I need to rescue from the
lone drive on Orca.  I retrieved the hd and threw it into an external
casing, and hooked it up to my Mac.. Only to find that the drive is
formatted with an "Linux LVM partition".  I started doing a little homework
and now have a basic understanding of what this exactly means.

So, after running through a couple different ideas, I decided the easiest
solution probably lies with connecting Orca's hd up to the second server
(called Beluga).  This time I could use the various lvm commands to see
which logical volumes, volume groups, and physical  volumes existed on the
machine.  Because both machines contained a single harddrive, each with FC3
installed (and thus a large root partition and a smaller swap partition), I
would expect to see something along the lines of two logical groups, each
containing two logical volumes and one physical volume.  Oddly enough, only
a single volume group appeared (VolGroup00).  The reason for this turns out
to be because on their 'home' machines, the two hard drives have a single
volume group.. The problem being that both are named VolGroup00 and so when
both drives are mounted, only VolGroup00 from Beluga is present.

I found some old threads where people had similar problems, and discovered
that one solution is to somehow deactivate the 'home' volume and rename its
volume group (to something like VolGroup01) before connecting the second
drive.. Which should then appear as VolGroup00 and thus allow you to mount
its logical volume via mount /dev/VolGroup00/LogVol01 (which would roughly
correspond to /dev/sbd2.. The root partition on the second drive).  I went
about attempting this with little success.  It then occurred to me I could
just go into the boot sequence and boot off the second drive (it didn't
really occur to me that this slightly older machine supported booting off a
usb device).  Doh!

Unfortunately I mucked up the volume groups and logical volumes on the
second drive, but I don't think the damage is irreparable (after all, it's
just the LVM info that is muddled, not the actual physical data).  So, I'm
hoping that if I post the output of vgscan, lvscan, and pvscan, maybe
someone out there savvy with LVM commands can help me put things in the
right order.

I don't much care whether I go with renaming one of the volume groups to
allow both to coexist (let's call it plan B), or whether I just put the
external drive from Orca back into order so that I might boot off of it as
the sole drive (plan A)... Though I feel that plan A is the safer option in
order to leave Beluga's home drive alone.

[root@beluga ~]# pvscan
  PV /dev/sdb2   VG VolGroup01   lvm2 [74.40 GB / 74.40 GB free]
  PV /dev/sda2   VG VolGroup00   lvm2 [279.34 GB / 160.00 MB free]
  Total: 2 [353.74 GB] / in use: 2 [353.74 GB] / in no VG: 0 [0   ]

[root@beluga ~]# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "VolGroup01" using metadata type lvm2
  Found volume group "VolGroup00" using metadata type lvm2

[root@beluga ~]# lvscan
  ACTIVE            '/dev/VolGroup00/LogVol00' [277.25 GB] inherit
  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit

As you can see, a VolGroup01 does exist... With a physical volume /dev/sdb2
associated with it ...as a result of my experimenting.  I'm just not sure
how to get the corresponding logical volumes for that volume group.  Lvscan
would then look something like...

[root@beluga ~]# lvscan
  ACTIVE            '/dev/VolGroup00/LogVol00' [277.25 GB] inherit
  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit
  ACTIVE            '/dev/VolGroup01/LogVol00' [74.40 GB] inherit
  ACTIVE            '/dev/VolGroup01/LogVol01' [probably 1.94 GB] inherit
  
I think I ran either a vgreduce at some point, so I might have to do an
lvcreate or something like that?  Unfortunately I don't understand LVM as
much as I'd like to, and am slightly confused with how it works.  Can anyone
out there lend me a hand?

(update to that last paragraph before sending this off...)
I've noticed that lvm archives a volume group configuration when a change is
made to it (under /etc/lvm/archive.. In plain text too!)  By looking at
these I can tell exactly what commands I ran in order to muck things up...

Fri Sep 21 17:56:48 2007:    'vgextend VolGroup00 /dev/sdb2'
Fri Sep 21 18:25:40 2007:    'vgreduce VolGroup00 /dev/sdb2'
Fri Sep 21 18:25:45 2007:    'vgcreate VolGroup01 /dev/sdb2'
Mon Sep 24 18:37:52 2007:    'vgremove VolGroup01'
Tue Sep 25 13:51:10 2007:    'vgcreate VolGroup01 /dev/sdb2'

I can also tell what pv's and lv's belonged to the corresponding VolGroup in
each archive.


Thanks in advance,
Andrew

ps: if you reply to this and you don't mind, please reply directly to me as
well as to the list, as I -just- joined the group and haven't received a
confirmation of my confirmation mail (and I have to scoot from the office).
Thanks!
