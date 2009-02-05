Received: from [10.32.10.40] (vpn-10-40.str.redhat.com [10.32.10.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n15LOVYl008856
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 16:24:32 -0500
Message-ID: <498B590E.3020901@redhat.com>
Date: Thu, 05 Feb 2009 22:24:30 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM skips /dev/hde3 because sysfs tells it not to
	use it
References: <jwvfxisobi2.fsf-monnier+gmane.linux.lvm.general@gnu.org>
In-Reply-To: <jwvfxisobi2.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Stefan Monnier wrote:
> I had to disable sysfs_scan before pvcreate accepted to use /dev/hde3 on
> a little MIPS box.
> 
> How does LVM decide whether sysfs tells it to use a block device or not?
> And why would /dev/hde (an internal IDE drive) be presented by sysfs as
> "not to be used by LVM"?

It should be possible to use the device unless there is some filter set.

Run the command with debug on (add -vvvv) and you will see which filter disabled
the device and why.

I guess you can also hit this "known" problem with 
old lvm toolset (<2.02.29) and new kernel with new sysfs layout.

*If* it is this situation you can fix it using one of the following
	1) disable sysfs scan
	2) upgrade lvm 
	3) switch CONFIG_SYSFS_DEPRECATED_V2 kernel config on and recompile kernel

Milan
--
mbroz@redhat.com
