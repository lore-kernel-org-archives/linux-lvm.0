Subject: Re: [linux-lvm] disk naming
From: Matt Schillinger <mschilli@vss.fsi.com>
In-Reply-To: <20030104195544.GB11424@tykepenguin.com>
References: <1041610095.19844.45.camel@mosix>
	<20030103174618.Z9539@zealot.blacknet.de> <1041613503.20036.49.camel@mosix>
	<1023440000.1041619125@[192.168.200.4]>
	<20030103192045.GI18613@tykepenguin.com>
	<1121550000.1041664663@[192.168.200.4]>
	<20030104100014.GA11424@tykepenguin.com>
	<1216750000.1041705320@[192.168.200.4]> 
	<20030104195544.GB11424@tykepenguin.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1042043372.15431.8.camel@mosix>
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
Date: Wed Jan  8 10:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have another scenario... If I have 1 volume setup
(/dev/test_vg/testlv1) and mounted on say, /mnt.

The disk is connected via scsi host channel 0, scsi id 4, and lun 0.

If i umount /mnt,
move the scsi disk to host channel 1,

Then run rescan-scsi-bus.sh 1, it should scan the scsi bus on host
channel 1, then find the scsi disk.

is there a way to make lvm see the new disk in a way that is mountable?


I have done the previous, but i see in /proc/lvm/global, that each VG is
associated with PV devices (/dev/sda1, etc). Is there a way that lvm can
rescan and reassociate VGs to new PV devices? (as in the disk on the
host channel 1 is added in as /dev/sdd).. If i reboot, this is no
problem to register things, but I am wonder if it is possible to do the
task without a reboot..

Thanks,

Matt Schillinger
mschilli@vss.fsi.com
