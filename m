Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1H2Gwet031213
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2009 21:16:58 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1H2GkD0029700
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2009 21:16:46 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LZFVu-0004iN-QE
	for linux-lvm@redhat.com; Tue, 17 Feb 2009 02:16:46 +0000
Received: from 76-10-148-202.dsl.teksavvy.com ([76.10.148.202])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2009 02:16:46 +0000
Received: from monnier by 76-10-148-202.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2009 02:16:46 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Mon, 16 Feb 2009 21:16:37 -0500
Message-ID: <jwv7i3p24qp.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <jwvzlgzlh6o.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<498EE80D.3090307@redhat.com>
	<jwvprhrinmg.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<49905A90.2000802@redhat.com>
	<jwvk57q0y5w.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<20090217000623.GD26197@agk.fab.redhat.com>
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

>> _io in dev-io.c) would often return garbage (tho not always).  Not sure
>> if it's a problem in LVM2, or in uClibc, or in the kernel, but I think
>> I've already wasted more than enough time on this, so I'll just use
>> the --disable-o_direct workaround.
> We had a problem with O-direct several years ago which we blamed on a rogue
> version of gcc.

Based on my experience I'd say that it seems to still be around.
At least on `mipsel'.  I have since discovered that Debian's `lvm2'
package disables O_DIRECT with the following lines:

   ifneq (,$(findstring $(DEB_HOST_ARCH), arm armeb hppa mips mipsel))
   CONFIGURE_FLAGS += --disable-o_direct
   endif

so that's probably why the Debian package worked fine.  It's probably
unrelated to uClibc.  My wild gut feeling is that it's a bug in the
kernel's handling of cache coherency.

Related Debian bugs are #351632 #330166 #267157 #247896.


        Stefan
