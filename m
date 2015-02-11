Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BNnOaw023804
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 18:49:24 -0500
Received: from mail-wi0-f193.google.com (mail-wi0-f193.google.com
	[209.85.212.193])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BNnLLb010368
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 18:49:22 -0500
Received: by mail-wi0-f193.google.com with SMTP id r20so169849wiv.0
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 15:49:21 -0800 (PST)
MIME-Version: 1.0
Sender: hofman.catsystem@gmail.com
In-Reply-To: <54DB66C7.5080809@gmail.com>
References: <CAPcfVV_VVvYDf0oa7pZZ1iFkK6XJDBM4wYU9=EnYpCo4ogrbjQ@mail.gmail.com>
	<54D87F38.4010303@redhat.com>
	<CAPcfVV_7WGzNCYJt1xGOnSGmDe7Hu4i-FBeZJ58=eLW8vVDAqg@mail.gmail.com>
	<54DB66C7.5080809@gmail.com>
Date: Wed, 11 Feb 2015 23:49:20 +0000
Message-ID: <CAKPhfZOb+NS5MD6AvAD8ySa4F6JM5_P-3+utMDva8THyfFVZGA@mail.gmail.com>
From: service hofman <service.hofman@googlemail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Volume group inconsistent
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

----
		pv64 {
			id =3D "TFSqaf-Wd6b-9w2r-8ZLp-rVN9-5851-0qNX0z"
			device =3D "/dev/mapper/plt-85"	# Hint only

			status =3D ["ALLOCATABLE"]
			flags =3D []
			dev_size =3D 1048576000	# 500 Gigabytes
			pe_start =3D 2048
			pe_count =3D 127999	# 499.996 Gigabytes
		}
	}

----

pvXX this is One for Team or for [hdd] /dev/sdX
this look like you have 64hdd for 500Gb one.

and first look MBR 0-2Mb

dd if=3D/dev/sdX of=3D/boot/sdX.mbr bs=3D512 count=3D4000

in side  sdX.mbr is lvm.vg
if is this same [ platinum_after_missing.vg ]

you found all record /etc/lvm/*

rest is easy.

device is inode, but not lv.
[ -b "/dev/mapper/plt-01" ] && echo "True " || echo "False"

-----

	logical_volumes {

		volume-a2d55040-a597-419b-95b6-403f5b287773 {
			id =3D "GA9jj9-hooD-Au8T-23Bw-LNox-LkWF-G1TUG6"
			status =3D ["READ", "WRITE", "VISIBLE"]
			flags =3D []
			creation_host =3D "brasilia"
			creation_time =3D 1409946331	# 2014-09-05 16:45:31 -0300
			segment_count =3D 1



			segment1 {
				start_extent =3D 0
				extent_count =3D 1024	# 4 Gigabytes

				type =3D "striped"
				stripe_count =3D 1	# linear

				stripes =3D [

					"pv10", 30730
				]
			}
		}

-----
segment1 =3D=3D lv like /dev/sdX1

pv10=3D=3D[hdd X],  offset[sdX1] =3D=3D [  -->[xxx] ]
but every one is start =3D=3D 0[+offset]
30730*4096=3D[offset]


by recovery us dd if=3D/dev/sdX1 bs=3D4096 count=3D(1024*1000) seek=3D($off=
set)


this not LVM only IBM LLVM
LINUX use LVM. kernel.org
IBM use AIX kernel



ComputerAlarmTechnologySystem=C2=A9

http://plus.google.com/105013137826111836446
+44 77 04 24 74 00
