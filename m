Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5U7xArs023025
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 03:59:10 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.191])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5U7wwtF022278
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 03:58:58 -0400
Received: by nf-out-0910.google.com with SMTP id g2so196723nfe
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 00:58:58 -0700 (PDT)
Message-ID: <44A4D3CB.4060902@gmail.com>
Date: Fri, 30 Jun 2006 09:33:31 +0200
From: "ThomasC." <shoktai@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm and fstab
References: <44A3DF57.4080003@gmail.com> <44A3F773.5040800@conterra.de>
In-Reply-To: <44A3F773.5040800@conterra.de>
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
> ThomasC. wrote:
>> I am using RHEL3.
>> I have been reading the LVM howto and it is very clear but i am missing
>> something anyways.
>> During the setup with DiskDruid i created a Volume group and two logical
>> volumes.
>> One LV for /opt and another one for /stage.
>> After rebooting the OS i don't have any /stage partition.
>=20
> initializing LVM is a multi stage process.
>=20
> 1. create the volume
>=20
> 2. create LVs within the volume.
>=20
> 3. format the LVs i.e. with "mke2fs"
>=20
> 4. copy data to the LVs
>=20
> 5. register the LVs with /etc/fstab to have them
>    available by default after each boot.
>=20
> Don't know what "DiskDruid" is, but it seems it did not
> perform steps 4 and 5 automatically. May be you have to
> perform them by hand.
>=20
> Todo:
>=20
> Verify step 2) by entering "lvs" to get a list of all your
> LVs created. Try to mount one of your LVs manually.
> i.E. try "mount /dev/Volume00/LogVol00 /mnt" (if your
> LV is named "LogVol00", else choose the name the "lvs"
> command told you). If you get an error, you should try to
> format the LV by "mke2fs". Else you may look into /mnt
> if there is already some data (you should find an empty
> lost+found directory).
>=20
> If there is no data, you may copy all your /opt to /mnt.
> Use: "cp -av /opt/* /mnt". Now you may umount /mnt.
> You may rename your current /opt into /opt-old and
> create a new empty /opt directory, then try:
> "mount /dev/Volume00/LogVol00 /opt".
>=20
> If all looks good, you should add a line to your /etc/fstab
> to get /opt mounted by default. Test the entry by umounting
> your /opt again ("umount /opt") and try a "mount -a", which
> mounts all entries from /etc/fstab. If all works well, you will
> find /opt mounted again without any error messages.
>=20
> Now you may try to reboot.
>=20
> Same for /stage...
>=20
> Tip:
>=20
> If your "DiskDruid" named your volumes /dev/Volume00/LogVol00
> this is OK, but a big feature of LVM is, that the LV may have
> expressive names. So it may find it useful to "rename" your=20
> /dev/Volume00/LogVol00 into "/dev/Volume00/OPT".
>=20
> See: "man lvrename".=20
>=20
> Dieter
Thanks very much (all) for your valuable help. Dieter thanks very much=20
the great explanation.

PS DiskDruid is the disk partitioning manager contained in RedHat=20
installation.
