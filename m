Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l829tD2v026769
	for <linux-lvm@redhat.com>; Sun, 2 Sep 2007 05:55:14 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l829t6uT026713
	for <linux-lvm@redhat.com>; Sun, 2 Sep 2007 05:55:06 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 437DB41CA2
	for <linux-lvm@redhat.com>; Sun,  2 Sep 2007 11:54:58 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id AE17293CF
	for <linux-lvm@redhat.com>; Sun,  2 Sep 2007 11:54:57 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id kWSd4ighsI+J for <linux-lvm@redhat.com>;
	Sun,  2 Sep 2007 11:54:55 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-79-108-204.netcologne.de
	[87.79.108.204]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Sun,  2 Sep 2007 11:54:55 +0200 (CEST)
Message-ID: <46DA886E.3030301@wpkg.org>
Date: Sun, 02 Sep 2007 11:54:54 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how much memory does LVM need? oom-killer comes
References: <46D9C7CD.4050703@wpkg.org> <46D9CA1D.8050908@wpkg.org>
In-Reply-To: <46D9CA1D.8050908@wpkg.org>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Tomasz Chmielewski schrieb:
> Tomasz Chmielewski schrieb:
>> I just did vgchange -an, and there came the oom-killer. This is all 
>> with 2.6.22.5 kernel.
>>
>> The machine has 256 MB RAM; PV is almost 1.5 TB big:
>>
>> # pvs
>>   PV         VG          Fmt  Attr PSize PFree
>>   /dev/md0   superthecus lvm2 a-   1.46T 120.63G
>>
>> After I do "vgchange -ay", the memory usage goes from ~17 MB to almost 
>> 180 MB - is it normal?
> 
> Can the memory usage be so high (~180 MB out of 256 MB) because I have 
> two pretty big snapshots? Normally, this machine uses about 17 MB.
> 
> 
> # lvs
>   LV                  VG          Attr   LSize   Origin Snap%  Move Log 
> Copy%
>   backup              superthecus owi-ao   1.20T
>   backup-snap         superthecus swi-a- 100.00G backup  30.15
>   backup-snap-resized superthecus swi-a-  30.00G backup  69.00
>   backup1             superthecus -wi-a-   3.00G
>   backup1-sync-test   superthecus -wi-a-   3.00G
>   src                 superthecus -wi-a-   2.00G
>   swap                superthecus -wi-ao   3.00G
> 
> 
> Unfortunately, I can't remove these snapshots, as oom-killer comes :(
> Is there any solution to that, other than adding memory (which can be 
> hard to do remotely)?

Ouch - now it went so far that the machine only loops from a kernel 
panic to a kernel panic - that's really bad:

(...)
Out of memory: kill process 2220 (getty) score 24 or a child
Killed process 2220 (getty)
Kernel panic - not syncing: Out of memory and no killable processes...

Rebooting in 20 seconds..


-- 
Tomasz Chmielewski
http://wpkg.org
