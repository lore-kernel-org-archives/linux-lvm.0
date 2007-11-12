Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lACMUIdb008929
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 17:30:18 -0500
Received: from pd3mo3so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lACMUBTR025450
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 17:30:11 -0500
Received: from pd3mr2so.prod.shaw.ca
	(pd3mr2so-qfe3.prod.shaw.ca [10.0.141.178]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0JRE002BZZU5CP90@l-daemon> for linux-lvm@redhat.com; Mon,
	12 Nov 2007 15:30:05 -0700 (MST)
Received: from pn2ml1so.prod.shaw.ca ([10.0.121.145])
	by pd3mr2so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JRE00IJ6ZU5UH00@pd3mr2so.prod.shaw.ca> for
	linux-lvm@redhat.com; Mon, 12 Nov 2007 15:30:05 -0700 (MST)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun Java System Messaging Server 6.2-7.05 (built Sep 5
	2006))
	with ESMTP id <0JRE00G25ZU42920@l-daemon> for linux-lvm@redhat.com; Mon,
	12 Nov 2007 15:30:04 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])	by mail.activenetwerx.com
	(Postfix) with ESMTP id F16D8FD311	for <linux-lvm@redhat.com>; Mon,
	12 Nov 2007 15:30:02 -0700 (MST)
Received: from an-ex.ActiveNetwerx.int (unknown [192.168.5.3])
	by mail.activenetwerx.com (Postfix) with ESMTP id 2CA6EFD2DD	for
	<linux-lvm@redhat.com>; Mon, 12 Nov 2007 15:30:02 -0700 (MST)
Date: Mon, 12 Nov 2007 15:30:00 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Subject: RE: [linux-lvm] Beginner Questions
In-reply-to: <20071112215854.GU22843@agk.fab.redhat.com>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88C@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
References: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
	<20071112215854.GU22843@agk.fab.redhat.com>
Content-Transfer-Encoding: 8bit
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Thanks Alasdair, but where did the ~475 GB's go on the second? Is there some limit on PV size, I can't find anything with Google (Not that I can see 1024GB being a likely figure).

Thanks!
jlc

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Alasdair G Kergon
Sent: Monday, November 12, 2007 2:59 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Beginner Questions

On Mon, Nov 12, 2007 at 02:33:58PM -0700, Joseph L. Casale wrote:
>   PV Size               745.00 GB / not usable 3.67 MB
>   PV Size               1024.00 GB / not usable 8192.00 EB

> Why is some space "not usable"?

Some space is used for LVM metadata; other space is lost as the
remainder when the volume size is divided by the chosen extent size.

Ignore the ridiculous number there - it's been fixed in CVS for the next
release.

Alasdair
--
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
