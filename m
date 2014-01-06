Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s06MnPa6031150
	for <linux-lvm@redhat.com>; Mon, 6 Jan 2014 17:49:25 -0500
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s06MnNdU005482
	for <linux-lvm@redhat.com>; Mon, 6 Jan 2014 17:49:23 -0500
Received: by mail-lb0-f175.google.com with SMTP id w6so10308934lbh.34
	for <linux-lvm@redhat.com>; Mon, 06 Jan 2014 14:49:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52CADC82.60607@gmail.com>
References: <52C16F30.9090501@libertytrek.org>
	<52CAA89E.1000904@libertytrek.org> <52CADC82.60607@gmail.com>
Date: Mon, 6 Jan 2014 23:49:20 +0100
Message-ID: <CAHEKYV6VP1qCuYr=MX-1UKYx-jZ_rEFV2tOkUzby8HrUsRCvDQ@mail.gmail.com>
From: Mauricio Tavares <raubvogel@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jan 6, 2014 at 5:40 PM, Guy Rouillier <guy.rouillier@gmail.com> wrote:
> On 1/6/2014 7:59 AM, Tanstaafl wrote:
>>
>> On 2013-12-30 8:03 AM, Tanstaafl <tanstaafl@libertytrek.org> wrote:
>>>
>>> Hello,
>>>
>>> Due to a misunderstanding about how LVM snapshots work when I set up
>>> this system, I now need to delete an LV I had created to use for this
>>> purpose (I thought I had to pre-create the LV).
>>>
>>> Currently I have:
>>>
>>>   # lvscan
>>>    ACTIVE            '/dev/vg/tmp' [5.00 GiB] inherit
>>>    ACTIVE            '/dev/vg/log' [5.00 GiB] inherit
>>>    ACTIVE            '/dev/vg/vtmp' [5.00 GiB] inherit
>>>    ACTIVE            '/dev/vg/var' [700.00 GiB] inherit
>>>    ACTIVE            '/dev/vg/snaps' [4.00 GiB] inherit
>>>
>>> I just need to delete the /dev/vg/snaps LV, so that that 4GB is
>>> available for my LVM snapshots.
>>>
>>> Am I correct that all I have to do is:
>>>
>>> # umount /dev/vg/snaps
>>> # lvremove /dev/vg/snaps
>>>
>>> Then remove this line from fstab?
>>>
>>> This would then result in my VG having 4GB available for taking LVM
>>> snapshots?
>>
>>
>> Would appreciate a confirmation that I don't have to do anything else to
>> totally eliminate the snaps LV...
>>
>> I unmounted it, and commented that line in fstab. lvscan still shows the
>> same as above, but lvs shows the snaps with a slightly different
>> attribute:
>>
>>   # lvs
>>    LV    VG   Attr       LSize
>>    log   vg   -wi-ao----   5.00g
>>    snaps vg   -wi-a-----   4.00g
>>    tmp   vg   -wi-ao----   5.00g
>>    var   vg   -wi-ao---- 700.00g
>>    vtmp  vg   -wi-ao----   5.00g
>>
>> So again - is lvremove /dev/vg/snaps the correct way - and the only
>> thing I need to do - to remove that LV as if it had never been created?
>
>
> Yes. This page has a definition of the attributes:
> http://man7.org/linux/man-pages/man8/lvs.8.html.  "o" in position 6 means
> device open; since you've unmounted it, it is no longer open.
>
> I learned via this mailing list that lvremove just updates metadata to make
> the space available again, but doesn't remove the filesystem in the LV.  So
> if you were to recreate the exact same LV you just removed, the filesystem
> would still be there.  My situation was unusual, and you probably won't
> encounter this.  But if you want to avoid that minor possibility, use
> "wipefs -a /dev/vg/snaps" before lvremove.
>
      Going a bit on a tangent, thanks for the info. I need to add
that to my notes because sometimes when I want a lv to go away, I
really really want it to go

> --
> Guy Rouillier
>
> ---
> This email is free from viruses and malware because avast! Antivirus
> protection is active.
> http://www.avast.com
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
