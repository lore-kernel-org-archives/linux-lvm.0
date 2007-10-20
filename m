Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9KHCEKD032342
	for <linux-lvm@redhat.com>; Sat, 20 Oct 2007 13:12:14 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9KHCDkn021426
	for <linux-lvm@redhat.com>; Sat, 20 Oct 2007 13:12:14 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l9KHC83f029828
	for <linux-lvm@redhat.com>; Sat, 20 Oct 2007 13:12:08 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l9KHC8IH020282
	for <linux-lvm@redhat.com>; Sat, 20 Oct 2007 13:12:08 -0400
Date: Sat, 20 Oct 2007 13:12:08 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] pvmove obliterates filesystem (Opensuse 10.2, x86-64)
In-Reply-To: <4716889A.6020206@mortent.org>
Message-ID: <Pine.LNX.4.44.0710201310330.20210-100000@bmsred.bmsi.com>
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

On Thu, 18 Oct 2007, Morten Torstensen wrote:

>  > [snip pvmove problems]
> 
> This is why, imo, why lvm on linux needs to virtualize PE in lVm... a LV 
> only maps to LE (logical extents) that can themselves be mapped to one 
> or more PEs. Then you can pvmove by adding maps and removing old maps 
> after verifying that the new mapping is ok.

While I come from AIX myself, I was impressed that lvm only obliterated
the LV being moved.  That shows good isolation between LVs.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
