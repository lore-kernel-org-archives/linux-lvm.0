Return-Path: <glenn@gecpalau.com>
Message-ID: <3AF091E1.D57CEEA4@gecpalau.com>
Date: Thu, 03 May 2001 08:01:53 +0900
From: Glenn Shannon <glenn@gecpalau.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] New details on VGScan crash on 2.4.4
References: <3AED170B.D5483465@gecpalau.com> <200104301544.JAA10700@lynx.turbolabs.com> <20010502122044.D30791@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Heinz J. Mauelshagen" wrote:

> On Mon, Apr 30, 2001 at 09:44:43AM -0600, Andreas Dilger wrote:
> > Glenn writes:
> > > Well, after much deliberation as to how BADLY I needed a /usr partition
> > > under 2.4.4....
> > >
> > > I booted it in single-user (blech) under 2.4.4 and ran vgscan and got:
> > >
> > > segmentation fault
> > >
> > > So I went about investigating as to whether I could get more info than
> > > that.....
> > >
> > > vgscan -d >& vgscan.log generated the textfile vgscan1.txt I am
> > > attaching to this email...hopefully it sheds some light (?)
> >
> > Looks like you have devfs configured but not mounted.  You really need to
> > mount devfs before running vgscan.  Also, you are far better off to not
> > use devfs and LVM at the same time.
> >
> > Granted, this is no reason for vgscan to segfault, but it may fix your
> > problem.
>
> Yep ;-)
>
> Did somebody find the reason why it segfaults already and has
> the finger pointing to the code location?
>
> >
> > Cheers, Andreas
> > --
> > Andreas Dilger                               TurboLabs filesystem development
> > http://sourceforge.net/projects/ext2resize/
> > http://www-mddsp.enel.ucalgary.ca/People/adilger/
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
>
> --
>
> Regards,
> Heinz    -- The LVM Guy --
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

I don't know what was causing the segfault, but I suspect it may have been a bad
compile.

I recompiled all over again and it works now :)

Glenn
