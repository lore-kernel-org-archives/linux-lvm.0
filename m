From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How to transit from Linux 2.4 to 2.6 with LVM in play?
Message-ID: <20030930164600.B26280@sistina.com>
References: <Pine.LNX.4.55.0309300932270.593@mhw.ULib.IUPUI.Edu>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.55.0309300932270.593@mhw.ULib.IUPUI.Edu>; from mwood@IUPUI.Edu on Tue, Sep 30, 2003 at 09:39:23AM -0500
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
Date: Tue Sep 30 09:58:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Mark,

you can try out LVM2 on 2.4 downloading and installing it from our website.
LVM2 is format compatible with LVM1 so you can switch back and forth.

In 2.6 there's no LVM1 any longer, LVM2 will be the default volume
manager there.

This means you can access your VG(s) with LVM2 on 2.6 and LVM1 or LVM2
on 2.4 switching between kernel and LVM versions.

If you get to the LVM2 installation (don't forget to install device-mapper
in Linux 2.4 as well) and have questions, please get back to us here.

Warning: LVM2/device-mapper in 2.6 doesn't have snapshot support yet.
         We plan to release it on 2.6 soon.

On Tue, Sep 30, 2003 at 09:39:23AM -0500, Mark H. Wood wrote:
> Okay, I must be missing something obvious, but...how do I get from kernel
> 2.4.19 to 2.6.0-testX without breaking LVM along the way?  The LVM1 tools,
> when run at 2.6 startup, fail after tripping a kernel message that module
> lvm_mod couldn't be found (which is sensible, since 2.6 has no such module
> that I can find).  The LVM2 tools don't want to run on 2.4 because the
> LVM1 driver is present.  So I have no tools that will run in both
> environments, meaning there's no way back if I don't like 2.6, and no way
> to try out LVM2 beforehand.  What have I failed to see?
> 
> -- 
> Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
> MS Windows *is* user-friendly, but only for certain values of "user".
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
