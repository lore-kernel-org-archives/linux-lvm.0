From: "Jorge Melhado" <jrgmelhado@hotmail.com>
References: <OE50LHN0t0oY6k8zpHy0000da29@hotmail.com> <20020808172939.GA18645@colombina.comedia.it>
Subject: Re: [linux-lvm] kernel panic - converting root fs to lvm
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <OE30LU028EGcAJ4e7jX0000ec6f@hotmail.com>
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
Date: Thu Aug  8 13:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Luca,

I generated another RAM with mkinitrd, changed the /etc/lilo.conf and reran
lilo.
After reboot, I note start up proceeds a bit more than before.
Now I see this message:

Mounting root filesystem
mount: error 6 mounting ext3
pivoroot: pivot_root (/sysroot, /sysroot/initrd) failed: 2
Freeing unused kernel memory: 280k freed
Kernel panic:  No init found. Try passing init=3D option to kernel


Thanks


Jorge




----- Original Message -----
From: "Luca Berra" <bluca@comedia.it>
To: <linux-lvm@sistina.com>
Sent: Thursday, August 08, 2002 2:29 PM
Subject: Re: [linux-lvm] kernel panic - converting root fs to lvm


> On Wed, Aug 07, 2002 at 11:26:03AM -0300, Jorge Melhado wrote:
> >
> >    Hello.
> >
> >
> >
> >    Please, help me.
> >
> >
> >
> >    I installed RedHat 7.3 (kernel 2.4.18-3) and I=EF=BF=BDm trying to c=
onvert my
> >    root filesystem to LVM (lvm-1.0.3-4).
> >
> use th mkinitrd tool shipped with redhat instead of lvmcreate_initrd
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
