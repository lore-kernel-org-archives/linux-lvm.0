From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] / on LVM2
Message-ID: <20021209120102.D18845@sistina.com>
References: <200212062032.11584.mweiss@grenoble.cnrs.fr>
Mime-Version: 1.0
In-Reply-To: <200212062032.11584.mweiss@grenoble.cnrs.fr>; from mweiss@grenoble.cnrs.fr on Fri, Dec 06, 2002 at 08:32:11PM +0100
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
Date: Mon Dec  9 05:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Markus,

we don't support root on LVM2 yet :(

On SuSE what you want to do that still _and_ have an LVM2/device-mapper
emergency boot media at hand if something goe wrong it goes along
these (untested!) lines:

- have device-mapper and LVM2 tools installed

- in case you want to go with the device-mapper module:
  - add dm-mod to your /etc/sysconfig/kernel
  - build/install a kernel qith dm-mod
  - run mkinitrd

- add "modprobe dm-mod" etc. to the created initrd:
  - gzip -dc /boot/initrd>initrd.wrk
  - mount -oloop /boot/initrd.wrk /mnt
  - echo -e "lvm vgscan\nlvm vgchange -ay" >> /mnt/linuxrc
  - cp -p /sbin/lvm /mnt/sbin
  - cp -sp /lib/libdevmapper* /mnt/lib
  - umount /boot/initrd.qrk
  - gzip -c /boot/initrd.wrk>/boot/initrd
  - lilo
  - rm /boot/initrd.wrk

On Fri, Dec 06, 2002 at 08:32:11PM +0100, Markus Weiss wrote:
> 
> Hello everbody,
> 
> I ran into a problem testing LVM2 on my system.
> I have / on LVM, and booting into kernel 2.5.50 (with dm compiled in,
> libdevmapper and LVM2-tools installed) fails, because the kernel cannot mount 
> the root fs. I have tried building an initrd using SuSE's mk_initrd and 
> lvmcreate_initrd, but I get the same problem.
> 
> Do these scripts have to be modified in any way to work with LVM2 ?
> (something like calling devmap_mknod.sh at some point ?)
> 
> Thanks for any advice,
> 
> Markus
> 
> PS:
> Please cc me, as I'm not subscribed
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
