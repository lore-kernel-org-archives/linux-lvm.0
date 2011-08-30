Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7UC2afq024474
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 08:02:36 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7UC2VDC027875
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 08:02:32 -0400
Received: by wyg24 with SMTP id 24so6534169wyg.33
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 05:02:31 -0700 (PDT)
Message-ID: <4E5CD154.6020308@redhat.com>
Date: Tue, 30 Aug 2011 14:02:28 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <4E5CCA32.4000000@tlinx.org> <4E5CCDB7.3020004@redhat.com>
In-Reply-To: <4E5CCDB7.3020004@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Proper way to delete an active snapshot?
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Linda A. Walsh" <lvm@tlinx.org>

Dne 30.8.2011 13:47, Zdenek Kabelac napsal(a):
> Dne 30.8.2011 13:32, Linda A. Walsh napsal(a):
>>
>>
>>
>> If you have a snapshot of a volume running... how are you supposed to delete
>> it?
>>
>> i.e. after you unmount it... if I just do a lvremove, I get a warning about it
>> being
>> an active volume -- so I tried doing a dmsetup remove on it first -- and that
>> stops the warning -- but I just noticed, I had a bunch of inactive 'cow'
>> volume names under 'dmsetup ls', that referred to the old snapshot names.
> 
> 
> lvchange -an  vg/snapshot_lv

Ooops sorry - ignore this one - as this will work with some not yet release target

> 
> Does it work for you ?
> 
> If so - please post  -vvvv  trace.


So just post only  lvremove -vvvv  trace please.

It could be udev-related issue.

Zdenek
