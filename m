From: "mons grapius" <monsgrapius@hotmail.com>
Mime-Version: 1.0
Message-ID: <BAY2-F92tTx7e4VksaV0002ea59@hotmail.com>
Subject: [linux-lvm] Unrecognised LVM device type
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
Date: Thu Feb  5 10:02:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi

Sorry to post this again but my attempts to register with the mailing list 
failed so badly I have no way of knowing if my original email made it....

No doubt I'm being stupid but I cannot find a whole load of documentation
on device mapper and LVM2 - there's a certain amount with the source but
it's more what I'd call a rough guide.

My problem is I cannot create a PV (let alone a logical Vol) on a
devicemapped device.

I am using a stock 2.4.22 kernel with the latest stable dm and LVM2 stuff
from the sistina web site.

if I use "lvm version" I get the following

LVM Version 2.00.08 (2003-11-14)
Library Version 1.00.07-ioctl (2003-11-21)
Driver 4.0.5

The kernel patches, the compiles went perfectly and I can see the device
mapper stuff loaded (I've compiled the dm and lvm stuff in statically) at
boot time. I run the mknod scripts at boot up as well.

I have managed to create a simple stripe using hda4 and hdc4 partitions
and I have a lovely big devicemapper device called bigdisk.

The special file for this is in /dev/mapper/bigdisk and has major 254 and
minor of 0.

I can create any regular file system on this device mount it and use it.

If I try to initialise this with pvcreate as in

lvm pvcreate -vvv /dev/mapper/bigdisk

it fails. The ominous line is:

/dev/mapper/bigdisk: Skipping: Unrecognised LVM device type 254


That's it I cannot progress further than that.

I am using the sample lvm.conf file that came with the LVM2 code.
Initially I had no lvm.conf file (just for testing) and it did not work.

I have created a LVM on /dev/hdd4 and that works perfectly so I know the
general installation must be good - well I assume it is!

I know that I have to be missing something obviously simple but without
any doccos I am stumped.

Can anyone help - I hope someone else is trying to create LVs on
devicemapper type devices.

Mark

_________________________________________________________________
Sign-up for a FREE BT Broadband connection today! 
http://www.msn.co.uk/specials/btbroadband
