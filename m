Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAC1E6V09225
	for <linux-lvm@redhat.com>; Fri, 11 Nov 2005 20:14:06 -0500
Received: from mail.inostor.com (w130.z209220038.sjc-ca.dsl.cnc.net
	[209.220.38.130])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAC1DrQd003068
	for <linux-lvm@redhat.com>; Fri, 11 Nov 2005 20:14:03 -0500
Received: from neo.matrix.local (unknown [172.16.1.75])
	by mail.inostor.com (Postfix) with ESMTP id BAF6A2B519
	for <linux-lvm@redhat.com>; Fri, 11 Nov 2005 17:07:03 -0800 (PST)
From: "James G. Sack (jim)" <jsack@tandbergdatacorp.com>
In-Reply-To: <20051111163525.18AE1734B1@hormel.redhat.com>
References: <20051111163525.18AE1734B1@hormel.redhat.com>
Date: Fri, 11 Nov 2005 17:13:46 -0800
Message-Id: <1131758026.4975.77.camel@jgs4.ino.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Sorry, dm:1.02, lvm2:2.02 did not work for me
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
To: "LVM LIST linux-lvm@redhat.com" <linux-lvm@redhat.com>

in linux-lvm Digest, Vol 21, Issue 7 msg 2..
> ------------------------------
> 
> Message: 2
> Date: Thu, 10 Nov 2005 15:52:47 +0000
> From: Alasdair G Kergon <agk@redhat.com>
> Subject: [linux-lvm] New LVM2/device-mapper development tarballs
> To: dm-devel@redhat.com, linux-lvm@redhat.com
> Message-ID: <20051110155247.GH26394@agk.surrey.redhat.com>
> Content-Type: text/plain; charset=us-ascii
> 
> I have just created new tarballs from CVS for testing
> purposes:
> 
>   ftp://sources.redhat.com/pub/dm/device-mapper.1.02.00.tgz
>   ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.00.tgz
> 
> There are some significant extensions to libdevmapper and 
> the code that activates logical volumes has been rewritten
> to prepare for kernel patches to fix snapshot activation.
> The new code will also make it possible to support more
> complex device hierarchies in the future, such as snapshots 
> of mirrors.
> 
> So far I've done some basic testing, but I expect there
> are still plenty more bugs to be found: If you find any,
> please report them to one of these lists!
> 
> (Note that you'll need to install the new device-mapper package
> before the new LVM2 one.)
> 
> Alasdair

I tried the above dm and lvm2, but now have problems creating a snapshot
on an origin volume named "F" of VGf11 on a pv /dev/sdf11. I get
(The origin F was built with prior lvm2:1.0.5 dm:1.01.05)
---
device-mapper ioctl cmd 3 failed: Device or resource busy
  Failed to suspend origin F
  Device '/dev/sdf11' has been left open.
---
This is on stock FC4 kernel
 kernel-2.6.13-1.1532_FC4

I also tried on 
 kernel-2.6.14-1.1637_FC4
but on that kernel, I get 
---
Attempt to close device '/dev/hda' which is not open.
Attempt to close device '/dev/sda' which is not open.
  (& similarly up thru sdi -- all my disks)
  ..followed by the 
Failed to suspend.. stuff as above


I had to configure both dm and lvm2 with "--disable-selinux"), but I
wouldn't expect that to have any impact, eh?

I've also been noticing that I've had to use "--ignorearch" to install
FC4 precompiled kernels and --target=i686 on compiles from FC4 kernel
srpms -- would that have any relation to these symptoms?

I didn't do any kernel patching -- the only patches relate to the 2.4
kernel, I believe. 

In case there's something useful there, heres the tail of the spam when
I set verbose=2 in lvm.coinf

      /dev/sdf11: lvm2 label detected
    Archiving volume group "VGf11" metadata (seqno 64797).
    Creating logical volume S
    Creating volume group backup "/etc/lvm/backup/VGf11" (seqno 64798).
      Finding volume group for uuid
cfAe87N2RoYKKc6Ef8yZn4fG0Foi98gBLI1TVwRB4p3bJEoRfK52PtAc0crW4ytk
      /dev/sdf11: lvm2 label detected
      /dev/sdf11: lvm2 label detected
    Found volume group "VGf11"
      Locking memory
      Setting activation/missing_stripe_filler to /dev/ioerror
      Getting target version for linear
      Getting target version for striped
    Creating VGf11-S
    Loading VGf11-S table
    Resuming VGf11-S (253:10)
      Unlocking memory
      Linking /dev/VGf11/S -> /dev/mapper/VGf11-S
    Zeroing start of logical volume "S"
      Finding volume group for uuid
cfAe87N2RoYKKc6Ef8yZn4fG0Foi98gBLI1TVwRB4p3bJEoRfK52PtAc0crW4ytk
      /dev/sdf11: lvm2 label detected
      /dev/sdf11: lvm2 label detected
    Found volume group "VGf11"
      Locking memory
    Removing VGf11-S (253:10)
      Unlocking memory
      Removing link /dev/VGf11/S
      Finding volume group for uuid
cfAe87N2RoYKKc6Ef8yZn4fG0Foi98gBLI1TVwRB4p3bJEoRfK52PtAc0crW4ytk
      /dev/sdf11: lvm2 label detected
      /dev/sdf11: lvm2 label detected
    Found volume group "VGf11"
      Finding volume group for uuid
cfAe87N2RoYKKc6Ef8yZn4fG0Foi98gBI7Kovv1OPi1Z4L4st6YPuh2L66mZur1B
      /dev/sdf11: lvm2 label detected
      /dev/sdf11: lvm2 label detected
    Found volume group "VGf11"
    Loading VGf11-F-real table
    Resuming VGf11-F-real (253:9)
    Creating VGf11-F
  device-mapper ioctl cmd 3 failed: Device or resource busy
  Failed to suspend origin F
      Unlocking /var/lock/lvm/V_VGf11
      Dumping persistent device cache to /etc/lvm/.cache
    Wiping internal VG cache
  Device '/dev/sdf11' has been left open.

---
Also, if I set logging "level = 6" in lvm.conf, here's the tail-end
of /var/log/lvm.log:
- - - 
label/label.c:167   /dev/sdf11: lvm2 label detected
config/config.c:757   Setting cow_store to S
config/config.c:757   Setting origin to F
metadata/metadata.c:1177   Found volume group "VGf11"
libdm-deptree.c:1103   Creating VGf11-F-real
libdm-deptree.c:1321   Loading VGf11-F-real table
libdm-deptree.c:864   Resuming  (253:1)
libdm-deptree.c:1103   Creating VGf11-F
ioctl/libdm-iface.c:1392   device-mapper ioctl cmd 3 failed: Device or
resource busy
lvcreate.c:763   Failed to suspend origin F
locking/file_locking.c:59   Unlocking /var/lock/lvm/V_VGf11
filters/filter-persistent.c:180   Dumping persistent device cache
to /etc/lvm/.cache
cache/lvmcache.c:591   Wiping internal VG cache
device/dev-cache.c:479   Device '/dev/sdf11' has been left open.
- - -


So .. what next?

Regards
..jim
