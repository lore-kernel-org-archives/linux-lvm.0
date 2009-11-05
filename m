Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA5KWvpl026859
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 15:32:57 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA5KWvYw010853
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 15:32:57 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nA5KWUFb030824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 15:32:38 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nA5KWSgp014673
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 15:32:29 -0500
Date: Thu, 5 Nov 2009 15:32:28 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] PFree is 0 on a drive with nothing on it
In-Reply-To: <20091105195217.GA20934@us.ibm.com>
Message-ID: <Pine.LNX.4.64.0911051526340.14554@bmsred.bmsi.com>
References: <1257433818.17792.30@raydesk1.bettercgi.com>
	<E6AFA4E4-A03C-4D1D-8A78-5DF2110EFA2E@gmail.com>
	<1257436528.17792.32@raydesk1.bettercgi.com>
	<896EDE05-E939-4C70-9513-5805DB864BD4@gmail.com>
	<Pine.LNX.4.64.0911051412100.13658@bmsred.bmsi.com>
	<20091105195217.GA20934@us.ibm.com>
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

On Thu, 5 Nov 2009, malahal@us.ibm.com wrote:

> Stuart D. Gathman [stuart@bmsi.com] wrote:
> > If you want an integrated LVM/filesystem, then you should look
> > at OpenSolaris and ZFS.  There are some advantages to this approach,
> > but it does mean that you have only one filesystem choice.
> 
> BTRFS is planning on doing similar things, in case you are not planning
> on jumping to Solaris yet. Stuart is right, you will be restricted to a
> single file system though.

Eventually, it might be possible to support arbitrary filesystems that
implement an API with operations like:

 o report extents that could be freed by an online resize
 o report extents that could be freed by an offline resize
 o online resize
 o offline resize

A filesystem could even return failure for resize operations, and the
filesystem aware LVM would then know it can't get free blocks from that
filesystem (which might result in an error message if it can't get them
from anywhere else either).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
