Return-Path: <jkirby@storagecraft.com>
From: "Jamey Kirby" <jkirby@storagecraft.com>
Subject: RE: [linux-lvm] Lost harddrive space
Date: Thu, 12 Apr 2001 10:24:42 -0700
Message-ID: <009301c0c375$75d90240$827ba8c0@CPQ1800>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200104121553.IAA30370@nebulus.tfb.com>
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

Is the driver using CHS or LBA? THis may cause the loss of sectors.

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Erik Rigtorp
> Sent: Thursday, April 12, 2001 8:52 AM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Lost harddrive space
>
>
> Hi!
>
> I have a 60999.46 MB linux lvm partition. But when I pvcreate it and
> pvdisplay /dev/hda2 it says the physical volume is only 56.8GB and 1.03MB
> not used. Where are those lost Gigs? I use the lvm that comes with the
> 2.4.3 kernel.
>
> /Erik
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
