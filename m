Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p78DdTqg009608
	for <linux-lvm@redhat.com>; Mon, 8 Aug 2011 09:39:29 -0400
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p78DdS8g016379
	for <linux-lvm@redhat.com>; Mon, 8 Aug 2011 09:39:28 -0400
Received: from mira.localnet ([unknown] [173.76.201.9])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LPM00MJ639JVA40@vms173019.mailsrvcs.net> for
	linux-lvm@redhat.com; Mon, 08 Aug 2011 08:39:23 -0500 (CDT)
Message-id: <4E3FE705.8040600@mattgillen.net>
Date: Mon, 08 Aug 2011 09:39:17 -0400
From: Matthew Gillen <me@mattgillen.net>
MIME-version: 1.0
References: <CAPweEDyrD2VE4DQ6rp=rfJ-MGa_rz4=c3-_+FVNMf3MHhAQZVA@mail.gmail.com>
In-reply-to: <CAPweEDyrD2VE4DQ6rp=rfJ-MGa_rz4=c3-_+FVNMf3MHhAQZVA@mail.gmail.com>
Content-transfer-encoding: 7bit
Subject: Re: [linux-lvm] linux kernel 2.6.39 LVM2 rootfs initrd kernel panic
 "no rootfs found" with userspace dmsetup+libdevmapper <= 1.02.48
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 08/06/2011 06:09 PM, Luke Kenneth Casson Leighton wrote:
> so at this point i'm puzzled, because it's userspace-kernelspace
> interaction and yet there's no recognition of this inter-dependency in
> the debian package specs...
> 
> so, we have an unusual situation in which the linux kernel appears to
> require a dependency on a specific version of a userspace library for
> booting a system (which the debian linux kernel maintainer quite
> rightly objected to "fixing" by adding random dependencies for random
> userspace libraries.  as they said in Galaxy Quest, "ohhh.  that's not
> riiiight"...)
> 
> so, with that as background, one debian user raised an interesting
> question: has any _other_ gnu/linux distro encountered this issue, and
> if so, how was it resolved?

I don't think it is resolved anywhere (Redhat/Fedora kernel packages
also have a very minimal set of user-space deps that do not include any
of the LVM auxiliary programs.  It's a nasty problem that would only
really be solved by packaging kernel-modules (or least the ones with
additional user-space dependencies) separately from the kernel core.
But package maintainers are resistant to that because it makes for more
management headaches...

The RPMFusion/kmod packages for Fedora take this approach for various
third-party modules (e.g. the linkage between the nvidia kernel module
and the nvidia libGL userspace library; separate packages because the
kernel module is tied to both a kernel version and a driver-release
version, while the userspace library is tied only to a driver-release
version).  I'm sure if you trolled the fedora-devel list from a few
years ago you'd find a big debate about this (there was at one time a
question as to whether the kmod packaging system would be used for
officially supported modules; they decided to not support kmod officially).

Matt
