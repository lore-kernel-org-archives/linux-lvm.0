Message-ID: <001d01c3bc42$cd6de2a0$f100a8c0@leslorin.com>
From: "Ronan-Yann Lorin" <ryl@free.fr>
References: <3560BA143F45D5118E670000E82459214C23AE@ssk.schneiderkenzingen.de>
Subject: Re: [linux-lvm] half my space lost
MIME-Version: 1.0
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
Date: Sat Dec  6 15:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I tried to extend my 96Mb VG "secured" with (default) extend size of 32M
with 1*128Mb /dev/md/8.

I recreated it with an extend size of 1Mb and with /dev/md/7 + /dev/md/8 PV.
It worked. Since then I added some more PV to it without problem. I now
trying to move my root partition on it.

----- Original Message -----
From: Koch, Steffen <steffen.koch@sphinx-electronics.de>
To: <linux-lvm@sistina.com>
Sent: Friday, December 05, 2003 4:11 PM
Subject: RE: [linux-lvm] half my space lost


> Hello again,
>
> > Thank you for this explanation which sounds very clear.
> >
> > One more question please. I do not understand why I can not
> > extend my VG with the second RAID partition: [root@fw root]#
> > pvdisplay /dev/md/8 pvdisplay -- "/dev/md/8" is a new
> > physical volume of 125.38 MB
> >
> > [root@fw root]# vgextend secured /dev/md/8
> > vgextend -- INFO: maximum logical volume size is 2 Terabyte
> > vgextend -- ERROR: physical volume "/dev/md/8" too small for
> > physical extent siz e of volume group "secured"
> Seems that the extent size of your other vg is larger than the available
> size of your new md8.
>
> A question I have: Why do you want to extend your 17 GB VG with 2*128 MB??
> Doesn't make much sense to me...
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
