From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM1 Snapshot
Message-ID: <20030403070800.GA1273@tykepenguin.com>
References: <20030402164704.61870.qmail@web14403.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030402164704.61870.qmail@web14403.mail.yahoo.com>
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
Date: Thu Apr  3 01:08:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 02, 2003 at 08:47:04AM -0800, Aman Shahi wrote:
> 
> does that mean that I will have to dedicate that
> physical device for the Snapshot. I mean if I had
> 4 device /dev/sda /dev/sdb /dev/sdc /dev/sdd and
> previously if I was striping my original LV over
> all the 4 devices, in the current context I stripe
> the original LV over 3 devices and create the
> Snapshot LV over the 4th (dev/sdd) ?

Not at all. the LV will take up only as much space on
that PV as you allocate to it. All that is happening by
adding the device name to the end of command is that LVM is
forced to use only that device when allocating the volume, 
rather than being allowed to use any device in the Volume Group.

Whether it affects the performance of other devices on the
system is up to you and how you have spread the load across
devices. 

Personally I allocate performance-critical filesystems on seperate
disks and low-use filesystems I leave to LVM to allocate.

Of course if the load changes you can always use pvmove to change
where the data is located.

In the case of 4 disks with 4 stripes (ie there is no "spare" disk)
I think what I would do would be to allocate a striped snapshot LV
so that at least the COW load is also spread evenly across all the 
disks.

None of this is mandatory, you are free to allocate LVs where you like
(that's the point of LVM) and performance matters are very much specific
to the particular installation.

patrick
