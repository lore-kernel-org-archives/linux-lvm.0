Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6GL4hx3004253
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 17:04:43 -0400
Received: from smtp2.globetrotter.net (smtp2.globetrotter.net [142.169.1.152])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6GL4Qtq002635
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 17:04:26 -0400
Received: from [192.168.1.158]
	(c207.134.181-229.clta.globetrotter.net [207.134.181.229])
	by smtp2.globetrotter.net (iPlanet Messaging Server 5.2)
	with ESMTP id <0K44009I1AJ8WU@"TELUS Quebec"> for linux-lvm@redhat.com;
	Wed, 16 Jul 2008 17:04:21 -0400 (EDT)
Date: Wed, 16 Jul 2008 17:03:21 -0400
From: Jean-Philippe Villeneuve <jeepii@globetrotter.net>
Subject: Re: [linux-lvm] Backup of ROOT Partition.
In-reply-to: <486B8550.6070605@globetrotter.net>
Message-id: <487E6219.7030507@globetrotter.net>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <48694ABE.2080307@globetrotter.net>
	<486A0EFE.8020805@kadzban.is-a-geek.net>
	<486B8550.6070605@globetrotter.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I tried the folowing recipe: 
http://tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html with the folowing 
script:

/****************************/

#!/bin/sh
BAKLVMNAME=sysbackup
lvcreate -L592M -s -n $BAKLVMNAME  /dev/VolGroup00/LogVol00
mount /dev/VolGroup00/$BAKLVMNAME /mnt/sysbackup/ -o ro
cd /mnt/sysbackup
time tar -cjvpf /mnt/serveur/backSysVol.bz2 *
cd ..
umount /mnt/sysbackup
lvremove -f /dev/VolGroup00/$BAKLVMNAME

/****************************/

I get the folowing error:
  Rounding up size to full physical extent 608.00 MB
  Insufficient free extents (1) in volume group VolGroup00: 19 required

It works find if I do it with -L20M.
How do I change the LogicalVolumeSize?

according to 'df' I have plenty of space for data.

# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                       35G  6.0G   27G  19% /
/dev/md0              677G  270G  373G  42% /mnt/serveur
/dev/sda1             190M   26M  155M  15% /boot
tmpfs                 374M     0  374M   0% /dev/shm

Am I missing something?

Jean-Philippe Villeneuve wrote:
>
> Bryan Kadzban wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: RIPEMD160
>>
>> Jean-Philippe Villeneuve wrote:
>>  
>>> I would like to know if I can backup all my system partitions(ROOT 
>>> included) using a snapshot?
>>>     
>>
>> Depends on what you mean by "backup [...] using a snapshot".
>>
>> If you mean taking a snapshot, then mounting it somewhere and pointing
>> your backup software to that mount point, then unmounting and deleting
>> the snapshot after the backup is done, then yes, it should work fine.
>>   
> This is exactly what I want to do.  I just want the latest 
> configuration, users files etc. I realy don't need files at a specific 
> date with tons of backups.
>
> Than you all for the fast and acurate answers.
>
> Jean-Philippe
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
