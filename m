Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27A155D9C6
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 14:15:22 +0000 (UTC)
Received: from egamorf.bogon.ca (egamorf.bogon.ca [149.56.143.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9D114E327
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 14:15:10 +0000 (UTC)
Received: from atlas.bogon.ca ([2001:470:b358:0:2c9d:79ff:fe07:eeb0])
	by egamorf.bogon.ca with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <doug@bogon.ca>) id 1ffnES-0008JU-M5
	for linux-lvm@redhat.com; Wed, 18 Jul 2018 14:15:08 +0000
Received: from doug by atlas.bogon.ca with local (Exim 4.90_1)
	(envelope-from <doug@bogon.ca>) id 1ffnEQ-0007aT-Rx
	for linux-lvm@redhat.com; Wed, 18 Jul 2018 10:15:06 -0400
Date: Wed, 18 Jul 2018 10:15:06 -0400
From: Douglas Paul <doug@bogon.ca>
Message-ID: <20180718141506.GD12563@bogon.ca>
References: <3ec4e4af-8109-ca19-2a57-8e8cf6d67737@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ec4e4af-8109-ca19-2a57-8e8cf6d67737@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jul 18, 2018 at 09:25:37PM +0800, runappz wrote:
>  ��� lvcreate --type raid10 -m 1 -i 2 -l 24576 pve # created lvol1
>  ��� lvcreate --type raid10 -m 1 -i 2 -l 8 pve # created lvol2
>  ��� lvcreate --type raid10 -m 1 -i 2 -l 8 pve # created lvol3
> 
>  ��� lvcreate --type raid10 -m 1 -i 2 -l 8 pve # created lvol4
>  ��� lvcreate --type raid10 -m 1 -l 8 pve # created lvol5
> 
> The default LE size was 4MiB, so that I expect lvol1 to be 2*4*24576
> MiB, while other 4 are all 2*4*8 MiB. However, I only got 4*24576 MiB
> and 4*8 MiB partitions. I tried to run `mkfs.ext4` on lvol3 and mount
> it. `df` shows clearly that lvol3 is a 32MiB volume.

The -l option is the final size of the LV, not the space used on each device
for each stripe or mirror. So when you say -l 8, it means the LV has 8
usable extents, so it is supposed to be 32MiB. It doesn't matter how many
stripes or mirrors you have.

-- 
Douglas Paul
