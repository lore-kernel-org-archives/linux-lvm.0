Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9JI4G9B012814
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 14:04:16 -0400
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.211.195])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9JI46d4024831
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 14:04:06 -0400
Received: by ywh33 with SMTP id 33so3950980ywh.23
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 11:04:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
From: Drew <drew.kay@gmail.com>
Date: Mon, 19 Oct 2009 11:03:46 -0700
Message-ID: <c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> 2) I also tried adding the drive to the existing volume group (VolGroup00)
> and created a new logical volume group (LogVol02) for the drive. But again,
> the file browser shows different amounts of free space at root (31GB) vs
> after the mount point of the new drive (/mnt/X2nd40GB) (35 GB). Why does it
> not show 66 GB free no matter what folder I look at?

Free space, from the filesystem perspective, is based on how big the
underlying partition is. In this case you've created two "partitions"
( "/" and "/mnt/X2nd40GB") and now the free space is being reported
based on which partition the folder you're looking at resides in.

As an example, if I create a "partitioning" scheme in LVM (VolGroup01)
that mounts logical volumes at the following directories:

/ - 8GB/3GB free [LogVolRoot]
/home - 20GB/15GB free [LogVolHome]
/var - 5GB/1GB free [LogVolVar]

If I'm sitting in /home/andrew/mystuff the filesystem (LogVolHome)
will report I have say 15GB free. If I then move over to /var/www and
do the same there, I may only get 1GB reported free. This is because
free space is calculated based on which Logical Volume/filesystem I'm
sitting in at the time.

-- 
Drew

"Nothing in life is to be feared. It is only to be understood."
--Marie Curie
