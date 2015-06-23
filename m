Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N3mDI1016805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2015 23:48:13 -0400
Received: from mail-vn0-f52.google.com (mail-vn0-f52.google.com
	[209.85.216.52])
	by mx1.redhat.com (Postfix) with ESMTPS id 1025D3679F0
	for <linux-lvm@redhat.com>; Tue, 23 Jun 2015 03:48:13 +0000 (UTC)
Received: by vnav203 with SMTP id v203so7615975vna.6
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2015 20:48:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <877fqxehm2.fsf@gmail.com>
References: <87lhff4u8l.fsf@gmail.com>
	<CAE8gLhmgtXCy4gdG_HyNRg3NugFzUS_awcN-NFNqFvtOG_R7=A@mail.gmail.com>
	<877fqxehm2.fsf@gmail.com>
Date: Tue, 23 Jun 2015 05:48:12 +0200
Message-ID: <CAE8gLhkCQ62uevA=0QQXhvSVpcg8Nz9s8PygfY=DT5KSM31E=g@mail.gmail.com>
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

2015-06-21 7:49 GMT+02:00 <csanyipal@gmail.com>:
> # lvcreate --verbose --size 10.10G -n var bubba
>   DEGRADED MODE. Incomplete RAID LVs will be processed.

Hey, I just notice, your VG is in degraded mode. This is not a normal
condition and it can also cause unexpected things. Why is your VG
degraded? Does it have missing PVs?
