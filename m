Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8HErIHa002725
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 10:53:18 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6CA4B6F4D
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 14:53:15 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 0CFD1A6807
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 16:53:16 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 17 Sep 2016 16:53:14 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <8340e33605f0a84b10ed1d626cfecfbe@dds.nl>
References: <368387847.156920.1474117496841.ref@mail.yahoo.com>
	<368387847.156920.1474117496841@mail.yahoo.com>
	<8340e33605f0a84b10ed1d626cfecfbe@dds.nl>
Message-ID: <8ebe6d1f9dc01bf7bfa843d8dcf3a0b8@dds.nl>
Subject: Re: [linux-lvm] creating DD copies of disks
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Xen schreef op 17-09-2016 16:16:

> I just won't be able to use the old system until I change it back.
> Time to test, isn't it.

Indeed both Linux and Windows have no issues with the new disk, I think.

I was making a backup onto a bigger-sized disk, but neither Windows nor 
Linux have an issue with it. They just see the old partition table of 
the old disk and are fine with that.

Now I only need to know if the Linux system will run with the new disk, 
but I'm sure there won't be issues there now. The system is not actually 
*on* that disk.

Call it a data disk for an SSD system.

So perhaps you can see why I would want to have the two disks loaded at 
the same time:

- if they work, I can copy data even after the DD (perhaps, to make some 
rsync copy as you indicate) but now I already have all the required 
structures (partition tables...) without any work.

- I wasn't actually yet done with the old disk. This was also just 
research. Better make a backup first before you finalize things. I want 
to do more work on the "old" system before I finalize things. But having 
a backup sitting there that I can use is a plus. Having to not be able 
to use both disks at the same time is a huge detriment. It is also not 
that hard now to change the system back but I still don't know how I can 
manually change the UUIDs that a VG/LV references. It is a huge plus if 
I can just exchange one PV with another at will.
