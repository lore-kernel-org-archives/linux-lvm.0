Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l77Ku9Pp026001
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 16:56:09 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l77Ku77F025888
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 16:56:07 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l77Ku2Au016343
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 16:56:02 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l77Ku1Ks017338
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 16:56:02 -0400
Date: Tue, 7 Aug 2007 16:56:01 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Best practice: metadata backup
In-Reply-To: <20070807190153.GV2064@agk.fab.redhat.com>
Message-ID: <Pine.LNX.4.44.0708071653390.17321-100000@bmsred.bmsi.com>
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

> > When grub supports LVM, and the entire disk is LVM (no partition table),
> > how will backups be made?  
> 
> Just like any other file backups - tape, CD, internet: you choose!

I meant metadata backups.  AIX keeps a copy on each physical volume
(using quorum to ensure a majority of the copies agree).  I was wondering
how linux LVM would handle metadata backup on an all LVM system.  Seems
like you would still need a small non LVM filesystem just for that.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
