Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j19ELQO29913
	for <linux-lvm@redhat.com>; Wed, 9 Feb 2005 09:21:26 -0500
Received: from bastard.smallmerchant.com
	(postfix@adsl-69-233-54-142.dsl.pltn13.pacbell.net [69.233.54.142])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j19ELGFa026476
	for <linux-lvm@redhat.com>; Wed, 9 Feb 2005 09:21:16 -0500
Received: from localhost (localhost [127.0.0.1])
	by bastard.smallmerchant.com (Postfix) with ESMTP id 31E1C605BD6
	for <linux-lvm@redhat.com>; Wed,  9 Feb 2005 06:22:04 -0800 (PST)
Received: from bastard.smallmerchant.com ([127.0.0.1])
	by localhost (bastard [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 17692-03-5 for <linux-lvm@redhat.com>;
	Wed, 9 Feb 2005 06:22:04 -0800 (PST)
Received: from [69.233.54.132] (adsl-69-233-54-132.dsl.pltn13.pacbell.net
	[69.233.54.132])
	by bastard.smallmerchant.com (Postfix) with ESMTP id 0CC6C605BD5
	for <linux-lvm@redhat.com>; Wed,  9 Feb 2005 06:22:04 -0800 (PST)
Message-ID: <420A1C64.7040305@tupshin.com>
Date: Wed, 09 Feb 2005 06:21:24 -0800
From: Tupshin Harper <tupshin@tupshin.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] moving LVM to a new box
References: <000701c50eae$503fbd20$911ba8c0@godzilla>
	<1107958513l.12640l.4l@tangerine-64>
In-Reply-To: <1107958513l.12640l.4l@tangerine-64>
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

Jean-Luc Coulon (f5ibh) wrote:

> Le 09.02.2005 14:50:28, Sutto Zoltan a =EF=BF=BDcrit :
>
>> I have a newly installed/configured/updated FC3 with LVM2 on a P3 box.
>> How can I move this working system to a new P4 box with a larger=20
>> SATA  disk without reinstalling/upgrading/configuring the whole OS.
>>
>> Any help would be appreciated
>
>
> If I suppose you can install and boot you old disk in you new system =20
> together with the new disk, you can do the following (I suppose the=20
> old  disk is /dev/hda with a /dev/hda1 partition, and new one /dev/sda=20
> with  a /dev/sda1 partition, I suppose your volume group is vg0):
>
> make backups  ;-)
>
> - pvcreate /dev/sda1
> - vgextend vg0 /dev/sda1
> - move all the lv data with pvmove /dev/hda1.
> - vgreduce vg0 /dev/hda2
> - you will have to configure lilo/grub to install and point on your=20
> new  disk.
>
> I've done such a way but it was not with lvm2. Maybe there are some =20
> pvmove issues with lvm2.

I just did exactly this for a new box, using lvm2, and it worked great.=20
(re-emphasize "make backups"). The only issue I has was that pvmove=20
failed until I realized that a necessary kernel module (dm_mirror, I=20
believe) wasn't loaded.

-Tupshin
