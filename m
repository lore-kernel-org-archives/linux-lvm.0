Message-ID: <39184001.EE90C818@msede.com>
Date: Tue, 09 May 2000 18:42:41 +0200
From: Michael Marxmeier <mike@msede.com>
Reply-To: okeefe@borg.umn.edu
MIME-Version: 1.0
Subject: Re: [linux-lvm] balance functionality
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message from Matthew O'Keefe (okeefe@borg.umn.edu) ...

-------- Original Message --------
From: "Matthew O'Keefe" <okeefe@borg.umn.edu>
Date: Tue, 9 May 2000 07:37:09 -0500
Subject: Re: [linux-lvm] balance functionality
Message-ID: <20000509073709.A96956@styx.>
References: <20000505230812.A449@HAL.HAL>
In-Reply-To: <20000505230812.A449@HAL.HAL>

On Fri, May 05, 2000 at 11:08:12PM -0400, Jean-Francois Landry wrote:
> Greetings,
> 
> I was wondering if the current LVM implementation supports functionality similar
> to the Digi^H^H^H^HCompaq Tru64 Unix "balance" utility. This utility rearranges
> data across volumes ( I think this maps to PV's in the Linux LVM) so that files
> are scattered evenly in a concatenated volume. Anyone willing to comment on
> that? Sorry if this has been covered but I was unable to find anything in the
> mailing lists archives.

Hi,

I don't think so.  Since the volume manager only knows about blocks,
not files, it cannot make decisions about how blocks for a particular
file should be distributed.  RAID-0 striping can help in general with
this
problem.  Our Linux cluster file system (GFS -- see
www.globalfilesystem.org)
has a balancer, but it is out-of-date, as the balancer has not kept up
with our latest code updates.  We plan to include this functionality
in the
future.

Matt O'Keefe
 

> 
> Cheers,
> 	Jean-Francois Landry
> -- 
> I'm famous. Ain't taht a bitch!
> 	Thelonious Sphere Monk
> --
