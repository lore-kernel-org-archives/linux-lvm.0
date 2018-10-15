Date: Mon, 15 Oct 2018 10:26:48 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20181015152648.GB29274@redhat.com>
References: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
	<20181008150016.GB21471@redhat.com>
	<5BC42808020000F90003A3E5@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5BC42808020000F90003A3E5@prv1-mh.provo.novell.com>
Subject: Re: [linux-lvm] Fails to create LVM volume on the top of RAID1
 after upgrade lvm2 to v2.02.180
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gang He <ghe@suse.com>
Cc: linux-lvm@redhat.com

On Sun, Oct 14, 2018 at 11:39:20PM -0600, Gang He wrote:
> >> [  147.371698] linux-472a dracut-initqueue[391]: Cannot activate LVs in VG 
> > vghome while PVs appear on duplicate devices.
> > 
> > Do these warnings only appear from "dracut-initqueue"?  Can you run and
> > send 'vgs -vvvv' from the command line?  If they don't appear from the
> > command line, then is "dracut-initqueue" using a different lvm.conf?
> > lvm.conf settings can effect this (filter, md_component_detection,
> > external_device_info_source).
> 
> mdadm --detail --scan -vvv
> /dev/md/linux:0:
>            Version : 1.0

It has the old superblock version 1.0 located at the end of the device, so
lvm will not always see it.  (lvm will look for it when it's writing to
new devices to ensure it doesn't clobber an md component.)

(Also keep in mind that this md superblock is no longer recommended:
raid.wiki.kernel.org/index.php/RAID_superblock_formats)

There are various ways to make lvm handle this:

- allow_changes_with_duplicate_pvs=1
- external_device_info_source="udev"
- reject sda2, sdb2 in lvm filter

> > It could be, since the new scanning changed how md detection works.  The
> > md superblock version effects how lvm detects this.  md superblock 1.0 (at
> > the end of the device) is not detected as easily as newer md versions
> > (1.1, 1.2) where the superblock is at the beginning.  Do you know which
> > this is?
