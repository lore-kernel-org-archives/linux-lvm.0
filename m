Received: from mx2.redhat.com (ext-mx01.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.1])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5PDKYD7027437
	for <linux-lvm@redhat.com>; Tue, 25 Jun 2013 09:20:35 -0400
Received: from minerva.ithagi.be (minerva.ithagi.be [194.50.177.62])
	by mx2.redhat.com (8.14.4/8.14.4) with ESMTP id r5PDKVFV016449
	for <linux-lvm@redhat.com>; Tue, 25 Jun 2013 09:20:32 -0400
Received: from edynami by minerva.ithagi.be with local (Exim 4.80)
	(envelope-from <liedekef@telenet.be>) id 1UrTAW-0007pv-0O
	for linux-lvm@redhat.com; Tue, 25 Jun 2013 15:20:24 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 25 Jun 2013 15:20:23 +0200
From: Franky Van Liedekerke <liedekef@telenet.be>
Message-ID: <25f646caf787289b2d4fb94f7f2c06da@imap.telenet.be>
Subject: [linux-lvm] lvcreate/convert a clustered striped mirror
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Since RHEL 6.4, the "-type raid*" options of lvcreate have been 
disabled for a clvm setup. Which is ok for me, since I don't like the 
chance of haveing data corruption.
However: when needing to do a mirror between 2 SAN storages, something 
is still needed. So I use the good old "-m 1" and cmirrord. And here 
lies the problem: suppose I have 2 disks from SAN 1, and 2 disks from 
SAN 2 so that I need to stripe over the SAN 1 disks and then mirror to 
SAN 2 disks.
This command (combining stripe and mirror) is working as expected:

lvcreate -m1 -i 2 -I 4 --nosync --alloc anywhere -n lvtest vgtest -L 
90G /dev/mapper/CLVM-SAN1-1315 /dev/mapper/CLVM-SAN1-1316  
/dev/mapper/CLVM-SAN2-1415 /dev/mapper/CLVM-SAN2-14

The command "lvs -a -o +devices" shows the setup is as expected:
   lvtest            vgtest     Mwa-a-m--  90.00g                        
lvtest_mlog   100.00         lvtest_mimage_0(0),lvtest_mimage_1(0)
   [lvtest_mimage_0] vgtest     iwa-aom--  90.00g                        
                              
/dev/mapper/CLVM-SAN1-1315(0),/dev/mapper/CLVM-SAN1-1316(0)
   [lvtest_mimage_1] vgtest     iwa-aom--  90.00g                        
                              
/dev/mapper/CLVM-SAN2-1415(0),/dev/mapper/CLVM-SAN2-1416(0)
   [lvtest_mlog]     vgtest     lwa-aom--   4.00m                        
                              /dev/mapper/CLVM-SAN2-1416(11520)


The command "pvs -a -o +devices" shows everything is ok (the mirror leg 
is also striped, since there's some space free on both the mirrored 
devices):
   PV                              VG         Fmt  Attr PSize   PFree  
Devices

   /dev/mapper/CLVM-SAN1-1315       vgtest     lvm2 a--   50.00g  5.00g 
/dev/mapper/CLVM-SAN1-1315(0),/dev/mapper/CLVM-SAN1-1316(0)
   /dev/mapper/CLVM-SAN1-1315       vgtest     lvm2 a--   50.00g  5.00g
   /dev/mapper/CLVM-SAN1-1316       vgtest     lvm2 a--   50.00g  5.00g 
/dev/mapper/CLVM-SAN1-1315(0),/dev/mapper/CLVM-SAN1-1316(0)
   /dev/mapper/CLVM-SAN1-1316       vgtest     lvm2 a--   50.00g  5.00g
   /dev/mapper/CLVM-SAN2-1415       vgtest     lvm2 a--   50.00g  5.00g 
/dev/mapper/CLVM-SAN2-1415(0),/dev/mapper/CLVM-SAN2-1416(0)
   /dev/mapper/CLVM-SAN2-1415       vgtest     lvm2 a--   50.00g  5.00g
   /dev/mapper/CLVM-SAN2-1416       vgtest     lvm2 a--   50.00g  4.99g 
/dev/mapper/CLVM-SAN2-1415(0),/dev/mapper/CLVM-SAN2-1416(0)
   /dev/mapper/CLVM-SAN2-1416       vgtest     lvm2 a--   50.00g  4.99g 
/dev/mapper/CLVM-SAN2-1416(11520)
   /dev/mapper/CLVM-SAN2-1416       vgtest     lvm2 a--   50.00g  4.99g

Now, however, if I decide to first create the stripe on SAN1:
   lvcreate -i 2 -I 4 -n lvtest vgtest -L 90G /dev/mapper/CLVM-SAN1-1315 
/dev/mapper/CLVM-SAN1-1316
and then the mirror (mirrorlog core used for testing):
   lvconvert -m1 --mirrorlog core vgtest/lvtest

The mirrored leg is now not striped:
   /dev/mapper/CLVM-SAN1-1315       vgtest     lvm2 a--   50.00g  5.00g 
/dev/mapper/CLVM-SAN1-1315(0),/dev/mapper/CLVM-SAN1-1316(0)
   /dev/mapper/CLVM-SAN1-1315       vgtest     lvm2 a--   50.00g  5.00g
   /dev/mapper/CLVM-SAN1-1316       vgtest     lvm2 a--   50.00g  5.00g 
/dev/mapper/CLVM-SAN1-1315(0),/dev/mapper/CLVM-SAN1-1316(0)
   /dev/mapper/CLVM-SAN1-1316       vgtest     lvm2 a--   50.00g  5.00g
   /dev/mapper/CLVM-SAN2-1415       vgtest     lvm2 a--   50.00g     0  
/dev/mapper/CLVM-SAN2-1415(0)
   /dev/mapper/CLVM-SAN2-1416       vgtest     lvm2 a--   50.00g  9.99g 
/dev/mapper/CLVM-SAN2-1416(0)
   /dev/mapper/CLVM-SAN2-1416       vgtest     lvm2 a--   50.00g  9.99g

In itself this is not a problem, but when the mirror breaks and you 
need to recreate it, the same command needs to be executed. Suppose in 
the beginning we execute the lvcreate with stripe/mirror combo and we 
need to rebuild the mirror after a failure, suddenly one part will no 
longer be striped.

So here are my questions:
- Is there an option to lvconvert to also force the same striping on 
the mirror leg?
- And a second question: "-mirrorlog mirrored" doesn't seem to be 
possible in a clvm setup, is this intended?
- And in general: is there another method to get a mirrored stripe in a 
clustered setup?

With friendly regards,

Franky
