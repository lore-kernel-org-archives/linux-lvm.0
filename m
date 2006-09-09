Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k89Kn8Ol014564
	for <linux-lvm@redhat.com>; Sat, 9 Sep 2006 16:49:08 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.224])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k89Kn2P9028027
	for <linux-lvm@redhat.com>; Sat, 9 Sep 2006 16:49:02 -0400
Received: by wx-out-0506.google.com with SMTP id i30so2532360wxd
	for <linux-lvm@redhat.com>; Sat, 09 Sep 2006 13:49:02 -0700 (PDT)
Message-ID: <b91808310609091349tf363c5dy57ced3b611523c18@mail.gmail.com>
Date: Sat, 9 Sep 2006 22:49:02 +0200
From: "=?ISO-8859-2?Q?Martin_Dvo=F8=E1k?=" <155144@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Cannot get rid of root filesystem LVM snapshot
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

Hi all,

I am writing here with hope somebody had already run and successfully
resolved this issue. I am on CentOS 4.4 with kernel
kernel-smp-2.6.9-200.0.2.EL.iworx.x86_64.rpm. I've been in the process
of creating a backup script which uses LVM snapshoting feature to
backup a snapshot of root filesystem instead of live filesystem.

During testing phase on testing CentOS installation, I've been able to
successfully create, mount, unmount and remove root filesystem
snapshots. On live production system, I've also successfully created,
mounted and unmounted root filesystem snapshot, but I CANNOT REMOVE IT
in any way.

lvremove -f gives following output:
[CODE]File descriptor 3 left open
File descriptor 5 left open
File descriptor 7 left open
  /dev/cdrom: open failed: Read-only file system
  Can't remove open logical volume "SSsystem"[/CODE]

tried also to deactivate the snapshot using lvchange -an command:
[CODE]File descriptor 3 left open
File descriptor 5 left open
File descriptor 7 left open
  /dev/cdrom: open failed: Read-only file system
  Can't change snapshot logical volume "SSsystem"[/CODE]

lvdisplay outputs this:
[CODE]File descriptor 3 left open
File descriptor 5 left open
File descriptor 7 left open
  --- Logical volume ---
  LV Name                /dev/VGdb/LVdb
  VG Name                VGdb
  LV UUID                R4mtQ4-Idyo-SRiU-EfLg-TFM6-NZN2-Cd1kgv
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                14.66 GB
  Current LE             469
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1

  --- Logical volume ---
  LV Name                /dev/VGsystem/LVsystem
  VG Name                VGsystem
  LV UUID                HusBAX-tbxn-6283-zap5-Cihe-K1AX-jKDbk7
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/VGsystem/SSsystem [active]
  LV Status              available
  # open                 1
  LV Size                31.25 GB
  Current LE             1000
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/VGsystem/SSsystem
  VG Name                VGsystem
  LV UUID                qohvbp-yo1c-SFGv-suM1-9QC9-OwA3-TpX1i0
  LV Write Access        read/write
  LV snapshot status     active destination for /dev/VGsystem/LVsystem
  LV Status              available
  # open                 1
  LV Size                31.25 GB
  Current LE             1000
  COW-table size         2.66 GB
  COW-table LE           85
  Allocated to snapshot  2.32%
  Snapshot chunk size    8.00 KB
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:4[/CODE]

At this very time I am in a situation when the snapshot space is
slowly filling and I am afraid to reboot, manually fill the snapshot
(with hope it will automatically deactivate) or try anything else,
because this is live production system placed in data center and
currently I have no physical access to it - only remote through SSH2.

I'll be grateful for any ideas which might help to resolve this issue
without loosing any data. Thanks very much.

Martin


Here is output of uname -a:
[CODE]Linux xxxx.xxx.xxx 2.6.9-200.0.2.EL.iworxsmp #1 SMP Fri Aug 4
15:25:06 EDT 2006 x86_64 x86_64 x86_64 GNU/Linux[/CODE]
