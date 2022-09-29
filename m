Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F95C433FE
	for <linux-lvm@archiver.kernel.org>; Fri, 30 Sep 2022 07:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664521924;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8gviD+jJbDfv1T2oCrPXTrQIFgXDxYXsz3pBo9uI0rM=;
	b=HKABRNZUmvLi7SaWPyXjqGu00KygS1E8yA/TyOKgnq/Q1KylNA2X8dDerAwM/P/wmjJ4z5
	QqvPRxcsuWZlLYnVzmttZ96Rldk3aneaPST5s7Ajt9NO31LA81oEc52HB5/qi5QjpDwxqU
	1JBRvm/EiSFRl7+6IIrEgd+aRN6SCYA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651--uFLNx0zP22Ys2sJmIJgoQ-1; Fri, 30 Sep 2022 03:12:01 -0400
X-MC-Unique: -uFLNx0zP22Ys2sJmIJgoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F27D862FDC;
	Fri, 30 Sep 2022 07:11:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F09ABC15BA8;
	Fri, 30 Sep 2022 07:11:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C65CE1946A70;
	Fri, 30 Sep 2022 07:11:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6349F19465B8
 for <linux-lvm@listman.corp.redhat.com>; Thu, 29 Sep 2022 12:12:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4595639D6A; Thu, 29 Sep 2022 12:12:24 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19DE2440EE
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 12:12:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAC50858F17
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 12:12:13 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-uVNk4h9ENEm9FB2CrxydJQ-1; Thu, 29 Sep 2022 08:12:11 -0400
X-MC-Unique: uVNk4h9ENEm9FB2CrxydJQ-1
Received: by mail-ed1-f49.google.com with SMTP id l22so217710edj.5
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 05:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:cc:to:date:from:subject:content-transfer-encoding
 :mime-version:user-agent:thread-topic:references:in-reply-to
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AYs08BUX7eQZoSVjqy4NRxd/XkKc3/XtOhJZMNUrxCQ=;
 b=zVEBtH0brJDf9+PLobzRI6WvVGZ7K2+Ic5Y+qHcE4Hys8XoNLwTwubJZTsps+t+uqx
 S6guqAeKjbR8ZRgak0E5rVa6qkW+QQnmFJ86dL/e7r2Ih5cMfgNUm/ilr22wrocetCD3
 VHYB6JV8yBTSTATdN3iESG4dsyv1UREbsqTTl4x/vmos7Z3k7BxAJZSteoXvpssf0VAO
 cCYyWn4mjP0HHYQ9jN7zVuruUqJ0W9iHv+56wP6WnD0Lvc/FezJX848LOApsuW147Kow
 aLISFKJVPyoFOiNh5HxgvAzkj4wwkRqfW1uikRprmRlYVqWQWa/GhkQrOYNKFP/UJFj+
 hycQ==
X-Gm-Message-State: ACrzQf0GiaNsTbkeLrXhB2iyarniiKLpfdIfzJTyOP9OB4EeT/+VUv10
 jhknaEIEb7ubj19XR+8rktzYgRLzo68=
X-Google-Smtp-Source: AMsMyM6sZgw0OlU6GEo7VXgTVGg0VvfbgOvrLOcalBYC6omMh6lMYCGGoy5YzFHHmNE8XVNwjV1Nog==
X-Received: by 2002:a05:6402:40d1:b0:44f:e974:f981 with SMTP id
 z17-20020a05640240d100b0044fe974f981mr3169162edb.222.1664453530190; 
 Thu, 29 Sep 2022 05:12:10 -0700 (PDT)
Received: from [10.61.238.209] ([37.162.234.249])
 by smtp.gmail.com with ESMTPSA id
 bc25-20020a056402205900b0044ef2ac2650sm5279099edb.90.2022.09.29.05.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 05:12:09 -0700 (PDT)
In-Reply-To: <7f7db1ac-fe8a-851f-ef38-8aa85f9353c2@gmail.com>
References: <CADoUXWv+Po7pdhcAUk=JSwaDYJ2qp6B7aXm_djOuaOB0r9Usrw@mail.gmail.com>
 <6c03a8e8-c4ed-4c2a-a23b-bf4513577d1e@gmail.com>
 <6f7d32a9-a6f3-44b7-a4be-53c9372e00b4@gmail.com>
 <7f7db1ac-fe8a-851f-ef38-8aa85f9353c2@gmail.com>
