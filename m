Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9Id3Px020854
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 13:39:03 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9IcnUG001528
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 13:38:49 -0500
Date: Tue, 9 Dec 2008 13:38:46 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] shift PV from disk to raid device?
In-Reply-To: <VA.000034f4.0456d5b7@news.conactive.com>
Message-ID: <Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com>
	<493EB3A0.6020306@redhat.com> <VA.000034f4.0456d5b7@news.conactive.com>
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
To: maillists@conactive.com, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 9 Dec 2008, Kai Schaetzl wrote:

> 
> how could I confirm that? pvs? No, it gives me:
> 
>   Found duplicate PV cs0HTBNIjwhdDD2fd6wvHTzAN61x8aWD: using /dev/sdb3 not 
> /dev/sda3
>   PV         VG   Fmt  Attr PSize   PFree
>   /dev/sdb3  dom0 lvm2 a-   456.34G 350.34G

Yes, there is a problem.  (Keep checking and double checking the procedure
before executing.)  You need to know which device, (sda3, sdb3, md2), LVM is
actually writing to.  

Here is what I think you did:

1) create md2 from sda3 and sdb3
2) pvcreate md2
3) add sda3 to VG - LVM complains about dup and uses sdb3 instead

If LVM is current actually using sdb3, then you need to remove *sdb3* from md2,
and pvmove the data to md2 (which will now have only sda3).

Let's try again:

0.5) backup
1) remove the partition LVM is writing to (sdb3) from md2 (otherwise all
   writes to md2 will scribble on both),
2) pvremove md2 (which hopefully does *not* contain the device LVM is
   putting your data on) to erase duplicate metadata (or use dd - maybe
   pvremove gets confused with dups)
3) pvcreate md2 and add to VG
4) pvmove data from sdb3 to md2
5) reduce sdb3 from VG
6) add sdb3 to md2 and sync

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
