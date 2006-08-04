Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k74FDw8c005326
	for <linux-lvm@redhat.com>; Fri, 4 Aug 2006 11:13:58 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k74FDpQw007163
	for <linux-lvm@redhat.com>; Fri, 4 Aug 2006 11:13:52 -0400
Message-ID: <44D3641C.2080903@conterra.de>
Date: Fri, 04 Aug 2006 17:13:32 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting on a new root partition
References: <20060804082953.99543.qmail@web26613.mail.ukl.yahoo.com>
In-Reply-To: <20060804082953.99543.qmail@web26613.mail.ukl.yahoo.com>
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

ramsis farhat wrote:
> hi everybody
> Dieter, here is what you asked me
...
> But i still think the problrm is coming from the instruction "lvmcreate_initrd" > because if I do not use the "-D" flag, the instruction fail, and in the "LVM-HOWTO",
> it is used without that flag.
> If you have any suggestion :)

hi ramsis,

unfortunately no :-( looks all fine. But I dont use Redhat and I have
no idea what "lvmcreate_initrd" exactly does. Seems "-d" activates devfs
which is obsolete now. I also do not use 2.4 kernels any more.
I use a similar setup, but with SuSE 10.1 using an actual 2.6 kernel.

sorry
Dieter.
 
