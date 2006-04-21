Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3LN6mQu002573
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 19:06:48 -0400
Received: from ranger.systems.pipex.net (ranger.systems.pipex.net
	[62.241.162.32])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3LN6klr031275
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 19:06:47 -0400
Received: from 192.168.0.7 (userb089.dsl.pipex.com [62.188.49.89])
	by ranger.systems.pipex.net (Postfix) with ESMTP id 0FE1DE000430
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 00:06:40 +0100 (BST)
Message-ID: <2996.192.168.0.15.1145660815.squirrel@192.168.0.15>
Date: Sat, 22 Apr 2006 00:06:55 +0100 (BST)
From: "Jannetta S Steyn" <jannetta@henning.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] restoring my lvm
Reply-To: jannetta@henning.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hi All

I would really appreciate some help with this problem. I found some
previous messages that seem to address problems similar to mine, but
because I would really like to not loose my data I would like some
specific guidance. Here is what happened. Everyting I am doing is on
Fedora Core 4.

I had a system with the following:
VolGroup00/LogVol00 (/dev/hda1 - swap)
VolGroup00/LogVol01 (/dev/hda2 - /)

Something happened and I was getting a bus error. I decided to just mount
this drive on another system and get my data off, not quite realising that
the system had an lvm because I just did a vanilla install in the
beginning. Once the drive was on the new system, I realised that it was an
lvm and I started reading the howto again from the beginning. What I
should have done was to read the howto first and then start doing, but
unfortunately I started doing and reading at the same time ...

My problem was that the new system (also FC4 and also a vanilla install)
already had VolGroup00. I then did a 'vgcreate VolGroup01 /dev/hdb2'. I
still couldn't figure out how to mount this drive, because now it didn't
have any logical volumes. This is where I stopped doing things because, if
possible I would like to get my data back.

I have now installed the drive in a system with VolGroup02. I get the
following information:

# vgscan
Reading all physical volumes. This may take a while...
Found volume group "VolGroup01" using metadata type lvm2
Found volume group "VolGroup02" using metadata type lvm2

# lvscan
ACTIVE '/dev/VolGroup02/LogVol00' [3.56 GB] inherit
ACTIVE '/dev/VolGroup02/LogVol01' [320.00 MB] inherit


# pvscan
PV /dev/hdb2 VG VolGroup01 lvm2 [2.93 GB / 2.93 GB free]
PV /dev/hda2 VG VolGroup02 lvm2 [3.91 GB / 32.00 MB free]
Total: 2 [6.83 GB] / in use: 2 [6.83 GB] / in no VG: 0 [0 ]


Can someone please give me some guidance on howto, if neccessary, recreate
the logical volumes for VolGroup01 and then mount it?

Many thanks to all reading and any help offered.
Regards
Jannetta


Random Thought:
---------------
Science may someday discover what faith has always known.
