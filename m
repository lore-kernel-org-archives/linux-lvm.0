Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9IE4YaO013182
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 10:04:34 -0400
Received: from mail.mhnet.de
	(213-146-240-5.int0b.skypoint_232-41.pforzheim.skytron.de
	[213.146.240.5])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9IE4WvP025467
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 10:04:33 -0400
Received: from mail.mhnet.de (localhost [127.0.0.1])
	by mail.mhnet.de (Postfix) with ESMTP id 3093C66D17
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 16:04:26 +0200 (CEST)
Date: Wed, 18 Oct 2006 16:04:25 +0200
From: Micha Holzmann <holzmann@gmx.de>
Subject: Re: [linux-lvm] pvcreate succeeds but vgcreate cannot read label
Message-ID: <20061018140425.GA10885@mail.mhnet.de>
References: <Pine.LNX.4.64.0610181348420.15257@saturn.retrosnub.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0610181348420.15257@saturn.retrosnub.co.uk>
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

Hi Malcolm,

Quoting Malcolm Scott:
> When I run pvcreate on a partition, it seems the PV label is successfully 
> written to the partition, but vgcreate cannot then read this label in order 
> to incorporate this new PV into a new VG.
> 
> mas90@neptune ~ $ sudo pvcreate /dev/hda6
>    Physical volume "/dev/hda6" successfully created
> 
> mas90@neptune ~ $ sudo vgcreate neptune_vg /dev/hda6
>    No physical volume label read from /dev/hda6
>    /dev/hda6 not identified as an existing physical volume
>    Unable to add physical volume '/dev/hda6' to volume group 'neptune_vg'.
> 
> What could cause this?
> 
> The system is running Ubuntu Edgy, with the following versions:

i assume that you have the standard installation. Having this, you have
evms installed. So will need to use /dev/evms/hdax. Please check this.

Best regards,
Micha Holzmann

-- 
Wie sagen Informatiker zu Dauerregen? "Caps Lock", Shift die ganze Zeit
