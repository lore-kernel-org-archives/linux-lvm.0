Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2Q0srUq004450
	for <linux-lvm@redhat.com>; Wed, 25 Mar 2009 20:54:53 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2Q0sYsP031610
	for <linux-lvm@redhat.com>; Wed, 25 Mar 2009 20:54:34 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lmdrb-0002Dl-Mk
	for linux-lvm@redhat.com; Thu, 26 Mar 2009 00:54:31 +0000
Received: from 69-196-168-214.dsl.teksavvy.com ([69.196.168.214])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 00:54:31 +0000
Received: from monnier by 69-196-168-214.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 00:54:31 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Wed, 25 Mar 2009 20:54:20 -0400
Message-ID: <jwvhc1hayxg.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <c268e4660903240759t35826b60n641296dba8fdd764@mail.gmail.com>
	<20090324215410.GB20225@lupe-christoph.de>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: Shrinking a LVM physical volume
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

> According to its manpage, it should be safe to use
>   pvresize --setphysicalvolumesize <newsize> <pvdevice>
> prior to resizing the partition. It should complain if there are extents
> in use beyond <newsize>.

Is there some way to move those extents?
I guess there's pvmove, but that seems to only be able to move them to
some other PV.

>> And then once that's done,
>> how safe is it to move the lvm partition around on the drive?
> That is up to somebody with more knowledge to answer.

I can confirm that PVs can be moved at will (even between drives).
I've done it a few times.


        Stefan
