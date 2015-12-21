Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBLGFeCa019416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2015 11:15:40 -0500
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mx1.redhat.com (Postfix) with ESMTPS id BBF91C0003F5
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2015 16:15:38 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id k189so138846098qkc.0
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2015 08:15:38 -0800 (PST)
Received: from biodora.local ([70.45.27.18]) by smtp.gmail.com with ESMTPSA id
	b6sm12205581qkh.12.2015.12.21.08.15.30 for <linux-lvm@redhat.com>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 08:15:37 -0800 (PST)
Message-ID: <5678252F.2040304@gmail.com>
Date: Mon, 21 Dec 2015 12:13:35 -0400
From: =?windows-1252?Q?Jorge_F=E1bregas?= <jorge.fabregas@gmail.com>
MIME-Version: 1.0
References: <5677F0E5.5050101@gmail.com>
	<20151221125008.GB16946@hex.gsslab.fab.redhat.com>
In-Reply-To: <20151221125008.GB16946@hex.gsslab.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Extend VG - Expand LUN vs New Disk
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
To: linux-lvm@redhat.com

On 12/21/2015 08:50 AM, Bryn M. Reeves wrote:
> Expanding an existing LUN may involve resizing partitions - that is
> normally the step that makes this the more complicated route since
> depending on system configuration and use it may not be easy to resize
> the partition without downtime (the Linux kernel has for some time
> enforced restrictions on resizing in-use partitions - device-mapper
> devices and whole disk devices do not share this limitation).

We use whole disks all the time :)

> It's safe enough - it's just that the kernel generally won't let you
> do it while the existing partition is active and in use.

I'm glad to know that:  one more reason to use whole disks.  I know Red
Hat favors partitions for PVs (as mentioned in various docs) but I've
never been convinced by the arguments for it.


> Expanding an existing partition may be seen as the "cleaner" option,
> since it avoids creating additional PVs and associated labels and
> metadata areas, but unless you are working with very large numbers of
> devices it makes little difference to most operations.

Excellent point.

> Gluing lots of devices together is one of the main reasons for using a
> volume manager and for typical uses it adds no appreciable overhead
> or additional complexity.

Thanks Bryn for your wonderful feedback.  I appreciate it!

All the best,
Jorge
