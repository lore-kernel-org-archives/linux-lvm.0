Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB81s45Z010551
	for <linux-lvm@redhat.com>; Thu, 7 Dec 2006 20:54:04 -0500
Received: from rpc1.mailstreet2003.net (rpc1.mailstreet2003.net [69.25.50.236])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB81s3Qw029778
	for <linux-lvm@redhat.com>; Thu, 7 Dec 2006 20:54:03 -0500
Date: Thu, 7 Dec 2006 17:53:50 -0800 (PST)
From: Antonio Varni <avarni@estalea.com>
Message-ID: <Pine.LNX.4.64.0612071745430.7186@io.corp.sb.estalea.net>
MIME-Version: 1.0
Subject: [linux-lvm] LVM question relating to a server crash
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hello!

I recently tried to lvremove a snapshot LV that was
a few days old.  I had let it get to the point
where the LV snapshot was unusable because too
many changes had been written to the parent.
When I went to lvremove it, the entire system
locked up and had to be reset.  Everything
came back up fine but I still want to remove
that LV and am unsure as to why it crashed
to begin with.

I could not see anything on console and there's nothing
interesting in my system logs.

Here's my LV setup:


[root@dw ~]# lvscan
  /dev/dm-5: read failed after 0 of 4096 at 0: Input/output error
  ACTIVE            '/dev/VolGroup00/Lroot' [6.00 GB] inherit
  ACTIVE            '/dev/VolGroup00/Lswap' [1.94 GB] inherit
  inactive Original '/dev/VolGroup00/Llpdw' [40.00 GB] inherit
  inactive Snapshot '/dev/VolGroup00/temp' [1.00 GB] inherit


/dev/VolGroup00/Lroot /dev/VolGroup00/Lswap and
/dev/VolGroup00/Llpdw are all mounted, active
file systems.  /dev/VolGroup00/temp is a snapshot
of /dev/VolGroup00/Llpdw.

Like I mentioned before the snapshot is unusable and
I want to remove it:

[root@dw ~]# mount /dev/VolGroup00/temp  /z
/dev/VolGroup00/temp: Input/output error
mount: /dev/VolGroup00/temp: can't read superblock


system info:

[root@dw ~]# cat /etc/redhat-release; uname -a
CentOS release 4.4 (Final)
Linux dw.xxxxxxx 2.6.9-42.0.3.ELsmp #1 SMP Fri Oct 6 06:28:26 CDT 2006 x86_64 x86_64 x86_64 GNU/Linux

Dell PowerEdge 1950 server.

more lvm info:

[root@dw ~]# pvdisplay
  /dev/dm-5: read failed after 0 of 4096 at 0: Input/output error
  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               VolGroup00
  PV Size               136.00 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              4352
  Free PE               2786
  Allocated PE          1566
  PV UUID               5Vshsw-Swd9-bSTH-kixv-frPK-SzSi-jm31hE

[root@dw ~]# vgdisplay
  /dev/dm-5: read failed after 0 of 4096 at 0: Input/output error
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  30
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                4
  Open LV               3
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               136.00 GB
  PE Size               32.00 MB
  Total PE              4352
  Alloc PE / Size       1566 / 48.94 GB
  Free  PE / Size       2786 / 87.06 GB
  VG UUID               MHdx9f-7mNZ-WtEp-ogmZ-Wo2H-47Db-o90d0e


[root@dw ~]# lvdisplay
  /dev/dm-5: read failed after 0 of 4096 at 0: Input/output error
  --- Logical volume ---
  LV Name                /dev/VolGroup00/Lroot
  VG Name                VolGroup00
  LV UUID                ZNXYXZ-fFHI-GPsn-fGZy-0QtI-19TR-iGwtmx
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                6.00 GB
  Current LE             192
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/VolGroup00/Lswap
  VG Name                VolGroup00
  LV UUID                5ZiUYo-aC7P-0YyN-XDAI-kiVc-GUz7-zCB5Q8
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.94 GB
  Current LE             62
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1

  --- Logical volume ---
  LV Name                /dev/VolGroup00/Llpdw
  VG Name                VolGroup00
  LV UUID                HJ9V38-zAYH-Et0F-Qb9o-8dzu-PwbQ-5AgPiF
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/VolGroup00/temp [INACTIVE]
  LV Status              available
  # open                 1
  LV Size                40.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:3

  --- Logical volume ---
  LV Name                /dev/VolGroup00/temp
  VG Name                VolGroup00
  LV UUID                yv8X2f-9Xud-PkJT-Q0l2-h5Qy-48ze-KOAg3t
  LV Write Access        read/write
  LV snapshot status     INACTIVE destination for /dev/VolGroup00/Llpdw
  LV Status              available
  # open                 0
  LV Size                40.00 GB
  Current LE             1280
  COW-table size         1.00 GB
  COW-table LE           32
  Snapshot chunk size    8.00 KB
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:5


The command I typed in that caused the crash
was 'lvremove /dev/VolGroup00/temp'.


Thanks in advance for any replies. I am
going to try this command again tomorrow
night after I do some more research into this.
