Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0K9IkFp006524
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 04:18:46 -0500
Received: from buexe.b-5.de (buexe.b-5.de [84.19.0.30])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0K9IRhP020856
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 04:18:28 -0500
Received: from alanya.lupe-christoph.de (alanya.lupe-christoph.de
	[172.17.0.19])
	by buexe.b-5.de (8.13.8/8.13.8/b-5/buexe-3.6.3) with ESMTP id
	n0K9IQFW005245
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 10:18:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by alanya.lupe-christoph.de (Postfix) with ESMTP id 50B1E2C1EA
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 10:18:21 +0100 (CET)
Received: from alanya.lupe-christoph.de ([127.0.0.1])
	by localhost (alanya.lupe-christoph.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dZk3kBSAA9zQ for <linux-lvm@redhat.com>;
	Tue, 20 Jan 2009 10:18:20 +0100 (CET)
Date: Tue, 20 Jan 2009 10:18:20 +0100
From: Lupe Christoph <lupe@lupe-christoph.de>
Subject: Re: [linux-lvm] 2GB limit
Message-ID: <20090120091820.GR21131@lupe-christoph.de>
References: <4975932A.6090902@bortal.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4975932A.6090902@bortal.de>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tuesday, 2009-01-20 at 10:02:34 +0100, ml@bortal.de wrote:

> i have a 32bit Linux box with a 3Ware Raidcontroller and 4x 1TB disks.  
> After installing Debian Etch i had to find out that i am running into  
> some limits.

> Is there a way to use a Partition >2GB with 32Linux/LVM?

There is no problem creating partitions larger than 2 GB, up to 2 TB :-P

The old-style disk partitioning has no room for larger values. If you
don't need the old-style MBR (e.g. for booting), use an EFI label.

Here is an article about the whole stuff:
http://www.cyberciti.biz/tips/fdisk-unable-to-create-partition-greater-2tb.html

HTH,
Lupe Christoph
-- 
| There is no substitute for bad design except worse design.                   |
| /me                                                                          |
