Mime-Version: 1.0 (Apple Message framework v1085)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <1410202048.13625.27.camel@kurenai.local>
Date: Thu, 11 Sep 2014 18:31:06 -0500
Message-Id: <47B3B0F3-0BC9-41D9-AB5C-FC1027E7B00F@redhat.com>
References: <1408896497.27190.12.camel@kurenai.local>
	<5211F372-B9BB-43A8-B569-AC1E3B077D15@redhat.com>
	<1409828800.6181.19.camel@kurenai.local>
	<0C032AC6-0346-4E28-BC0A-240EC76C44E2@redhat.com>
	<1410202048.13625.27.camel@kurenai.local>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Does LVM RAID1 have TRIM support?
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
Cc: oranenj+lvm@iki.fi


On Sep 8, 2014, at 1:47 PM, Jarkko Oranen wrote:

> On Mon, 2014-09-08 at 12:47 -0500, Brassow Jonathan wrote:
>> On Sep 4, 2014, at 6:06 AM, Jarkko Oranen wrote:
>> 
>>>> TRIM is not yet supported in LVM RAID.  However, if MD has a solid TRIM implementation, it should be simple to enable it for LVM.  (This is because the MD kernel modules are used to perform RAID for LVM.  There is only a thin wrapper layer (linux/drivers/md/dm-raid.c) in device-mapper used to set-up the device.)
>>> 
>>> Thanks for the reply! Unfortunately, "simple" is relative.
>> 
>> By "simple", I mean that from our side all we should need to do is set 'num_discard_bios = 1' in dm-raid.c.  That is, if things are working fine in MD.  We could even make that conditional depending on the type of RAID (e.g. discards for RAID1, but not RAID5).  It could end up being that simple, but I need to know if MD has proper support for discards and all the kinks have been worked out.
>> 
> 
> dm-raid.c already has         
> 
>  ti->num_discard_bios = 1;
> 
> in raid_ctr in the kernel source I'm looking at (3.15.6; not the most
> recent, but it's what I happen to have locally available). As I said, to
> me it looks like it should already work, but it doesn't, so I spent a
> bit of time trying to understand why. 
> 
> Digging at it again, eg. lsblk -D seems to report discard information
> identical to other discard-supporting block devices, suggesting that
> discard passthrough should work fine, but the actual ioctl fails (when
> testing via either fstrim or blkdiscard) with "not supported" for
> whatever reason.
> 
> As far as I know, discard support in MD is stable, and has been so for a
> long while; my current setup consists of linear logical volumes on top
> of a software RAID PV created with mdadm, and I haven't had a single
> issue with discards. It seems RAID1 discard support was merged in
> January 2011 (git commit 5fc2ffeabb9ee0fc0e71ff16b49f34f0ed3d05b4), so
> it's definitely not new.

dm-raid.c does not have that - dm-raid1.c does.  dm-raid1.c is a mirroring implementation specific to device-mapper.  It is used by LVM for pvmove functionality (and is otherwise being slowly phased out).  dm-raid.c is the device-mapper wrapper around the MD RAID personalities.  It does not have discard support.

I will ask Neil what the current state of discard support is in MD.  I see that "support" was added in Oct of 2012 (starting at commit 2ff8cc2), but I remember them having problems with discards + any resync operations.  If Neil says it is ok, I will turn it on.

 brassow
