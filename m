Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5LMPHtF031372
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 18:25:17 -0400
Received: from smtp1.versatel.nl (smtp1.versatel.nl [62.58.50.88])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5LMPBon016663
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 18:25:11 -0400
From: Aad Rijnberg <Aad.Rijnberg@zonnet.nl>
Subject: Re: [linux-lvm] Mounting two logical volumes to the same mount point
Date: Thu, 22 Jun 2006 00:24:53 +0200
References: <200606202107.29948.Aad.Rijnberg@zonnet.nl>
	<20060621082434.GA4570@redhat.com>
In-Reply-To: <20060621082434.GA4570@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606220024.53715.Aad.Rijnberg@zonnet.nl>
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
To: linux-lvm@redhat.com

On Wednesday 21 June 2006 10:24, Heinz Mauelshagen wrote:
> On Tue, Jun 20, 2006 at 09:07:29PM +0200, Aad Rijnberg wrote:
> > Hi,
> >
> > my logical volume that contains /usr appears to be too small. I already
> > removed some applications that I did not need, but it is still on the
> > edge. Now that there are a lot of updates, I get the complaint of yum
> > that there is not enough free space on /usr.
> >
> > I just bought an additional harddisk which I also needed for other
> > purposes, and would like to reserve part of this new drive for extra LVM
> > space. I have just created a new volume group (VolGroup01) on the new
> > drive, and a logical volume (LogVol01) inside that physical volume group.
> >
> > Can I mount both /dev/mapper/VolGroup00-LogVol01 (which contains the /usr
> > data on the "old" drive) and /dev/mapper/VolGroup01-LogVol01 to the /usr
> > mount point? Or can only one logical volume be mounted to a mount point?
>
> Aad,
>
> you can only mount one device with a filesystem on the same mountpoint.
>
> What needs doing in order to grow your logical volume containing the usr
> filesystem, is to *add* the second drive to the existing volume group on
> the first one and grow usr afterwards (LV and FS).
>
> Carry out the follwoing steps (or use system-config-lvm):
>
> lvremove VolGroup01/LogVol01
> vgremove VolGroup01
> vgextend VolGroup00 /dev/sdb # or whatever the drive is
>
> # replace 5G with the capacity you want to add
> lvextend -L+5G VolGroup00/LogVol01
>
> How to grow the FS depends on the type; for ext2/3 you'ld run:
>
> ext2online /dev/VolGroup00/LogVol00
>
Hi Heinz and Georg,

thanks for the clear descriptions.

I performed the operations with the Logical Volume Management tool provided 
with Fedora Core 5 (system-config-lvm), which has an intuitive GUI and now 
my /usr "partition" has grown by 5G. It's as easy as ... ;-)

Thanks for the support!

Aad
