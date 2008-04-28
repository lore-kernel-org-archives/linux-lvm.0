Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3SGhmJn024248
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:43:48 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3SGhcmZ015641
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:43:38 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m3SGhWtr001567
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:43:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m3SGhWb0032372
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:43:32 -0400
Date: Mon, 28 Apr 2008 12:43:32 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] How to move /usr from LVM back to non-LVM?
In-Reply-To: <4815FA96.1090302@Media-Brokers.com>
Message-ID: <Pine.LNX.4.44.0804281239560.32095-100000@bmsred.bmsi.com>
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

On Mon, 28 Apr 2008, Charles Marcus wrote:

> On 4/28/2008, Georges Giralt (georges.giralt@free.fr) wrote:
> > But some people will question the reason you will move from LVM to 
> > plain filesystem/partitioning.... 
> 
> Good point... and maybe my reason is not a 'good one'... ;)
> 
> My thinking is, since /usr is a critical system partition, it should be 
> on the main system drive - which I always set up as a simple 2 drive mirror.

I made that mistake on one system.

> So, I'm now curious how/what other people generally use LVM for?

And now I regret it because I can't use snapshots to take backups
of the system.  The only drawback to LVM is that initrd is trickier.
And a good LiveCD makes it possible to recover from boot problems -
even remotely. 

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
