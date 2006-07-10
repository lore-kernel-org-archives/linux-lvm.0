Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6AIZTnl004180
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 14:35:29 -0400
Received: from zrtps0kn.nortel.com (zrtps0kn.nortel.com [47.140.192.55])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6AIZFKO027574
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 14:35:20 -0400
Received: from zrtphxs1.corp.nortel.com
	(zrtphxs1.corp.nort...s0.corp.nortel.com [47.140.202.46])
	by zrtps0kn.nortel.com (Switch-2.2.6/Switch-2.2.0) with ESMTP id
	k6AIZ8r03577
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 14:35:08 -0400 (EDT)
Message-ID: <44B29DA2.1010305@dogpad.net>
Date: Mon, 10 Jul 2006 13:34:10 -0500
From: Joe Harvell <jharvell@dogpad.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] errors using mkinitrd: cannot stat lvm2/vgwrapper
References: <4469F5C1.7030603@cmu.edu>
In-Reply-To: <4469F5C1.7030603@cmu.edu>
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

The stock 2.4 kernel has LVM1 support only (not LVM2).  I'm not sure
about your RedHat kernel, but Gentoo has a 2.4 kernel with LVM2
backported.  If your volumes are LVM2 format then you can only read them
if you have LVM2 support in your kernel.  Even if you created the
volumes in an LVM2 system, they may still be LVM1 format.

If you do have LVM2 support in your kernel, you need to install the lvm2
tools and the device_mapper library  Then mkinitrd should find what it's
looking for.  Although it's strange that my LVM2 tools don't have any
file named lvm2 or vgwrapper.  Maybe these are added by RedHat and part
of the RedHat LVM2 package.

If your kernel only supports LVM1 and your volumes are in LVM1 format,
you need to generate an LVM1 based initrd.  Maybe mkinitrd has options
for this?

George Nychis wrote:
> Hi,
>
> I am having trouble booting a 2.4.32 kernel with fedora core 3, I can
> successfully boot the partition with 2.6.9
>
> I built the 2.4.32 kernel with lvm support built in, and as a module,
> and get the following errors when trying to mkinitrd:
>
> cannot stat lvm2: No such file or directory
> cannot stat /sbin/vgwrapper: No such file or directory
>
> The initrd still gets created though, but I think these errors are the
> sources of my problems.  /sbin/vgwrapper, as it says, does not exist
>
> Any ideas how to fix these errors?
>
> Thanks!
> George
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>   
