From: "^YosH^" <yosh@liquidzone.net>
Message-ID: <000001c35ed3$c78a35e0$0296a8c0@malin>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to force a remove/shrink  LV with a bad PV in the middle of the VG and not using fsck?
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
Date: Sat Aug  9 19:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have posted to this list before with some problems, I have worked most
of them out since I now can access the LV... now for my next problem...

How can I shrink/remove a PV that's in the middle of a VG without
reading that drive... since all access to the disk causes the server to
hang and need a reboot before I can use it again...

As I understand the fs is shrunk from the end and towards the beginning
of the fs but I need to remove a piece in the middle...


--- Logical volume ---
  LV Name                /dev/lvm_01/lvm_01
  VG Name                lvm_01
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                957.75 GB
  Current LE             15324
  Segments               6
  Allocation             next free
  Read ahead sectors     1024
  Block device           254:0

  --- Segments ---
  Logical extent 0 to 2440:
    Type                linear
    Physical volume     /dev/hdh
    Physical extents    0 to 2440

  Logical extent 2441 to 6179:
    Type                linear
    Physical volume     /dev/sda
    Physical extents    0 to 3738

  Logical extent 6180 to 7668:
    Type                linear
    Physical volume     /dev/hde
    Physical extents    0 to 1488

  Logical extent 7669 to 9157:
    Type                linear
    Physical volume     /dev/hdf
    Physical extents    0 to 1488

  Logical extent 9158 to 12882:
    Type                linear
    Physical volume     /dev/hdg
    Physical extents    0 to 3724

  Logical extent 12883 to 15323:
    Type                linear
    Physical volume     /dev/hdd
    Physical extents    0 to 2440


I need to remove /dev/hdg from the system... but I need to keep the rest
of the disks intact... ie I want to shrink the lv between Logical extent
9158 to 12882. and I need it to be forced and without fsck since fsck
will scan that drive and cause the server to hang... I have tried some
things with e2fsadm without luck...  so I need some help pretty bad...
Thank you!
