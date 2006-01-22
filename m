Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k0MHuoRq010807
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2006 17:56:50 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1F0jSM-0007ur-NV
	for linux-lvm@redhat.com; Sun, 22 Jan 2006 17:56:50 +0000
Date: Sun, 22 Jan 2006 17:56:50 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] random occasional filesystem corruption
Message-ID: <20060122175650.GE4280@agk.surrey.redhat.com>
References: <bde36b470601210921x3116aa4bs1afcecf35eac084a@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bde36b470601210921x3116aa4bs1afcecf35eac084a@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Jan 21, 2006 at 11:21:51AM -0600, Jeff McClure wrote:
> System is Debian testing, kernel 2.6.15 (but the problem was also seen
> on a 2.6.14 kernel).
> lvm2 package is 2.01.04-5 (with lvm-common version 1.5.20).

1. Update your kernel to include the patches I sent to dm-devel and 
linux-kernel mailing lists in the last couple of weeks.

2. Update your userspace device-mapper and linux-lvm packages to the
latest ones (as referenced in the linux-kernel emails).

3. Then see if you can reproduce the problems.  If you can, look out for
the next set of snapshot patches following in the next week or two...

Alasdair
-- 
agk@redhat.com
