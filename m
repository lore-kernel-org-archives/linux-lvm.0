Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DGcJn7015944
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 12:38:19 -0400
Received: from bronze.cs.yorku.ca (bronze.cs.yorku.ca [130.63.90.34])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DGcFY3019110
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 12:38:16 -0400
Received: from [130.63.86.107] (ident=jas)
	by bronze.cs.yorku.ca with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.62)
	(envelope-from <jas@cse.yorku.ca>) id 1G14CY-00008W-IG
	for linux-lvm@redhat.com; Thu, 13 Jul 2006 12:38:10 -0400
Message-ID: <44B676F2.2070602@cse.yorku.ca>
Date: Thu, 13 Jul 2006 12:38:10 -0400
From: Jason Keltz <jas@cse.yorku.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 volumes not available on boot
References: <44B66C49.90500@cse.yorku.ca> <44B67177.4050404@conterra.de>
In-Reply-To: <44B67177.4050404@conterra.de>
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
>> I have what is probably a very simple question concerning lvm2.    If I
>> create an lvm2 volume, and reboot, I no longer see the volume.  The
>> system startup scripts do "vgchange -a y", but if I do this by hand, I g=
et:
>>
>> No volume groups found
>=20
> I observed this for my SuSE system, too. I found, LVM was compiled as
> a module, but it was not loaded when system startup initialized lvm :-(
> I managed to push loading of LVM into initrd. Thus it gets loaded
> very early and even may mount root from LVM. Either start mkinitrd
> manually with the informations to load LVM, or declare the LVM module
> within some config file to get it into initrd.
>=20
> For SuSE it's in: /etc/sysconfig/kernel.

Hi.

Thanks for your quick response.  I don't think in my case the problem is=20
that the module isn't loaded .... Here are the lines in rc.sysinit:

     if [ -x /sbin/lvm.static ]; then
         if /sbin/lvm.static vgscan --mknodes --ignorelockingfailure >=20
/dev/null
2>&1 ; then
             action $"Setting up Logical Volume Management:"=20
/sbin/lvm.static vgchange -a y --ignorelockingfailure
         fi
     fi

Before the vgscan is run, here are the loaded modules:

Module                  Size  Used by
dm_mirror              28577  0
dm_mod                 59717  1 dm_mirror
joydev                 13953  0
button                 10449  0
battery                12741  0
ac                      8773  0
uhci_hcd               32729  0
ehci_hcd               31813  0
3w_9xxx                35909  0
e1000                  99757  0
floppy                 57937  0
ext3                  118729  1
jbd                    60761  1 ext3
ata_piix               13381  1
libata                 57885  1 ata_piix
sd_mod                 20417  2
scsi_mod              116941  3 3w_9xxx,libata,sd_mod

... so "dm_mod" is actually loaded, and as far as I know, that's the=20
lvm2 module.  The output of those commands is then:

File descriptor 21 left open
   No volume groups found
   No volume groups found
   Reading all physical volumes.  This may take a while...

... and it doesn't seem to find any physical volumes, but if I use the=20
same command after bootup:

# /sbin/lvm.static vgscan --mknodes --ignorelockingfailure
   Reading all physical volumes.  This may take a while...
   Found volume group "scratch" using metadata type lvm2

??

Jason.
