Message-Id: <3C6B14D0.576C9A56@bellsouth.net>
From: Jeff Layton <laytonjb@bellsouth.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Building LVM ona RH7.2 - errors
References: <E16awby-00059c-00@hermes.sistina.com>
    <1013616001.3175.26.camel@dirac.cids.ca> <3C6A9541.34A54984@lmco.com>
Content-Transfer-Encoding: 8bit
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
Date: Wed Feb 13 19:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Jeff Layton wrote:

> Daniel Savard wrote:
>
> > le mer 13-02-2002 � 05:26, linux-lvm-request@sistina.com a �crit :
> >
> > >
> > > (sorry about the length). sed is not my string point at all.
> > > Any ideas what I'm doing wrong?
> > >
> > > TIA,
> > >
> > > Jeff
> > >
> >
> > Jeff,
> >
> > 1st) Untar the kernel somewhere like: /usr/src/linux-2.4.17
> > 2nd) Untar the LVM 1.0.2, it will create the sub-directory 1.0.2 in the
> > current dir, for example: /usr/src/LVM/1.0.2
> > 3rd) Create the directory /usr/src/LVM/build
> > 4th) cd /usr/src/LVM/build
> > 5th) ../1.0.2/configure --with-kernel-dir=/usr/src/linux-2.4.17
> > 6th) Read instructions in /usr/src/LVM/1.0.2/PATCHES/README
>
> Did all that.
>
> I tested on a RH 7.1 box this morning and it worked fine. The
> box I'm having trouble with is my home box which I'll try this
> evening.

OK. I tried it again on my RH 7.2 box at home. I still get the
same errors. I even followed Daniel's step-by-step suggestion
above and got the same errors. However, when I did it on my
RH 7.1 box at work, it works correctly. So, something is amiss
with my home box. Any suggestions where to start? I'm totally
lost on this one.

TIA,

Jeff


>
>
> Thanks,
>
> Jeff
>
> >
> >
> > >From your description, it is not clear, but I guess you mixed LVM stuff
> > with Kernel stuff while building the patches and Makefile modifications
> > may encountered problems with the Linux kernel Makefile.
> >
> > --
> >
> > =======================================
> > Daniel Savard
> > Consultation Informatique Daniel Savard
> > 551, boul. Sir-Wilfrid-Laurier
> > suite 105
> > Beloeil, (Qu�bec)
> > Canada J3G 4J1
> >
> > T�l: (450) 467-8014
> > Internet: dsavard@cids.ca
> > =======================================
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
