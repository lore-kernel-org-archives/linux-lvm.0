From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Error creating snapshot, "Cannot allocate memory"
Message-ID: <20021204125629.A29881@sistina.com>
References: <20021202223223.GC21924@ofb.net> <20021203114821.A25161@sistina.com> <3DEC9B03.B83C0078@silicide.dk> <20021203182119.GD21924@ofb.net>
Mime-Version: 1.0
In-Reply-To: <20021203182119.GD21924@ofb.net>; from jheiss@ofb.net on Tue, Dec 03, 2002 at 10:21:20AM -0800
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
Date: Wed Dec  4 06:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 03, 2002 at 10:21:20AM -0800, Jason Heiss wrote:
> On Tue, Dec 03, 2002 at 12:52:35PM +0100, Jon Bendtsen wrote:
> > "Heinz J . Mauelshagen" wrote:
> > > 
> > > You don't have enough kernel virtual memory to hold the snapshot exception
> > > table in core :(
> > > Install more RAM.
> > 
> > I've seen this error as well. In a machine with 1GB memory and the only
> > processes
> > running were NFS and samba. Just how much memory does it need ?
> > 
> 
> Indeed, my server has 2 GB of RAM and 1 GB of swap, of which free
> reports only a few hundred MB in use.

Hmmm...

vmalloc() fails to allocate kernel virtual memory. That's why you get the
error. Could well be a constraint in vmalloc() in general or in the
Redhat kernel you use.
Have you tried using a 2.4.20 vanilla kernel and were able to reproduce this
(enough free RAM presumed).

> 
> Jason
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
