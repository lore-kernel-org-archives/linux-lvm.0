Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07649608EF
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 14:41:28 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BFEF12C0A
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 14:41:17 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id x5-v6so2101186pgp.7
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 07:41:17 -0700 (PDT)
Received: from ?IPv6:2402:f000:1:1a01:68b5:9361:5007:bee9?
	([2402:f000:1:1a01:68b5:9361:5007:bee9])
	by smtp.gmail.com with ESMTPSA id
	c7-v6sm6228133pfh.25.2018.07.18.07.41.14 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jul 2018 07:41:15 -0700 (PDT)
References: <3ec4e4af-8109-ca19-2a57-8e8cf6d67737@gmail.com>
	<20180718141506.GD12563@bogon.ca>
From: runappz <runappz@gmail.com>
Message-ID: <80dbc3e4-3f7e-ba5d-7f0b-00b809098538@gmail.com>
Date: Wed, 18 Jul 2018 22:41:14 +0800
MIME-Version: 1.0
In-Reply-To: <20180718141506.GD12563@bogon.ca>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] Got only half the space of RAID10 LV with 4 PVs
 (similar to RAID1 cause LV shows it has 4 'Mirrored volumes')
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
To: linux-lvm@redhat.com

Thank you for clarifying it sir. Then  for `-l 8` I expect all 
`lvolX_rimage_N`s has 4 extents rather than 8:

       --- Segments ---
       Logical extents 0 to 7:
         Type        raid10
         Monitoring        monitored
         Raid Data LV 0
           Logical volume    lvol5_rimage_0
           Logical extents    0 to 7
         Raid Data LV 1
           Logical volume    lvol5_rimage_1
           Logical extents    0 to 7
       ...


On 2018/7/18 22:15, Douglas Paul wrote:
> On Wed, Jul 18, 2018 at 09:25:37PM +0800, runappz wrote:
>>       lvcreate --type raid10 -m 1 -i 2 -l 24576 pve # created lvol1
>>       lvcreate --type raid10 -m 1 -i 2 -l 8 pve # created lvol2
>>       lvcreate --type raid10 -m 1 -i 2 -l 8 pve # created lvol3
>>
>>       lvcreate --type raid10 -m 1 -i 2 -l 8 pve # created lvol4
>>       lvcreate --type raid10 -m 1 -l 8 pve # created lvol5
>>
>> The default LE size was 4MiB, so that I expect lvol1 to be 2*4*24576
>> MiB, while other 4 are all 2*4*8 MiB. However, I only got 4*24576 MiB
>> and 4*8 MiB partitions. I tried to run `mkfs.ext4` on lvol3 and mount
>> it. `df` shows clearly that lvol3 is a 32MiB volume.
> The -l option is the final size of the LV, not the space used on each device
> for each stripe or mirror. So when you say -l 8, it means the LV has 8
> usable extents, so it is supposed to be 32MiB. It doesn't matter how many
> stripes or mirrors you have.
>
