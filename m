Return-Path: <root@srv.sistina.com>
Date: Mon, 29 Jan 2001 15:44:57 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] configuration question
Message-ID: <20010129154457.E8567@srv.sistina.com>
References: <3A7235A2.C515ED1C@wrkhors.com> <20010129135716.B511@tykepenguin.com>
Mime-Version: 1.0
In-Reply-To: <20010129135716.B511@tykepenguin.com>; from caulfield@sistina.com on Mon, Jan 29, 2001 at 01:57:16PM +0000
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

On Mon, Jan 29, 2001 at 01:57:16PM +0000, Patrick Caulfield wrote:
> On Fri, Jan 26, 2001 at 08:42:42PM -0600, Steven Lembark wrote:
> > 
> > trying to get vg's out of dev for now -- devfs issues.
> > 
> > so i modify ./kernel/lvm.h replacing:
> > 
> > 	#define LVM_DIR_PREFIX  "/dev/"
> > 
> > with 
> > 	#define LVM_DIR_PREFIX  "/lvm/"
> > 
> > then configure and compile the code.
> > 
> > probem is that this doesn't seem to purge /dev/ from
> > all of the code.  is there some other location where
> > the lvm directory is defined or is this just a 
> > configuration bug [perhaps a known one at that]?
> 
> It looks like there are few hardcoded /dev strings elsewhere
> in the code. try a grep down the lib directory and change 
> those too. I'll fix this in CVS.

The only one I still found was in tools/lib/pv_check_name.c.
Fixed that and checked it in.

The real constraint here is, that LVM stores the full pathname in the VGDA
and that there's no tool available today to change that information on the fly.

I implemented LVM_DIR_PREFIX a while ago as a helper to ease namespace
changes. But for sure there's still something to do (as it always will ;-)

> 
> patrick
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

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
