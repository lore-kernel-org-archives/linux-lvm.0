Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B1A81A9.9D378419@tls.msk.ru>
Date: Sun, 03 Jun 2001 22:27:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
References: <NBBBKLKHMJHIJLHOGAOJEEAMIPAA.steve.wray@the.net.nz>
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

Steve Wray wrote:
[]
> > Perhaps just like LVM has a nice little script for creating the
> > initrd, they can ship with a nice little script for creating root/boot
> > diskettes.
> 
> Yes and I hope the mkinitrd (whatever its called...) is fixed so that
> it copies sed to the ramdrive...

Hey, sed should NOT be here.  Initrd exeists for exactly ONE version of
kernel, so you know what IOP that kernel uses and what usertools should
be placed to initrd BEFORE doing initrd, and sed can/should be used only
at initrd creation stage.  Idea: why not put to initrd ALL modules for
ALL kernels your system have, and update it each time you add a new
kernel to your system? ;)

Regards,
 Michael.
