Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u39AMqDn026751
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 9 Apr 2016 06:22:52 -0400
Received: from nicku.org (nicku.org [64.22.125.63])
	by mx1.redhat.com (Postfix) with ESMTP id BFCA585360
	for <linux-lvm@redhat.com>; Sat,  9 Apr 2016 10:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by nicku.org (Postfix) with ESMTP id 2AAD874DE
	for <linux-lvm@redhat.com>; Sat,  9 Apr 2016 10:13:21 +0000 (UTC)
Date: Sat, 9 Apr 2016 20:12:46 +1000
From: Nick Urbanik <nicku@nicku.org>
Message-ID: <20160409101245.GB31040@nicku.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Shrinking LVM partition at beginning
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Dear Folks,

I want to shrink an LVM partition and expand a preceding, non-LVM
partition.  The LVM partition contains three logical volumes.  I
shrank the larger, middle home volume at the volume's end successfully
with a command something like this:

sudo lvresize --verbose --resizefs -L -40G /dev/fedora/home

and then used pvmove to move all the pysical extents towards the end
of the disk, using some commands something like this:

sudo pvmove --alloc anywhere /dev/sda6:24387-34626 /dev/sda6:34627-44866

until all the extents are towards the end of the disk, and there are
10240 unused at the beginning of the volume.

So: can anyone suggest how I can shrink the volume group by that 10240
physical extents, so that I can shrink the partition, and expand the
previous partition?

Here are some details:
Fedora 23, i686, MBR partitioning.

[liveuser@samsung ~]$ sudo lvdisplay -m
  --- Logical volume ---
  LV Path                /dev/fedora/root
  LV Name                root
  VG Name                fedora
  LV UUID                C3JJJ0-L7dR-6kLJ-xj4U-zUn2-i9tY-bexbV1
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2013-10-20 18:39:46 -0400
  LV Status              available
  # open                 0
  LV Size                50.00 GiB
  Current LE             12800
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:3
   
  --- Segments ---
  Logical extents 0 to 12799:
    Type		linear
    Physical volume	/dev/sda6
    Physical extents	10240 to 23039
   
   
  --- Logical volume ---
  LV Path                /dev/fedora/home
  LV Name                home
  VG Name                fedora
  LV UUID                lHnoBw-pzJn-jCkZ-JaZ3-evAb-RisG-N22ErF
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2013-10-20 18:39:51 -0400
  LV Status              available
  # open                 0
  LV Size                85.26 GiB
  Current LE             21827
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:4
   
  --- Segments ---
  Logical extents 0 to 21826:
    Type		linear
    Physical volume	/dev/sda6
    Physical extents	23040 to 44866
   
   
  --- Logical volume ---
  LV Path                /dev/fedora/swap
  LV Name                swap
  VG Name                fedora
  LV UUID                HL6UPR-Z5AK-Oa6a-X9kZ-1wn0-j3Mn-w3avH9
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2013-10-20 18:39:56 -0400
  LV Status              available
  # open                 2
  LV Size                2.03 GiB
  Current LE             520
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:5
   
  --- Segments ---
  Logical extents 0 to 519:
    Type		linear
    Physical volume	/dev/sda6
    Physical extents	44867 to 45386
   
   
[liveuser@samsung ~]$ sudo vgdisplay 
  --- Volume group ---
  VG Name               fedora
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  28
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               177.29 GiB
  PE Size               4.00 MiB
  Total PE              45387
  Alloc PE / Size       35147 / 137.29 GiB
  Free  PE / Size       10240 / 40.00 GiB
  VG UUID               gAbhli-WPRu-ZOkx-nAbl-lPCD-An7E-uEmhO6
   
Any suggestions gratefully received.
-- 
Nick Urbanik             http://nicku.org           nicku@nicku.org
GPG: 7FFA CDC7 5A77 0558 DC7A 790A 16DF EC5B BB9D 2C24 ID: BB9D2C24
