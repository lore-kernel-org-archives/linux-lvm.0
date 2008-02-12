Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1CIecTs006177
	for <linux-lvm@redhat.com>; Tue, 12 Feb 2008 13:40:38 -0500
Received: from perkons.com.br (smtp.perkons.com.br [200.150.64.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m1CIeBO0018309
	for <linux-lvm@redhat.com>; Tue, 12 Feb 2008 13:40:12 -0500
Received: from [10.1.30.2] by perkons.com.br
	(Cipher SSLv3:RC4-MD5:128) (MDaemon.PRO.v8.0.3.R)
	with ESMTP id md50001319910.msg
	for <linux-lvm@redhat.com>; Tue, 12 Feb 2008 16:38:54 -0300
From: Guilherme Destefani <gd@helixbrasil.com.br>
Date: Tue, 12 Feb 2008 16:39:58 -0200
Message-Id: <1202841598.32238.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question: How much space is needed do make sure that a
	LVM snapshot won't overflow
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

Hi.

In the LVM2 HOWTO, it says:
(http://www.tldp.org/HOWTO/LVM-HOWTO/snapshotintro.html),

"Full snapshot are automatically disabled"
and:
"If the snapshot size equals the origin size, it will never overflow.".

But if one snapshot is created and an equal size is allocated to the
snapshot, it still overflows (creates a volume with 32M, a snapshot with
32M, and fills the volume with zeros).
Using more space, it doesn't overflow (same thing, but 64M for the
snapshot).

How much more space is needed to be alocated to the snapshot to ensure
that it will never overflow?

Thanks in advance,

Guilherme.


        Script started on Tue 12 Feb 2008 02:11:11 PM BRST
        [root@localhost ~]# lvcreate -L 32M -n base_volume hf
          Logical volume "base_volume" created
        [root@localhost ~]# lvcreate -s -L 32M -n
        copy_volume /dev/hf/base_volume 
          Logical volume "copy_volume" created
        [root@localhost ~]# lvdisplay |grep -A 13 "_volume"
          LV Name                /dev/hf/base_volume
          VG Name                hf
          LV UUID                qPzWgG-ON3V-swUr-O0IP-I172-G3YV-GH431K
          LV Write Access        read/write
          LV snapshot status     source of
                                 /dev/hf/copy_volume [active]
          LV Status              available
          # open                 0
          LV Size                32.00 MB
        --
          LV Name                /dev/hf/copy_volume
          VG Name                hf
          LV UUID                oGK0gG-o62D-Tu84-9CW0-rvPb-H7HX-bjUwk0
          LV Write Access        read/write
          LV snapshot status     active destination
        for /dev/hf/base_volume
          LV Status              available
          # open                 0
          LV Size                32.00 MB
          Current LE             1
          COW-table size         32.00 MB
          COW-table LE           1
          Allocated to snapshot  0.05% 
          Snapshot chunk size    8.00 KB
          Segments               1
          Allocation             inherit
          Read ahead sectors     0
          Block device           253:20
           
        [root@localhost ~]# dd if=/dev/zero of=/dev/hf/copy_volume 
        dd: writing to `/dev/hf/copy_volume': No space left on device
        65537+0 records in
        65536+0 records out
        33554432 bytes (34 MB) copied, 8.01466 s, 4.2 MB/s
        [root@localhost ~]# lvresize -L 64M /dev/hf/copy_volume 
          /dev/dm-20: read failed after 0 of 4096 at 0: Input/output
        error
          Extending logical volume copy_volume to 64.00 MB
          Logical volume copy_volume successfully resized
        [root@localhost ~]# lvdisplay |grep -A 13 "_volume"
          /dev/dm-20: read failed after 0 of 4096 at 0: Input/output
        error
          LV Name                /dev/hf/base_volume
          VG Name                hf
          LV UUID                qPzWgG-ON3V-swUr-O0IP-I172-G3YV-GH431K
          LV Write Access        read/write
          LV snapshot status     source of
                                 /dev/hf/copy_volume [INACTIVE]
          LV Status              available
          # open                 0
          LV Size                32.00 MB
          Current LE             1
          Segments               1
          Allocation             inherit
          Read ahead sectors     0
          Block device           253:18
        --
          LV Name                /dev/hf/copy_volume
          VG Name                hf
          LV UUID                oGK0gG-o62D-Tu84-9CW0-rvPb-H7HX-bjUwk0
          LV Write Access        read/write
          LV snapshot status     INACTIVE destination
        for /dev/hf/base_volume
          LV Status              available
          # open                 0
          LV Size                32.00 MB
          Current LE             1
          COW-table size         64.00 MB
          COW-table LE           2
          Snapshot chunk size    8.00 KB
          Segments               1
          Allocation             inherit
          Read ahead sectors     0
          Block device           253:20
           
        [root@localhost ~]# lvremove /dev/hf/copy_volume 
          /dev/dm-20: read failed after 0 of 4096 at 0: Input/output
        error
        Do you really want to remove active logical volume
        "copy_volume"? [y/n]: y
          Logical volume "copy_volume" successfully removed
        [root@localhost ~]# lvcreate -s -L 64M -n \
        copy_volume /dev/hf/base_volume 
          Logical volume "copy_volume" created
        [root@localhost ~]# lvdisplay |grep -A 13 "_volume"
          LV Name                /dev/hf/base_volume
          VG Name                hf
          LV UUID                qPzWgG-ON3V-swUr-O0IP-I172-G3YV-GH431K
          LV Write Access        read/write
          LV snapshot status     source of
                                 /dev/hf/copy_volume [active]
          LV Status              available
          # open                 0
          LV Size                32.00 MB
          Current LE             1
          Segments               1
          Allocation             inherit
          Read ahead sectors     0
          Block device           253:18 
        --
          LV Name                /dev/hf/copy_volume
          VG Name                hf
          LV UUID                LSUqQB-O2n4-8zmk-iL9n-2vDQ-qSsB-yOBDL1
          LV Write Access        read/write
          LV snapshot status     active destination
        for /dev/hf/base_volume
          LV Status              available
          # open                 0
          LV Size                32.00 MB
          Current LE             1
          COW-table size         64.00 MB
          COW-table LE           2
          Allocated to snapshot  0.02% 
          Snapshot chunk size    8.00 KB
          Segments               1
          Allocation             inherit
          Read ahead sectors     0
          Block device           253:20
           
        [root@localhost ~]# dd if=/dev/zero of=/dev/hf/copy_volume 
        dd: writing to `/dev/hf/copy_volume': No space left on device
        65537+0 records in
        65536+0 records out
        33554432 bytes (34 MB) copied, 9.5375 s, 3.5 MB/s
        [root@localhost ~]# lvdisplay |grep -A 13 "_volume"
          LV Name                /dev/hf/base_volume
          VG Name                hf
          LV UUID                qPzWgG-ON3V-swUr-O0IP-I172-G3YV-GH431K
          LV Write Access        read/write
          LV snapshot status     source of
                                 /dev/hf/copy_volume [active]
          LV Status              available
          # open                 0
          LV Size                32.00 MB
          Current LE             1
          Segments               1
          Allocation             inherit
          Read ahead sectors     0
          Block device           253:18
           
          --- Logical volume ---
          LV Name                /dev/hf/F4_burn
          VG Name                hf
          LV UUID                Bj1VJS-1JUK-BA18-egFj-xOoY-qrbq-jbZFFY
        --
          LV Name                /dev/hf/copy_volume
          VG Name                hf
          LV UUID                LSUqQB-O2n4-8zmk-iL9n-2vDQ-qSsB-yOBDL1
          LV Write Access        read/write
          LV snapshot status     active destination
        for /dev/hf/base_volume
          LV Status              available
          # open                 0
          LV Size                32.00 MB
          Current LE             1
          COW-table size         64.00 MB
          COW-table LE           2
          Allocated to snapshot  50.12% 
          Snapshot chunk size    8.00 KB
          Segments               1
          Allocation             inherit
          Read ahead sectors     0
          Block device           253:20
           
        [root@localhost ~]# exit
        
        Script done on Tue 12 Feb 2008 02:13:07 PM BRST
        [Gui@localhost:~]$ 
        
        
