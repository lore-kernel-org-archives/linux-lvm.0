Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Problems: reiserfs lvm as /
Date: Wed, 23 May 2001 10:52:44 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJCEMHIOAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3B0A7045.6393BC58@in.tum.de>
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

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> 
> > Could anybody tell me which Options are Required
> > for Initial Ram Disk (initrd) support ??
> >
> 
> well,
> RAM disk support = y
> Initrd = y
> ramdisk_size = ....
> <filesystem_of_initrd>-support = y
> 
> That would be enough....

Not quite. The initial ramdisk has to be either
ext2 or minix filesystem so one of these needs to be
compiled in.

Also I don't think that ramdisk_size has to be compiled in.
