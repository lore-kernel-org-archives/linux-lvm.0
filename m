Date: Mon, 8 Oct 2018 10:00:16 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20181008150016.GB21471@redhat.com>
References: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
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

On Mon, Oct 08, 2018 at 04:23:27AM -0600, Gang He wrote:
> Hello List
> 
> The system uses lvm based on raid1. 
> It seems that the PV of the raid1 is found also on the single disks that build the raid1 device:
> [  147.121725] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV on /dev/sda2 was already found on /dev/md1.
> [  147.123427] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV on /dev/sdb2 was already found on /dev/md1.
> [  147.369863] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/md1 because device size is correct.
> [  147.370597] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/md1 because device size is correct.
> [  147.371698] linux-472a dracut-initqueue[391]: Cannot activate LVs in VG vghome while PVs appear on duplicate devices.

Do these warnings only appear from "dracut-initqueue"?  Can you run and
send 'vgs -vvvv' from the command line?  If they don't appear from the
command line, then is "dracut-initqueue" using a different lvm.conf?
lvm.conf settings can effect this (filter, md_component_detection,
external_device_info_source).

> This is a regression bug? since the user did not encounter this problem with lvm2 v2.02.177.

It could be, since the new scanning changed how md detection works.  The
md superblock version effects how lvm detects this.  md superblock 1.0 (at
the end of the device) is not detected as easily as newer md versions
(1.1, 1.2) where the superblock is at the beginning.  Do you know which
this is?
