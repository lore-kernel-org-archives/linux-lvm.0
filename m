Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9JIfq4V020011
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 14:41:52 -0400
Received: from mail-gx0-f221.google.com (mail-gx0-f221.google.com
	[209.85.217.221])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9JIffpw022364
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 14:41:41 -0400
Received: by gxk21 with SMTP id 21so5540795gxk.10
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 11:41:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com> 
	<c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com> 
	<a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com>
From: Drew <drew.kay@gmail.com>
Date: Mon, 19 Oct 2009 11:41:21 -0700
Message-ID: <c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
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
To: Lou Arnold <larnolda1@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

> But I thought that the purpose of LVM was to make a number of partitions
> look like one big one. So I can understand that with an added volume group,
> the filsesystems are separate, but for my (2) below, I expected all LVM-type
> partitions to seen as one large one.

The purpose of LVM is to make a bunch of physical drives look like one
big pool of storage space. A Volume Group is a container into which
you plug physical volumes (drives) so that the logical volumes can
allocate space from the pool (volume group) as needed.

> 1) Why would you want several logical volumes in one volume group?

The same reason(s) you would want to partition a regular hard drive.

Maybe you only want /home to have 20GB so your kids can't flood the
computer with downloaded music. Maybe you want /var/www to have
restricted permissions so your home web server is less vulnerable to
hackers. Maybe you're running a PVR application like MythTV and want a
high-performance filesystem like XFS for storing recorded shows.

All of these can be done with logical volumes, and are often easier under LVM.


> 2) Why would you want several volume groups at all?

You don't need multiple volume groups on a single machine. There are
certain uses though in which it is beneficial, usually in commercial
use.


-- 
Drew

"Nothing in life is to be feared. It is only to be understood."
--Marie Curie
