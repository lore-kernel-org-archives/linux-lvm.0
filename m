From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] disk naming
Message-ID: <20030103192045.GI18613@tykepenguin.com>
References: <1041610095.19844.45.camel@mosix> <20030103174618.Z9539@zealot.blacknet.de> <1041613503.20036.49.camel@mosix> <1023440000.1041619125@[192.168.200.4]>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1023440000.1041619125@[192.168.200.4]>
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
Date: Fri Jan  3 13:20:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 03, 2003 at 12:38:45PM -0600, Steven Lembark wrote:
> 
> 
> -- Matt Schillinger <mschilli@vss.fsi.com>
> 
> >If i'm NOT using devfs, can i reliably (assuming that disks are on the
> >same scsi id/lun/host channel) use lvm?
> >
> >Scenario:
> >
> >LV is created with device /dev/sdd, which is on host channel 2
> >
> >Machine is shutdown, and a new raid is connected on host channel 1, with
> >one disk.
> >
> >Machine is restarted, and the 1 disk on the host channel 1 raid takes
> >/dev/sdd. The original disk is now /dev/sde.
> >
> >Will LVM find the correct disk?
> 
> Nope. Main issue there is that the first disk device
> encountered by the kernel will be /dev/sda. Period.
 

NOPE, NOPE, NOPE.

LVM writes a UUID to each disk and uses that as the PV identifier. it does NOT
matter what it is called to the kernel. (as long as the device actually visible 
to the code).*

I regularly plug and unplug disks around LVM systems and it works just fine.

patrick

* by which I mean it's a "known device" and not some new device that hasn't been
coded for in LVM (eg i2o block devs). This particular restriction is lifted in LVM2.
