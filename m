From: Chris Rouch <crouch@pobox.com>
Message-Id: <20040109100327.1e62b416.crouch@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] recover from a disk crash with lvm/lvm2
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
Date: Fri Jan  9 04:04:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

[I posted this to the fedora list, but had no response, so I'm trying
again here.]

I had 2 disks together in one volume group with 4 logical volumes split
between them. On Sunday night one of the disks failed. I have backups so
this isn't a serious problem, but I'm curious to see if it's possible to
recover any data from the disk that is still working. So far I've had no
luck.

From googling around it seemed that lvm2 might be able to do this for
me. So I installed the 2.6 kernel from rawhide on a test box and updated
lvm2-2.00.08-2.i386.rpm
mkinitrd-3.5.17-1.i386.rpm
device-mapper-1.00.07-2.i386.rpm
initscripts-7.43-1.i386.rpm 

Then I ran 

lvm vgscan -P --mknodes
lvm vgchange -P -a y
lvm lvchange -P -a y /dev/scsivg/disk2 (also for other LVs)

lvm lvdisplay -P scsivg then shows, in part,

  Partial mode. Incomplete volume groups will be activated read-only.
  1 PV(s) found for VG scsivg: expected 2
  Logical volume (swap) contains an incomplete mapping table.
  --- Logical volume ---
  LV Name                /dev/scsivg/disk2
  VG Name                scsivg
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                4.50 GB
  Current LE             1152
  Segments               257
  Allocation             next free
  Read ahead sectors     10000
  Block device           254:0

Which implies that I should be able to do something with this LV. But

dd if=/dev/scsivg/disk2 of=/dev/null bs=1k count=1024
0+0 records in
0+0 records out

Does anyone have any suggestions of things I could try? 

Regards,

Chris
(who's just worked out the hard way that having a VG span two disks is
not always a good idea)
