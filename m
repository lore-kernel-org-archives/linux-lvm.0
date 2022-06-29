Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F30C43334
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Jun 2022 11:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656500776;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4P6oGY2GUTgrs3O56/q2PyvW0vLIoSF5rcSuL7AisgQ=;
	b=K5WvPHv+FAqSRKnMptn+4k9m6hPaVMLR5kvpc24bw3kf1Leary/tvNSb13v09/xwaQlojA
	aY96/r7tz2HB1SBs9cw4aRxy45y1GWFM0N4lV1CkMV9ipM95b+X5vDeYuciT2Qi+FUaMzw
	X7ZYD5r6u1zEnZr7w2dRKDpkP4gc3fo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-WNDdULVXO1S-my682G3cdQ-1; Wed, 29 Jun 2022 07:06:13 -0400
X-MC-Unique: WNDdULVXO1S-my682G3cdQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E63EE185A79C;
	Wed, 29 Jun 2022 11:06:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C3CC404E4B2;
	Wed, 29 Jun 2022 11:06:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2DACC194705B;
	Wed, 29 Jun 2022 11:06:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E9731947056
 for <linux-lvm@listman.corp.redhat.com>; Wed, 29 Jun 2022 11:06:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2AFF09D7F; Wed, 29 Jun 2022 11:06:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25ECA18EAB
 for <linux-lvm@redhat.com>; Wed, 29 Jun 2022 11:06:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2D051C006A9
 for <linux-lvm@redhat.com>; Wed, 29 Jun 2022 11:06:02 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-FW-F-JJsNJ-dUAdCTEZILg-1; Wed, 29 Jun 2022 07:06:01 -0400
X-MC-Unique: FW-F-JJsNJ-dUAdCTEZILg-1
Received: by mail-qv1-f48.google.com with SMTP id n15so24129520qvh.12
 for <linux-lvm@redhat.com>; Wed, 29 Jun 2022 04:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=ADjr/fxDfkM+yzciylepWxJsrPbt3hqTTK/8aDoLH24=;
 b=rUPy95S3uiilqN1eKrNMyv2wPgz7CZwFIb/ws9HItG4Hs92yE8hil3E+rjKk/ivYkd
 9tD+66c0eDwREV2/+TjGU2JeRaXKL9pdMPq7fqSxTgeLps0+1wQKNPZAvw8jHHS4m4aC
 GRE5CEo77j3BTRCnx8iCIV9wMB1JGV8OXfL33BMAUl2c+FmMeqzygDVm/yYyMqHpIG1h
 MNWYkfnTV9xGuhrf8gqhJNW1DcFzWekaWBGOAFQfga9CpFPBL+qSmnzc+UeZbzLiN9mp
 mRIPxG/TYNuxqc3WYx4Q64Mfyg1UhO1q5iqF2H+y8OtMzscIaCNVUoo/VKHFjDMzELJa
 k/aA==
X-Gm-Message-State: AJIora+O1vDDKacV+KGDKxIiYTbOkHKHkMnXJQ4VXGXsECymywNKVXHp
 Uhy6bDoI15JwQo1kM3FO1qPRumps8a3JJmnDZ47rNYrBpDY=
X-Google-Smtp-Source: AGRyM1v3cvsoJW4aFutjOzpBQg0RkE4xcqajNc+bwusNCwtOyKzjj1ZBcFa3M7uQjRdfXfMYOihUZt8dv/m97nFB+Go=
X-Received: by 2002:a0c:d988:0:b0:470:a35b:5195 with SMTP id
 y8-20020a0cd988000000b00470a35b5195mr7262222qvj.75.1656500760303; Wed, 29 Jun
 2022 04:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <181a3eed7e0.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
 <181a96ed530.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
In-Reply-To: <181a96ed530.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 29 Jun 2022 06:05:49 -0500
Message-ID: <CAAMCDecEVHoYr9Cz5C9700YPDW4i9Oc7druoPo8rv=Pd4QmVHQ@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [linux-lvm] Recovering from a failed pvmove
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Did your operating system have backups/archives of the old cfgs?

