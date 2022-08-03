Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DA1C19F2D
	for <linux-lvm@archiver.kernel.org>; Thu,  4 Aug 2022 07:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659596859;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7roLCoHkfRLRKp3/n4ScrHl988AuemO+I4icc5COKgw=;
	b=XjO5QEMzKH7BL0dlxODnuyg81tNGZ2j7ZaX3PybW6CR6L+hk3Uz6QHbx42O70nA0UOu3t7
	8mAQg8t5bQhf3wrIIV0n+rL+YTjz+3qWcvgyTXq1RtODq+lXLYEpW7q7dRzghx2YSw+etg
	cLwWEUDagD+pvUUxo9Utjf3KuE5HvBI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-rC1-eNy7M5OdY4QR-JygeQ-1; Thu, 04 Aug 2022 03:07:35 -0400
X-MC-Unique: rC1-eNy7M5OdY4QR-JygeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D128037B7;
	Thu,  4 Aug 2022 07:07:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66BBC2026D07;
	Thu,  4 Aug 2022 07:07:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 38F151946A53;
	Thu,  4 Aug 2022 07:07:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60D7C1946A53
 for <linux-lvm@listman.corp.redhat.com>; Wed,  3 Aug 2022 21:31:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 451BD40CFD0D; Wed,  3 Aug 2022 21:31:37 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40FA740CFD0A
 for <linux-lvm@redhat.com>; Wed,  3 Aug 2022 21:31:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25A45281137C
 for <linux-lvm@redhat.com>; Wed,  3 Aug 2022 21:31:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-nAQL-hmaM0mUcHNYKjbFzQ-1; Wed, 03 Aug 2022 17:31:35 -0400
X-MC-Unique: nAQL-hmaM0mUcHNYKjbFzQ-1
Received: by mail-ej1-f49.google.com with SMTP id tl27so15809603ejc.1
 for <linux-lvm@redhat.com>; Wed, 03 Aug 2022 14:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=I1gFAF+gHWSmBH5YwN8jbzs073zQNwS/xamTRtGFhSM=;
 b=WzYZnzP4UtUbTw0x8oj/PVjweCyH+2HlnCii+6p1BUFk0mv5MpQg/+9O1149q4rCpf
 kjYsXishHw2u3laG5168zwhP5YU02glP57wBXX6rwJNe7XaI/AnpB/ySYcCQv60IyICH
 4HynEcbSNb7po9WF+t6JKSoRfWV/KQW0GvW8w6U5h0Eq8bwecK5MZIVQfn1bwX8qFKKm
 XNUNfwOrTPCd2TrY0begJEEwq7kmulfj3ecKu61a818hoH3ueARU4MPJt4xgOaCdJMAR
 NAdM+vaq0nnHCQzeGIgvhTwHlDzLBmKYZG2dSon8tJiMaaABOn3uQYKXDfemp+hBgVMy
 iqxw==
X-Gm-Message-State: ACgBeo0CfgqbUL4uyXYKH8DNhswBcVjYu8jnlwZ/a70PXcdMlNbLkxZB
 f5WLGFH8Fs19bVZX6BAomCxhIE955LhtXlJvuzV9dBB4QM0=
X-Google-Smtp-Source: AA6agR6cbGjchyAGMCQpJ2jMYCC6gRRUKuGApTCNdN67tVyPjqoFy87jRFQjQpcN+YLpD3zpC2tg3H0t90ZryzcWVpI=
X-Received: by 2002:a17:907:2e01:b0:730:a098:7257 with SMTP id
 ig1-20020a1709072e0100b00730a0987257mr7814422ejc.705.1659562293628; Wed, 03
 Aug 2022 14:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
 <18239b39270.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
 <CAAMCDecDyj_JLQvnxhsECng_t-x=Lxeta5WgrCLUGGqxHQvuiQ@mail.gmail.com>
 <1823f6818f8.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
In-Reply-To: <1823f6818f8.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
From: Ken Bass <daytooner@gmail.com>
Date: Wed, 3 Aug 2022 16:31:22 -0500
Message-ID: <CAH5g027PhrTHgoNbgMP1bf=BbnwV+oSP7phJULWDzG-kVpwBGw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Thu, 04 Aug 2022 07:07:27 +0000
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0709183537405220882=="

--===============0709183537405220882==
Content-Type: multipart/alternative; boundary="000000000000fe91ba05e55cf442"

--000000000000fe91ba05e55cf442
Content-Type: text/plain; charset="UTF-8"

That's pretty much it. Whenever any app attempts to read a block from the
missing drive, I get the "Buffer I/O error" message. So, even though my
recovery apps can scan the LV, marking blocks on the last drive as
missing/unknown/etc., they can't display any recovered data - which I know
does exist. Looking at raw data from the apps' scans, I can see directory
entries, as well as files. I'm sure the inodes and bitmaps are still there
for some of these, I just can't really reverse engineer and follow them
through. But isn't that what the apps are supposed to do?

As for debugfs: pretty much the same issue: in order to use it, I need to
open the fs. But that (in debugfs) fails as well. So it can't help much.
Unless I'm missing something about debugfs.

