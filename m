Date: Wed, 22 Nov 2000 12:54:33 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Removing a PV
Message-ID: <20001122125433.K2769@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <20001113195854.D23680@colombina.comedia.it> <Pine.BSO.4.21.0011131545220.14526-100000@loonybin.loonybin.net> <20001113160725.A13890@omnifarious.mn.org>
Mime-Version: 1.0
In-Reply-To: <20001113160725.A13890@omnifarious.mn.org>; from hopper@omnifarious.mn.org on Mon, Nov 13, 2000 at 04:07:25PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Cc: linux-lvm@msede.com

On Mon, Nov 13, 2000 at 04:07:25PM -0600, Eric M. Hopper wrote:
> On Mon, Nov 13, 2000 at 03:58:37PM -0500, Rob Foehl wrote:
> > I'd assumed that was the correct command sequence, but does lvreduce
> > ensure that the filesystem won't be damaged? Ie. does it only remove LE's
> > from the end of the LV, or what?
> 
> 	Yes, you guessed it.  :-)
> 
> 	I'm not sure what happens with pvmove if the logical volume is
> striped though.  I'd really like to know.  :-)

You need to pvmove all PEs belonging to the stripe to another PV
in order to keep up with the RAID0 constraints.

> 
> Have fun (if at all possible),
> -- 
> The best we can hope for concerning the people at large is that they
> be properly armed.  -- Alexander Hamilton
> -- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hopper) --



-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
