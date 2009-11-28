Received: from [10.36.4.115] (vpn1-4-115.ams2.redhat.com [10.36.4.115])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nASEVl4j026523
	for <linux-lvm@redhat.com>; Sat, 28 Nov 2009 09:31:48 -0500
Message-ID: <4B113453.1030703@redhat.com>
Date: Sat, 28 Nov 2009 15:31:47 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange behaviour with initramfs and read-ahead
	settings
References: <20091128105253.GA4389@gibson.comsick.at>
In-Reply-To: <20091128105253.GA4389@gibson.comsick.at>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 11/28/2009 11:52 AM, Michael Guntsche wrote:
> I am currently running the 2.6.32-rc8 kernel with lvm2 version 2.02.54-1
> on debian unstable.
> Since my root is on LVM as well I use an initramfs for booting. The
> setup I have consists of 5 disks in a RAID-5 with one PV on top of it.
> Now for my problem. The md device correctly sets the read-ahead to 4096.
> If I understand correctly lvm should get this value and set the
> read-ahead on the LVs accordingly. This is not working correctly for
> all my LVs.

Hi,

the logic is simple here
- if readahead is set to auto, it should inherit value from underlying device
for all LVs on that PV
- if there is explicitly set value in metadata, it should always use that
(you can switch back to auto by specifying -r auto)

(striped volumes calculate readahead differently, but it is not the case here)

There was similar issue - caused by not updated lvm in initrd
(or with different lvm.conf there) - all volumes activated
in initramdisk had different readahead value set - please check this.

Also Check default value of readahed in lvm.conf in activation section.

(See also https://bugzilla.redhat.com/show_bug.cgi?id=473273 )

If you still see that some volume is activated wrongly, please send
debug output of lvchange -a y -vvvv <LV>, blockdev --getra <PV>

> For testing purposes I took one LV (home) offline and back online again
> 
> lvchange -an;lvchange -ay
> 
> After that the readahead was set correctly to 4096. I am not sure what's
> happening here. I would understand a problem with getting the values
> automatically but right now they are saved in the metadata but are still
> set to 256. 

Check which lvm activated it first - it seems that it uses old default or
old version of lvm.

Milan
--
mbroz@redhat.com
