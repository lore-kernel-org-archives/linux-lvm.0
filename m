Return-Path: <root@srv.sistina.com>
Date: Tue, 24 Jul 2001 08:07:07 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Question
Message-ID: <20010724080707.A16486@sistina.com>
References: <20010724014053.45142.qmail@web13402.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20010724014053.45142.qmail@web13402.mail.yahoo.com>; from plamb_98@yahoo.com on Mon, Jul 23, 2001 at 06:40:53PM -0700
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

On Mon, Jul 23, 2001 at 06:40:53PM -0700, Pierre Lamb wrote:
> I recomplied my kernel (2.4.3-12) to include lvm as a
> module, added the entries to "modules.conf" made the
> pe/vg/lvol finally added vgscan and vgchange -ay to
> rc.sysinit before hte line mounting the other fs.  The
> problem is it does not do the vgscan/vgchane during
> the boot ptocess thus forcing me to do these 2 steps
> after logging in. What am I missing

Is the module really loaded, when you run "vgscan;vgchange -ay" in rc.sysinit?
Are all other modules loaded before that which eventually drive disks
you have PVs on?

> 
> Pierre
> 
> __________________________________________________
> Do You Yahoo!?
> Make international calls for as low as $.04/minute with Yahoo! Messenger
> http://phonecard.yahoo.com/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
