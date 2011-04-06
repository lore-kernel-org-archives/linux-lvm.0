Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p36KpOrl018196
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 16:51:25 -0400
Received: from mail.ynet.co.nz (mail.ynet.co.nz [210.48.92.21])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p36KpKHV005100
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 16:51:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.ynet.co.nz (Postfix) with ESMTP id D1514272158
	for <linux-lvm@redhat.com>; Thu,  7 Apr 2011 08:51:18 +1200 (NZST)
Received: from mail.ynet.co.nz ([127.0.0.1])
	by localhost (mail.ynet.co.nz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuVx2nekyUr2 for <linux-lvm@redhat.com>;
	Thu,  7 Apr 2011 08:51:15 +1200 (NZST)
Received: from [10.10.10.10] (unknown [210.48.92.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: omiha@ynet.co.nz)
	by mail.ynet.co.nz (Postfix) with ESMTPSA id 06B68272104
	for <linux-lvm@redhat.com>; Thu,  7 Apr 2011 08:51:15 +1200 (NZST)
Message-ID: <4D9CD23F.6010208@omiha.com>
Date: Thu, 07 Apr 2011 08:51:11 +1200
From: Jan Bakuwel <jan.bakuwel@omiha.com>
MIME-Version: 1.0
References: <4D9A9E2A.7070106@diala.gl3> <1302079983.27047.454.camel@localhost>
In-Reply-To: <1302079983.27047.454.camel@localhost>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM corruption/diagnosis
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
To: linux-lvm@redhat.com

Hi Radu,


Thanks for your response.

> Now the only question that's left to be answered is why the heck a
> windows xp guest (yes, my guest machines are windows xp too) would crash
> (or not even boot) when there is some particular data left in the
> *unallocated* filesystem blocks. But since I have a "certain" opinion
> about microsoft and their products, I just think that life is too short
> to bother yourself with this kind of crap.

That is indeed a good question and the reason why I initially didn't
pursue this track. I wouldn't be surprised if this would indeed be a
"feature" of Windows XP/Microsoft. Another question would be why a)
Windows XP would hang itself up beyond repair after having run for half
a year just fine as well as leaving it's disc space in a unusable state.
After all making image backups of Windows machines and restoring them to
known states is a well tried method.


> I hope this helps you debug the issue you had. It would also be
> interesting if you could try to zero the *original* LVM volume (the one
> that didn't work) and then restore the image once again and see if it
> works. It would prove (or disprove) my theory :)

I'll do just that in the next few days and will report back.


best regards,
Jan
