Message-ID: <530B4487.4000703@redhat.com>
Date: Mon, 24 Feb 2014 14:09:27 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <530A77EC.5090900@mglug.de> <530B059F.3060502@redhat.com>
	<530B3DA6.50807@mglug.de>
In-Reply-To: <530B3DA6.50807@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [SOLVED] unwanted autocreation of /dev/mapper/
 entries while using parted on lvm devices
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: rath@mglug.de

On 02/24/2014 01:40 PM, Oliver Rath wrote:
> Hi Peter!
> 
> Am 24.02.2014 09:41, schrieb Peter Rajnoha:
>> On 02/23/2014 11:36 PM, Oliver Rath wrote:
>> The parted itself creates a new device-mapper mapping that represents
>> the partition. Then it's like any other device-mapper device and so
>> the /dev content is created by 10-dm-disk.rules (the /dev/mapper
>> content) and 13-dm-disk.rules (the /dev/disk content). Parted has this
>> functionality integrated so there's no need to call kpartx in addition. 
> 
> On my machine parted-2.3 was running. Upgrading to parted-3.1 didnt
> help, BUT building parted-3.1 for myself with ./configure
> --disable-device-mapper works! Then parted does his job without creating
> these deices implicitly.

Yes, I was just about to write that :) I think there's no option in parted
to avoid creating these mappings for partitions once the parted is
compiled with device-mapper support. So yes, the only option is either
to recompile without devmapper support or always remove these mappings
manually...

> 
> Maybe you know a less radical method? I.e. I could exclude some names in
> lvm.conf or something like this? The names of the lvm whould should
> create subvolumes are well defined.

You would need to tell parted to stop syncing the state after partition
signatures are created/removed on/from disk. But parted always creates/removes
the partition mappings unconditionally (...or it calls BLKRRPART/blkpg for
non-dm devices).

You can try using fdisk instead which does not do this step and requires
calling partprobe or kpartx manually after partitioning.
-- 
Peter
