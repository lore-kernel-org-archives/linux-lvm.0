Return-Path: <lembark@wrkhors.com>
Message-ID: <3AC1E80D.E3A1C0BF@wrkhors.com>
Date: Wed, 28 Mar 2001 07:33:01 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvmgui 0.2 release
References: <3ABDD38D.A841FFD3@ida.xs4all.nl> <wxx1yrkklzx.fsf@fjorir.ifi.uio.no> <20010327122311.A25656@d3.front>
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

> > > + New Features / Enhancements / Bug Fixes
> > >
> > > - added images for LV and PV.
> > > - extend/reduce a VG
> > > - extend/reduce a LV
> > > - added vgscan in menu
> > > - changed File->Rescan to File->Refresh
> >
> >   sounds cute. I was actually thinking of writing something like this
> >   myself, but can't really decide on what language to do it in. :)
> 
> How about Tcl/Tk?  Quick and easy to learn (a bit C, and Perl combined).
> I picked it up quick by hacking allready made scripts, and I didn't know
> any perl, but I know some C.  And you've got a good one allready made,
> "/usr/src/linux/scripts/kconfig.tk" (might have to do "make xconfig" to
> create it though).  Not as pretty as java, or C, but much faster than C
> to create, and will run on most systems.

the perl for this would look pretty much like the C.  you could
use Perl/Tk to make the programming easier (i.e., modular w/
reasonable exeption handling).

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
