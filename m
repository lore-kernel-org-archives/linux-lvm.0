Message-ID: <3FE357AA.6090305@alteeve.com>
From: Madison Kelly <linux@alteeve.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Ext3 -> ReiserFS on '/' convertion prob
References: <3FE2892B.8000506@alteeve.com>	 <1071846372.22613.2.camel@gecko.indygecko.com>	 <3FE32D1A.6040500@alteeve.com> <1071857908.22615.13.camel@gecko.indygecko.com>
In-Reply-To: <1071857908.22615.13.camel@gecko.indygecko.com>
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
Date: Fri Dec 19 13:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Time for me to feel really foolish... I am trying to do just this from 
'/' but I am getting a "Device or resource busy" error... '/proc' is 
mounted off of root already... I tried continuing on and it seemed to 
have worked anyway though it threw a LOT of:

depmod: *** Unresolved symbol in 
/lib/modules/2.4.22-1.2115.nptl/unsupported/<dir/file>

The rest seemed fine and I made the entry into grub.conf pointing to the 
new boot image. I ams till getting a kernel panic now but it no longer 
seems to have anything to do with LVM, simply it is -still- looking for 
an ext3 partition and obviously failing to find it.

Is there an LV, LVM, VG or PV command I need to issue to tell the system 
that the filesystem is now resierfs? As I mentioned, I have edited 
'/etc/fstab', '/etc/mtab' and '/etc/blkid.tab' to reflect the changes. 
What am I missing? Gah! I feel like I am so close yet so far!

Madison

Jord Tanner wrote:
> Don't do any symlinking, instead try this:
> 
>         sh-2.05b# mount -t proc proc /mnt/sysimage/proc
>         sh-2.05b# chroot /mnt/sysimage /bin/bash
>         sh-2.05b# source /etc/profile
>         [root@hostname /]# lvmcreate_initrd
>         [root@hostname /]# exit
>         sh-2.05b# umount /mnt/sysimage/proc
>         sh-2.05b# shutdown -r now
>         
> You may have more success. I think the reason you were getting errors is
> that lvmcreate_initrd assumes that your system file tree starts at /,
> not at /mnt/sysimage. You were able to fool it somewhat with symlinking,
> but the real solution is to chroot to the real /, then run
> lvmcreate_initrd. As always YMMV.
> 
