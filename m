Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] NFS
References: <200102271700.f1RH0iE27053@webber.adilger.net>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 02 Mar 2001 10:56:15 +0100
In-Reply-To: <200102271700.f1RH0iE27053@webber.adilger.net>; from Andreas Dilger on Tue, 27 Feb 2001 10:00:44 -0700 (MST)
Message-ID: <m2ofvko5og.fsf@isnogud.escape.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas Dilger <adilger@turbolinux.com> writes:

> No, I've been doing it a long time.  LVM is a block device like a disk,
> while NFS is a filesystem interface.  As long as the filesystem can
> support NFS you are OK.

??  Has a file system to be written so that it supports NFS?  I
thought all file systems beneath the VFS provide the same interface to
the NFS server and can be exported via NFS.

> This limits you pretty much to ext2 or ext3 only, unless you have
> reiserfs with up-to-date patches.

I have also exported iso9660 and msdos file systems on local block
devices via NFS.


urs
