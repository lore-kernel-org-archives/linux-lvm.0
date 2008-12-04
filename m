Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB4IBbku031909
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 13:11:37 -0500
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB4IAYRb027755
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 13:10:52 -0500
Received: by yx-out-2324.google.com with SMTP id 31so1711703yxl.81
	for <linux-lvm@redhat.com>; Thu, 04 Dec 2008 10:10:34 -0800 (PST)
Message-ID: <41519ea60812041010x557b183dt7fb154d49a61e520@mail.gmail.com>
Date: Thu, 4 Dec 2008 19:10:33 +0100
From: "Fabio Coatti" <fabio.coatti@gmail.com>
Subject: Re: [linux-lvm] pvresize complains about too many metadata
In-Reply-To: <20081130123440.GG13235@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <41519ea60811290713g46083998v6c42bb7b578f1472@mail.gmail.com>
	<20081130123440.GG13235@agk.fab.redhat.com>
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

2008/11/30 Alasdair G Kergon <agk@redhat.com>:
> On Sat, Nov 29, 2008 at 04:13:31PM +0100, Fabio Coatti wrote:
>>   /dev/md1: too many metadata areas for pvresize
>
> That's meant to be saying you chose to place a second copy of the metadata at
> the end of the device and if you want to increase the size of the data area you
> have to shift that metadata first and there is no code that does that.
>
> Workaround is to reduce to 1 metadata area first (backup VG, redo pvcreate with
> uuid & restorefile, restore VG), then extend, then put the 2nd metadata area
> back (same process) if you still want it.

Done that (basically, having several PV and some space, some pvmove
and pvcreate solved it). But basically this means that the option to
use 2 metadata areas prevents pv to grow, right?
Maybe this situation should be reported on documentation: "never use
two copies of metadata if it can happen to resize pv" (or can it be
considered a bug and solved on code side? basically pvresize should
handle the move of the second metadata at the end of the pv after the
resize operation...)
