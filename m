Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1O4TBH3023520
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 23:29:11 -0500
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1O4T8AP009508
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 23:29:08 -0500
Received: by mail-pd0-f176.google.com with SMTP id w10so5772162pde.35
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 20:29:07 -0800 (PST)
Received: from localhost.localdomain
	(99-121-56-32.lightspeed.sntcca.sbcglobal.net. [99.121.56.32])
	by mx.google.com with ESMTPSA id
	db3sm45354606pbb.10.2014.02.23.20.29.06 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 20:29:07 -0800 (PST)
Date: Sun, 23 Feb 2014 20:29:04 -0800
From: Julie Ashworth <ashworth@berkeley.edu>
Message-ID: <20140224042904.GA13974@localhost.localdomain>
References: <20140222071408.GA10598@localhost.localdomain>
	<CAAMCDed94+WJa5Ms9CG+gtxKmfzuWw39yHLD1uj2xXGa89J3ag@mail.gmail.com>
	<20140224031336.GB13829@localhost.localdomain>
	<CAAMCDeeR9QnRp=v724QRfPjtmq29=ZH3kyU0EoN++=0VmL-8HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAMCDeeR9QnRp=v724QRfPjtmq29=ZH3kyU0EoN++=0VmL-8HQ@mail.gmail.com>
Subject: Re: [linux-lvm] LV mirror extents on same physical device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 23-02-2014 21.29 -0600, Roger Heflin wrote:
> This indicates that it "worked" that way on some versions rhel5 but
> does not work that way on rhel6 in a number of versions.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=594525
> 
> I would suspect depending on exactly what version you are using that
> it is a bug.
> 
> I know up to at least 5.7 there are some bad LVM bugs when you are
> doing abnormal things (mirroring, pvmoves with lv with multiple
> extents), there are probably other bugs I don't know about.
> 
> I would suggest unmirroring it, and just doing a straight pvmove to
> the new device, mirroring it in the middle would just appear to
> complicate things.
---end quoted text---

Thank you. 
It's possible to specify where the extents should be located, i.e.

The following command creates a mirrored logical volume with a single mirror. The volume is 500 megabytes in size, it is named mirrorlv, and it is carved out of volume group vg0. The first leg of the mirror is on device /dev/sda1, the second leg of the mirror is on device /dev/sdb1, and the mirror log is on /dev/sdc1. 
lvcreate -L 500M -m1 -n mirrorlv vg0 /dev/sda1 /dev/sdb1 /dev/sdc1
(from http://linux-satya.blogspot.com/2010/09/logical-volume-manager.html)

I regret not doing this. Oh well. At this point, I haven't decided if I should convert to linear LV, or add aother mirror on /dev/md2.

Thanks again for the heads-up about the bug.
best,
Julie
