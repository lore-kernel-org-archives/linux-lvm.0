Return-Path: <thornber@btconnect.com>
Date: Mon, 23 Apr 2001 14:19:36 +0100
Subject: Re: [linux-lvm] Re: linux-lvm digest, Vol 1 #136 - 14 msgs
Message-ID: <20010423141936.A1405@66bassett.freeserve.co.uk>
References: <200104231048.f3NAm3715005@pigpen.bl.physik.uni-muenchen.de> <3AE41D86.9CC5363@Physik.Uni-Muenchen.DE>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3AE41D86.9CC5363@Physik.Uni-Muenchen.DE>; from Klaus.Steinberger@Physik.Uni-Muenchen.DE on Mon, Apr 23, 2001 at 02:18:14PM +0200
From: Joe Thornber <thornber@btconnect.com>
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

> There is one little change necessary, which is not obvious from the
> patches:
> 
> In drivers/block/md.c:
> 
> int md_make_request (struct buffer_head * bh, int rw)
> {
>         int err;
>         mddev_t *mddev = kdev_to_mddev(bh->b_dev);
>                                            ^^^^^  Change this to b_rdev

This change to md.c is in my generic-map-raid-2.2.19-A1 patch, along
with another which is certainly needed.

- Joe
