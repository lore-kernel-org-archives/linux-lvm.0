From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <NBBBKLKHMJHIJLHOGAOJOEDFJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011129181708.B16013@colombina.comedia.it>
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
Date: Thu Nov 29 15:04:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Luca Berra
> On Thu, Nov 29, 2001 at 09:00:02AM -0500, Sarwer Zafiruddin wrote:
> > For those Mandrake 8.1 users out there.  Does anyone know if you can
setup
> > the Linux Logical Volume Manager (LVM) during the install?  Ideally, I
> > would like to put my /,/var,/usr,/tmp filesystems under LVM control, so
I
> > have the ability to expand the filesystems if it every gets full.
>
> you can setup lvm during install, but you cannot put root over lvm
> sorry.

No don't be sorry!!!

I don't know why people even think of doing that...
Can *anyone* give a good reason (and I don't include
"because its tidier to have everything LVM") for having
root on LVM? Its just begging for trouble; like running
windows XP!

Oh and yes, mandrake 8.1 supports LVM at install; it'll even
detect previous LVM setups and incorporate them into the
install if you want!

My only worry is that Mandrake 8.1 defaults to devfs
and there was a recent message about a problem with devfs and LVM.


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
>
