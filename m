Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1L8i1101114
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 03:44:01 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.192])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1L8i09T028370
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 03:44:00 -0500
Received: by zproxy.gmail.com with SMTP id i11so1091370nzh
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 00:44:00 -0800 (PST)
Message-ID: <d605dcda0602210043q70671f97pb10ca806e2cd92b4@mail.gmail.com>
Date: Tue, 21 Feb 2006 09:43:59 +0100
From: "Jose Massa" <firulo@googlemail.com>
Subject: Re: [linux-lvm] FW: Unrecognised segment type mirror
In-Reply-To: <20060217165543.4E54112EC7@bluewhale.planbit.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
References: <20060217165543.4E54112EC7@bluewhale.planbit.co.uk>
Content-Transfer-Encoding: 8bit
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

This is what I've tried: I've move all data from an LV somewhere else,
remove the LV, but the errors (or warnings, whatever they are) still
showed up. Then I've recreated the LV, and they are still there. Maybe
I will try doing a full backup and recreating the whole drive. The
point is that before I spend time doing that, I would like to know if
this is some warning or bug present in the code, or whether it is
really some corruption in my hard drive. Will I have the messages
after recreating everything? Did I configure something wrong in my
lvm.conf? I've followed the standard Gentoo LVM installation...

Interesting enough, there is only one post in all google regarding
this (without an answer). It seems to be something very strange, and
I'm afraid that only one of the devs knows what this really means.

I'm just scared about hard drive corruption...
Any thoughts? Thanks,
-Jose
