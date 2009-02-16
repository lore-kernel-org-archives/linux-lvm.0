Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1GNKwPL032457
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2009 18:20:58 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1GNKktK004892
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2009 18:20:46 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LZCla-0006gB-2l
	for linux-lvm@redhat.com; Mon, 16 Feb 2009 23:20:46 +0000
Received: from 76-10-148-202.dsl.teksavvy.com ([76.10.148.202])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2009 23:20:46 +0000
Received: from monnier by 76-10-148-202.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2009 23:20:46 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Mon, 16 Feb 2009 18:20:32 -0500
Message-ID: <jwvk57q0y5w.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <jwvzlgzlh6o.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<498EE80D.3090307@redhat.com>
	<jwvprhrinmg.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<49905A90.2000802@redhat.com>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: Problems running my home-built LVM2
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
To: linux-lvm@redhat.com

>> It sounds like a likely culprit, indeed.  But Googling indicates that
>> LVM2 has been compiled and used with uClibc for initramfs purposes so it
>> should work fine.  Tho maybe the problem is that those references I see

> AFAIK, nobody is testing this regularly, especially not for the latest
> releases.  Also many (most?) distributions are now shipping an
> initramfs with a full glibc environment so this use is becoming
> less common.

I think I've finally "tracked it down".  Or at least I've found
a workaround: if I pass "--disable-o_direct" to configure, everything
works fine.

While trying to track it down, I saw that calls to "read" (from within
_io in dev-io.c) would often return garbage (tho not always).  Not sure
if it's a problem in LVM2, or in uClibc, or in the kernel, but I think
I've already wasted more than enough time on this, so I'll just use
the --disable-o_direct workaround.


        Stefan
