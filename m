Received: from [10.36.8.30] (vpn2-8-30.ams2.redhat.com [10.36.8.30])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8IJm7kK001504
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 15:48:08 -0400
Message-ID: <4AB3E3F7.2060704@redhat.com>
Date: Fri, 18 Sep 2009 21:48:07 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Question on compatibility with 2.6.31 kernel.
References: <4AB3DE8E.9080301@candelatech.com>
In-Reply-To: <4AB3DE8E.9080301@candelatech.com>
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

Ben Greear wrote:
> I recently tried to boot 2.6.31 on Fedora 8, and it couldn't
> find the volume groups.  The same kernel works fine on F11.

try to recompile kernel with
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y

(old lvm will not understand new sysfs design, this should
provide old sysfs entries)

> Someone on LKML said they had similar problems on an old Debian Etch
> system and to fix it they installed a new version of lvm2 and put
> that in the initrd.

yes, this is another option, new lvm2 (I think >2.02.29) should work.
But note that also device-mapper library must be updated.

Milan
