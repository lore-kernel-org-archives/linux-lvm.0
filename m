Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3TE2VB8013063
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 10:02:31 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3TE1xH8027985
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 10:02:00 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m3TE1rKj023023
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 10:01:53 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m3TE1rEL007069
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 10:01:53 -0400
Date: Tue, 29 Apr 2008 10:01:53 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM mirroring questions...
In-Reply-To: <4816F5B1.6010608@mortent.org>
Message-ID: <Pine.LNX.4.44.0804290941010.6839-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 29 Apr 2008, Morten Torstensen wrote:

> Marcin Ka�u�a wrote:
> > Why software RAID is not an option? It works with partitions as well as with
> > whole disks (actually it doesn't care what it is working on as long as it's
> > a block device)
> 
> Because doing mirroring in the LVM is much easier as you don't have to 
> set up the md layer. Simple LE to multiple PE mapping is easy to do and 
> makes LVM mirroring easy and flexible.

Using md with LVM was a work around for LVM mirroring not being available /
reliable at first.  With LVM, you can mirror some LV and not others.
For instance, a /work LV used only for software builds might not get mirrored.
(If the underlying PV crashes, the build gets interrupted, but you just
start over after replacing the disk.)

With md, fully taking advantage of new disks added to the system often
requires repartitioning and solving knapsack problems (moving partitions
can take place online with live filesystem using md).  With LVM, 
many equal sized PE make this automatic.  (Although the write intent
table needs a 3rd drive.)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
