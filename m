Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r64AtQZQ010677
	for <linux-lvm@redhat.com>; Thu, 4 Jul 2013 06:55:26 -0400
Received: from nm18-vm8.access.bullet.mail.bf1.yahoo.com
	(nm18-vm8.access.bullet.mail.bf1.yahoo.com [216.109.115.87])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r64AtPuS016877
	for <linux-lvm@redhat.com>; Thu, 4 Jul 2013 06:55:25 -0400
References: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
	<CAFrGbuXHzzYwgB88bhOyjFUL7dokFbSsHWdJ1P8Pc88Wp2EdoQ@mail.gmail.com>
	<CAFrGbuXJ54EgwA7pnzRMLtTnkjsgep=h2RvVZMN01fTXn+1hQw@mail.gmail.com>
	<CAFrGbuVRTSo1gTdgoOgmZLCk4NzVDf2jMYB=nT3_dNzJPz5HzA@mail.gmail.com>
Message-ID: <1372935324.66998.YahooMailNeo@web181505.mail.ne1.yahoo.com>
Date: Thu, 4 Jul 2013 03:55:24 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <CAFrGbuVRTSo1gTdgoOgmZLCk4NzVDf2jMYB=nT3_dNzJPz5HzA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] I can't have the mirror_log mirrored,
	LVM complains "there is no suitable space"
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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



>
>http://serverfault.com/questions/500533/lvm-mirror-with-data-and-logs-mirrored-on-same-2-devices

wow, that smells like a logic bug to me. If not, then the documentation needs a VERY obvious warning about how to properly do mirrored devices with mirrored logs (nee 4+ distinct PV devices). If the internals can't be fixed, then it needs to error out on creation when there aren't 4 devices to work with. Any particular reason why you wanted pseudo-external logs in the first place?

Does 'lvcreate -nv' show you the work plan?

I'd say most people use MD for any sort of RAID functionality. It's implemented better (or at least faster).

>I've just started with LVM, I might not see the obvious.

maybe turn down the exotic, till you have more experience?
