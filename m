Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 13 Feb 2001 16:09:22 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM with devfs questions and patches
Message-ID: <20010213160922.G556@tykepenguin.com>
References: <20010212205229.A3375@trez42.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010212205229.A3375@trez42.net>; from ben@trez42.net on Mon, Feb 12, 2001 at 08:52:29PM +0100
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 12, 2001 at 08:52:29PM +0100, Benoit Gaussen wrote:
> Hi,
> 
> I'm running LVM 0.9.1_beta2 from kernel 2.4.1 with devfs and I had some little
> troubles, all related to /dev entries and devfs registration :
> 
> - another trouble I had, and I saw some people here had the same, is the
>   'devfs_register(): device already registered: "group"' message while doing
>   vgchange.
>   I did not find an=y answer about the cause of it. So I looked at the code
>   of vgchange and discovered that the /dev/vg0 and /dev/vg0/group are created
>   by mkdir and mknod (in the function vg_create_dir_and_group() ).
>   So when the kernel code tries to register the group device, the devfs code
>   finds it, since it was already registered by doing the mknod.
>   I understand the group device must exist since the VG_CREATE ioctl uses its
>   minor to select the VG to create. But since the minor is based on
>   vg->vg_number, and the vg structure is passed as argument to the VG_CREATE
>   ioctl, why not using vg->vg_number to select the VG ?
>   So we could open /dev/lvm to do the VG_CREATE ioctl instead of using
>   /dev/vg0/group ?  
> 

Thanks for those, I've reworked them a little but the effect should be the same.

patrick
