Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5CGQDUH026377
	for <linux-lvm@redhat.com>; Thu, 12 Jun 2008 12:26:13 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5CGQ3m2032382
	for <linux-lvm@redhat.com>; Thu, 12 Jun 2008 12:26:03 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m5CGPv3j013504
	for <linux-lvm@redhat.com>; Thu, 12 Jun 2008 12:25:57 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m5CGPvEm021347
	for <linux-lvm@redhat.com>; Thu, 12 Jun 2008 12:25:57 -0400
Date: Thu, 12 Jun 2008 12:25:57 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Using snapshots for online, incremental userspace
	backup
In-Reply-To: <8a28830e0806111335mf16052amca601c7c7b03c891@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0806121225050.21304-100000@bmsred.bmsi.com>
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

On Wed, 11 Jun 2008, Sharif Ibrahim wrote:

> I'm trying to do incremental backups with LVM by reading the COW
> device from userspace but am having some trouble.

Zumastor does this, and is open source.  Maybe check how they do it.
Their method might not be directly applicable, since they use a new
snapshot format (for shared COW).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
