content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0142B555@mercury.infiniconsys.com>
From: "Barry, Christopher" <cbarry@infiniconsys.com>
Subject: [linux-lvm] LVM snap size weirdness...
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Mar 20 14:01:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Lvm (E-mail)" <linux-lvm@sistina.com>

All,
	See output of lvdisplay below...

lvm> lvdisplay
  --- Logical volume ---
  LV Name                /dev/vg0/data
  VG Name                vg0
  LV UUID                fox8qK-dePL-xTi1-zfBO-xQzu-R5Ls-yZ5bgQ
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                200.00 GB
  Current LE             51200
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:0

  --- Logical volume ---
  LV Name                /dev/vg0/home
  VG Name                vg0
  LV UUID                C748g0-PYnB-zdtB-p1Eh-kYIU-1zXN-n1yKsb
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/vg0/homeSnap [active]
  LV Status              available
  # open                 1
  LV Size                200.00 GB
  Current LE             51200
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:1

  --- Logical volume ---
  LV Name                /dev/vg0/installs
  VG Name                vg0
  LV UUID                yKoPPg-BM0J-245e-BgCZ-kj3m-DVSo-5edFbH
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                200.00 GB
  Current LE             51200
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:2

  --- Logical volume ---
  LV Name                /dev/vg0/vortex
  VG Name                vg0
  LV UUID                slyYlF-tU41-rLmt-y7eC-GU41-iWD3-bsnFil
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                800.00 GB
  Current LE             204800
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:3

  --- Logical volume ---
  LV Name                /dev/vg0/homeSnap
  VG Name                vg0
  LV UUID                1eaqQh-DtCf-1FD7-iUwx-UHzR-aH0G-4X2BQv
  LV Write Access        read only
  LV snapshot status     active destination for /dev/vg0/home
  LV Status              available
  # open                 1
  LV Size                200.00 GB
  Current LE             51200
  Segments               1
  Snapshot chunk size    8.00 KB
  Allocated to snapshot  0.00%
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:10

lvm>


After creating the snapshot vg0/homeSnap, mounting it, and viewing it, =
everything looked fine. But a df (below) shows something is amiss. Look =
at the size on the homeSnap vs the size of the DATA lv. For some reason =
they are identical, yet the snap contains the data from the HOME lv.


debian:~# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda2             942M  688M  207M  77% /
/dev/hda1              46M  4.6M   39M  11% /boot
/dev/hda5             9.2G  875M  7.9G  10% /usr
/dev/hda6             1.9G  155M  1.6G   9% /var
/dev/hda7             5.4G   33M  5.1G   1% /sys_data
/dev/vg0/data         200G   32G  169G  16% /mnt/lvm/data
/dev/vg0/home         200G  102G   99G  51% /mnt/lvm/home
/dev/vg0/installs     200G  5.9G  195G   3% /mnt/lvm/installs
/dev/vg0/vortex       800G  3.2M  800G   1% /mnt/lvm/vortex
/dev/vg0/homeSnap     200G   32G  169G  16% /mnt/lvm/home-snap


I have dumped an ls of both the snap lv and the home lv and diffed them =
- no differences.
Why/how can df be confused?




Thanks for your help,
Christopher
