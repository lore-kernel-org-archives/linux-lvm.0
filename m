Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6CIub9D021758
	for <linux-lvm@redhat.com>; Sun, 12 Jul 2009 14:56:37 -0400
Received: from mail-bw0-f219.google.com (mail-bw0-f219.google.com
	[209.85.218.219])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6CIuNEq018615
	for <linux-lvm@redhat.com>; Sun, 12 Jul 2009 14:56:23 -0400
Received: by bwz19 with SMTP id 19so87709bwz.3
	for <linux-lvm@redhat.com>; Sun, 12 Jul 2009 11:56:23 -0700 (PDT)
MIME-Version: 1.0
From: Diego Jacobi <jacobidiego@gmail.com>
Date: Sun, 12 Jul 2009 20:56:03 +0200
Message-ID: <5de034af0907121156s491df9cei264569333ea6a787@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Parallel mirroring
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

Hello.

I have succesfully configured Mirroring between 2 disks in linux for 2
logical volumes, and on other without mirroring.
But i can not find any evidence showing that it is reading in parallel
scheduler mode.
I have read HP docs about HP-UX, but it talks about command line
options which arent in the linux side.

The "-d p" in HP-UX would be what i need now for linux. Also lvdisplay
doesnt show anything about it, more than the number of mirrors.


This are my tests:

sda1 = /boot in disk 1, no lvm
sdb1 = /boot in disk 2, no lvm
data/data = lvm without mirroring
data/root = lvm with mirroring


linux-8mmd:~ # hdparm -t /dev/sda1
/dev/sda1:
 Timing buffered disk reads:  262 MB in  3.02 seconds =  86.83 MB/sec

linux-8mmd:~ # hdparm -t /dev/sdb1
/dev/sdb1:
 Timing buffered disk reads:  174 MB in  3.03 seconds =  57.36 MB/sec

linux-8mmd:~ # hdparm -t /dev/data/data
/dev/data/data:
 Timing buffered disk reads:  272 MB in  3.02 seconds =  90.02 MB/sec

linux-8mmd:~ # hdparm -t /dev/data/root
/dev/data/root:
 Timing buffered disk reads:  278 MB in  3.02 seconds =  92.16 MB/sec



As you can see, the read speed are mostly the same. This could mean a
secuenced scheduler.

And this is my system setup:

lvm> version
  LVM version:     2.02.39 (2008-06-27)
  Library version: 1.02.27 (2008-06-25)
  Driver version:  4.14.0

linux-8mmd:~ # pvs
  PV         VG   Fmt  Attr PSize   PFree
  /dev/sda3  data lvm2 a-   537.11G 395.12G
  /dev/sda5  data lvm2 a-   996.00M 988.00M         <--- Note 1 Gb, for log
  /dev/sdb3  data lvm2 a-   138.99G 118.99G

linux-8mmd:~ # lvs -a -o +devices
  LV              VG   Attr   LSize   Origin Snap%  Move Log
Copy%  Convert Devices
  data            data -wi-ao 121.50G
           /dev/sda3(125)
  home            data mwi-ao  10.00G                    home_mlog
100.00         home_mimage_0(0),home_mimage_1(0)
  [home_mimage_0] data iwi-ao  10.00G
           /dev/sda3(33788)
  [home_mimage_1] data iwi-ao  10.00G
           /dev/sdb3(2560)
  [home_mlog]     data lwi-ao   4.00M
           /dev/sda5(1)
  root            data mwi-ao  10.00G                    root_mlog
100.00         root_mimage_0(0),root_mimage_1(0)
  [root_mimage_0] data iwi-ao  10.00G
           /dev/sda3(31228)
  [root_mimage_1] data iwi-ao  10.00G
           /dev/sdb3(0)
  [root_mlog]     data lwi-ao   4.00M
           /dev/sda5(0)
  test            data -wi-a- 500.00M
           /dev/sda3(0)
