Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5EDP9025837
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 09:25:09 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5EDP3Xn012291
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 09:25:04 -0400
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 62906E6A96
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 14:24:58 +0100 (BST)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14491-19 for <linux-lvm@redhat.com>;
	Mon, 14 Jun 2004 14:24:58 +0100 (BST)
Received: from oak.dgreaves.com (modem-3547.kawau.dialup.pol.co.uk
	[81.78.157.219]) by mail.ukfsn.org (Postfix) with ESMTP id B9DCFE6A8E
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 14:24:57 +0100 (BST)
Received: from ash.dgreaves.com ([10.0.0.121])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1BZrUA-0005oS-4T
	for linux-lvm@redhat.com; Mon, 14 Jun 2004 14:26:50 +0100
Message-ID: <40CDA728.4080902@dgreaves.com>
Date: Mon, 14 Jun 2004 14:24:56 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 seems to chop performance by 33%
References: <40C86F52.4090500@dgreaves.com> <40CD910A.9040605@ist.utl.pt>
In-Reply-To: <40CD910A.9040605@ist.utl.pt>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Miguel Cabe=EF=BF=BDa wrote:

> Hi,
>
>> I didn't think lvm2 had such a big performance hit?
>>
>> 65Mb/s on the raid5 device
>> 44Mb/s on the lv
>>
> Did you try to ajust the read ahead with blockdev on the LV itself?
>
> # blockdev --setra XXXX /dev/sda  (raid5 device, just for comparisson)
> # blockdev --setra XXXX /dev/vg/lv (lv)
>
> Try some values for the readahead. On my system I use 2048.

No, I didn't
hmm... man blockdev
useful - new to me :) Not seen it on any googling to do with lvm.

I'll try this later when it's idle - thanks for the suggestion.

I do already have
  Read ahead sectors     100
in the lvdisplay

yet blockdev --getra /dev/video_vg/video_lv
reports 256 (and, to be sure --getss says 512byte sectors)

Why is this different?

David
