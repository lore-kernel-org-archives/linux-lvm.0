From: Stefan Weigel <sw@global-linxs.de>
Subject: Re: [linux-lvm] Re: problem with lvm on root-fs
References: <200210170859.03682.sw@global-linxs.de> <200210170935.12777.sw@global-linxs.de> <3DAF1DE5.3060203@comedia.it>
In-Reply-To: <3DAF1DE5.3060203@comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200210181013.56689.sw@global-linxs.de>
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
Date: Fri Oct 18 03:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Am Donnerstag, 17. Oktober 2002 22:30 schrieb Luca Berra:
> Stefan Weigel wrote:
> >>>kernel panic: no init found. Try passing init=3D to...
> >>
> >>this usually means it couldn't mount your root fs, or got it wrong
> >>
> >>L.
> >
> > Hi,
> > that's right, but where's my problem ? I've used the howto from
> > sistina.com to
>
> do you have any hint printed above this?
>
> L.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Hi!
I don't know exactly what you guess. I've used this one:=20
http://tldp.org/HOWTO/LVM-HOWTO/upgraderoottolvm.html

After the command lvmcreate_initrd I've mounted the initrd and added the=20
module for my raid-controller and changed linuxrc. But I mentioned that.
Sorry if I misunderstand you.

Best regards

Stefan
