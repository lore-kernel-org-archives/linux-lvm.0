Return-Path: <jeffrey.b.layton@lmco.com>
Date: Thu, 24 May 2001 13:17:13 -0400
From: Jeffrey B Layton <jeffrey.b.layton@lmco.com>
Subject: Re: [linux-lvm] Problem createing Logical Volumes
Message-id: <3B0D4219.DFA77222@lmco.com>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <3B0D322A.7037368A@lmco.com>
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
To: linux-lvm@sistina.com

I found the trouble (user error of course). I was trying to stripe
across 5 new disks and a partition of a sixth one (only 2.5G of
17G). Oops, forgot to think before I typed.

Jeff



Jeffrey B Layton wrote:

> Hello,
>
>    I've got a 2.2.19 with Beta6 kernel. I've got 6 SCSI disks
> that I'm trying to setup as logical group and then divide
> into logical volumes.
>    I've created all the pv's correctly and the vg (vg01). It
> says that I have the following:
>
> Total PE: 22396
> Free PE: 22396/87.48GB
>
> So I tried to create a 70G logical volume,
>
> lvcreate -i6 -I4 -L70G -nlvol1 -v /dev/vg01
>
> (this corresponds to 17922 PE's). It fails with the following:
>
> not enough allocatble/free physical volume space in "vg01"
> please check if physical volumes are allocatable
>
>    I checked all the pv's and they are allocatable. What should
> I look at next? I'm kind of stuck.
>
> TIA,
>
> Jeff Layton
>
> Lockheed-Martin
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
