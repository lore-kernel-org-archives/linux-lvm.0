Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1R9kMbs006462
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2013 04:46:22 -0500
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1R9kKet008671
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2013 04:46:21 -0500
Received: by mail-wi0-f180.google.com with SMTP id hi8so383984wib.1
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2013 01:46:20 -0800 (PST)
Message-ID: <512DD5E8.6020109@gmail.com>
Date: Wed, 27 Feb 2013 10:46:16 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CAEZ+n-hGcgRPvc+Rx1co3G_Bd-n8mC+5LUhdkSqiz9PRdtt27Q@mail.gmail.com>
In-Reply-To: <CAEZ+n-hGcgRPvc+Rx1co3G_Bd-n8mC+5LUhdkSqiz9PRdtt27Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How does LVM-Cache work?
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Leo Antonio <heiligerstein@gmail.com>

Dne 26.2.2013 19:44, Leo Antonio napsal(a):
> Hello, everyone.
>
> I'm willing to do research about second-level cache using SSDs and I think
> that the best way to do this is using LVM/Device Mapper, because other
> implementations are based on FUSE, virtualization layers, and others.
>
> What I'm trying to do is to develop a subsystem that will put hot blocks/PEs
> on SSDs-Cache, as well as group related blocks/PEs on cache automatically. Not
> simply put on SSD the most  used files or directories.
>
> The problem is that I could not find any documentation about DM or LVM to help
> my research and development.
>
> Could you point me to some documentation or what's the best way to accomplish
> this?

Look for all-caches branch for dm-cache target:
https://github.com/jthornber/linux-2.6/branches

My assumption is - it's most probably already developed and on its way for 
upstream inclusion.

Zdenek
