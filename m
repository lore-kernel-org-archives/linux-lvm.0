Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D92C433F5
	for <linux-lvm@archiver.kernel.org>; Fri, 30 Sep 2022 07:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664521924;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7ujUC5jwRi+zixD4al9oAc4FeiSP2j75xuKPJWXbzfk=;
	b=Ol5IEka6nuJ2X3YaM76Ab8Fn42ZX9v2lg9dLKEkiAofN/34bDWfL4CtS67uA3EQqMlA/Q2
	cA1i4MxxLMO8I7x3vlViHQZxSDcvHZ1PIWRLMhM9QaYLdYFBDJ3Z48vv2VYtgy7JDmx05V
	b56NPStLigwQip4wa9gv1dsShwcH2tw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-RxiM-38TMtGuXqUH8TEpig-1; Fri, 30 Sep 2022 03:12:01 -0400
X-MC-Unique: RxiM-38TMtGuXqUH8TEpig-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E74985A59D;
	Fri, 30 Sep 2022 07:11:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE4B54B4010;
	Fri, 30 Sep 2022 07:11:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A6ADE1946A67;
	Fri, 30 Sep 2022 07:11:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4742319465B8
 for <linux-lvm@listman.corp.redhat.com>; Thu, 29 Sep 2022 11:20:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29CD6111DCE5; Thu, 29 Sep 2022 11:20:38 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22547111DCE9
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 11:20:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2EDD801231
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 11:15:11 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-DcZ_76-dMyygt_3dE1SXjA-1; Thu, 29 Sep 2022 07:15:09 -0400
X-MC-Unique: DcZ_76-dMyygt_3dE1SXjA-1
Received: by mail-ej1-f44.google.com with SMTP id lc7so2143006ejb.0
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 04:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:cc:to:date:from:subject:content-transfer-encoding
 :mime-version:user-agent:thread-topic:references:in-reply-to
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4gOY2yS60g/18dotRGboBhuxSFUZsHZYQQNlXYcCI0s=;
 b=wzuXURTrdq+zvov1MG1LK3BOYQMWQl7Z7vDmd4SuW2lPNZuSLstlwIZmf/85gMvvLK
 ztyN/p0m/jcEHi4dXpoVRkwaTAcXjl15RupCcy2tR+0zA/ANUgWxP6/J23OjpeEd/ekf
 um3KUCiDQgIxAPg/uGcuGO67uaPPD17d1sUZUSCLQRvU5UaZBk0uLJu8eOM5sdlzBlGL
 AP2Emj3bJeVWlCmoQKyRj7/zllSymh7PboMNlUdLR2N60ARe2B4JQa5aUwGgDfRWgHeN
 w3fjTb0PEoVO2SLUbeOn6XEsnmS421Y6k2JKkYw7ai+/2YIhHsal/0eOOI1Si8EmcNIf
 r12A==
X-Gm-Message-State: ACrzQf2HCEFBSkyWkjUTg/icr9+IsLnTv+7BXziIp/z+vPd0W0OnwmS1
 XXzdRj/gFEWy/lRLKvbDV6EFW3La+V0=
X-Google-Smtp-Source: AMsMyM7OwS9nHeIZ+kT4isI+zr5mm33CqHpGjjAW66atPE+8BQH9PXjEZY+IKwLQXPBVTpsUjdposQ==
X-Received: by 2002:a17:907:7b97:b0:782:20fd:b956 with SMTP id
 ne23-20020a1709077b9700b0078220fdb956mr2334003ejc.204.1664450108574; 
 Thu, 29 Sep 2022 04:15:08 -0700 (PDT)
Received: from [10.61.238.209] ([37.162.234.249])
 by smtp.gmail.com with ESMTPSA id
 a11-20020aa7d90b000000b00456cbd8c65bsm5249957edr.6.2022.09.29.04.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 04:15:07 -0700 (PDT)
In-Reply-To: <6c03a8e8-c4ed-4c2a-a23b-bf4513577d1e@gmail.com>
References: <CADoUXWv+Po7pdhcAUk=JSwaDYJ2qp6B7aXm_djOuaOB0r9Usrw@mail.gmail.com>
 <6c03a8e8-c4ed-4c2a-a23b-bf4513577d1e@gmail.com>
X-Referenced-Uid: 71094
Thread-Topic: Re: LVM2 Metadata structure, extents ordering,
 metadata corruptions
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
X-Local-Message-Id: <6f7d32a9-a6f3-44b7-a4be-53c9372e00b4@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Thu, 29 Sep 2022 13:15:04 +0200
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <6f7d32a9-a6f3-44b7-a4be-53c9372e00b4@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4187453140045207205=="

--===============4187453140045207205==
Content-Type: multipart/alternative; boundary="----VGHK82K0KUJ6BIEQ1277TJXAY2N1P5"

------VGHK82K0KUJ6BIEQ1277TJXAY2N1P5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

Hello Zdenek
Thank you for the explanation

