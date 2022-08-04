Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8B9C19F2B
	for <linux-lvm@archiver.kernel.org>; Thu,  4 Aug 2022 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659611275;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R8floTPam6CZOXTESfVya0yo9UuioCQoPlALuZ3Q/3M=;
	b=gqisX5TKRbUMe/uzvT7MxzHKk4eWhX4CvMQ/LNWwXVZykgCRRIB+/qhChKqnVGAKrtsXlJ
	LOV2dKKxfmyTP/IkdOWdN5ohXodpNxziEnIbCkKYDvfzCuKYte+aZ5po4rQe6TB2KrAXpa
	CeI+CLHiJ4wGMLPlIpAdX/rcPrg7t4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-3Aia_h0JO8a8o6YAkc17Ng-1; Thu, 04 Aug 2022 07:07:52 -0400
X-MC-Unique: 3Aia_h0JO8a8o6YAkc17Ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EB1585A588;
	Thu,  4 Aug 2022 11:07:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 154A8C28100;
	Thu,  4 Aug 2022 11:07:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E93B11946A56;
	Thu,  4 Aug 2022 11:07:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0C28E1946A52
 for <linux-lvm@listman.corp.redhat.com>; Thu,  4 Aug 2022 11:07:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E148E2026D07; Thu,  4 Aug 2022 11:07:43 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD6F12026D4C
 for <linux-lvm@redhat.com>; Thu,  4 Aug 2022 11:07:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0DB31C1448F
 for <linux-lvm@redhat.com>; Thu,  4 Aug 2022 11:07:43 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-4KrAV3MEO-WkCNvZRArkzg-1; Thu, 04 Aug 2022 07:07:42 -0400
X-MC-Unique: 4KrAV3MEO-WkCNvZRArkzg-1
Received: by mail-qk1-f172.google.com with SMTP id o1so14738394qkg.9
 for <linux-lvm@redhat.com>; Thu, 04 Aug 2022 04:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=GjPprv+67/ZvNvtYqy09T+/keHnseZm4wIuCw7zRAxQ=;
 b=UUdBFRiaumoDs/ETCGK/FzybzS5l7TocKPPTF2TQhz6hJyQmHEJLKl9tn/QCT1q3rg
 PIjmjrIPqoCJ5yQ0tS1KZaMmm3nJFNfB9Db+YKaBqIPTloR4OlZ2ge6XfOy4FsLODu5P
 fYBTsg8PoRPtEh86c7wuxQQexiGkgAyB90tUEP+P/XULVHbq8LutgWqAMfYQklSbxv5i
 hRPUhvSVDaIkmoCR/sWgNGIYpIiI2iWZlM522FwQtsWW4U3V7asv82IT4JhclGgf5qB2
 HcwiFYPZzFlUo/z+gDAg+4lf/GsWFm+oC4Izes5BU1x2+IpoDLqXwE9BHXlqXwUDA3GY
 s35w==
X-Gm-Message-State: ACgBeo2dFxhQVAQvp8SkKWm9uBYOiXmFGfa0zu3BFFTZpJNQrXzxEGrG
 EsURwnbkJPiA0HmTfYKpOX3q8Rtc6fg6OrBp0sZpt28c
X-Google-Smtp-Source: AA6agR5bJjV0WoMftU8tggvZl8KylVAzguPMjIfVRObEoZ+11fZH4NnNOAc/htoxEyWAviPPTApVmJhpomJcPX3vs0U=
X-Received: by 2002:a37:69c6:0:b0:6b6:60d0:c414 with SMTP id
 e189-20020a3769c6000000b006b660d0c414mr855515qkc.586.1659611261115; Thu, 04
 Aug 2022 04:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
 <18239b39270.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
 <CAAMCDecDyj_JLQvnxhsECng_t-x=Lxeta5WgrCLUGGqxHQvuiQ@mail.gmail.com>
 <1823f6818f8.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
 <CAH5g027PhrTHgoNbgMP1bf=BbnwV+oSP7phJULWDzG-kVpwBGw@mail.gmail.com>
In-Reply-To: <CAH5g027PhrTHgoNbgMP1bf=BbnwV+oSP7phJULWDzG-kVpwBGw@mail.gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Thu, 4 Aug 2022 06:07:29 -0500
Message-ID: <CAAMCDeeVAMKq0tTcmOona7d0xQfA6R2J9u5-cgUYt=BkrFEb4g@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [linux-lvm] Problem with partially activate logical volume
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

