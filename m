Return-Path: <raheesom@navpoint.com>
Subject: Re: [linux-lvm] Converting my Root file system to LVM
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <990547328.1133.1.camel@localhost>
References: <990547328.1133.1.camel@localhost>
Date: 22 May 2001 12:22:05 -0400
Message-Id: <990548531.1134.2.camel@localhost>
Mime-Version: 1.0
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

Having looked at another thread also with Root boot problems, I've had a
look at my kernel (2.4.3) .config file options for the initrd.  Since my
lilo.conf file has the RAM disk size set to 8192, would the kernel
setting (4096) get in the way of this?

CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_BLK_DEV_INITRD=y


On 22 May 2001 12:02:03 -0400, Rupert Heesom wrote:
> I've been practicing LVM techniques on a spare 2nd disk which I'm adding
> to my root file system using LVM.  I think I've got the hang of how LVs,
> PVs, and VGs work.

> 
> Now, when I boot up into the LVM partition, I get the following error
> msgs -
> 
> lvm - Module successfully initialised.
> /sbin/vgscan: sed: command not found.
> /sbin/vgscan: /lib/lvm-iop10/: is a directory
> /sbin/vgscan: exec: /lib/lvm-iop10/: cannot execute:  permission denied.
> 
> /sbin/vgchange:  <same msgs>
> 
> Obviously the kernel can't find the LVM tools.  Would these not be
> included in the lvm initrd?  If they are, and the kernel still can't
> find them, what do I change so that the kernel CAN find the LVM tools?

-- 
regs
rupert
