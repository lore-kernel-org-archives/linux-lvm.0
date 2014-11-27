Message-ID: <5476712B.2030404@cn.fujitsu.com>
Date: Thu, 27 Nov 2014 08:32:43 +0800
From: Qu Wenruo <quwenruo@cn.fujitsu.com>
MIME-Version: 1.0
References: <54758746.3000701@cn.fujitsu.com>
	<20141126150617.GA30136@redhat.com>
In-Reply-To: <20141126150617.GA30136@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [BUG?] OOM executing blkdiscard on a thin lv
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Mike Snitzer <snitzer@redhat.com>
Cc: axboe@kernel.dk, Lukas Czerner <lczerner@redhat.com>, Joe Thornber <thornber@redhat.com>, linux-lvm@redhat.com


-------- Original Message --------
Subject: Re: [BUG?] OOM executing blkdiscard on a thin lv
From: Mike Snitzer <snitzer@redhat.com>
To: Qu Wenruo <quwenruo@cn.fujitsu.com>
Date: 2014年11月26日 23:06
> On Wed, Nov 26 2014 at  2:54am -0500,
> Qu Wenruo <quwenruo@cn.fujitsu.com> wrote:
>
>> Hi,
>>
>> [Bug]
>> When I try to discard the whole thin lv using blkdiscard, an OOM
>> occurs and I lost my ssh connection.
>> TTY login also fails to start, although kernel and network still
>> looks alive but no way to login into the system.
>> Have to reboot.
>>
>> Not sure if this is a bug in blkdiscard or lvm.
> It is a bug in the kernel's blkdev_issue_discard() for allowing too many
> inflight bios at once.  We probably should add an upper bound for how
> many inflight discard bios blkdev_issue_discard() will allow at any one
> time.
>
> Reason why so many discard bios are being issued is that the DM thin
> device currently only allows a discard as large as the DM thin-pool's
> configured blocksize.  So if you're using something like a 64K or
> whatever for the thin-pool blocksize then divide your 1TB thin lv by
> that value and you can quickly see why it takes so may discard bios to
> cover the entire logical address space of the 1TB thin device.
>
> Some good news is that Joe has been working on range (multi block)
> discard support to allow for very large discards to be issued to DM thin
> devices.  He is focusing on getting this working on dm-cache at the
> moment but once that is complete bringing it to dm-thin is next.  It is
> a stretch goal to have that land in time for 3.19 merge window (but it
> is quickly approaching so it may need to wait for 3.20).
Thanks for the explain, got it.
I'll wait several kernel releases and try it again.
>> [lvs output]
>>    LV       VG           Attr       LSize  Pool     Origin Data% Move
>> Log Cpy%Sync Convert
>>    disk1    test_vg      Vwi-a-tz--  1.00t thinpool 0.77
>>    thinpool test_vg      twi-a-tz-- 30.00g 26.28
>>
>> [Reproducer]
>> 1. Make a thin pool with 30G space.
>> 2. Create 1T thin lv from the thin pool created in 1.
>> 3. Do some operation to occupy some space in thin lv
>> 4. Exec blkdiscard on the thin lv
>>
>> [Related package version]
>> kernel-3.17.3-200.fc20.x86_64
>> lvm2-2.02.106-1.fc20.x86_64
>> util-linux-2.24.2-1.fc20.x86_64
>>
>> [How to discard thin lv]
>> BTW, what's the proper method to discard all allocated space for a thin lv?
>> Lvremove and lvcreate?!
> Moving forward it'll be a new tool that Joe wrote called thin_trim:
> https://github.com/jthornber/thin-provisioning-tools/commit/8e921580554ed91e84bb68ea32a8c2ea47ad6ff3
>
> But that code hasn't been fully tested and included in the
> device-mapper-persistent-data package yet.
OK, so I'll use the lvremove and lvcreate until the tool gets mature.

Thanks,
Qu
