Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0KETM129613
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 09:29:22 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0KETLnQ010195
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 09:29:22 -0500
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id E5B7924FB0
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 07:29:15 -0700 (MST)
Date: Fri, 20 Jan 2006 07:29:14 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] LVM on Raid-5 woes...
Message-ID: <53D60533C1E27D68FBAF212F@dhcp-2-206.wgops.com>
In-Reply-To: <43D0C66C.3040609@gmx.net>
References: <43D0C66C.3040609@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



--On January 20, 2006 12:15:56 PM +0100 Fabian Wenzel <f.wenzel@gmx.net> 
wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hello there!
>
> Currently I am trying to set up LVM on top of RAID-5. I am using Kernel
> 2.6.12.2, device-mapper 1.01.04-r2 and lvm2 2.01.15-r1 on an NSLU2 (big
> endian ARM) with three USB hard disks connected (two via a hub).
>
> My problem is that I cannot create any volume groups; even physical
> volumes cause trouble: After typing

Oh also, do the drives work fine by themselves?  IE remove MD RAID fromt eh 
picture completely temporarily, can you pvcreate directly on the devices?
