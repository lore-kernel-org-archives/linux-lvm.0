Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j36JFAO18993
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2005 15:15:10 -0400
Received: from tisch.mail.mindspring.net (tisch.mail.mindspring.net
	[207.69.200.157])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j36JF4jS010903
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2005 15:15:04 -0400
Received: from [192.168.167.41] (helo=wamui03.slb.atl.earthlink.net)
	by tisch.mail.mindspring.net with esmtp (Exim 3.36 #1)
	id 1DJFzU-0008QN-00
	for linux-lvm@redhat.com; Wed, 06 Apr 2005 15:15:04 -0400
Message-ID: <11707185.1112814904249.JavaMail.root@wamui03.slb.atl.earthlink.net>
Date: Wed, 6 Apr 2005 15:15:03 -0400 (GMT-04:00)
From: "linuxboy123@mindspring.com" <linuxboy123@mindspring.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Debian (Sarge) 2.6.8 lvm2 on software raid
Reply-To: "linuxboy123@mindspring.com" <linuxboy123@mindspring.com>,
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

to all,

I am sorry if I am repeating an earlier thread but if it exists I haven't found it yet.

I am running Debian (sarge) on a self-compiled 2.6.8.
I have installed
	 lvm2 (lvm2_2.01.04-3_i386.deb) and 
	mdadm (mdadm_1.9.0-1_i386.deb).

I have created a raid5 disc and am attempting to do a pvcreate upon it.

Here are my attempts.

# vgscan
  Reading all physical volumes.  This may take a while...
# pvcreate /dev/md2
  Physical volume "/dev/md2" successfully created
# vgcreate -v /dev/vg00 /dev/md2
    Adding physical volume '/dev/md2' to volume group 'vg00'
    Archiving volume group "vg00" metadata.
    Creating volume group backup "/etc/lvm/backup/vg00"
  Volume group "vg00" successfully created
# lvcreate -L 500 /dev/vg00
  Volume group "vg00" doesn't exist

After that failed a couple of times I found on the web to add this line in lvm.conf

filter = [ "a|^/dev/md|", "r|.*|" ]


Is this bug? 
Any time you spend on this is appreciated.

Brian 
