From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] 2.4.20pre5 CONFIG_BLK_STATS breaks LVM tools
Message-ID: <20020909130011.D15934@sistina.com>
References: <3D77B43B.7000506@domdv.de>
Mime-Version: 1.0
In-Reply-To: <3D77B43B.7000506@domdv.de>; from ast@domdv.de on Thu, Sep 05, 2002 at 09:44:59PM +0200
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
Date: Mon Sep  9 06:28:41 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas,

this is a known issue and I am working on a patch to send to Marcelo.

Try removing the add_gendisk() call (~line 460) in drivers/md/lvm.c and
retry as a workaround for now,

On Thu, Sep 05, 2002 at 09:44:59PM +0200, Andreas Steinmetz wrote:
> If CONFIG_BLK_STATS is enabled in 2.4.20pre5 this breaks at least the
> LVM tools. The symptom on a system running initrd to do vgscan/vgchange
> to be able to boot is that after
> 
> RAMDISK: Compressed image found at block 0
> Freeing initrd memory: 734k freed
> VFS: Mounted root (ext2 filesystem).
> 
> the system hangs with the CPU under load. It is difficult for me to
> investigate this further as both systems I do have available run a
> LVM/reiserfs only setup and thus I can't have a look at the layout of
> /proc/partitions in the CONFIG_BLK_STATS enabled page.
> 
> It would, however, be worth a word of warning in Configure.help that
> this option can break userspace tools that may be important for system
> boot and other system functions.
> -- 
> Andreas Steinmetz
> D.O.M. Datenverarbeitung GmbH
> 
> 
> 
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
