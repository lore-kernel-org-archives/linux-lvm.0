Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n19GT9gA013177
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 11:29:09 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n19GSslJ008405
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 11:28:54 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LWZ04-0001zY-Qx
	for linux-lvm@redhat.com; Mon, 09 Feb 2009 16:28:49 +0000
Received: from 69-196-139-226.dsl.teksavvy.com ([69.196.139.226])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 09 Feb 2009 16:28:48 +0000
Received: from monnier by 69-196-139-226.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 09 Feb 2009 16:28:48 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Mon, 09 Feb 2009 11:28:36 -0500
Message-ID: <jwvprhrinmg.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <jwvzlgzlh6o.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<498EE80D.3090307@redhat.com>
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

>> I'm trying to use LVM2 on a small MIPS machine.  This machine uses
>> uClibc-0.9.29 with Linux-2.6.25.20 and has limited RAM and CPU power,
>> but does come with a 1TB drive which I'd rather manage with LVM.

>> I had no particular problems building the latest version of LVM2
>> for it.  And as far as I can tell, it's not fully broken,
>> but it's unusable: every run of `lvm' gives different results.
>> E.g. `lvm pvs' sometimes gives the expected output, sometimes lists
>> nothing at all, sometimes complains about missing volume groups,
>> sometimes "Incorrect metadata area header checksum" [as mentioned in an
>> earlier message on this list, incidentally].

> I guess that using uClibc is the problem.

It sounds like a likely culprit, indeed.  But Googling indicates that
LVM2 has been compiled and used with uClibc for initramfs purposes so it
should work fine.  Tho maybe the problem is that those references I see
are old: i.e. it used to work OK but not anymore.

Is someone successfully using a recent LVM2 with a recent uClibc?

> Can you try to link it to standard glibc (if possible; you can try to use
> static build also)?

That's probably beyond my ability for now (the target machine is under
powered, so I need to cross-compile, which makes everything a lot more
... interesting).

>> Then I installed Debian in a chroot, and Debian's 2.02.39 version of
>> `lvm' works just fine.
> That version uses glibc, right?

Yes, indeed.


        Stefan
