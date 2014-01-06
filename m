Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s06GedP5026534
	for <linux-lvm@redhat.com>; Mon, 6 Jan 2014 11:40:39 -0500
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s06Gebsi015285
	for <linux-lvm@redhat.com>; Mon, 6 Jan 2014 11:40:37 -0500
Received: by mail-oa0-f50.google.com with SMTP id l6so320902oag.9
	for <linux-lvm@redhat.com>; Mon, 06 Jan 2014 08:40:37 -0800 (PST)
Received: from [127.0.0.1] (nycssl.masergy.com. [64.47.77.150])
	by mx.google.com with ESMTPSA id m7sm85603676obo.7.2014.01.06.08.40.36
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 06 Jan 2014 08:40:36 -0800 (PST)
Message-ID: <52CADC82.60607@gmail.com>
Date: Mon, 06 Jan 2014 11:40:34 -0500
From: Guy Rouillier <guy.rouillier@gmail.com>
MIME-Version: 1.0
References: <52C16F30.9090501@libertytrek.org>
	<52CAA89E.1000904@libertytrek.org>
In-Reply-To: <52CAA89E.1000904@libertytrek.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Question re: deleting an LV...
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

On 1/6/2014 7:59 AM, Tanstaafl wrote:
> On 2013-12-30 8:03 AM, Tanstaafl <tanstaafl@libertytrek.org> wrote:
>> Hello,
>>
>> Due to a misunderstanding about how LVM snapshots work when I set up
>> this system, I now need to delete an LV I had created to use for this
>> purpose (I thought I had to pre-create the LV).
>>
>> Currently I have:
>>
>>   # lvscan
>>    ACTIVE            '/dev/vg/tmp' [5.00 GiB] inherit
>>    ACTIVE            '/dev/vg/log' [5.00 GiB] inherit
>>    ACTIVE            '/dev/vg/vtmp' [5.00 GiB] inherit
>>    ACTIVE            '/dev/vg/var' [700.00 GiB] inherit
>>    ACTIVE            '/dev/vg/snaps' [4.00 GiB] inherit
>>
>> I just need to delete the /dev/vg/snaps LV, so that that 4GB is
>> available for my LVM snapshots.
>>
>> Am I correct that all I have to do is:
>>
>> # umount /dev/vg/snaps
>> # lvremove /dev/vg/snaps
>>
>> Then remove this line from fstab?
>>
>> This would then result in my VG having 4GB available for taking LVM
>> snapshots?
>
> Would appreciate a confirmation that I don't have to do anything else to
> totally eliminate the snaps LV...
>
> I unmounted it, and commented that line in fstab. lvscan still shows the
> same as above, but lvs shows the snaps with a slightly different attribute:
>
>   # lvs
>    LV    VG   Attr       LSize
>    log   vg   -wi-ao----   5.00g
>    snaps vg   -wi-a-----   4.00g
>    tmp   vg   -wi-ao----   5.00g
>    var   vg   -wi-ao---- 700.00g
>    vtmp  vg   -wi-ao----   5.00g
>
> So again - is lvremove /dev/vg/snaps the correct way - and the only
> thing I need to do - to remove that LV as if it had never been created?

Yes. This page has a definition of the attributes: 
http://man7.org/linux/man-pages/man8/lvs.8.html.  "o" in position 6 
means device open; since you've unmounted it, it is no longer open.

I learned via this mailing list that lvremove just updates metadata to 
make the space available again, but doesn't remove the filesystem in the 
LV.  So if you were to recreate the exact same LV you just removed, the 
filesystem would still be there.  My situation was unusual, and you 
probably won't encounter this.  But if you want to avoid that minor 
possibility, use "wipefs -a /dev/vg/snaps" before lvremove.

-- 
Guy Rouillier

---
This email is free from viruses and malware because avast! Antivirus protection is active.
http://www.avast.com
