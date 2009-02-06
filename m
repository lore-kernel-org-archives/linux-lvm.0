Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n16FbEwS018107
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 10:37:14 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n16FavHC017933
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 10:36:57 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LVSlC-00048C-04
	for linux-lvm@redhat.com; Fri, 06 Feb 2009 15:36:54 +0000
Received: from 69-196-139-226.dsl.teksavvy.com ([69.196.139.226])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 06 Feb 2009 15:36:53 +0000
Received: from monnier by 69-196-139-226.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 06 Feb 2009 15:36:53 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Fri, 06 Feb 2009 10:36:45 -0500
Message-ID: <jwvzlgzlh6o.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Problems running my home-built LVM2
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

I'm trying to use LVM2 on a small MIPS machine.  This machine uses
uClibc-0.9.29 with Linux-2.6.25.20 and has limited RAM and CPU power,
but does come with a 1TB drive which I'd rather manage with LVM.

I had no particular problems building the latest version of LVM2
for it.  And as far as I can tell, it's not fully broken,
but it's unusable: every run of `lvm' gives different results.
E.g. `lvm pvs' sometimes gives the expected output, sometimes lists
nothing at all, sometimes complains about missing volume groups,
sometimes "Incorrect metadata area header checksum" [as mentioned in an
earlier message on this list, incidentally].

I've taken a look at the compile log and didn't see any funny warning.
I tried to compile other versions of LVM (2.02.44, 2.02.43, 2.02.39),
but they all give the same result.

Then I installed Debian in a chroot, and Debian's 2.02.39 version of
`lvm' works just fine.

Does anyone have any idea what might be going on?

As a temporary workaround, I use "chroot /debian lvm" instead of "lvm",
but I really would like to get the "native" lvm working.


        Stefan
