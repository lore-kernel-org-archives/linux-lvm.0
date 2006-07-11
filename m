Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6BDfSL0003537
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 09:41:28 -0400
Received: from bronze.cs.yorku.ca (bronze.cs.yorku.ca [130.63.90.34])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6BDfQkO026228
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 09:41:26 -0400
Received: from [130.63.86.107] (ident=jas)
	by bronze.cs.yorku.ca with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.62)
	(envelope-from <jas@cse.yorku.ca>) id 1G0IUG-0007lj-9s
	for linux-lvm@redhat.com; Tue, 11 Jul 2006 09:41:16 -0400
Message-ID: <44B3AA7C.9000809@cse.yorku.ca>
Date: Tue, 11 Jul 2006 09:41:16 -0400
From: Jason Keltz <jas@cse.yorku.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] question about pvresize not seeing newly added disk
	space
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

I am doing some work with lvm2 on our system with a 3ware 9550SX-12 card ...

   LVM version:     2.02.01 (2005-11-23)
   Library version: 1.02.02 (2006-01-04)
   Driver version:  4.5.0

In particular, I wanted to experiment with the ability to add disks to
an existing RAID-5 lvm volume on the 3ware side, and then using
"pvresize" to make the additional space available on the system.

After adding a 200 GB disk to the RAID-5 unit on the 3ware side (14
hours!!!), I ran "pvresize" on the system, but it doesn't see the new
disk space.  I'm pretty sure that if I reboot, it will see it, but this
somewhat defeats the purpose because I'm trying to figure out how to add
space to a live system without downtime.  Any suggestions on what to do
to make pvresize see the new space?
In addition, it is interesting to note that using the -v option of
pvresize, it seems like LVM doesn't know about the additional disk space:

lead 34 # pvresize -v /dev/sdb
     Using physical volume(s) on command line
     Archiving volume group "scratch" metadata (seqno 8).
     No change to size of physical volume /dev/sdb.
     Resizing volume "/dev/sdb" to 781205120 sectors.
     Updating physical volume "/dev/sdb"
     Creating volume group backup "/etc/lvm/backup/scratch" (seqno 9).
   Physical volume "/dev/sdb" changed
   1 physical volume(s) resized / 0 physical volume(s) not resized

(In fact, the information "No change to size of physical volume"
followed by "Physical volume "/dev/sdb" changed seems to me to be strange.)

Yet, running the "pvs" command, the lvm does indeed see the new storage:
   PV         VG      Fmt  Attr PSize   PFree
   /dev/sdb   scratch lvm2 a-   372.50G 172.50G

(my apologies if this is a repeat message -- I think I sent it the first 
time before the subscribe request was processed...)

Jason.
