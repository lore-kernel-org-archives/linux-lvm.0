From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Reinstalling Linux, and LVM issues?
Message-ID: <20030702004727.A17096@sistina.com>
References: <20030701195622.59977.qmail@web20416.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20030701195622.59977.qmail@web20416.mail.yahoo.com>; from mgeusenet@yahoo.com on Tue, Jul 01, 2003 at 12:56:22PM -0700
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
Date: Tue Jul  1 18:03:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jul 01, 2003 at 12:56:22PM -0700, Matt E wrote:
> Hello All.
> 
> I'm going to be wiping my hard drive and reinstalling
> Linux on it.  Currently, I have an LVM set up on two
> other discs in my system, they will not be touched.
> 
> Do I need to do anything before I blow away the
> exisiting system to be able to get my LVM array back
> after I format?

No, unless the LVM PVs get written to during install by accident,
LVM's vgscan finds your VG(s) on the two discs after reinstallation
of Linux.

Because this is a major system reconfiguration, you want to have
an actual backup of all your data!

> 
> Cheers!
> 
> __________________________________
> Do you Yahoo!?
> SBC Yahoo! DSL - Now only $29.95 per month!
> http://sbc.yahoo.com
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
