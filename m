Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2ULxet4009206
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 16:59:40 -0500
Received: from mx12.bbn.com (mx12.bbn.com [128.33.0.81])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2ULxb6h023896
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 16:59:39 -0500
Received: from mgillen2.dsl.bbn.com ([128.89.72.74])
	by mx12.bbn.com with esmtp (Exim 4.60)
	(envelope-from <me@mattgillen.net>) id 1FP5As-0007Tj-5N
	for linux-lvm@redhat.com; Thu, 30 Mar 2006 16:59:26 -0500
Message-ID: <442C54BD.8010305@mattgillen.net>
Date: Thu, 30 Mar 2006 16:59:25 -0500
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Accessing volume group on single drive of failed
	raid 1?
References: <200603291138.08104.kmescher@vt.edu>
In-Reply-To: <200603291138.08104.kmescher@vt.edu>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Kevin Mescher wrote:
> Is there a way to access/start up a volume group from a 
> single drive of a failed raid 1?

Sure.  I've done it recently.

> I had a drive fail on my raid 1 array, and I didn't want to 
> have to bring up a md device to be able to access the 
> volume group information. 

Why?  The md device should be perfectly functional with 1 working drive.

> Is there any way to access the 
> individual drives in the array without having to bring it 
> up?

I don't think so, but that's more a RAID question than an LVM one.

Matt