X-Referenced-Uid: 71096
Thread-Topic: Re: LVM2 Metadata structure, extents ordering,
 metadata corruptions
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
X-Local-Message-Id: <06aa39c6-66bc-45be-8a69-07fd827db5bf@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Thu, 29 Sep 2022 14:12:06 +0200
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <06aa39c6-66bc-45be-8a69-07fd827db5bf@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Fri, 30 Sep 2022 07:11:51 +0000
Subject: Re: [linux-lvm] LVM2 Metadata structure, extents ordering,
 metadata corruptions
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6685080291748292605=="

--===============6685080291748292605==
Content-Type: multipart/alternative; boundary="----RWMS6QTY2V55LSDWV4Q04AVMKA5GKC"

------RWMS6QTY2V55LSDWV4Q04AVMKA5GKC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

Thank you for all the details and for your kind replies

I will have a look to the utilities you kindly pointed out

Kind regards=20

Il giorno 29 set 2022, 13:41, alle ore 13:41, Zdenek Kabelac <zdenek.kabela=
c@gmail.com> ha scritto:
>Dne 29. 09. 22 v 13:15 Roberto Fastec napsal(a):
>> Hello Zdenek
>> Thank you for the explanation
>>=20
>> May I kindly ask you what/which is the command line API to access and
>
>> manipulate those metadata?
>>=20
>
>'command line API' in the mean of:
>
>To create LV --   'lvcreate'....
>To remove LV --   'lvremove'....
>
>
>Note - many command can actually work without physical interaction with
>DM=20
>layer  (--driverloaded n) - however in some case some targets require
>presence=20
>of DM.
>
>lvm2 commands are the way how to change your metadata properly.
>
>
>> And when you say vi editor, do you kindly mean direct edit of HEX
>values on=20
>> the raw metadata?
>
>No way -  you can't change metadata on disk - unless you would be
>basically=20
>precisely copying what lvm2 command does  -  so what would be the point
>??
>
>Simply use lvm2 command to make the job.  Unless I'm missing some
>important=20
>point why would you need to work  with lvm2 metadata but without lvm2
>??
>
>
>>=20
>> Thank you
>>=20
>> If you kindly may have some link to some documentation, thank you
>even more
>>=20
>> Though here it is not the configuration that got lost
>
>Well yeah - it will take some time - but i.e. RHEL storage
>documentation might=20
>be a good way to go through it.
>
>
>
>> Also, additional info, we now got that all the cases do have active
>the=20
>> thin-provisionin and looks like that these are additional/different
>metadata=20
>> tables
>
>This-provisioning is handled by LVM2 only to provide  LVs for metadata
>and=20
>data LVs - and then the  thinLVs to a user.
>
>Physical block layout for thin-provisioning is fully stored inside=20
>thin-pool's metadata device.
>
>To explore those mappings you need to use tools like 'thin_dump',
>'thin_ls'
>
>>=20
>> So if these got messed/corrupted...
>>=20
>
>If these thin-pool metadata get corrupted, there is tool:
>'thin_repair'.
>
>Note: corruption of some high-level bTree nodes may result a severe
>damage to=20
>whole metadata structure ->  i.e. lots of thinLVs being lost.
>
>It's a good idea to keep such metadata on some resilient type of
>storage=20
>(raid) and of course  rule #1  - create regular backups of your thin=20
>volumes...   (snapshot of thinLV is not a backup!).
>
>
>> In QNAP looks they have made some customization and so thin-provision
>LVM=20
>> metadata are on a dedicated partition
>>=20
>> we observed the HEX inside there and got partially the logic
>>=20
>> About thin-provisioning, again, any "fsck"-like is available? (I
>suppose no,=20
>> but just as confirmation)
>
>This tool is called  'thin_check'
>
>(and this tool is in fact executed with every thin-pool activation &=20
>deactivation by default by lvm2)
>
>Note: just like with lvm2 metadata - also thin-pool's kernel metadata
>are=20
>check-summed (protected agains disc bit corruptions), so again zero
>chance=20
>with any 'hex-editor' to manipulate them - unless you would 'recreate'=20
>thin-pool engine...
>
>
>Regards
>
>Zdenek

