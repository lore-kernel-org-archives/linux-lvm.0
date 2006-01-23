Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0N4JD110846
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2006 23:19:13 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.201])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0N4JDIf024992
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2006 23:19:13 -0500
Received: by xproxy.gmail.com with SMTP id h28so1178429wxd
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2006 20:19:12 -0800 (PST)
Message-ID: <bde36b470601222019o37874870o5e2dde4e72901a5f@mail.gmail.com>
Date: Sun, 22 Jan 2006 22:19:12 -0600
From: Jeff McClure <jeff.mcclure@gmail.com>
Subject: Re: [linux-lvm] random occasional filesystem corruption
In-Reply-To: <20060122175650.GE4280@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <bde36b470601210921x3116aa4bs1afcecf35eac084a@mail.gmail.com>
	<20060122175650.GE4280@agk.surrey.redhat.com>
Content-Transfer-Encoding: 8bit
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

On 1/22/06, Alasdair G Kergon <agk@redhat.com> wrote:
> On Sat, Jan 21, 2006 at 11:21:51AM -0600, Jeff McClure wrote:
> > System is Debian testing, kernel 2.6.15 (but the problem was also seen
> > on a 2.6.14 kernel).
> > lvm2 package is 2.01.04-5 (with lvm-common version 1.5.20).
>
> 1. Update your kernel to include the patches I sent to dm-devel and
> linux-kernel mailing lists in the last couple of weeks.
>
> 2. Update your userspace device-mapper and linux-lvm packages to the
> latest ones (as referenced in the linux-kernel emails).
>
> 3. Then see if you can reproduce the problems.  If you can, look out for
> the next set of snapshot patches following in the next week or two...
>
> Alasdair

Thanks for the suggestions, Alasdair. I've already figured out it's
not in LVM (or RAID). I decided to go ahead and pull out the LVM layer
to see if it still happened. It did. In fact, during the various large
file copies I did, I learned that it would happen on a filesystem
directly on one of the hard drives in question (no RAID, no LVM).

Another interesting data point... if I booted into an old 2.4
kernel/root filesystem I had lying around, it worked beautifully (even
with LVM2 in place).

I picked up a Belkin (Silicon Image SI860-based) ATA133 card to
replace the Promise Ultra66 that was running the two drives. I have
had absolutely no problems since. So... my current hypotheses are:

1) The pd202xx_old driver in 2.6 is buggy.

OR

2) The Ultra66 didn't get along well with the Maxtor 200GB ATA133
drives (6L200R0). Why I didn't see this in 2.4, I don't know. However,
the problem seems to be more frequent during heavy disk access. I
could be convinced that the 2.6 kernel is sufficiently more efficient
so as to create the access rate necessary to reveal the problem.

--Jeff
