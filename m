Return-Path: <iain@g7iii.junglelink.co.uk>
Date: Mon, 18 Jun 2001 22:00:49 +0100
From: Iain Young <iain@g7iii.junglelink.co.uk>
Message-ID: <20010618220049.A652@g7iii.junglelink.co.uk>
Mime-Version: 1.0
Subject: [linux-lvm] mount: bad address
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

Hi Everyone,

I have compiled LVM both in the kernel, and as a module. In both cases,
the LVM subsystem works fine...vgcreate...lvcreate...lvextend...vgchange...
mke2fs etc etc.

However when using the module (lvm-mod.o) running the command:

mount /dev/vg01/lvol1 /mnt/tmp

responds with:

mount: bad address

This is with LVM 0.9.1 beta 7, kernel 2.4.6-pre<something>, and also
under 2.4.5-pre1.

I did have a similar problem with SCSI cdrom back in the 2.4.2 days,
but that went away with the next release.

Does anyone know what the cause of this is, and more importantly how
to fix it. I do prefer my kernels to be as modular as possible (I know
some don't, Im wierd TM)


All the Best

Iain
