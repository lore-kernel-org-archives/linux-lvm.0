Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1OH0JDH022703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2017 12:00:19 -0500
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3D72804F4
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2017 17:00:17 +0000 (UTC)
Received: from [192.168.0.38] (unknown [82.66.78.161])
	(Authenticated sender: georges.giralt)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5ECCC7802B2
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2017 18:00:13 +0100 (CET)
References: <b55d9679-db08-7e72-ff0f-ec471fc8f514@free.fr>
	<8e009a96764979131283584ca8695b7d@dds.nl>
From: Georges Giralt <georges.giralt@free.fr>
Message-ID: <3bd2fb7a-d287-7704-2bf8-ee9e844890fc@free.fr>
Date: Fri, 24 Feb 2017 18:00:13 +0100
MIME-Version: 1.0
In-Reply-To: <8e009a96764979131283584ca8695b7d@dds.nl>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Sorry to ask here ...
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Thank you Xen,

Your trick is working fine.

As far as I can tell, the two md are properly working during boot.

Now, I've to analyze the boot and update logs to try to find what was 
the cause. But, the PC is booting fine. The wife won't complain. ;-) I'm 
happy ;-)

Thank you.


Le 23/02/2017 � 21:23, Xen a �crit :
> Georges Giralt schreef op 23-02-2017 20:25:
>
>> Lastly, I bet the cause is an upgrade of some packages, the machine
>> refuses to boot. It drops onto initramfs shell because the vg0 volume
>> group is not activated. Launching lvm and doing a vgchange -a y does
>> the trick and the system boots fine afterwards.
>
> I don't know what is the cause, but...
>
>
> The /boot is on the same partition so it should be no problem right.
>
> In the initrd the root is opened but it fails?
>
> The quickest thing to do is to go to:
>
> /usr/share/initramfs-tools/scripts/local-top
>
> And edit lvm2
>
> You must add a call to "/sbin/lvm vgchange -ay" at the bottom. If this 
> works it will try to activate everything while still being in the initrd.
>
> Normally only root and swap are activated. I assume the mdX array will 
> be assembled just fine, but I am not sure. However I think the chance 
> is high that it would work.
>
> There is a call in there I think to activate only $ROOT and $RESUME. 
> Maybe it will work if you just vgchange -ay.
>
> If you can enter the system in a chroot and edit this file, and then 
> regenerate the initramfs, it will be included in the new initramfs.
>
> If "lvm2" is upgraded this file will be overwritten.
>
> I assume you can override it in 
> /etc/initramfs-tools/scripts/local-top/lvm2
>
> You could need to copy lvm2 there and edit it there, for that:
>
> mkdir -p /etc/initramfs-tools/scripts/local-top
>
> cp /usr/share/initramfs-tools/scripts/local-top/lvm2 
> /etc/initramfs-tools/scripts/local-top
>
> But I am not 100% sure of that.
>
>
>
> In any case that would definitely add a call to "vgchange -ay" to the 
> initramfs, so that the entire volume group can be activated prior to 
> passing control to systemd.
>
> Good luck.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

-- 
"If a man empties his purse into his head, no man can take it away from him.
An investment in knowledge always pays the best interest"


Benjamin Franklin.
