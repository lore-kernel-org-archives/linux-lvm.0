From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Red Hat Advanced Server + LVM
Message-ID: <20030620130234.A29677@sistina.com>
References: <1056102632.7379.35.camel@lupin>
Mime-Version: 1.0
In-Reply-To: <1056102632.7379.35.camel@lupin>; from geoff.dolman@cimr.cam.ac.uk on Fri, Jun 20, 2003 at 10:50:32AM +0100
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
Date: Fri Jun 20 06:16:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 20, 2003 at 10:50:32AM +0100, Geoff Dolman wrote:
> Hi
> 
> I am soon to take delivery of a new Server: It's configuration is to be
> 
> 584GB disk (hardware raid5) 4 cpu (with Intel hyperthreading)
> 
> 32 GB RAM
> 
> 
> I intend to use RH Advanced Server 2.1 (whatever the latest kernel is at
> time of install).
> 
> I would ideally like to be able to snapshot dump this machine (the
> largest partition will use most of the available disk space (4-500GB)).
> 
> Is there any caveat or issue that I should be aware of with lvm in this
> configuration?

Snapshots trigger a virtual memory problem with highmem enabled in kernel 2.4 :(

The snapshot exception tables hold in RAM can grow quite big in case
of large snapshot sizes (which you might not need in case your filesystem(s)
are not heavily updated during the lifetime of the snapshot).

> 
> Many thanks
> 
> -- 
> Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
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
