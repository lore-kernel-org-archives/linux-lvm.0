Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 638CA788E4
	for <linux-lvm@redhat.com>; Mon, 24 Apr 2017 21:02:41 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8DA7C04B948
	for <linux-lvm@redhat.com>; Mon, 24 Apr 2017 21:02:37 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 35C6D40A345F
	for <linux-lvm@redhat.com>; Mon, 24 Apr 2017 23:02:36 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 24 Apr 2017 23:02:36 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
Message-ID: <51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 23-04-2017 11:26:

> I'm just currious -  what the you think will happen when you have
> root_LV as thin LV and thin pool runs out of space - so 'root_LV'
> is replaced with 'error' target.

Why do you suppose Root LV is on thin?

Why not just stick to the common scenario when thin is used for extra 
volumes or data?

I mean to say that you are raising an exceptional situation as an 
argument against something that I would consider quite common, which 
doesn't quite work that way: you can't prove that most people would not 
want something by raising something most people wouldn't use.

I mean to say let's just look at the most common denominator here.

Root LV on thin is not that.

I have tried it, yes. Gives troubles with Grub and requires thin package 
to be installed on all systems and makes it harder to install a system 
too.

Thin root LV is not the idea for most people.

So again, don't you think having data volumes produce errors is not 
preferable to having the entire system hang?

> How do you think this will be ANY different from hanging your system ?

Doesn't happen cause you're not using that.

You're smarter than that.

So it doesn't happen and it's not a use case here.

> IMHO reboot is still quite fair solution in such case.

That's irrelevant; if the thin pool is full you need to mitigate it, 
rebooting won't help with that.

And if your root is on thin, rebooting won't do you much good either. So 
you had best keep a running system in which you can mitigate it live 
instead of rebooting to avail.

That's just my opinion and a lot more commonsensical than what you just 
said, I think.

But to each his own.