May I kindly ask you what/which is the command line API to access and manip=
ulate those metadata?

And when you say vi editor, do you kindly mean direct edit of HEX values on=
 the raw metadata?

Thank you

If you kindly may have some link to some documentation, thank you even more

Though here it is not the configuration that got lost

Also, additional info, we now got that all the cases do have active the thi=
n-provisionin and looks like that these are additional/different metadata t=
ables

So if these got messed/corrupted...=20

In QNAP looks they have made some customization and so thin-provision LVM m=
etadata are on a dedicated partition

we observed the HEX inside there and got partially the logic

About thin-provisioning, again, any "fsck"-like is available? (I suppose no=
, but just as confirmation)

Thank you
R.



Il giorno 29 set 2022, 12:52, alle ore 12:52, Zdenek Kabelac <zdenek.kabela=
c@gmail.com> ha scritto:
>Dne 27. 09. 22 v 12:10 Roberto Fastec napsal(a):
>> Dear friends of the LVM mailing list
>>=20
>> I suppose this question is for some real LVM2 guru or even developer
>>=20
>> Here I kindly make three question with three premises
>>=20
>> premises
>> 1. I'm a total noob about LVM2 low level logic, so I'm sorry of the
>questions=20
>> will sound silly :-)
>> 2. The following applies to a whole md RAID (in my example it will be
>a RAID5=20
>> made of 4 drives 1TB each so useful available space more or less
>2.7TB)
>> 3. I assign whole those 2.7TB to one single PV and one single VG and
>one=20
>> single LV.
>>=20
>> questions
>> 1. Given the premise 3. The corresponding LVM2 metadata/tables are
>and will be=20
>> just a (allow me the term) "grid" "mapping that space" in an ordered
>sequence=20
>> to in the subsequent use (and filling) of the RAID space "just mark"
>the used=20
>> ones and the free ones? Or those grid cells will/could be in a messed
>order ?
>> And explicitly I mean. In case of metadata corruption (always with
>respect of=20
>> premise 3.) , could we just generate a dummy metadata table with all
>the=20
>> extents marked as "used" in such a way that we can anyway access them
>> And can we expect to have them ordered?
>
>lvm2  'metadata handling'  is purely internal to the lvm2 codebase -
>you can't=20
>rely on any 'witnessed/observed' logic.
>
>There is cmdline API to access and manipulate metadata in most cases.
>
>Temporarily you can i.e. update/modify your current metadata with 'vi'
>editor=20
>and vgcfgrestore them - however this is not a 'guaranteed' operational
>mode -=20
>rather a workaround if the 'cmdline' interface is not handling some
>error case=20
>well - and it should be used as  RFE to enhance lvm2 in such case.
>
>>=20
>> 2. Does it exist a sort of "fsck" for the LVM2 metadata ? We do
>technical=20
>> assistance and recently, specifically with those NAS devices that
>make use of=20
>
>In general - lvm2 metadata on disk always do have CRC32  checksum -
>when=20
>invalid -> metadata is garbage.
>
>Each loaded CRC32 correct metadata is always then fully validated - yep
>it can=20
>be sometimes a bit costly in the case of very large metadata size - but
>so far=20
>- no big problems -  CPUs are mostly getting faster as well...  so
>bigger=20
>setups tends to have also powerful hw....
>
>> LVM2, we have experienced really easy metadata corruption in
>occurence of just=20
>> nothing or because of a electric power interruption (which is really=20
>> astonishing). We mean no drives failures , no bad SMARTs . Just
>corruption=20
>> from "nowhere" and "nocause"
>
>
>Corrupted metadata are always considered unusable - user has to restore
>to=20
>previous valid version (and here sometimes all the combinations of
>error might=20
>eventually require  'vi editor' assistance - but again - in very very
>unusual=20
>circumstances.
>
>Metadata are archived in /etc/lvm/archive and  they are also in
>ring-buffer=20
>present on all PVs in a VG  -  if there are too many PVs - user can
>'opt-out'=20
>and consider only a subset of PVs to hold metadata - i.e.  200PVs - and
>only=20
>20PVs holding metadata - but these are highly unusual configurations...
>
>Regards
>
>
>Zdenek

------VGHK82K0KUJ6BIEQ1277TJXAY2N1P5
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"zoom: 0%;"><div dir=3D"auto">Hello Zdenek=
<br></div>
<div dir=3D"auto">Thank you for the explanation<br><br></div>
<div dir=3D"auto">May I kindly ask you what/which is the command line API t=
o access and manipulate those metadata?<br><br></div>
<div dir=3D"auto">And when you say vi editor, do you kindly mean direct edi=
t of HEX values on the raw metadata?<br><br></div>
<div dir=3D"auto">Thank you<br><br></div>
<div dir=3D"auto">If you kindly may have some link to some documentation, t=
hank you even more<br><br></div>
<div dir=3D"auto">Though here it is not the configuration that got lost<br>=
<br></div>
<div dir=3D"auto">Also, additional info, we now got that all the cases do h=
ave active the thin-provisionin and looks like that these are additional/di=
fferent metadata tables<br><br></div>
<div dir=3D"auto">So if these got messed/corrupted... <br><br></div>
<div dir=3D"auto">In QNAP looks they have made some customization and so th=
in-provision LVM metadata are on a dedicated partition<br><br></div>
<div dir=3D"auto">we observed the HEX inside there and got partially the lo=
gic<br><br></div>
<div dir=3D"auto">About thin-provisioning, again, any "fsck"-like is availa=
ble? (I suppose no, but just as confirmation)<br><br></div>
<div dir=3D"auto">Thank you<br></div>
<div dir=3D"auto">R.<br><br></div>
<div class=3D"gmail_quote" >Il giorno 29 set 2022, alle ore 12:52, Zdenek K=
abelac &lt;<a href=3D"mailto:zdenek.kabelac@gmail.com" target=3D"_blank">zd=
enek.kabelac@gmail.com</a>&gt; ha scritto:<blockquote class=3D"gmail_quote"=
 style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;">
<pre class=3D"blue">Dne 27. 09. 22 v 12:10 Roberto Fastec napsal(a):<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-l=
eft: 1px solid #729fcf; padding-left: 1ex;"> Dear friends of the LVM mailin=
g list<br> <br> I suppose this question is for some real LVM2 guru or even =
developer<br> <br> Here I kindly make three question with three premises<br=
> <br> premises<br> 1. I'm a total noob about LVM2 low level logic, so I'm =
sorry of the questions <br> will sound silly :-)<br> 2. The following appli=
es to a whole md RAID (in my example it will be a RAID5 <br> made of 4 driv=
es 1TB each so useful available space more or less 2.7TB)<br> 3. I assign w=
hole those 2.7TB to one single PV and one single VG and one <br> single LV.=
<br> <br> questions<br> 1. Given the premise 3. The corresponding LVM2 meta=
data/tables are and will be <br> just a (allow me the term) "grid" "mapping=
 that space" in an ordered sequence <br> to in the subsequent use (and fill=
