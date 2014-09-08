Mime-Version: 1.0 (Apple Message framework v1085)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <1409828800.6181.19.camel@kurenai.local>
Date: Mon, 8 Sep 2014 12:47:57 -0500
Message-Id: <0C032AC6-0346-4E28-BC0A-240EC76C44E2@redhat.com>
References: <1408896497.27190.12.camel@kurenai.local>
	<5211F372-B9BB-43A8-B569-AC1E3B077D15@redhat.com>
	<1409828800.6181.19.camel@kurenai.local>
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


On Sep 4, 2014, at 6:06 AM, Jarkko Oranen wrote:

>> TRIM is not yet supported in LVM RAID.  However, if MD has a solid TRIM implementation, it should be simple to enable it for LVM.  (This is because the MD kernel modules are used to perform RAID for LVM.  There is only a thin wrapper layer (linux/drivers/md/dm-raid.c) in device-mapper used to set-up the device.)
> 
> Thanks for the reply! Unfortunately, "simple" is relative.

By "simple", I mean that from our side all we should need to do is set 'num_discard_bios = 1' in dm-raid.c.  That is, if things are working fine in MD.  We could even make that conditional depending on the type of RAID (e.g. discards for RAID1, but not RAID5).  It could end up being that simple, but I need to know if MD has proper support for discards and all the kinks have been worked out.

 brassow
