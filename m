From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LV Fragmentation determination
Message-ID: <20021106135537.A1228@sistina.com>
References: <Pine.LNX.4.44.0211060108110.8692-100000@junior.lunanet.biz>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0211060108110.8692-100000@junior.lunanet.biz>; from dlt@lunanet.biz on Wed, Nov 06, 2002 at 01:23:52AM -0700
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
Date: Wed Nov  6 07:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 06, 2002 at 01:23:52AM -0700, Donald Thompson wrote:
> First off, can LV's become fragmented across a PV/VG? If yes then...

Yes, they can.

> 
> I'm looking for an easy way to determine how fragmented an LV might been
> inside the VG. Is there any command I can run that'll give me nice
> estimate on this?
> 
> Assuming theres no such command, can I determine this by looking at the
> PE's displayed from an 'lvdisplay -v' command? I'm guessing it'd be pretty
> easy to write a script that analyzes the PE numbers and looks for skips in
> the sequence to give myself an idea of the amount of fragmention for the
> LV. Or am I competely wrong thinking you can use PE's to make such a
> determination?
> 
> I do shrinks and enlarges for different LV's sometimes on an almost daily
> basis, and my VG's are getting to be very old. So I'm curious to see how
> fragmentated my LVs have become.

You can analyze the "lvdisplay -v" output on your LVs in question.
That shows you the mapping information and therefore, if your LVs are
fragemented.

> 
> TIA for any clues.
> 
> -Don
> 
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
