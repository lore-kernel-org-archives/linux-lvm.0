Return-Path: <lembark@wrkhors.com>
Message-ID: <3A758856.1216A1D9@wrkhors.com>
Date: Mon, 29 Jan 2001 09:12:22 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] configuration question
References: <3A7235A2.C515ED1C@wrkhors.com> <20010129135716.B511@tykepenguin.com> <20010129154457.E8567@srv.sistina.com>
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

> > > trying to get vg's out of dev for now -- devfs issues.
> > >
> > > so i modify ./kernel/lvm.h replacing:
> > >
> > >     #define LVM_DIR_PREFIX  "/dev/"
> > >
> > > with
> > >     #define LVM_DIR_PREFIX  "/lvm/"
> > >
> > > then configure and compile the code.
> > >
> > > probem is that this doesn't seem to purge /dev/ from
> > > all of the code.  is there some other location where
> > > the lvm directory is defined or is this just a
> > > configuration bug [perhaps a known one at that]?
> >
> > It looks like there are few hardcoded /dev strings elsewhere
> > in the code. try a grep down the lib directory and change
> > those too. I'll fix this in CVS.
> 
> The only one I still found was in tools/lib/pv_check_name.c.
> Fixed that and checked it in.
> 
> The real constraint here is, that LVM stores the full pathname in the VGDA
> and that there's no tool available today to change that information on the fly.
> 
> I implemented LVM_DIR_PREFIX a while ago as a helper to ease namespace
> changes. But for sure there's still something to do (as it always will ;-)

i don't have any existing VG's -- problems with devfs trashed
them all.  main issue now is starting over w/ lvm & devfs in
separate namespaces until all of the kinks are worked out.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
