Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o51DRaUf029942
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2010 09:27:36 -0400
Received: from mail-gy0-f174.google.com (mail-gy0-f174.google.com
	[209.85.160.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o51DRMOx026644
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2010 09:27:22 -0400
Received: by gye5 with SMTP id 5so1098123gye.33
	for <linux-lvm@redhat.com>; Tue, 01 Jun 2010 06:27:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A7A5455753145049A5860984ED9BFF5627598C6F19@GVW0547EXC.americas.hpqcorp.net>
References: <AANLkTikmw8_d91zrpW9HFKz8d5XCkg-b8h_NdD3leR9u@mail.gmail.com>
	<1275338712.1423.2@raydesk1.bettercgi.com>
	<A7A5455753145049A5860984ED9BFF5627598C6F19@GVW0547EXC.americas.hpqcorp.net>
Date: Tue, 1 Jun 2010 22:27:22 +0900
Message-ID: <AANLkTim3bctwpuF8_dEKt_Y66cWn7SK2Zmg78S2Z4YHh@mail.gmail.com>
From: Romeo Theriault <romeo.theriault@maine.edu>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Is it possible to bypass LVM and mount contained
	partition directly?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

> �Can you restore these backups to another system? �Such as one designated to do this job?

Yes, I've thought about this a bit too. The problem that I see with
this is that I'll only be able to have one restore at a time
happening, since almost all our linux vm's have the same named VG's
and LV's and they are on read-only media so I wouldn't be able to
rename them....

I've going to have to keeping thinking about this one.

Thanks for the pointers.

Romeo
