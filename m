Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B87C04A68
	for <linux-lvm@archiver.kernel.org>; Thu, 28 Jul 2022 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658995963;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dytFkdSqbIgp2BDdHButxYesVOTQTSM17ba8YQeNYXA=;
	b=V9Eg+9mTUN699F/u51jvo4UguzNFW6OexDME+OXsoXPSNxgdscSw/aGnwUNX+/CN5FPlVa
	MSnB6X3c6NiDVyxdhd3wWIxynzDIFCIjvb4ZFd9QB04Pwwi2g1Y/x33llMZrZ6qwaaxDqv
	WOqtG+UUJNj334LJXC7ACS1ZOJPCqWY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-tkjMQV9VNe6nzduWhzOhUw-1; Thu, 28 Jul 2022 04:12:39 -0400
X-MC-Unique: tkjMQV9VNe6nzduWhzOhUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B5243802B88;
	Thu, 28 Jul 2022 08:12:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B992E40466AA;
	Thu, 28 Jul 2022 08:12:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 811891945DA7;
	Thu, 28 Jul 2022 08:12:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6497B1945D94
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Jul 2022 11:26:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5191F492CA5; Wed, 27 Jul 2022 11:26:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DC89492CA2
 for <linux-lvm@redhat.com>; Wed, 27 Jul 2022 11:26:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35FBB802E5D
 for <linux-lvm@redhat.com>; Wed, 27 Jul 2022 11:26:09 +0000 (UTC)
Received: from bounces.a-painless.mh.aa.net.uk
 (bounces.a-painless.mh.aa.net.uk [90.155.5.1]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-eDIchy6nNnCuUuIdObofNQ-1; Wed, 27 Jul 2022 07:26:07 -0400
X-MC-Unique: eDIchy6nNnCuUuIdObofNQ-1
Received: from 4.13.169.217.in-addr.arpa ([217.169.13.4] helo=[192.168.10.122])
 by painless-a.thn.aa.net.uk with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <roger@beardandsandals.co.uk>) id 1oGfB1-004Ncl-5S
 for linux-lvm@redhat.com; Wed, 27 Jul 2022 12:26:06 +0100
From: Roger James <roger@beardandsandals.co.uk>
To: LVM general discussion and development <linux-lvm@redhat.com>
Date: Wed, 27 Jul 2022 12:26:04 +0100
Message-ID: <1823f6818f8.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
In-Reply-To: <CAAMCDecDyj_JLQvnxhsECng_t-x=Lxeta5WgrCLUGGqxHQvuiQ@mail.gmail.com>
References: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
 <18239b39270.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
 <CAAMCDecDyj_JLQvnxhsECng_t-x=Lxeta5WgrCLUGGqxHQvuiQ@mail.gmail.com>
User-Agent: AquaMail/1.37.0 (build: 103700163)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Thu, 28 Jul 2022 08:12:30 +0000
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5420312064169929655=="

This is a multi-part message in MIME format.
--===============5420312064169929655==
Content-Type: multipart/alternative; boundary="1823f681e85231d27a565a052c"

This is a multi-part message in MIME format.
--1823f681e85231d27a565a052c
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

The procedure outlined should at least get you back to a state where the lv 
is consistent but with blank sectors where the data is missing. I would 
suggest using dd to make a backup partition image. Then you can either work 
on that or the original to mend the fs.

On 27 July 2022 11:50:07 Roger Heflin <rogerheflin@gmail.com> wrote:

