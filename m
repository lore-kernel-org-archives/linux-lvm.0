Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q766wJfa032383
	for <linux-lvm@redhat.com>; Mon, 6 Aug 2012 02:58:20 -0400
Received: from mail.profihost.ag (mail.profihost.ag [85.158.179.208])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q766wH5d009581
	for <linux-lvm@redhat.com>; Mon, 6 Aug 2012 02:58:17 -0400
Message-ID: <501F6B07.5060405@profihost.ag>
Date: Mon, 06 Aug 2012 08:58:15 +0200
From: Stefan Priebe - Profihost AG <s.priebe@profihost.ag>
MIME-Version: 1.0
References: <501EE710.9070703@profihost.ag>
	<20120805221452.GE16335@agk-dp.fab.redhat.com>
In-Reply-To: <20120805221452.GE16335@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] dm thinp: pool get's bigger than allowd virtual disk
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: agk@redhat.com

Am 06.08.2012 00:14, schrieb Alasdair G Kergon:
> On Sun, Aug 05, 2012 at 11:35:12PM +0200, Stefan Priebe wrote:
>> this will waste 123,86g for all the time ?! As i can't use them.
>
> Did you have it configured to auto-expand to a size larger than you
> know you need?  (See logs / dmeventd / lvm.conf)

I've configured these settings in lvm.conf:

     thin_pool_autoextend_threshold = 80
     thin_pool_autoextend_percent = 15

     monitoring = 1

     polling_interval = 15

Thanks,
Stefan
