Return-Path: <mauelshagen@sistina.com>
Date: Mon, 20 Aug 2001 11:37:54 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Successful Upgrade to 1.0 with RH 7.1
Message-ID: <20010820113754.B26319@sistina.com>
References: <Pine.LNX.4.33.0108191729210.1071-100000@leopard.dorfam.ca>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0108191729210.1071-100000@leopard.dorfam.ca>; from gerry@dorfam.ca on Sun, Aug 19, 2001 at 05:39:26PM -0400
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

Gerry,

thanks a lot for your kind feedback.

FYI:
in order to make the upgrade to > 0.9.1 Beta 8 even smoother, my team came
up with a slicker solution avoiding the metadata upgrade process
completely, which caused sleepless nights ;-) for some users and Linux
distributors. Sorry folks!

Already announced and available at www.sistina.com as LVM 1.0.1-rc1.

FYI: users, who already have successfully updated to 1.0 *don't* need it
     but users who didn't can install 1.0.1-rc1 *and* run it with their given
     VGs without a seperate upgrade process (kudos to my team and Joe Thornber
     in particular :-)

Regards,
Heinz    -- The LVM Guy --


On Sun, Aug 19, 2001 at 05:39:26PM -0400, gerry@dorfam.ca wrote:
> I thought I'd share my experience with my upgrade from beta 7 to 1.0 on
> Redhat's 2.4.3-12 kernel...
> 
> First, I had already patched the 2.4.3-12 kernel and successfully
> installed lvm beta 7.  This went without problems following the
> instructions in the PATCHES directory.
> 
> I downloaded the new lvm 1.0 tarball and tried to patch the existing
> patched kernel source.  That didn't work very well so I immediately gave
> up on that approach and started with a clean Redhat 2.4.3-12 kernel.  The
> patch was created properly and installed without errors.
> 
> I then rebuilt the kernel using the saved .config file from the old
> working kernel.  No problems with the kernel compile.  Being on a roll I
> did the make file in the LVM/1.0 directory, then updated the existing pv's
> using pvversion.  Finally, I did a make install and rebooted.
> 
> Everything came up without a single error.  I'm now running on lvm 1.0 and
> all data is intact!
> 
> Great work and congratulations to the LVM team!
> 
> PS. Notice that I started with a clean Redhat 2.4.3-12 kernel NOT the
> standard kernel.  Whatever changes have been made by Redhat do not affect
> LVM.
> 
> 
> Gerry
> -- 
> "The lyfe so short, the craft so long to learne"  Geoffrey Chaucer
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
