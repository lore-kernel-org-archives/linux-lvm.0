Return-Path: <root@srv.sistina.com>
Date: Wed, 2 May 2001 12:42:23 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcfgrestore fails.
Message-ID: <20010502124223.F30791@sistina.com>
References: <20010430160431.H19810@sistina.com> <01043007034800.04719@vidar> <01043012341701.04719@vidar>
Mime-Version: 1.0
In-Reply-To: <01043012341701.04719@vidar>; from dablake@speakeasy.net on Mon, Apr 30, 2001 at 12:34:17PM -0500
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

On Mon, Apr 30, 2001 at 12:34:17PM -0500, Hcd wrote:
> Ok,  I have my volumes back.  
> It was messy but it worked.

:-(

> 
> l simply removed the lvm 9.4 and reinstalled lvm 8.0
> I then did the vgcfgrestore and opt and export came back.

That was another option ;-)

Have you beann able to upgrade to LVM 0.9.1 Beta 7 already, run some changing
command and did everything work fine?

If not so, I'ld be very interested in it.

Regards,
Heinz    -- The LVM Guy --


> thanks for your help. 
> 
> On Monday 30 April 2001 07:03, you wrote:
> > No joy on this on this method.
> > If you need I can supply more inforamation.
> > BTW I am running on an Athlon..
> > thor:/etc # cp /etc/lvmconf/export.conf /etc/lvmtab.d/export
> > thor:/etc # cp /etc/lvmconf/opt.conf /etc/lvmtab.d/opt
> > thor:/etc # echo -ne "export\0" > /etc/lvmtab
> > thor:/etc # echo -ne "opt\0" >> /etc/lvmtab
> > thor:/etc # vgchange -ay
> > vgchange -- ERROR: different structure size stored in
> > "/etc/lvmtab.d/export" than expected in file vg_cfgrestore.c [line 122]
> > vgchange -- volume group "export" does not exist
> > vgchange -- ERROR: different structure size stored in "/etc/lvmtab.d/opt"
> > than expected in file vg_cfgrestore.c [line 122]
> > vgchange -- volume group "opt" does not exist
> >
> > On Monday 30 April 2001 11:04, you wrote:
> > > On Sat, Apr 28, 2001 at 12:33:58PM -0500, root wrote:
> > > > I am running SuSe 7.1
> > > > 2.4.0 kernel
> > > > 512M Ram
> > > > AhA2940U2W
> > > > suse lvm
> > > >
> > > > I had three volume groups and a week ago the volume group that
<SNIP>
> > > LV with just 1 LE had done it as well.
> > >
> > > Please tell us if this helps you or we need to go for another solution.
> > >
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