The one thing I haven't tried is to use vgreduce to remove the missing PV;
but that will also remove the LV as well, which is why I haven't tried it
yet.

Sorry I haven't replied sooner, but it takes a long time (days) to clone,
then scan 16Tb...

So, please any suggestions are greatly appreciated, as well as needed.

ken

(I know: No backup; got burned; it hurts; and I will now always have
backups. 'Nuf said.)


On Thu, Jul 28, 2022 at 3:12 AM Roger James <roger@beardandsandals.co.uk>
wrote:

> The procedure outlined should at least get you back to a state where the
> lv is consistent but with blank sectors where the data is missing. I would
> suggest using dd to make a backup partition image. Then you can either work
> on that or the original to mend the fs.
>
> On 27 July 2022 11:50:07 Roger Heflin <rogerheflin@gmail.com> wrote:
>
> I don't believe that is going to work.
>>
>> His issue is that the filesystem is refusing to work because of the
>> missing data.
>>
>> man debugfs
>>
>> It will let you manually look at the metadata and structures of the
>> ext2/3/4 fs.  You will likely need to use the "-c" option.
>>
>> It will be very manual and you should probably read up on the fs
>> structure a bit.
>>
>> A data recovery company could get most of the data back, but they
>> charge 5k-10k per TB, so likely close to 100k US$.
>>
>> And the issues will be that 1/3 of the metadata was on the missing
>> disk, and some of the data was on the missing disk.
>>
>> I was able to do debugfs /dev/sda2  (my /boot) and do an ls and list
>> out the files and then do a dump <filename> /tmp/junk.out and copy out
>> that file.
>>
>> So the issue will be writing up a script to do lses and find all of
>> the files and dump all of the files to someplace else.
>>
>> On Wed, Jul 27, 2022 at 2:39 AM Roger James <roger@beardandsandals.co.uk>
>> wrote:
>>
>>>
>>> Try
>>> https://www.linuxsysadmins.com/recover-a-deleted-physical-volume/?amp
>>>
>>> On 26 July 2022 09:16:32 Ken Bass <daytooner@gmail.com> wrote:
>>>
>>>>
>>>> (fwiw: I am new to this list, so please bear with me.)
>>>>
>>>> Background: I have a very large (20TB) logical volume consisting of 3
>>>> drives. One of those drives unexpectedloy died (isn't that always the case
>>>> :-)). The drive that failed happened to be the last PV. So I am assuming
>>>> that there is still 2/3 of the data still intact and, to some extent,
>>>> recoverable. Although, apparently the ext4 fs is not recognised.
>>>>
>>>> I activated the LV partially (via -P). But running any utility on that
>>>> (eg: dumpe2fs, e2fsck, ...) I get many of these  in dmesg:
>>>>
>>>> "Buffer I/O error on dev dm-0, logical block xxxxxxx, async page read."
>>>>  The thing is, the xxxxxxx block is on the missing drive/pv.
>>>>
>>>> I have also tried some recovery software, but eventually get these same
>>>> messages, and the data recovered is not really useful.
>>>>
>>>> Please help! How can I get passed that dmesg error, and move on. 14TB
>>>> recovered is better than 0.
>>>>
>>>> TIA
>>>> ken
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>
>>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
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
>

--000000000000fe91ba05e55cf442
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div>That&#39;s pretty much it. Whenever any app=
 attempts to read a block from the missing drive, I get the &quot;Buffer I/=
O error&quot; message. So, even though my recovery apps can scan the LV, ma=
rking blocks on the last drive as missing/unknown/etc., they can&#39;t disp=
lay any recovered data - which I know does exist. Looking at raw data from =
the apps&#39; scans, I can see directory entries, as well as files. I&#39;m=
 sure the inodes and bitmaps are still there for some of these, I just can&=
#39;t really reverse engineer and follow them through. But isn&#39;t that w=
hat the apps are supposed to do?<div><br></div><div>As for debugfs: pretty =
much the same issue: in order to use it, I need to open the fs. But that (i=
n debugfs) fails as well. So it can&#39;t help much. Unless I&#39;m missing=
 something about debugfs.</div><div><br></div><div>The one thing I haven&#3=
