Subject: RE: [linux-lvm] snapshot with bigmem broken
From: Andrew Rechenberg <arechenberg@shermfin.com>
In-Reply-To: <37885B2630DF0C4CA95EFB47B30985FB020EBDA8@exchange-1.umflint.edu>
References: 
	 <37885B2630DF0C4CA95EFB47B30985FB020EBDA8@exchange-1.umflint.edu>
Content-Transfer-Encoding: 7bit
Message-Id: <1053531846.12974.147.camel@cinshrlnxws01.shermfin.com>
Mime-Version: 1.0
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
Date: Wed May 21 10:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have HIGHMEM enabled on my kernel but I have to limit the memory to
~6GB for snapshots to work.  I added mem=6000M to my kernel command line
and snapshots work fine.  

I also found this thread on the LKML that has a patch that may fix the
problem:

http://marc.theaimsgroup.com/?l=linux-kernel&m=104549874128521&w=2

The only machine we have that has >4GB RAM is a production box and I
really don't want to test something in production (call me crazy :) ).

Here are my specs:

Kernel 2.4.18-27.SHRbigmem
LVM 1.0.7

Hope this helps,
Andy.


On Fri, 2003-05-16 at 08:38, Lauro, John wrote:
> > > I did more testing, and it appears that snapshots in LVM will not
> work
> > > with either 4GB or or 64GB support enabled in the kernel under
> 2.4.20.
> > > This includes both LVM 1.0.7 or the latest LVM2.
> > >
> > 
> > That's a known issue. You are faced with a VM flaw.
> > 
> > I presume that it's not LVM snapshots only bacause HIGHMEM is
> > basically broken.
> 
> Can you give more specifics/examples/web links/etc?  Does this mean I
> should avoid LVM completely with HIGHMEM?  What if any other problems
> should I expect with LVM (and/or other software)?
> 
> > > Is there anyone using LVM snapshots with 64GB RAM support (or even
> 4GB
> > > RAM support, as snapshots would be good for at least our medium
> size
> > > servers if not our large ones)?  Is so, let me know the kernel
> version
> > > and LVM version you are using so that I can try it.
> > 
> > Probably not, because the system lifelocks on bounce buffers (which
> is
> > the sympton of the principle HIGHMEM bug).
> > Obviously not a lot of HIGHMEM users out there raising priorities to
> fix
> > this.
> 
> Is this easy to reproduce?  If so, how?  Sounds like I am either a
> lucky early adopter of a >4GB Libux system, and/or the problem is rare
> even on HIGHMEM systems?
> 
> Thanks.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Andrew Rechenberg <arechenberg@shermfin.com>
Infrastrucutre Team, Sherman Financial Group