------RWMS6QTY2V55LSDWV4Q04AVMKA5GKC
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"zoom: 0%;"><div dir=3D"auto">Thank you fo=
r all the details and for your kind replies<br><br></div>
<div dir=3D"auto">I will have a look to the utilities you kindly pointed ou=
t<br><br></div>
<div dir=3D"auto">Kind regards </div>
<div class=3D"gmail_quote" >Il giorno 29 set 2022, alle ore 13:41, Zdenek K=
abelac &lt;<a href=3D"mailto:zdenek.kabelac@gmail.com" target=3D"_blank">zd=
enek.kabelac@gmail.com</a>&gt; ha scritto:<blockquote class=3D"gmail_quote"=
 style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;">
<pre class=3D"blue">Dne 29. 09. 22 v 13:15 Roberto Fastec napsal(a):<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-l=
eft: 1px solid #729fcf; padding-left: 1ex;"> Hello Zdenek<br> Thank you for=
 the explanation<br> <br> May I kindly ask you what/which is the command li=
ne API to access and <br> manipulate those metadata?<br> <br></blockquote><=
br>'command line API' in the mean of:<br><br>To create LV --   'lvcreate'..=
..<br>To remove LV --   'lvremove'....<br><br><br>Note - many command can a=
ctually work without physical interaction with DM <br>layer  (--driverloade=
d n) - however in some case some targets require presence <br>of DM.<br><br=
>lvm2 commands are the way how to change your metadata properly.<br><br><br=
><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; bord=
er-left: 1px solid #729fcf; padding-left: 1ex;"> And when you say vi editor=
, do you kindly mean direct edit of HEX values on <br> the raw metadata?<br=
></blockquote><br>No way -  you can't change metadata on disk - unless you =
would be basically <br>precisely copying what lvm2 command does  -  so what=
 would be the point ??<br><br>Simply use lvm2 command to make the job.  Unl=
ess I'm missing some important <br>point why would you need to work  with l=
vm2 metadata but without lvm2 ??<br><br><br><blockquote class=3D"gmail_quot=
e" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padd=
ing-left: 1ex;"> <br> Thank you<br> <br> If you kindly may have some link t=
o some documentation, thank you even more<br> <br> Though here it is not th=
e configuration that got lost<br></blockquote><br>Well yeah - it will take =
some time - but i.e. RHEL storage documentation might <br>be a good way to =
go through it.<br><br><br><br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;=
"> Also, additional info, we now got that all the cases do have active the =
<br> thin-provisionin and looks like that these are additional/different me=
tadata <br> tables<br></blockquote><br>This-provisioning is handled by LVM2=
 only to provide  LVs for metadata and <br>data LVs - and then the  thinLVs=
 to a user.<br><br>Physical block layout for thin-provisioning is fully sto=
red inside <br>thin-pool's metadata device.<br><br>To explore those mapping=
s you need to use tools like 'thin_dump', 'thin_ls'<br><br><blockquote clas=
s=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px soli=
d #729fcf; padding-left: 1ex;"> <br> So if these got messed/corrupted...<br=
> <br></blockquote><br>If these thin-pool metadata get corrupted, there is =
tool: 'thin_repair'.<br><br>Note: corruption of some high-level bTree nodes=
 may result a severe damage to <br>whole metadata structure -&gt;  i.e. lot=
s of thinLVs being lost.<br><br>It's a good idea to keep such metadata on s=
ome resilient type of storage <br>(raid) and of course  rule #1  - create r=
egular backups of your thin <br>volumes...   (snapshot of thinLV is not a b=
ackup!).<br><br><br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt =
0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"> In QNAP=
 looks they have made some customization and so thin-provision LVM <br> met=
adata are on a dedicated partition<br> <br> we observed the HEX inside ther=
e and got partially the logic<br> <br> About thin-provisioning, again, any =
"fsck"-like is available? (I suppose no, <br> but just as confirmation)<br>=
</blockquote><br>This tool is called  'thin_check'<br><br>(and this tool is=
 in fact executed with every thin-pool activation &amp; <br>deactivation by=
 default by lvm2)<br><br>Note: just like with lvm2 metadata - also thin-poo=
l's kernel metadata are <br>check-summed (protected agains disc bit corrupt=
ions), so again zero chance <br>with any 'hex-editor' to manipulate them - =
unless you would 'recreate' <br>thin-pool engine...<br><br><br>Regards<br><=
br>Zdenek<br><br><br></pre></blockquote></div></body></html>
------RWMS6QTY2V55LSDWV4Q04AVMKA5GKC--

--===============6685080291748292605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6685080291748292605==--

