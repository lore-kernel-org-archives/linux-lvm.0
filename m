Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2006D60175
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 21:54:02 +0000 (UTC)
Received: from sonic315-21.consmr.mail.ne1.yahoo.com
	(sonic315-21.consmr.mail.ne1.yahoo.com [66.163.190.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47B3D4E4C3
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 21:54:01 +0000 (UTC)
Date: Wed, 7 Feb 2018 21:53:55 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <215644475.5896991.1518040435407@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <215644475.5896991.1518040435407.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Saying goodbye to LVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Xen wrote:
 

>  Yes Ubuntu runs a long time behind and Debian also.
> As a user, I can't help that, upgrading LVM just like that to have less 
>...  seems also  fraught with peril.
>
>  So if you're on Xenial, you are stuck with the features but without the  protection.

Don't use a distro that is sloppy about looking out for the end-user? I can't speak for how 'stable' LVM is in their releases or if anyone expends effort to identify "golden" releases vs "preview / dangerous" releases...

>  particular there is a quagmire of situations ... only get out of the situation with dmsetup remove, 
> but I didn't  know this at first.

Which is part of the problem, really. You were trying to do 'expert' things without the requisite background or knowledge. Now granted we learn by shooting ourselves in the foot from time to time but the blood loss is never pleasant. You either learn quickly or you pick another tool that has spent the time to put proper dependency/protection in place such that 'EXPERTS ONLY NEED APPLY' is not the phrase of the day.

I think LVM does need to step it up in putting proper safeguards in place before calling a feature release-worthy. If you have a feature then it is REQUIRED that it also have ALL of the necessary dependency check logic fully implemented. Otherwise it is a BUG and has no business being published in a manner that careless distros can activate it.

If multiple PVs show up with duplicate ID or other bad characteristics there needs to be a well documented mechanism for rectifying the situation written from the POV of a user/sysadmin and not a developer who happens to know all the inner workings. Are metadata time-stamped or otherwise versioned so even if you see what looks to be a conflict the 'age' of the metadata can give an indication which one is likely to be correct? If not, why not?

> A missing cache device cannot be removed without the missing cache  device being present.

That's retarded. Is this a correct characterization? If so, how did that get past the release audit?

 
