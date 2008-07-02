Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m62Df6W0021425
	for <linux-lvm@redhat.com>; Wed, 2 Jul 2008 09:41:07 -0400
Received: from smtp1.globetrotter.net (smtp1.globetrotter.net [142.169.1.151])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m62DeZq4013087
	for <linux-lvm@redhat.com>; Wed, 2 Jul 2008 09:40:35 -0400
Received: from [192.168.1.158]
	(c207.134.181-229.clta.globetrotter.net [207.134.181.229])
	by smtp1.globetrotter.net (iPlanet Messaging Server 5.2)
	with ESMTP id <0K3D00EEWSNG18@"TELUS Quebec"> for linux-lvm@redhat.com;
	Wed, 02 Jul 2008 09:40:29 -0400 (EDT)
Date: Wed, 02 Jul 2008 09:40:32 -0400
From: Jean-Philippe Villeneuve <jeepii@globetrotter.net>
Subject: Re: [linux-lvm] Backup of ROOT Partition.
In-reply-to: <486A0EFE.8020805@kadzban.is-a-geek.net>
Message-id: <486B8550.6070605@globetrotter.net>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <48694ABE.2080307@globetrotter.net>
	<486A0EFE.8020805@kadzban.is-a-geek.net>
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


Bryan Kadzban wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: RIPEMD160
>
> Jean-Philippe Villeneuve wrote:
>   
>> I would like to know if I can backup all my system partitions(ROOT 
>> included) using a snapshot?
>>     
>
> Depends on what you mean by "backup [...] using a snapshot".
>
> If you mean taking a snapshot, then mounting it somewhere and pointing
> your backup software to that mount point, then unmounting and deleting
> the snapshot after the backup is done, then yes, it should work fine.
>   
This is exactly what I want to do.  I just want the latest 
configuration, users files etc. I realy don't need files at a specific 
date with tons of backups.

Than you all for the fast and acurate answers.

Jean-Philippe
