Subject: Re: [linux-lvm] Red Hat Advanced Server + LVM
From: Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
In-Reply-To: <20030620130234.A29677@sistina.com>
References: <1056102632.7379.35.camel@lupin>
	 <20030620130234.A29677@sistina.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1056122994.7379.146.camel@lupin>
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
Date: Fri Jun 20 10:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Fri, 2003-06-20 at 12:02, Heinz J . Mauelshagen wrote:
> On Fri, Jun 20, 2003 at 10:50:32AM +0100, Geoff Dolman wrote:
> > Hi
> > 
> > I am soon to take delivery of a new Server: It's configuration is to be
> > 
> > 584GB disk (hardware raid5) 4 cpu (with Intel hyperthreading)
> > 
> > 32 GB RAM
> > 
> > 
> > I intend to use RH Advanced Server 2.1 (whatever the latest kernel is at
> > time of install).
> > 
> > I would ideally like to be able to snapshot dump this machine (the
> > largest partition will use most of the available disk space (4-500GB)).
> > 
> > Is there any caveat or issue that I should be aware of with lvm in this
> > configuration?
> 
> Snapshots trigger a virtual memory problem with highmem enabled in kernel 2.4 :(
> 
> The snapshot exception tables hold in RAM can grow quite big in case
> of large snapshot sizes (which you might not need in case your filesystem(s)
> are not heavily updated during the lifetime of the snapshot).
> 

Hi Heinz

What do you recommend I do? What is (if any) the largest filesystem I
can snapshot in this set-up?

-- 
Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
