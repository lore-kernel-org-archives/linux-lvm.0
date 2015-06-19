Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5JMtieP015459
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 19 Jun 2015 18:55:44 -0400
Received: from mail-vn0-f48.google.com (mail-vn0-f48.google.com
	[209.85.216.48])
	by mx1.redhat.com (Postfix) with ESMTPS id 2380D33E7E6
	for <linux-lvm@redhat.com>; Fri, 19 Jun 2015 22:55:44 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so578804vnb.4
	for <linux-lvm@redhat.com>; Fri, 19 Jun 2015 15:55:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87lhff4u8l.fsf@gmail.com>
References: <87lhff4u8l.fsf@gmail.com>
Date: Sat, 20 Jun 2015 00:55:43 +0200
Message-ID: <CAE8gLhmgtXCy4gdG_HyNRg3NugFzUS_awcN-NFNqFvtOG_R7=A@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Subject: Re: [linux-lvm] lvcreate - device not cleared Aborting. Failed to
 wipe start of new LV.
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

2015-06-19 17:02 GMT+02:00  <csanyipal@gmail.com>:
> I'm not sure whether was on this system created the VG 'bubba' with lvm
> version 1, so maybe this issue is related to that fact that it was
> really created with lvm version 1?

That your LVM library version is 1.02.90 (which is afaik the latest on
the Debian line), doesn't mean that you use LVM1 metadata. It is very
likely that you use LVM2. To check, you can see the output of "pvs"
("Fmt" = "lvm2"), or you can check "file -Lks /dev/sda2" where the
output should start with "/dev/sda2: LVM2 PV (Linux Logical Volume
Manager)".


> What is the solution for my problem?

Please also try to run lvcreate with "--verbose" and post the output.
