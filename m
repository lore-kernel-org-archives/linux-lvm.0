Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9PDEDn0015390
	for <linux-lvm@redhat.com>; Sun, 25 Oct 2009 09:14:13 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9PDE2xD016887
	for <linux-lvm@redhat.com>; Sun, 25 Oct 2009 09:14:02 -0400
Received: by yxe13 with SMTP id 13so8917262yxe.23
	for <linux-lvm@redhat.com>; Sun, 25 Oct 2009 06:14:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091025084610.GA737@maude.comedia.it>
References: <a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com> 
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com> 
	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com> 
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com> 
	<20091024000642.GA30974@bdmcc-us.com>
	<a5a956f70910240943u3558a466je5c9a0073ed5f8fa@mail.gmail.com> 
	<29ae894c0910241004k327b0ff8w6577b83af3701753@mail.gmail.com> 
	<20091025084610.GA737@maude.comedia.it>
From: Drew <drew.kay@gmail.com>
Date: Sun, 25 Oct 2009 06:13:42 -0700
Message-ID: <c268e4660910250613y5d307d92t3ab0f4198d76c373@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
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

> Online shrinking is more difficult to achieve than online growing, and
> is much less frequently needed, it usually happens due to bad planning.
> I know some filesystem on different oses (namely vxfs) and btrfs on linux
> allow online shrinking, ext3/4 and xfs don't.

Ext3 does support shrinking. I've been doing it as far back as 2005.


-- 
Drew

"Nothing in life is to be feared. It is only to be understood."
--Marie Curie
