Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DJAeDi024821
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 15:10:40 -0400
Received: from bronze.cs.yorku.ca (bronze.cs.yorku.ca [130.63.90.34])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DJAb9g006282
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 15:10:37 -0400
Received: from [130.63.86.107] (ident=jas)
	by bronze.cs.yorku.ca with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.62)
	(envelope-from <jas@cse.yorku.ca>) id 1G16Zz-0003Zo-UN
	for linux-lvm@redhat.com; Thu, 13 Jul 2006 15:10:32 -0400
Message-ID: <44B69AA7.9020500@cse.yorku.ca>
Date: Thu, 13 Jul 2006 15:10:31 -0400
From: Jason Keltz <jas@cse.yorku.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 volumes not available on boot
References: <44B66C49.90500@cse.yorku.ca>
	<44B67177.4050404@conterra.de>	<44B676F2.2070602@cse.yorku.ca>
	<44B68206.60306@conterra.de>
In-Reply-To: <44B68206.60306@conterra.de>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dieter St=EF=BF=BDken wrote:
> Jason Keltz wrote:
>> Before the vgscan is run, here are the loaded modules:
>>
>> Module                  Size  Used by
>> dm_mirror              28577  0
>> dm_mod                 59717  1 dm_mirror
>> joydev                 13953  0
>> button                 10449  0
>> battery                12741  0
>> ac                      8773  0
>> uhci_hcd               32729  0
>> ehci_hcd               31813  0
>> 3w_9xxx                35909  0
>> e1000                  99757  0
>> floppy                 57937  0
>> ext3                  118729  1
>> jbd                    60761  1 ext3
>> ata_piix               13381  1
>> libata                 57885  1 ata_piix
>> sd_mod                 20417  2
>> scsi_mod              116941  3 3w_9xxx,libata,sd_mod
>>
>> ... so "dm_mod" is actually loaded, and as far as I know, that's the
>> lvm2 module. =20
>=20
> I also have two 3w_9xxx since a few weeks, works great!
>=20
> If it becomes /dev/sdb, have a look into /sys/block/sdb and
> /proc/partitions if it appears correctly. Also, certain devices
> may be excluded from scanning via /etc/lvm/lvm.conf.
>=20
> Does hotplug create /dev/sdb dynamically and in time during boot?
>=20
> In the beginning I got problems, as the 3ware controller
> and my SATA backplane both may be configured to delay the
> disk spinup. This caused some timeout trouble.

/sys/block/sdb existed, but I think you're right re: disk spinup since I=20
inserted a "sleep 5" into rc.sysinit before the call to vgscan and it=20
works now!

Jason.
