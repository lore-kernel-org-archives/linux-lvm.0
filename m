From: "Jorge Melhado" <jrgmelhado@hotmail.com>
References: <OE50LHN0t0oY6k8zpHy0000da29@hotmail.com> <20020808172939.GA18645@colombina.comedia.it> <OE30LU028EGcAJ4e7jX0000ec6f@hotmail.com> <20020809061302.GA22782@colombina.comedia.it> <OE183IR6t6c6oghBePr00001338@hotmail.com> <20020809150118.GD25223@colombina.comedia.it> <OE18lx6EIfu4FbATcFZ0000167a@hotmail.com> <20020809185853.GA26648@colombina.comedia.it>
Subject: Re: [linux-lvm] kernel panic - converting root fs to lvm
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <OE65NulKPAFBT0h9N7A000115e1@hotmail.com>
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
Date: Fri Aug  9 14:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Thanks, Luca.
Excuse me for disturb you.
Your sugestion didn�t work. I�ll try read a little more.





----- Original Message -----
From: "Luca Berra" <bluca@comedia.it>
To: <linux-lvm@sistina.com>
Sent: Friday, August 09, 2002 3:58 PM
Subject: Re: [linux-lvm] kernel panic - converting root fs to lvm


> On Fri, Aug 09, 2002 at 03:06:26PM -0300, Jorge Melhado wrote:
> > Ok. I ran  "mount -o remount,rw/" and I got fix /etc/fstab.
> >
> now try adding --fstab=/mnt/etc/fstab to your initrd command line
>
> btw a little RTFM on your part will not hurt
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
