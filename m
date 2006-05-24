Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4OGLnBQ008233
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 12:21:49 -0400
Received: from snoopy.localdomain
	(ASt-Lambert-153-1-9-148.w82-124.abo.wanadoo.fr [82.124.155.148])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4OGLmq2015131
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 12:21:48 -0400
Received: from [127.0.0.1] (francis@localhost.localdomain [127.0.0.1])
	by snoopy.localdomain (8.12.5/8.12.5) with ESMTP id k4O5L6LS002249
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 07:21:10 +0200
Message-ID: <4473ED42.1060702@wanadoo.fr>
Date: Wed, 24 May 2006 07:21:06 +0200
From: Francis SOUYRI <francis.souyri@wanadoo.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting from an LV
References: <4472E235.6020707@neuroweave.nl>	<20060523105821.GA6491@percy.comedia.it>
	<4472EE4E.9050208@neuroweave.nl>
In-Reply-To: <4472EE4E.9050208@neuroweave.nl>
Content-Transfer-Encoding: 7bit
Reply-To: francis.souyri@wanadoo.fr,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

If you need to boot from a logical partition you can use lilo.

Best regards.

Francis

Joep Blom wrote:

> Luca Berra wrote:
>
>> On Tue, May 23, 2006 at 12:21:41PM +0200, Joep Blom wrote:
>>
>>> I have one question.
>>> Is it possible with grub to use a logical volume as boot partition?
>>> (e.g.:partition: /dev/VG01/lvol0.
>>
>>
>> No.
>>
>> L.
>>
> Thanks
> Joep
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
