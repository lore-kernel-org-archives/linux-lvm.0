From: "Anthony W. Marino" <anthony@AWMObjects.com>
Subject: Re: [linux-lvm] LVM System
References: <auto-000021223409@front2.mail.megapathdsl.net>
    <20020305013930.A5231@golem.blacknet.de>
In-Reply-To: <20020305013930.A5231@golem.blacknet.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <auto-000021247038@front2.mail.megapathdsl.net>
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
Date: Mon Mar  4 18:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Goetz Bock <bock@blacknet.de>

On Monday 04 March 2002 07:39 pm, Goetz Bock wrote:
> On Mon, Mar 04 '02 at 16:39, Anthony W. Marino wrote:
> > LVM 1.x
>
> good idea
>
> > 3Ware 7800 Raid Controller
>
> what do you want to go for? RAID5

RAID5

> > Maxtor 40GB harddrives
>
> All IDE drives are about the same, but I'm running softraid5 with 4x60GB
> and 6x80GB, all Maxtor
>
> > XFS Journalling FS
>
> I'm using ReiserFS and ext3 (both in production), and am about to move
> from reiserFS to ext3. Except for special purpose (e.g. my MP3 base, and
> an thousends off small files (1-10k) box)
>
> > SuSE 2.4.18+ Linux
>
> IMHO, don't use SuSE, pick one of the real RPM based distributions.
> If you want everything provided go for RedHat or Mandrake, if you want a
> real server (and know how to compile your kernel) go for trustix.

Why don't you think that SuSE isn't a real server OS???

> Some more comments:
> - don't use striping on RAID5. It is not going to work (well, if you
>   have two RAID5 sets it will, but that's a waste of disk space)
> - this ony appiles to my bad expirience with the 6xxx 3ware controllers:
>   test wether softRAID with the linux kernel is not faster than the
>   hardware RAID
>   (well, you can not boot from softRAID as comfortable as you can from
>    hardware RAID)

I have 4x40GB Maxtor drives and haven't determined what my final 
configuration will be.


> - install the 3ware tool, the 3dm is a deamon that is configurateable
>   from a web page (only runs on localhost, and has (for sure) some
>   security holes). It can send mails on errors, too.
>   (AFAIR the install script is realy broken, don't run it, do it by
>    hand)
> - with a 2.4.xx kernel you do not need a special driver
> - I've a 6800 for sale. i switched my home filebase over to 3 promise
>   controllers. They can do powersaving while I'm at work.
>

Where do I find this 3ware tool?

Thanks,
Anthony


> Cu,
>     Goetz.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
