Return-Path: <root@srv.sistina.com>
Date: Tue, 17 Jul 2001 13:20:15 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Strtup probs !
Message-ID: <20010717132015.B17345@sistina.com>
References: <OE52FqgyThYTrRviCij00004c76@hotmail.com>
Mime-Version: 1.0
In-Reply-To: <OE52FqgyThYTrRviCij00004c76@hotmail.com>; from ahiam@hotmail.com on Tue, Jul 17, 2001 at 06:20:34AM +0530
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

On Tue, Jul 17, 2001 at 06:20:34AM +0530, Arindam Haldar wrote:
> hi all,
> 
> i need help with the following probs 'm facing.....
> my system is--->  512MB, 500Mhz, 3 scsi, Compaq server with 7.0 Slackware
> upgradded packages with latest from Slackware & kernel 2.4.6 ( with LVM as
> module)
> 1) could not start LVM with /etc/fstab entries !   ;-(
>     i have created initrd.gz & have done exactly as stated in HOW-TO to
> start LVM at startup ( i'm doing it only on my /home ).
>     if i dont put entries on my /etc/fstab ( for home & LVM) then it works
> ok, but sooner i put it there on boot there is an error of  something swap
> disk which takes me to administrative mode !!!!.. my /etc/fstab enrty is
> /dev/VGmail/LVmail    /home    ext2    defaults    1    1

You don't need an initial ram disk at all, if you don't want to have root
on a logical volume.

Just run "vgscan;vgchange -ay" in your startup script before it comes to local
filesystem mounts.

> 
> 2) can quota be implimented with LVM  for eg on my /home .. ??

LVM doesn't care. Quotas are FS things.

> 
> 3) how to have root partion on LVM.
>     i tried to do that too like in the HOW-TO & did dd on an empty partion.
> but when i tried to convert root partion to LVM  i got errors.. so can
> anyone tell me the actual steps pls !

Then something with the LVM driver (in case you build it into your kernel),
the /linuxrc script content in your initrd or the boot configuration to boot
the kernel containing LVM is wrong.
In case your boot kernel is stored in the root filesystem on a logical
volume as well, you need to patch lilo and probably LVM as well.

Search the LVM archive at www.sistina.com for that.

root on LV is only recommended if you *really* need it.
It is rather hard to configure.
We are working on boot time recognition of VGs which will make it much easier.

> 
> pls excuse me for my english
> thanxs in advance...
> arindam haldar
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
