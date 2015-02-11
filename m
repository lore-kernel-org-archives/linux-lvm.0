Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BBJbiW029431
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 06:19:37 -0500
Received: from mail-wi0-f194.google.com (mail-wi0-f194.google.com
	[209.85.212.194])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BBJXce025291
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 06:19:35 -0500
Received: by mail-wi0-f194.google.com with SMTP id hi2so1323593wib.1
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2015 03:19:33 -0800 (PST)
MIME-Version: 1.0
Sender: hofman.catsystem@gmail.com
In-Reply-To: <CAKPhfZOe2=qPCr4kHeVXw-vrRY5LG4SRLa1KjUW795tQJun3tQ@mail.gmail.com>
References: <CAPcfVV_VVvYDf0oa7pZZ1iFkK6XJDBM4wYU9=EnYpCo4ogrbjQ@mail.gmail.com>
	<54D87F38.4010303@redhat.com>
	<CAPcfVV_7WGzNCYJt1xGOnSGmDe7Hu4i-FBeZJ58=eLW8vVDAqg@mail.gmail.com>
	<CAKPhfZOe2=qPCr4kHeVXw-vrRY5LG4SRLa1KjUW795tQJun3tQ@mail.gmail.com>
Date: Wed, 11 Feb 2015 11:19:33 +0000
Message-ID: <CAKPhfZM+8kWgR4ScpeSb5qsrj+w_0EhLEz1gC9rvOxkD2Mkf1A@mail.gmail.com>
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

Hi

dd if=3D/dev/sda of=3D/boor/sda.mbr bs=3D512 count=3D4000

mcedit -e /boot/sda.mbr
or
hexedit


look lvm list in bootrecord

eric hofman

service.hofman@gmail.com

--=20
ComputerAlarmTechnologySystem=C2=A9

http://plus.google.com/105013137826111836446
+44 77 04 24 74 00
