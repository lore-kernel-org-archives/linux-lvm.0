Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4ILLNan030930
	for <linux-lvm@redhat.com>; Mon, 18 May 2015 17:21:23 -0400
Received: from mail.bitfolk.com (bitfolk.com [85.119.80.223])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4ILLLCj021764
	for <linux-lvm@redhat.com>; Mon, 18 May 2015 17:21:22 -0400
Received: from andy by mail.bitfolk.com with local (Exim 4.72)
	(envelope-from <andy@strugglers.net>) id 1YuSTN-0000GZ-Nm
	for linux-lvm@redhat.com; Mon, 18 May 2015 21:21:17 +0000
Date: Mon, 18 May 2015 21:21:17 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20150518212117.GH4327@bitfolk.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] =?utf-8?q?Expectations_for_TRIM_on_an_MD=E2=86=92LVM?=
	=?utf-8?b?4oaSWGVu4oaSPyBzdGFjaw==?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

This is a purely hypothetical setup at this point but I am wondering
what to expect in the way of TRIM support through all these layers.

Let's say: Debian 8.0 (jessie) host machine with SSDs in MD RAID-10,
MD device used as PV, and then Xen PV VMs using LVs as their disks.
I will have no idea how the administrators of the VMs will lay out
their storage; they might treat them as disks and partition them, or
directly put filesystems on the block devices, or even use them as
LVM PVs themselves.

As far as I can see:

- MD supports TRIM on RAID-10 from kernel 3.7:

  http://kernelnewbies.org/Linux_3.7#head-2fd9b183a4623d96e69ed24f88e0eb83217fa8df

- LVM supports TRIM if issue_discards is set:

  https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/lvmconf_file.html

- Xen supports TRIM on PV block device since kernel 3.2:

  http://wiki.xen.org/wiki/XenParavirtOps

So, I think the situation would be something like:

- If the admin of the VM sets it up to do TRIM by e.g. using the
  discard fstab option or issuing fstrim commands, then the TRIM
  commands should be passed all the way down and honoured.

- There will be nothing I as the operator of the bare metal machine
  can do to either force or deny TRIM for the underlying storage of
  those LVs other than to disable it in LVM. So if the VM admin does
  not configure TRIM, there will be no TRIM.

- Once a VM is decommissioned and an lvremove is done from the
  hypervisor host, we could expect TRIM to take place.

Are these assumptions correct?

If I ran blktrace on the MD member device (e.g. /dev/sda5), would I
see a TRIM command propagated down from a VM? What would that look
like?

Thanks,
Andy
