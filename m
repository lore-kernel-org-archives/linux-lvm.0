Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m49Ec3cb023996
	for <linux-lvm@redhat.com>; Fri, 9 May 2008 10:38:03 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m49EbW0q005777
	for <linux-lvm@redhat.com>; Fri, 9 May 2008 10:37:32 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m49EbQVE020489
	for <linux-lvm@redhat.com>; Fri, 9 May 2008 10:37:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m49EbQ92023324
	for <linux-lvm@redhat.com>; Fri, 9 May 2008 10:37:26 -0400
Date: Fri, 9 May 2008 10:37:26 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] device /dev/sdb1 not found or ignored by filtering
In-Reply-To: <48241070.6020207@saros.fr>
Message-ID: <Pine.LNX.4.44.0805091032200.23258-100000@bmsred.bmsi.com>
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

On Fri, 9 May 2008, Gilles Guiot wrote:

> Hello and thanks for the answer.
> For "political" (indeed) reasons, we can't use the raid 5......

I actually prefer raid1, even though it uses more disks and has slower writes.

1) It is easy to use the mirrors apart from raid for recovery.  For instance, a
   clients motherboard died.  I had him ship me 2 of his 4 disks, from which I
   constructed a clone of his system on new hardware, and shipped it to him.
   He kept the other two as backup.

2) You do get some speedup for reads.

3) Disk space is cheap.

4) You can always use raid0+1 to speed up writes.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
