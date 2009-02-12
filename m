Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1CLKVu7020540
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 16:20:31 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1CLKDT8007104
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 16:20:13 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXiyf-00045n-P9
	for linux-lvm@redhat.com; Thu, 12 Feb 2009 21:20:09 +0000
Received: from 69-196-139-226.dsl.teksavvy.com ([69.196.139.226])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 21:20:09 +0000
Received: from monnier by 69-196-139-226.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 21:20:09 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Thu, 12 Feb 2009 16:20:01 -0500
Message-ID: <jwvvdrf5pbn.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>
	<b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>
	<68c491a60902120038g6cede40ckaa5ae58600f5ff21@mail.gmail.com>
	<jwv3aej76uf.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<499483E1.3020509@redhat.com>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: About fstab and fsck
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

>>>> filesystem... so considering its size, I'd turn it off. Hopefully the
>>>> "fsck takes _forever_" problem will die when btrfs becomes the
>>>> standard filesystem.
>>> Just a reminder: Linux has xfs since 2002. A full-blown fsck on xfs is
>>> a rare thing.
>> Similarly, I don't know of any case where fsck on an ext3 partition
>> turned out to be useful.  As a matter of fact, my home router's ext3
> I wouldn't go that far. It all depends what messed the file system up in the
> first place.

That's the thing: nothing did.  So why run fsck at all?

> Ext3 bugs, minor scribbling and suchlike generally get tidied up
> reasonably well by e2fsck.  It's quite true that with major corruption
> to the file system there's often not an awful lot left afterwards but
> that's true of many other file systems as well.

Oh, you're thinking of using fsck for recovery purposes.
That's a different situation.  I was just talking about the idea of "not
needing to do fsck any more", which is pretty much already the case for
XFS and ext3, AFAIK.

>> partition is never fsck'd (it would take way too much time to this poor
>> 266MHz thingy to fsck my 1TB filesystem).
> /me wonders why a router needs a 1TB fs :-)

Actually I call it "router" because it was sold as such and it replaced
a machine which I originally used as such as well.  Really it's just
a small home server which stores&plays my music, stores my movies and
other such things, ...  It doesn't actually do any routing at all.


        Stefan
