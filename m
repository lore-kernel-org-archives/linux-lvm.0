Return-Path: <root@srv.sistina.com>
Date: Mon, 9 Jul 2001 09:58:34 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvscan - - invalid i/o protocol version
Message-ID: <20010709095834.A12405@sistina.com>
References: <F2153oryKFRJrzdDW6l00000349@hotmail.com>
Mime-Version: 1.0
In-Reply-To: <F2153oryKFRJrzdDW6l00000349@hotmail.com>; from pascal_heger@hotmail.com on Sun, Jul 08, 2001 at 01:34:23PM +0200
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

On Sun, Jul 08, 2001 at 01:34:23PM +0200, Pascal Heger wrote:
> Hi,
> 
> I'm new to LVM, and desperate to get it working on a 3 disk linux box.
> I'm running Kernel version 2.4.6, and installed the binary 'RedHat' version 
> 8.1 of LVM.
> I have compiled the kernel with LVM as a module, and everything seems to 
> work fine at bootup (/proc/lvm is there).
> The module is loaded at bootup, and i put the vgscan and vgchange scripts in 
> rc.sysinit.
> 
> I have changed the partition type of hdb, and hdc to 0x8e. But when i try to 
> run pvcreate /dev/hdb1 i get:
> 
> pvcreate - - ERROR: "/etc/lvmtab" doesn't exist; please run vgscan.
> 
> And when i run vgscan:
> 
> vgscan - - invalid i/o protocol version
> 
> What did i do wrong? Did i install the wrong version of LVM?
> Any help will be greatly appreciated.

You don't have the driver in your kernel.

Check in your kernel configuration if LVM is activated.

In case you've got the driver as a module, you need to load it manually or
preferably have it loaded by kmod. Maybe your modules.conf doesn't cover
the LVM module load?


> 
> Pascal.
> _________________________________________________________________________
> Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