> I don't believe that is going to work.
>
> His issue is that the filesystem is refusing to work because of the
> missing data.
>
> man debugfs
>
> It will let you manually look at the metadata and structures of the
> ext2/3/4 fs.  You will likely need to use the "-c" option.
>
> It will be very manual and you should probably read up on the fs
> structure a bit.
>
> A data recovery company could get most of the data back, but they
> charge 5k-10k per TB, so likely close to 100k US$.
>
> And the issues will be that 1/3 of the metadata was on the missing
> disk, and some of the data was on the missing disk.
>
> I was able to do debugfs /dev/sda2  (my /boot) and do an ls and list
> out the files and then do a dump <filename> /tmp/junk.out and copy out
> that file.
>
> So the issue will be writing up a script to do lses and find all of
> the files and dump all of the files to someplace else.
>
> On Wed, Jul 27, 2022 at 2:39 AM Roger James <roger@beardandsandals.co.uk> 
> wrote:
>>
>> Try https://www.linuxsysadmins.com/recover-a-deleted-physical-volume/?amp
>>
>> On 26 July 2022 09:16:32 Ken Bass <daytooner@gmail.com> wrote:
>>>
>>> (fwiw: I am new to this list, so please bear with me.)
>>>
>>> Background: I have a very large (20TB) logical volume consisting of 3 
>>> drives. One of those drives unexpectedloy died (isn't that always the case 
>>> :-)). The drive that failed happened to be the last PV. So I am assuming 
>>> that there is still 2/3 of the data still intact and, to some extent, 
>>> recoverable. Although, apparently the ext4 fs is not recognised.
>>>
>>> I activated the LV partially (via -P). But running any utility on that (eg: 
>>> dumpe2fs, e2fsck, ...) I get many of these  in dmesg:
>>>
>>> "Buffer I/O error on dev dm-0, logical block xxxxxxx, async page read."  
>>> The thing is, the xxxxxxx block is on the missing drive/pv.
>>>
>>> I have also tried some recovery software, but eventually get these same 
>>> messages, and the data recovered is not really useful.
>>>
>>> Please help! How can I get passed that dmesg error, and move on. 14TB 
>>> recovered is better than 0.
>>>
>>> TIA
>>> ken
>>>
>>>
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
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--1823f681e85231d27a565a052c
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">The procedure outlined should at least get you back to a =
state where the lv is consistent but with blank sectors where the data is m=
issing. I would suggest using dd to make a backup partition image. Then you=
 can either work on that or the original to mend the fs.</div><div dir=3D'a=
uto'><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">On 27 July 2022 11:50:07 Roger Heflin &lt;rogerheflin@gma=
il.com&gt; wrote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">I don't believe that is going to work.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">His issue is that the filesystem is refusing to work beca=
use of the</div>
<div dir=3D"auto">missing data.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">man debugfs</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">It will let you manually look at the metadata and structu=
res of the</div>
<div dir=3D"auto">ext2/3/4 fs. &nbsp;You will likely need to use the "-c" o=
ption.</div>
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
<div dir=3D"auto">I was able to do debugfs /dev/sda2 &nbsp;(my /boot) and d=
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
<div dir=3D"auto">On Wed, Jul 27, 2022 at 2:39 AM Roger James &lt;roger@bea=
rdandsandals.co.uk&gt; wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Try https://www.linuxsysadmins.com/recover-a-deleted-phys=
ical-volume/?amp</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On 26 July 2022 09:16:32 Ken Bass &lt;daytooner@gmail.com=
&gt; wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">(fwiw: I am new to this list, so please bear with me.)</d=
iv>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Background: I have a very large (20TB) logical volume con=
sisting of 3 drives. One of those drives unexpectedloy died (isn't that alw=
ays the case :-)). The drive that failed happened to be the last PV. So I a=
m assuming that there is still 2/3 of the data still intact and, to some ex=
tent, recoverable. Although, apparently the ext4 fs is not recognised.</div=
>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I activated the LV partially (via -P). But running any ut=
ility on that (eg: dumpe2fs, e2fsck, ...) I get many of these &nbsp;in dmes=
g:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">"Buffer I/O error on dev dm-0, logical block xxxxxxx, asy=
nc page read." &nbsp;The thing is, the xxxxxxx block is on the missing driv=
e/pv.</div>
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
<div dir=3D"auto">linux-lvm@redhat.com</div>
<div dir=3D"auto">https://listman.redhat.com/mailman/listinfo/linux-lvm</di=
v>
<div dir=3D"auto">read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</=
div>
<div dir=3D"auto"><br></div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">linux-lvm mailing list</div>
<div dir=3D"auto">linux-lvm@redhat.com</div>
<div dir=3D"auto">https://listman.redhat.com/mailman/listinfo/linux-lvm</di=
v>
<div dir=3D"auto">read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</=
div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">linux-lvm mailing list</div>
<div dir=3D"auto">linux-lvm@redhat.com</div>
<div dir=3D"auto">https://listman.redhat.com/mailman/listinfo/linux-lvm</di=
v>
<div dir=3D"auto">read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</=
div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--1823f681e85231d27a565a052c--

--===============5420312064169929655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============5420312064169929655==--

