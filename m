Return-Path: <root@srv.sistina.com>
Date: Wed, 9 May 2001 09:37:27 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Upgrading from beta 6 to beta 7
Message-ID: <20010509093727.C4918@sistina.com>
References: <989275349.1722.5.camel@localhost>
Mime-Version: 1.0
In-Reply-To: <989275349.1722.5.camel@localhost>; from raheesom@navpoint.com on Mon, May 07, 2001 at 06:42:29PM -0400
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

As Luca already pointed out in his answer:
you need to start with a *clean* kernel and do a full compile/install run.

Regards,
Heinz    -- The LVM Guy --


On Mon, May 07, 2001 at 06:42:29PM -0400, Rupert Heesom wrote:
> Guys:
> 
> I've currently got lvm beta6 RPMs installed on my PC, although I only
> have test vols in place.
> 
> I think I ought to upgrade to beta 7 since there are now RPMs available.
> My question is in regard to patching the kernel.  I assume that I just
> run the beta 7 patch onto the source which had the beta 6 patch applied.
> 
> When then compiling the source to get the updated LVM module, do I need
> to recompile the whole kernel & put that in place first as well as
> compiling & installing the modules, or do I just need to compile the
> modules, and install (make modules; make modules_install) ?
> 
> -- 
> regs
> rupert
> 
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
