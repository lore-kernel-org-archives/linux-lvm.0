Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B082B2E.A0EB9C96@tls.msk.ru>
Date: Mon, 21 May 2001 00:38:06 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems: reiserfs lvm as /
References: <01051916333601.00791@mama>
Content-Transfer-Encoding: 7bit
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

Peter Kirk wrote:
> 
> Hi,
> 
> I am new to LVM, and I ran into some problems.
> First thing I did, was to setup LVM within the SuSE7.1 setup tools, which
> worked out fine.
> /boot is not on LVM, ext2fs
> swap is not on LVM
> LVM:
>         /       [reiserfs]
>         /usr    [reiserfs]
>         /home   [reiserfs]
> 
> I have too disks, so I set the strip option to two, to get better
> performance. Now I want to compile a new kernel (2.4.4), and I cannot get lvm
> working with it. Since root is on LVM I need to do this lvmcreate_initrd
> stuff, but it does not work ! I get:
> 
> VFS: Mounted root (ext2 file system).
                     ^^^^

What a hell ext2fs does with your reiserfs filesystem??
Do you have compiled reiser as a module or in kernel?
Do you have included and loaded reiserfs from your initrd
if it is a module?
Why in a case when your root is on reiserfs, you included
ext2 in kernel?

Ummm... :)

> attempt to access beyond end of device
> 01:00: rw=0, want=4612, limit=4096

Doh!  Ext2 code should check more carefully if it
mounted (or attempted to) ext2 fs -- what a bizzare,
ext2 code treats reiserfs as ext2fs!..

Regards,
 Michael.
