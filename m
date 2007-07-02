Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l627Z8O2024514
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 03:35:08 -0400
Received: from jogback.se (root@mail1.jogback.se [192.165.82.16])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l627Z1mi025499
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 03:35:02 -0400
Received: from [130.244.254.1] (account lm HELO [127.0.0.1])
	by mail1.jogback.se (CommuniGate Pro SMTP 5.1.9)
	with ESMTPA id 4525145 for linux-lvm@redhat.com;
	Mon, 02 Jul 2007 09:35:01 +0200
Message-ID: <4688AAA2.6070807@swip.net>
Date: Mon, 02 Jul 2007 09:34:58 +0200
From: =?ISO-8859-1?Q?Lars_Michael_Jogb=E4ck?= <lm@swip.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems(?) with pvresize
References: <4688A567.2030005@swip.net> <4688A90B.8080507@vdberg.org>
In-Reply-To: <4688A90B.8080507@vdberg.org>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Richard van den Berg wrote:
> Lars Michael Jogb=EF=BF=BDck wrote:
>  =20
>> I've got a hardware-raid5 that I've extended (/dev/sdk), and after
>> extending it, I get the kernel to recognize the new size.
>> But pvresize is still using the old size. I'm pretty convinced that a
>> reboot will solve this issue for me, but isn't there a way of solving
>> this without rebooting?
>>    =20
>
> I used "partprobe" that comes with parted, and it worked well for me
>  =20
Thanks, but I've tried that and it didn't work either. pvresize still=20
thinks it's the old size.

Best Regards,
/LM
