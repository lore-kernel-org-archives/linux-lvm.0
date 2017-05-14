Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 980B877DD1
	for <linux-lvm@redhat.com>; Sun, 14 May 2017 20:45:28 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7233213A60
	for <linux-lvm@redhat.com>; Sun, 14 May 2017 20:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 381DF411
	for <linux-lvm@redhat.com>; Sun, 14 May 2017 22:45:25 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id AkznFxlNZjcZ for <linux-lvm@redhat.com>;
	Sun, 14 May 2017 22:45:25 +0200 (CEST)
Received: from [192.168.178.40] (p50802FC6.dip0.t-ipconnect.de [80.128.47.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id ED236410
	for <linux-lvm@redhat.com>; Sun, 14 May 2017 22:45:24 +0200 (CEST)
References: <fd7147f6-6a91-198d-d381-e41a1cfe458d@mglug.de>
From: Oliver Rath <rath@mglug.de>
Message-ID: <141d0fb3-0a8a-ada0-d4cf-ba70d988af59@mglug.de>
Date: Sun, 14 May 2017 22:45:24 +0200
MIME-Version: 1.0
In-Reply-To: <fd7147f6-6a91-198d-d381-e41a1cfe458d@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] SOLVED [was: : pvmove of thinpool-metadata fail]
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

Hi list,

deactivating the whole vg with

vgchange -an dmivg

resulted a working

lvconvert --repair dmivg/winthinpool

after this, i was able to remove the "old" metadata on /dev/ram0 with

lvremove /dev/mapper/dmivg-winthinpoo_meta0

After this, i was able to reduce the vg with

vgreduce dmivg /dev/ram0

DONE

So all is fine now.

Regards
Oliver


On 14.05.2017 19:00, Oliver Rath wrote:
> Hi list,
> 
> Ive moved the _tmeta part of a thinpool to a (ramdisk) device for
> testing and wanted now to move it back to disk, but this fail:
> 
> # pvmove -v -n /dev/mapper/dmivg-winthinpool_tmeta  /dev/ram0 /dev/sdg1
>   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
>     Cluster mirror log daemon not included in build.
>     Wiping internal VG cache
>     Wiping cache of LVM-capable devices
>     Archiving volume group "dmivg" metadata (seqno 217).
>     Creating logical volume pvmove0
>     Moving 229 extents of logical volume dmivg/winthinpool_tmeta
>     activation/volume_list configuration setting not defined: Checking
> only host tags for dmivg/winthinpool_tmeta.
>     Setting up pvmove in on-disk volume group metadata.
>     Creating dmivg-pvmove0
>   device-mapper: create ioctl on dmivg-pvmove0
> LVM-EHcvL2Ube7wb2effdgOufgqLTeAS9K6fABDshfurJLvBuIPvuBMXLnlfGxHUNCc8
> failed: Device or resource busy
>   Failed to suspend winthinpool_tmeta
>   ABORTING: Temporary pvmove mirror activation failed.
> 
> 
> It seems, that pvmove is trying to create a mirror-device from *_tmeta
> on the target disk, but this seems to fail.
> 
> The computer is still running, so do I have a possibility to save the
> situation? Can I transfer the *tmeta in another way?
> 
> LVM und Thin-provisioning-tools are from git today.
> 
> Tfh!
> Oliver
> 
