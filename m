Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2OLuNm4010699
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 17:56:24 -0400
Received: from buexe.b-5.de (buexe.b-5.de [84.19.0.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2OLt1aY023347
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 17:55:02 -0400
Received: from alanya.lupe-christoph.de (alanya.lupe-christoph.de
	[172.17.0.19])
	by buexe.b-5.de (8.13.8/8.13.8/b-5/buexe-3.6.3) with ESMTP id
	n2OLswD2006824
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 22:54:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by alanya.lupe-christoph.de (Postfix) with ESMTP id E7B952C1DC
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 22:54:10 +0100 (CET)
Received: from alanya.lupe-christoph.de ([127.0.0.1])
	by localhost (alanya.lupe-christoph.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lKKMuYcBwjfp for <linux-lvm@redhat.com>;
	Tue, 24 Mar 2009 22:54:10 +0100 (CET)
Date: Tue, 24 Mar 2009 22:54:10 +0100
From: Lupe Christoph <lupe@lupe-christoph.de>
Subject: Re: [linux-lvm] Shrinking a LVM physical volume
Message-ID: <20090324215410.GB20225@lupe-christoph.de>
References: <c268e4660903240759t35826b60n641296dba8fdd764@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c268e4660903240759t35826b60n641296dba8fdd764@mail.gmail.com>
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

On Tuesday, 2009-03-24 at 07:59:09 -0700, Drew wrote:

> I have a system that I dual boot Windows and Debian from. Due to a
> minor mistake on my part when carving out the space on my drive for my
> linux partition, I now find myself with insufficient space on my
> windows partition.

> How do you shrink a physical volume on lvm?

Since nobody with real experience doing that has answered, I'll supply
my fewer than 2 Eurocents...

According to its manpage, it should be safe to use
  pvresize --setphysicalvolumesize <newsize> <pvdevice>
prior to resizing the partition. It should complain if there are extents
in use beyond <newsize>.

I say "it should" because I never tried it. So make a backup, blahblah,
etcetera...

> And then once that's done,
> how safe is it to move the lvm partition around on the drive?

That is up to somebody with more knowledge to answer.

HTH,
Lupe Christoph
-- 
| There is no substitute for bad design except worse design.                   |
| /me                                                                          |
