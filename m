Return-Path: <jweber@valinux.com>
Date: Fri, 26 Jan 2001 03:16:38 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] prepatched kernels?
In-Reply-To: <OFFE4A39D2.71C10BD5-ONC12569E0.002F70E8@zrh.sairgroup.com>
Message-ID: <Pine.LNX.4.30.0101260310320.31316-100000@beefcake.hdqt.valinux.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: clmuelle@atraxis.com

You can try <ftp://ftp.valinux.com/pub/kernel/2.2.18-pre11-va1.8-beta>
which contains tarballs, rpms, and debs of a 2.2.18 kernel with loads of
patches including LVM 0.9.1beta1 and ext3 0.0.5e plus LFS (for largefiles)
and multitudes of others.

This is a beta kernel from VA which is avail on their ftp site, it comes
with no warranties I gather and is use at your own risk.  I use it myself
though, if that makes you feel any better. :)

As far as a ext2 filesystem resizer I use resize2fs which became
available in either e2fstools 1.18 or 1.19 which is avail from sourceforge
(just search for ext2 or e2fs).

On Fri, 26 Jan 2001 clmuelle@atraxis.com wrote:

> Date: Fri, 26 Jan 2001 09:48:36 +0100
> From: clmuelle@atraxis.com
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] prepatched kernels?
>
> Does anybody knows about a site for prepatched kernels 2.2.18 and 2.4.0
> including patches for lvm and filesystems/tools like ext2online, ext3,
> reiserfs, jfs? I heard about HJ Lu's prepatched kernels but can't find a
> webpage for that.
>
> thanks
>
> Claudia
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
