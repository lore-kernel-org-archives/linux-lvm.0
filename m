Received: from [127.0.0.1] (sebastian-int.corp.redhat.com [172.16.52.221])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAMMRmpo006887
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 22:27:49 GMT
Message-ID: <4564CF3F.1060009@redhat.com>
Date: Wed, 22 Nov 2006 22:29:19 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Big question ...
References: <200611222304.28368.martial.paupe@nagra.com>
In-Reply-To: <200611222304.28368.martial.paupe@nagra.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martial Paupe wrote:
> Hello All,
> 
> I put un wrong PV in a Volume Group and now the VG are not available in the 
> system.
> 
> Howto remove the wrong PV from a inactive VG ?
> 
> Best regards
> 
> Martial
> 

Hello Martial,

You should be able to remove a PV from a volume group with vgreduce even
when it is inactive, as long as the PV is still present on the system:

[root ~]# vgchange -an s0
  0 logical volume(s) in volume group "s0" now active
[root ~]# vgreduce s0 /dev/loop1
  Removed "/dev/loop1" from volume group "s0"

If the PV is no longer present, this won't work though:

[root ~]# losetup -d /dev/loop1
[root ~]# vgreduce s0 /dev/loop1
  Couldn't find device with uuid 'Tzx4n9-iA60-yu3U-9oRe-R0jh-RBb4-Sw8EmF'.
  Couldn't find all physical volumes for volume group s0.
  Couldn't find device with uuid 'Tzx4n9-iA60-yu3U-9oRe-R0jh-RBb4-Sw8EmF'.
  Couldn't find all physical volumes for volume group s0.
  Volume group "s0" doesn't exist

In this case, you can make the volume group consistent again with
"--removemissing":

[root ~]# vgreduce --removemissing s0
  Couldn't find device with uuid 'Tzx4n9-iA60-yu3U-9oRe-R0jh-RBb4-Sw8EmF'.
  Couldn't find all physical volumes for volume group s0.
  Couldn't find device with uuid 'Tzx4n9-iA60-yu3U-9oRe-R0jh-RBb4-Sw8EmF'.
  Couldn't find all physical volumes for volume group s0.
  Couldn't find device with uuid 'Tzx4n9-iA60-yu3U-9oRe-R0jh-RBb4-Sw8EmF'.
  Wrote out consistent volume group s0

Be aware though that if the PV you want to remove was actually in use
you risk loosing whatever data was stored on it by this method - if
possible get the PV back on the system and use the normal vgreduce.

If this doesn't help then it would be useful to know what versions of
LVM2 and device-mapper you are using and what distribution this is on.

Regards,

Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFZM8+6YSQoMYUY94RAp9pAKCgEdic3bWk9+kEefAifHaoTgTOswCfXlO4
txQM7flkwstodOJmp2Ni1ME=
=jwiV
-----END PGP SIGNATURE-----
