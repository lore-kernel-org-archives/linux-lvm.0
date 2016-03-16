Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2GM0Jq2021243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 18:00:19 -0400
Received: from mail.gathman.org (unknown [50.248.53.218])
	by mx1.redhat.com (Postfix) with ESMTPS id CBD425BA1F
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 22:00:18 +0000 (UTC)
Received: from elissa.gathman.org (elissa.gathman.org
	[IPv6:2001:470:8:809:11::1009]) (authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id u2GM0F2H012249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 18:00:16 -0400
References: <56E9D1D2.8000403@apollo.lv>
From: Stuart Gathman <stuart@gathman.org>
Message-ID: <56E9D770.7070406@gathman.org>
Date: Wed, 16 Mar 2016 18:00:16 -0400
MIME-Version: 1.0
In-Reply-To: <56E9D1D2.8000403@apollo.lv>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvconvert -m 0 /dev/varlin/distfiles /dev/md0 =>
 zero filled logical volume
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 03/16/2016 05:36 PM, Raimonds Cicans wrote:
> Hello.
>
> I am trying to move LVM setup from old RAID md0 to new RAID md1
>
> I did "lvconvert -m 1 /dev/path/to/logical_volume /dev/md1" on bunch 
> of logical volumes.
> Everything went without problems.
>
> Then I tried to remove md0 from one of logical volumes by running 
> command:
> lvconvert -m 0 /dev/varlin/distfiles /dev/md0
>
> I tried to mount this logical volume, but failed.
>
> Then I checked first  megabyte of logical volume it was zero filled.
>
> Partial output of "lvs -o+devices":
>   LV              VG     Attr       LSize   Pool Origin Data% Meta% 
> Move Log Cpy%Sync Convert Devices
>   backup          varlin -wi-ao---- 100,00g                          
> /dev/md0(6304)
>   backup          varlin -wi-ao---- 100,00g                          
> /dev/md0(8544)
>   data            varlin -wi-ao----  20,00g                          
> /dev/md0(28384)
>   distfiles       varlin -wi-a-----  20,00g                          
> /dev/md1(2738)
>   ftp             varlin rwi-aor---  10,00g 100,00           
> ftp_rimage_0(0),ftp_rimage_1(0)
>   ftpdown         varlin rwi-aor---  10,00g 100,00           
> ftpdown_rimage_0(0),ftpdown_rimage_1(0)
>
>
> lvm2: 2.02.116
> kernel: 4.4.2
>
>
> Questions:
>
> 1) What I did wrong?
I would have used pvmove.  Using lvconvert, I think you needed to sync 
the mirrors before removing a leg.
> 2) Is it possible to salvage /dev/varlin/distfiles or I must restore 
> it from backups?
Use the metdata backups (/etc/lvm) to restore lvm to before you removed md0.
> 3) What I should do now to get system to safe state?
The system is probably fine - you just removed you data.
