Subject: Re: [linux-lvm] disk naming
From: Matt Schillinger <mschilli@vss.fsi.com>
In-Reply-To: <20030103170356.GH18613@tykepenguin.com>
References: <1041610095.19844.45.camel@mosix>
	<20030103174618.Z9539@zealot.blacknet.de> <1041613503.20036.49.camel@mosix>
	 <20030103170356.GH18613@tykepenguin.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1041620373.20036.52.camel@mosix>
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
Date: Fri Jan  3 12:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Patrick,

I was wondering if you could explain a little bit of how lvm finds a
device that no longer corresponds to the same 'dev/sd*' name. does it
use some kind of device id or serial number? I just want to be doubly
sure, as Steven Lembark claimed that it WOULDN't work..

Thanks,

Matt Schillinger
mschilli@vss.fsi.com

On Fri, 2003-01-03 at 11:03, Patrick Caulfield wrote:
> On Fri, Jan 03, 2003 at 11:05:00AM -0600, Matt Schillinger wrote:
> > If i'm NOT using devfs, can i reliably (assuming that disks are on the
> > same scsi id/lun/host channel) use lvm?
> > 
> > Scenario:
> > 
> > LV is created with device /dev/sdd, which is on host channel 2
> > 
> > Machine is shutdown, and a new raid is connected on host channel 1, with
> > one disk.
> > 
> > Machine is restarted, and the 1 disk on the host channel 1 raid takes
> > /dev/sdd. The original disk is now /dev/sde.
> > 
> > Will LVM find the correct disk?
> > 
> 
> Yes, that'll work fine. Getting LVM to work with those scsidev names 
> you mentioned in the first email will be quite a lot harder 
> (unless you use LVM2).
> 
> patrick
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Matt Schillinger
System Administrator
FlightSafety International
mschilli@vss.fsi.com
314-551-8403
