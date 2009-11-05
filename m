Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA5JODkP004014
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:24:13 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA5JO22e005092
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:24:03 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nA5JO10U028194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:24:01 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nA5JO1fi013984
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:24:01 -0500
Date: Thu, 5 Nov 2009 14:24:01 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] PFree is 0 on a drive with nothing on it
In-Reply-To: <896EDE05-E939-4C70-9513-5805DB864BD4@gmail.com>
Message-ID: <Pine.LNX.4.64.0911051412100.13658@bmsred.bmsi.com>
References: <1257433818.17792.30@raydesk1.bettercgi.com>
	<E6AFA4E4-A03C-4D1D-8A78-5DF2110EFA2E@gmail.com>
	<1257436528.17792.32@raydesk1.bettercgi.com>
	<896EDE05-E939-4C70-9513-5805DB864BD4@gmail.com>
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

On Thu, 5 Nov 2009, Adam Mooz wrote:

> That is correct.  All drives are part of 'fileshare/lv_fileshare', which only
> has 400GB of data on it at the moment; which I can see reflected in the PFREE
> columns of the PVS output.  Is there an easy way to force the LVM to rescan
> it's allocation unit or would I have to remove the drives and re-insert them
> into the LVM?

It doesn't matter how much space is free in whatever filesystem you 
made on top of lv_fileshare.  The LVM extents are allocated to that 
LV.  LVM doesn't care what you do with the LV after that.  It certainly
doesn't know about all the dozens of different kinds of filesystems you 
might put on the LV.

You could shrink the filesystem, then lvreduce the LV and allocate the
LVM extents to something else.  With most filesystems, you have to
unmount before shrinking - but a few support online shrinking.  (Many more
support online growing.)  You didn't mention what filesystem.

LVM is a block device layer that abstracts block devices so that filesystems
and stuff above the LVM layer don't care about physical drive allocation.

Many of us like this abstraction.  I don't *want* LVM to know anything
about filesystems.  I even have my own database filesystem that can run
on top of an LV.  LVM *should* support things like mirroring
and ordering of block writes to multiple physical devices - but it should never
care about specific filesystems.

If you want an integrated LVM/filesystem, then you should look
at OpenSolaris and ZFS.  There are some advantages to this approach,
but it does mean that you have only one filesystem choice.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