fsck might be able to fix it enough that debugfs and/or mount works,
but it may also eliminate all the data, but since you have a clone and
no data it is probably worth a shot.

fsck -f -y   will either get you some data or not and make you have to
clone from the copy if you have something else to  try.

Did you try the "-c" option on debug fs?

On Thu, Aug 4, 2022 at 2:07 AM Ken Bass <daytooner@gmail.com> wrote:
>
>
> That's pretty much it. Whenever any app attempts to read a block from the missing drive, I get the "Buffer I/O error" message. So, even though my recovery apps can scan the LV, marking blocks on the last drive as missing/unknown/etc., they can't display any recovered data - which I know does exist. Looking at raw data from the apps' scans, I can see directory entries, as well as files. I'm sure the inodes and bitmaps are still there for some of these, I just can't really reverse engineer and follow them through. But isn't that what the apps are supposed to do?
>
> As for debugfs: pretty much the same issue: in order to use it, I need to open the fs. But that (in debugfs) fails as well. So it can't help much. Unless I'm missing something about debugfs.
>
> The one thing I haven't tried is to use vgreduce to remove the missing PV; but that will also remove the LV as well, which is why I haven't tried it yet.
>
> Sorry I haven't replied sooner, but it takes a long time (days) to clone, then scan 16Tb...
>
> So, please any suggestions are greatly appreciated, as well as needed.
>
> ken
>
> (I know: No backup; got burned; it hurts; and I will now always have backups. 'Nuf said.)
>
>
> On Thu, Jul 28, 2022 at 3:12 AM Roger James <roger@beardandsandals.co.uk> wrote:
>>
>> The procedure outlined should at least get you back to a state where the lv is consistent but with blank sectors where the data is missing. I would suggest using dd to make a backup partition image. Then you can either work on that or the original to mend the fs.
>>
>> On 27 July 2022 11:50:07 Roger Heflin <rogerheflin@gmail.com> wrote:
>>
>>> I don't believe that is going to work.
>>>
>>> His issue is that the filesystem is refusing to work because of the
>>> missing data.
>>>
>>> man debugfs
>>>
>>> It will let you manually look at the metadata and structures of the
>>> ext2/3/4 fs.  You will likely need to use the "-c" option.
>>>
>>> It will be very manual and you should probably read up on the fs
>>> structure a bit.
>>>
>>> A data recovery company could get most of the data back, but they
>>> charge 5k-10k per TB, so likely close to 100k US$.
>>>
>>> And the issues will be that 1/3 of the metadata was on the missing
>>> disk, and some of the data was on the missing disk.
>>>
>>> I was able to do debugfs /dev/sda2  (my /boot) and do an ls and list
>>> out the files and then do a dump <filename> /tmp/junk.out and copy out
>>> that file.
>>>
>>> So the issue will be writing up a script to do lses and find all of
>>> the files and dump all of the files to someplace else.
>>>
>>> On Wed, Jul 27, 2022 at 2:39 AM Roger James <roger@beardandsandals.co.uk> wrote:
>>>>
>>>>
>>>> Try https://www.linuxsysadmins.com/recover-a-deleted-physical-volume/?amp
>>>>
>>>> On 26 July 2022 09:16:32 Ken Bass <daytooner@gmail.com> wrote:
>>>>>
>>>>>
>>>>> (fwiw: I am new to this list, so please bear with me.)
>>>>>
>>>>> Background: I have a very large (20TB) logical volume consisting of 3 drives. One of those drives unexpectedloy died (isn't that always the case :-)). The drive that failed happened to be the last PV. So I am assuming that there is still 2/3 of the data still intact and, to some extent, recoverable. Although, apparently the ext4 fs is not recognised.
>>>>>
>>>>> I activated the LV partially (via -P). But running any utility on that (eg: dumpe2fs, e2fsck, ...) I get many of these  in dmesg:
>>>>>
>>>>> "Buffer I/O error on dev dm-0, logical block xxxxxxx, async page read."  The thing is, the xxxxxxx block is on the missing drive/pv.
>>>>>
>>>>> I have also tried some recovery software, but eventually get these same messages, and the data recovered is not really useful.
>>>>>
>>>>> Please help! How can I get passed that dmesg error, and move on. 14TB recovered is better than 0.
>>>>>
>>>>> TIA
>>>>> ken
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> linux-lvm mailing list
>>>>> linux-lvm@redhat.com
>>>>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>>
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

