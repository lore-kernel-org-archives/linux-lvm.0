From: Jeff Layton <jeffrey.b.layton@lmco.com>
Subject: Re: [linux-lvm] Building LVM ona RH7.2 - errors
Message-Id: <3C6A45BD.E4534C36@lmco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
References: <3C69A99A.398C19D4@bellsouth.net>
    <20020213095631.GD1028@tykepenguin.com>
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
Date: Wed Feb 13 04:52:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Patrick Caulfield wrote:

> On Tue, Feb 12, 2002 at 06:47:38PM -0500, Jeff Layton wrote:
> > Good evening,
> >
> >    I tried building lvm-1.0.2 against a clean 2.4.17
> > kernel. I untarred the lvm tar.gz file as well as
> > the 2.4.17 kernel (into /usr/src/linux-2.4.17.clean).
> > Then I did a,
> >
> > ./configure --with-kernel_dir=/usr/src/linux-2.4.17.clean
> >
> > from /usr/src/LVLM/1.0.2 I get the following errors
> > during the configure process,
>
> >
> > checking whether time.h and sys/time.h may both be included... yes
> > ./configure: [: too many arguments
> > checking whether gcc needs -traditional... no
>
> >
> > (sorry about the length). sed is not my string point at all.
> > Any ideas what I'm doing wrong?
> >
>
> It looks like there's something funny with your kernel sources, maybe a space in
> the version number perhaps - check the Makefile.
>
> I just tried a kernel.org kernel and 1.0.2 on RH 7.2 here and it's fine.

I'll try it again, but the kernel source was pristine. I untarred it
to /usr/src/linux and mv'ed it to /usr/src/linux-2.4.17.clean.

Thanks

Jeff


>
>
> patrick
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
