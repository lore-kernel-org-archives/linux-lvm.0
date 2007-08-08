Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l78J3jM0030966
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2007 15:03:45 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l78J3huD005157
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2007 15:03:43 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l78J3cW2021025
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2007 15:03:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l78J3cBC023245
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2007 15:03:38 -0400
Date: Wed, 8 Aug 2007 15:03:38 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Best practice: metadata backup
In-Reply-To: <20070807213412.GC2064@agk.fab.redhat.com>
Message-ID: <Pine.LNX.4.44.0708081447350.23150-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 7 Aug 2007, Alasdair G Kergon wrote:

> There are already copies (and backups of previous copies) on each physical
> volume (in the default configuration) and there's an automated process to deal
> with simple problems like power failure during a metadata update leading to
> disagreement between the copies.

That's good.  But I've been lurking and noticed that when things
go disastrously wrong, and some poor admin posts here hoping for a miracle,
the key to the miracle is having a copy of the LVM metadata somewhere for
use with vgcfgrestore.  Apparently, the PV copies are not enough for
current tools to allow recovery from some situations.

I wish I could take a sabbatical and spend a year setting up VGs,
breaking them in evil ways, and fixing the tools to intelligently
recover.  Given the nature of open source, OSS friendly employers should
offer sabbaticals for developers, like clergy and academics get.  A year
every 7 years to work full-time on whatever project (hardware or
software related) grabs their interest.

Certainly, automatically bringing all remaining LVs online after
PV failure is a must.

I've always been interested in data storage that can recover from
disaster.  I designed a database filesystem that stores a table id
in every block, so that usable tables and directories can be recovered
regardless of what portion of the filesystem is wiped out (missing records,
of course).  It has saved our customers butt several times ("No, we don't
know where the backup tapes have gone...we took them offsite like you said.
You didn't say anything about bringing them back.").

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