9;t tried is to use vgreduce to remove the missing PV; but that will also r=
emove the LV as well, which is why I haven&#39;t tried it yet.<br></div><di=
v><br></div><div>Sorry I haven&#39;t replied sooner, but it takes a long ti=
me (days) to clone, then scan 16Tb...</div><div><br></div><div>So, please a=
ny suggestions are greatly appreciated, as well as needed.</div><div><br></=
div><div>ken</div><div><br></div><div><div>(I know: No backup; got burned; =
it hurts; and I will now always have backups. &#39;Nuf said.)</div><div><br=
></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Jul 28, 2022 at 3:12 AM Roger James &lt;<a href=3D"mai=
lto:roger@beardandsandals.co.uk">roger@beardandsandals.co.uk</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

<div>
<div dir=3D"auto">
<div dir=3D"auto">The procedure outlined should at least get you back to a =
state where the lv is consistent but with blank sectors where the data is m=
issing. I would suggest using dd to make a backup partition image. Then you=
 can either work on that or the original to mend the fs.</div><div dir=3D"a=
uto"><br></div>
<div id=3D"gmail-m_-8979662971263915469aqm-original" style=3D"color:black">
<div dir=3D"auto">On 27 July 2022 11:50:07 Roger Heflin &lt;<a href=3D"mail=
to:rogerheflin@gmail.com" target=3D"_blank">rogerheflin@gmail.com</a>&gt; w=
rote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.75ex;border-left:1px solid rgb(128,128,128);padding-left:0.75ex">
<div dir=3D"auto">I don&#39;t believe that is going to work.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">His issue is that the filesystem is refusing to work beca=
use of the</div>
<div dir=3D"auto">missing data.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">man debugfs</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">It will let you manually look at the metadata and structu=
res of the</div>
<div dir=3D"auto">ext2/3/4 fs.=C2=A0 You will likely need to use the &quot;=
-c&quot; option.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">It will be very manual and you should probably read up on=
 the fs</div>
<div dir=3D"auto">structure a bit.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">A data recovery company could get most of the data back, =
but they</div>
<div dir=3D"auto">charge 5k-10k per TB, so likely close to 100k US$.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">And the issues will be that 1/3 of the metadata was on th=
e missing</div>
<div dir=3D"auto">disk, and some of the data was on the missing disk.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I was able to do debugfs /dev/sda2 =C2=A0(my /boot) and d=
o an ls and list</div>
<div dir=3D"auto">out the files and then do a dump &lt;filename&gt; /tmp/ju=
nk.out and copy out</div>
<div dir=3D"auto">that file.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">So the issue will be writing up a script to do lses and f=
ind all of</div>
<div dir=3D"auto">the files and dump all of the files to someplace else.</d=
iv>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Wed, Jul 27, 2022 at 2:39 AM Roger James &lt;<a href=
=3D"mailto:roger@beardandsandals.co.uk" target=3D"_blank">roger@beardandsan=
dals.co.uk</a>&gt; wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.75ex;border-left:1px solid rgb(0,153,204);padding-left:0.75ex">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Try <a href=3D"https://www.linuxsysadmins.com/recover-a-d=
eleted-physical-volume/?amp" target=3D"_blank">https://www.linuxsysadmins.c=
om/recover-a-deleted-physical-volume/?amp</a></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On 26 July 2022 09:16:32 Ken Bass &lt;<a href=3D"mailto:d=
aytooner@gmail.com" target=3D"_blank">daytooner@gmail.com</a>&gt; wrote:</d=
iv>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.75ex;border-left:1px solid rgb(153,51,204);padding-left:0.75ex">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">(fwiw: I am new to this list, so please bear with me.)</d=
iv>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Background: I have a very large (20TB) logical volume con=
sisting of 3 drives. One of those drives unexpectedloy died (isn&#39;t that=
 always the case :-)). The drive that failed happened to be the last PV. So=
 I am assuming that there is still 2/3 of the data still intact and, to som=
e extent, recoverable. Although, apparently the ext4 fs is not recognised.<=
/div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I activated the LV partially (via -P). But running any ut=
ility on that (eg: dumpe2fs, e2fsck, ...) I get many of these =C2=A0in dmes=
g:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&quot;Buffer I/O error on dev dm-0, logical block xxxxxxx=
, async page read.&quot; =C2=A0The thing is, the xxxxxxx block is on the mi=
ssing drive/pv.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I have also tried some recovery software, but eventually =
get these same messages, and the data recovered is not really useful.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Please help! How can I get passed that dmesg error, and m=
ove on. 14TB recovered is better than 0.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">TIA</div>
<div dir=3D"auto">ken</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">linux-lvm mailing list</div>
<div dir=3D"auto"><a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank"=
>linux-lvm@redhat.com</a></div>
<div dir=3D"auto"><a href=3D"https://listman.redhat.com/mailman/listinfo/li=
nux-lvm" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/linu=
x-lvm</a></div>
<div dir=3D"auto">read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/L=
VM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></div>
<div dir=3D"auto"><br></div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">linux-lvm mailing list</div>
<div dir=3D"auto"><a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank"=
>linux-lvm@redhat.com</a></div>
<div dir=3D"auto"><a href=3D"https://listman.redhat.com/mailman/listinfo/li=
nux-lvm" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/linu=
x-lvm</a></div>
<div dir=3D"auto">read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/L=
VM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">linux-lvm mailing list</div>
<div dir=3D"auto"><a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank"=
>linux-lvm@redhat.com</a></div>
<div dir=3D"auto"><a href=3D"https://listman.redhat.com/mailman/listinfo/li=
nux-lvm" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/linu=
x-lvm</a></div>
<div dir=3D"auto">read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/L=
VM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></div>

_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div>

--000000000000fe91ba05e55cf442--

--===============0709183537405220882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0709183537405220882==--