Fedora/Redhat keeps around 20 old copies going back typically several
months and so typically one of those can be used.

My archive dir looks like this for the roovg (note I do not do a lot
of vg work, typically
 ls -l /etc/lvm/archive/fedora*
-rw-------. 1 root root 3159 Oct 16  2021
/etc/lvm/archive/fedora_00031-1021957302.vg
-rw-------. 1 root root 2740 Oct 16  2021
/etc/lvm/archive/fedora_00032-1140767599.vg
-rw-------. 1 root root 2331 Oct 16  2021
/etc/lvm/archive/fedora_00033-104560841.vg
-rw-------. 1 root root 2084 Oct 16  2021
/etc/lvm/archive/fedora_00034-239698665.vg
-rw-------. 1 root root 2330 Oct 16  2021
/etc/lvm/archive/fedora_00035-1994061504.vg
-rw-------. 1 root root 1973 Oct 16  2021
/etc/lvm/archive/fedora_00036-974449793.vg
-rw-------. 1 root root 1997 Oct 16  2021
/etc/lvm/archive/fedora_00037-1503932417.vg
-rw-------. 1 root root 1997 Oct 16  2021
/etc/lvm/archive/fedora_00038-951442204.vg
-rw-------. 1 root root 1997 Oct 16  2021
/etc/lvm/archive/fedora_00039-989943813.vg
-rw-------. 1 root root 1968 Oct 16  2021
/etc/lvm/archive/fedora_00040-815563362.vg
-rw-------. 1 root root 1997 Oct 16  2021
/etc/lvm/archive/fedora_00041-1303737065.vg
-rw-------. 1 root root 1968 Oct 16  2021
/etc/lvm/archive/fedora_00042-714254626.vg
-rw-------. 1 root root 1976 Oct 16  2021
/etc/lvm/archive/fedora_00043-858775161.vg
-rw-------. 1 root root 2229 Oct 16  2021
/etc/lvm/archive/fedora_00044-1360584830.vg
-rw-------. 1 root root 2238 Oct 16  2021
/etc/lvm/archive/fedora_00045-1806472194.vg
-rw-------. 1 root root 2218 Oct 16  2021
/etc/lvm/archive/fedora_00046-519515389.vg
-rw-------. 1 root root 1992 Oct 16  2021
/etc/lvm/archive/fedora_00047-1997891375.vg
-rw-------. 1 root root 1988 Oct 16  2021
/etc/lvm/archive/fedora_00048-1666128451.vg
-rw-------. 1 root root 2396 Oct 18  2021
/etc/lvm/archive/fedora_00049-67607509.vg
-rw-------. 1 root root 2396 Oct 18  2021
/etc/lvm/archive/fedora_00050-1102265641.vg
-rw-------. 1 root root 2404 Oct 18  2021
/etc/lvm/archive/fedora_00051-243833122.vg
-rw-------. 1 root root 1738 Oct 18  2021
/etc/lvm/archive/fedora_00052-1619420890.vg
-rw-------. 1 root root 1744 Oct 18  2021
/etc/lvm/archive/fedora_00053-149551096.vg
-rw-------. 1 root root 1748 Nov 11  2021
/etc/lvm/archive/fedora_00054-1785934566.vg
-rw-------. 1 root root 1748 Nov 11  2021
/etc/lvm/archive/fedora_00055-1992369253.vg
-rw-------. 1 root root 1719 Nov 11  2021
/etc/lvm/archive/fedora_00056-26730175.vg
-rw-------. 1 root root 1748 Nov 11  2021
/etc/lvm/archive/fedora_00057-1989410182.vg
-rw-------. 1 root root 1719 Nov 11  2021
/etc/lvm/archive/fedora_00058-1590942582.vg
-rw-------. 1 root root 1748 Nov 11  2021
/etc/lvm/archive/fedora_00059-140743745.vg

I have only personally had to edit the lvm archive I needed to use  a
few times, and that has always been to remove the MISSING tag from
PV's that are no longer missing and the missing tag blocks the archive
from being used.

Most of the time I am correcting VG's I revert to the archive copy
that was taked before the bad steps were done.

There are options that can be put in /etc/lvm/lvm.conf and
/etc/lvm/lvmlocal.conf that can cause the archive's to get collected
if they are not being automatically collected, I am pretty sure I have
seen a few distributions that do not seem to collect the archives that
do typically give you a restore point to revert to (without editing
the file directly).


On Wed, Jun 29, 2022 at 2:32 AM Roger James <roger@beardandsandals.co.uk> wrote:
>
> I have now managed to fix the problem. I ran vgcfgbackup, then made a copy of the backup for safety purposes. I than hand edited the original backup to remove the missing pv (pv4), the root lv and the pvmove0 lv. I then than vgcfgrestore. Everything is working.
>
> There must be a better way of doing this. Hand editing cfg files is not safe or sensible. What have I missed?
>
> Roger
>
> On 28 June 2022 07:38:48 Roger James <roger@beardandsandals.co.uk> wrote:
>>
>> Hi,
>>
>> I am struggling to recover from a failed pvmove. Unfortunately I only have a limited knowledge of lvm. I setup my lvm configuration many years ago.
>>
>> I was trying to move a lv to a SSD using pvmove. Unfortunately my brand new SSD choose that moment to fail (never buy cheap SSDs, lesson learnt!").
>>
>> This is the current status.
>>
>> roger@dragon:~$ sudo pvs
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).
>>   PV VG Fmt Attr PSize PFree
>>   /dev/sda1 wd lvm2 a-- <465.76g 0
>>   /dev/sdb1 wd lvm2 a-- <465.76g <80.45g
>>   /dev/sdc2 wd lvm2 a-- 778.74g 278.74g
>>   /dev/sdd1 wd lvm2 a-- <465.76g 0
>>   [unknown] wd lvm2 a-m <784.49g 685.66g
>> roger@dragon:~$ sudo lvs
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).
>>   LV VG Attr LSize Pool Origin Data% Meta% Move Log Cpy%Sync Convert
>>   home wd -wi------- 1.46t
>>   root wd -wI-----p- <108.83g
>>   swap wd -wi------- 8.00g
>>   work wd -wi------- 200.00g
>> roger@dragon:~$ sudo vgs
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).
>>   VG #PV #LV #SN Attr VSize VFree
>>   wd 5 4 0 wz-pn- 2.89t 1.02t
>>
>> This is a recap of what I have tried so far.
>>
>> roger@dragon:~$ sudo pvmove --abort
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).
>>   LVM command executed by lvmpolld failed.
>>   For more information see lvmpolld messages in syslog or lvmpolld log file.
>> roger@dragon:~$ sudo vgreduce --removemissing wd
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   WARNING: Partial LV root needs to be repaired or removed.
>>   WARNING: Partial LV pvmove0 needs to be repaired or removed.
>>   There are still partial LVs in VG wd.
>>   To remove them unconditionally use: vgreduce --removemissing --force.
>>   To remove them unconditionally from mirror LVs use: vgreduce --removemissing --mirrorsonly --force.
>>   WARNING: Proceeding to remove empty missing PVs.
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>> roger@dragon:~$ sudo lvchange -an wd/root
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).
>> roger@dragon:~$ sudo vgreduce --removemissing wd
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   WARNING: Partial LV root needs to be repaired or removed.
>>   WARNING: Partial LV pvmove0 needs to be repaired or removed.
>>   There are still partial LVs in VG wd.
>>   To remove them unconditionally use: vgreduce --removemissing --force.
>>   To remove them unconditionally from mirror LVs use: vgreduce --removemissing --mirrorsonly --force.
>>   WARNING: Proceeding to remove empty missing PVs.
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>> roger@dragon:~$ sudo lvremove wd/pvmove0
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).
>>   WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
>>   Can't remove locked logical volume wd/pvmove0.
>>
>> I am quite happy to loose the root lv, I just need the home and work lvs. What am I missing?
>>
>> Help!
>>
>> Roger
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
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

