From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] snapshot with bigmem broken
Message-ID: <20030516125958.B24422@sistina.com>
References: <37885B2630DF0C4CA95EFB47B30985FB020EBD2E@exchange-1.umflint.edu>
Mime-Version: 1.0
In-Reply-To: <37885B2630DF0C4CA95EFB47B30985FB020EBD2E@exchange-1.umflint.edu>; from jlauro@umflint.edu on Wed, May 14, 2003 at 06:50:46AM -0400
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
Date: Fri May 16 06:08:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 14, 2003 at 06:50:46AM -0400, Lauro, John wrote:
> Hello,
> 
>  
> 
> I did more testing, and it appears that snapshots in LVM will not work
> with either 4GB or or 64GB support enabled in the kernel under 2.4.20.
> This includes both LVM 1.0.7 or the latest LVM2.  
> 

That's a known issue. You are faced with a VM flaw.

I presume that it's not LVM snapshots only bacause HIGHMEM is
basically broken.

>  
> 
> Is there anyone using LVM snapshots with 64GB RAM support (or even 4GB
> RAM support, as snapshots would be good for at least our medium size
> servers if not our large ones)?  Is so, let me know the kernel version
> and LVM version you are using so that I can try it.

Probably not, because the system lifelocks on bounce buffers (which is
the sympton of the principle HIGHMEM bug).
Obviously not a lot of HIGHMEM users out there raising priorities to fix this.

> 
>  
> 
> PS: As mentioned previously, everything else in LVM seems to be ok
> with larger kernel memory models.  It's mainly just snapshots that
> appear to be broken using the latest LVMs and kernel.
> 
>  
> 

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
