Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8JIKPD9008297
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 14:20:25 -0400
Received: from ixe-mta-18.emailfiltering.com (ixe-mta-18-tx.emailfiltering.com
	[194.116.198.213])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8JIKLhp016613
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 14:20:22 -0400
Received: from smtp.media-brokers.com ([70.43.81.99])
	by ixe-mta-18.emailfiltering.com with emfmta (version
	4.0.0.434.1.rd-3.2.3-libc2.3.2) vanilla id 1338103388
	for linux-lvm@redhat.com; Sat, 19 Sep 2009 19:20:20 +0100
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id B13F616DDB4
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 14:20:19 -0400 (EDT)
Message-ID: <4AB520E3.4080209@Media-Brokers.com>
Date: Sat, 19 Sep 2009 14:20:19 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Question on compatibility with 2.6.31 kernel.
References: <4AB3DE8E.9080301@candelatech.com> <4AB3E3F7.2060704@redhat.com>
	<4AB3F3EE.5040004@candelatech.com>
In-Reply-To: <4AB3F3EE.5040004@candelatech.com>
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

On 9/18/2009, Ben Greear (greearb@candelatech.com) wrote:
> > I recently tried to boot 2.6.31 on Fedora 8, and it couldn't
> > find the volume groups.  The same kernel works fine on F11.
> 
> try to recompile kernel with
> CONFIG_SYSFS_DEPRECATED=y
> CONFIG_SYSFS_DEPRECATED_V2=y
> 
> (old lvm will not understand new sysfs design, this should
> provide old sysfs entries) 

I'm also an lvm newbie, and since I'll obviously be running into this
sometime soon...

If lvm2 is updated first (before the kernel), I'm assuming it would
still be backward compatible with older kernels?

Or, if I updated the kernel first and compiled it with the above
options, when lvm2 gets updated, will I need to recompile the kernel
with the above options disabled before the next reboot?

Thanks,

-- 

Best regards,

Charles
