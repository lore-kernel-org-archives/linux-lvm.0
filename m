Received: from [10.32.10.85] (vpn-10-85.str.redhat.com [10.32.10.85])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n18DvSS3011038
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2009 08:57:29 -0500
Message-ID: <498EE4C7.8020407@redhat.com>
Date: Sun, 08 Feb 2009 14:57:27 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't mount or access Logical Volume (LV)
References: <9b08fe090902080346i4d6ff602td9abf882adda1067@mail.gmail.com>
In-Reply-To: <9b08fe090902080346i4d6ff602td9abf882adda1067@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Glenn Everette wrote:
> I'm using OpenSuSe 11.1. The LV was initially created on a 10.3 with one
> drive and extended to two drives. I've moved the physical volume into
> and out of various linux distros with no problem. Now the Logical Volume
> does not show up in any partitioning tool or any Linux distro.
...
> vault {
>         id = "4LIF0K-KJQl-JtpG-bRTv-YoSA-18Zz-kwKIoy"
>         seqno = 6
>         status = ["EXPORTED", "RESIZEABLE", "READ", "WRITE"]
...

> omni:~ # lvs --all --debug --verbose
>     Finding all logical volumes
>   Volume group vault is exported

Your VG is apparently marked as exported (see man for vgexport/vgimport)

Try 

vgimport vault
vgchange -a y vault


Milan
--
mbroz@redhat.com
