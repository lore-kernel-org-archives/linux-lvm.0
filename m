From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LV Fragmentation determination
Message-ID: <20021107180002.B8382@sistina.com>
References: <Pine.LNX.4.44.0211060108110.8692-100000@junior.lunanet.biz> <20021106135537.A1228@sistina.com> <95154593687.20021106141700@tnonline.net> <20021106133803.GA22411@reti>
Mime-Version: 1.0
In-Reply-To: <20021106133803.GA22411@reti>; from joe@fib011235813.fsnet.co.uk on Wed, Nov 06, 2002 at 01:38:03PM +0000
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
Date: Thu Nov  7 11:05:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 06, 2002 at 01:38:03PM +0000, Joe Thornber wrote:
> On Wed, Nov 06, 2002 at 02:17:00PM +0100, Anders Widman wrote:
> > >> First off, can LV's become fragmented across a PV/VG? If yes then...
> > 
> > > Yes, they can.
> > 
> > >> 
> > >> I'm looking for an easy way to determine how fragmented an LV might been
> > >> inside the VG. Is there any command I can run that'll give me nice
> > >> estimate on this?
> > 
> > > You can analyze the "lvdisplay -v" output on your LVs in question.
> > > That shows you the mapping information and therefore, if your LVs are
> > > fragemented.
> > 
> > Will LVM include a defragment procedure?
> 
> LVM2 will at some point, in that arbitrary remappings will be
> supported.  However I'm not convinced that this is a big problem, the
> extents are 4M after all.

True.

BTW: the default got changed to 32MB to support up to 2TB LVs in
     LVM 1.0.6 by default rather than by "vgchange -s" which makes the
     impact even smaller.

> 
> - Joe
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
