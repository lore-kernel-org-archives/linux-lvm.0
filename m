From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] disk naming
Message-ID: <1023440000.1041619125@[192.168.200.4]>
In-Reply-To: <1041613503.20036.49.camel@mosix>
References: <1041610095.19844.45.camel@mosix>
 	<20030103174618.Z9539@zealot.blacknet.de> <1041613503.20036.49.camel@mosix>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Fri Jan  3 12:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Matt Schillinger <mschilli@vss.fsi.com>

> If i'm NOT using devfs, can i reliably (assuming that disks are on the
> same scsi id/lun/host channel) use lvm?
>
> Scenario:
>
> LV is created with device /dev/sdd, which is on host channel 2
>
> Machine is shutdown, and a new raid is connected on host channel 1, with
> one disk.
>
> Machine is restarted, and the 1 disk on the host channel 1 raid takes
> /dev/sdd. The original disk is now /dev/sde.
>
> Will LVM find the correct disk?

Nope. Main issue there is that the first disk device
encountered by the kernel will be /dev/sda. Period.

This is the same catagory of problem you get into
with DOS when adding a new drive displaces the "D:"
partition on your first drive.

There are a few fixes for this:

1. Install the non-root drives' controller as a
   module and add /etc/rc.d/init.d/otherscsi
   to install the extra controller's module. At
   that point you are guaranteed not to find the
   RAID before you want to.

2. Devfs will solve this particular problem since
   the /dev/type/bus/target/item list has not changed.
   What will break devfs is adding a new controller
   on the PCI bus in a way that displaces your
   existing controler as, say, /dev/scsi/bus0.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 8773 252 1080