ing) of the RAID space "just mark" the used <br> ones and the free ones? Or=
 those grid cells will/could be in a messed order ?<br> And explicitly I me=
an. In case of metadata corruption (always with respect of <br> premise 3.)=
 , could we just generate a dummy metadata table with all the <br> extents =
marked as "used" in such a way that we can anyway access them<br> And can w=
e expect to have them ordered?<br></blockquote><br>lvm2  'metadata handling=
'  is purely internal to the lvm2 codebase - you can't <br>rely on any 'wit=
nessed/observed' logic.<br><br>There is cmdline API to access and manipulat=
e metadata in most cases.<br><br>Temporarily you can i.e. update/modify you=
r current metadata with 'vi' editor <br>and vgcfgrestore them - however thi=
s is not a 'guaranteed' operational mode - <br>rather a workaround if the '=
cmdline' interface is not handling some error case <br>well - and it should=
 be used as  RFE to enhance lvm2 in such case.<br><br><blockquote class=3D"=
gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #72=
9fcf; padding-left: 1ex;"> <br> 2. Does it exist a sort of "fsck" for the L=
VM2 metadata ? We do technical <br> assistance and recently, specifically w=
ith those NAS devices that make use of <br></blockquote><br>In general - lv=
m2 metadata on disk always do have CRC32  checksum - when <br>invalid -&gt;=
 metadata is garbage.<br><br>Each loaded CRC32 correct metadata is always t=
hen fully validated - yep it can <br>be sometimes a bit costly in the case =
of very large metadata size - but so far <br>- no big problems -  CPUs are =
mostly getting faster as well...  so bigger <br>setups tends to have also p=
owerful hw....<br><br><blockquote class=3D"gmail_quote" style=3D"margin: 0p=
t 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"> LVM2,=
 we have experienced really easy metadata corruption in occurence of just <=
br> nothing or because of a electric power interruption (which is really <b=
r> astonishing). We mean no drives failures , no bad SMARTs . Just corrupti=
on <br> from "nowhere" and "nocause"<br></blockquote><br><br>Corrupted meta=
data are always considered unusable - user has to restore to <br>previous v=
alid version (and here sometimes all the combinations of error might <br>ev=
entually require  'vi editor' assistance - but again - in very very unusual=
 <br>circumstances.<br><br>Metadata are archived in /etc/lvm/archive and  t=
hey are also in ring-buffer <br>present on all PVs in a VG  -  if there are=
 too many PVs - user can 'opt-out' <br>and consider only a subset of PVs to=
 hold metadata - i.e.  200PVs - and only <br>20PVs holding metadata - but t=
hese are highly unusual configurations...<br><br>Regards<br><br><br>Zdenek<=
br></pre></blockquote></div></body></html>
------VGHK82K0KUJ6BIEQ1277TJXAY2N1P5--

--===============4187453140045207205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============4187453140045207205==--

