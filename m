From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] DM: Possible disk corruption?
Message-ID: <20030107145249.A13660@uk.sistina.com>
References: <20030107092849.GE2529@lug-owl.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030107092849.GE2529@lug-owl.de>; from jbglaw@lug-owl.de on Tue, Jan 07, 2003 at 10:28:50AM +0100
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
Date: Tue Jan  7 08:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 07, 2003 at 10:28:50AM +0100, Jan-Benedict Glaw wrote:
> The first 512 byted of mentioned boot HDD where overwritten by some
> Samba log! This is followed by some KB of 0x00.

If you read/write directly to /dev/hda do you see any corruption?
Do you see any errors for the device in the system logs?

> After playing a bit with DM+LVM2, I shutted the box down to bring it to
> another location, but it didn't any longer boot:-( I reinstalled the
> base system (the LVs came up again with no problems:-), but rebooting
> the box again, it didn't boot up again:-(

I reckon it's unlikely DM/LVM2 can be causing this - not least because
the device you're seeing problems on is apparently outside 
the DM/LVM2 system.

Nevertheless, you can block LVM2 userspace from reading/writing
to/from /dev/hda and its partitions by adding a filter to lvm.conf 
(see example.conf) e.g. "r|^/dev/hda|"
and then running vgscan to apply the new filter.
[Personally I recommend using a positive filter though - (a)ccept
the devices you want to use with LVM2 and (r)eject everything else.]

You can see what block devices the kernel device-mapper is really
using by running 'dmsetup' after you have activated your LVs:
For each entry in /dev/mapper, run:
  dmsetup deps name    e.g. dmsetup deps vg0-lvol0
to get a list of major/minor numbers used.
  dmsetup table <name>
shows you the mappings.

Did you keep a complete log of the commands you ran so you can check
retrospectively for typos?  (e.g. "/dev/hda" where "/dev/hda2" was
intended)  [Always a good idea to set shell history to a big number,
or (esp. on a shared box) to use 'sudo' to record all commands 
run as root.]

If the problem is reproducible, I'd check for all occurrences of
"/dev/hda" on your system (e.g. with 'rgrep') and make sure none of
them have have a missing partition ID.  I'd check the block device
major/minors are correct & there isn't another /dev/something 
the same as /dev/hda & that the physical devices hda, hdb, hdc etc. 
haven't got reordered by mistake & the geometries & jumpers
are correct.

Then I'd make sure syslog was set up to log *all* messages 
(many distributions annoyingly throw many debug messages away by
default) and run through the system startup & shutdown sequence
manually, to discover at what point the sector gets corrupted, and
dealing with any error messages that appear either on the screen or in
the system logs.

> PS: If you would like to have the floppy's contents for your own
> inspection, 

I don't think it would help in isolation: to follow that line of
investigation you need to start by working out where those 512 bytes 
of samba log were meant to be on your system - e.g. are they a copy of
existing data, or is that sector missing from where it should be? etc.

Alasdair
-- 
agk@uk.sistina.com
