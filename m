Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11098C77B73
	for <linux-lvm@archiver.kernel.org>; Thu, 13 Apr 2023 06:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681368915;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=F7SGj4xfUWK81EJpZ+ZhcSqOGsWsBmwYewIktDyiuCg=;
	b=USvsFtGCaBlxY3oPKvX5B69XJ637AEtQP6CXtfAJr3/bzfnSy0elsWbdg/IK8Gcu1Oy14b
	7qkv5++i1Sc8Y3dgpU7PNGKvJ1fMSZJX17/2u8lP6RI3bv9AikO4BXjs7DEagFvAKgqnCh
	9bVyx85ECfsSI/5P+cR2s5MaBGwmPJI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-Q4GtFZXwMsuaq4nV2ieqjA-1; Thu, 13 Apr 2023 02:55:11 -0400
X-MC-Unique: Q4GtFZXwMsuaq4nV2ieqjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E860885630;
	Thu, 13 Apr 2023 06:55:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47D3EC16028;
	Thu, 13 Apr 2023 06:55:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B73B61946A72;
	Thu, 13 Apr 2023 06:55:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A7F83194658F
 for <linux-lvm@listman.corp.redhat.com>; Wed, 12 Apr 2023 09:28:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9B313C15BBA; Wed, 12 Apr 2023 09:28:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92500C15BB8
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 09:28:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7215A885620
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 09:28:29 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-84ySCZHgO5ukoGU_yk72dg-1; Wed, 12 Apr 2023 05:28:27 -0400
X-MC-Unique: 84ySCZHgO5ukoGU_yk72dg-1
Received: by mail-wm1-f54.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so5767240wms.1
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 02:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681291705; x=1683883705;
 h=message-id:cc:to:date:from:subject:content-transfer-encoding
 :mime-version:user-agent:thread-topic:references:in-reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L0MxrVZalahlHdNdqJ0qpMNTWyup5XXfgOJDF1DZ8Uc=;
 b=UFsrU8kn7SQDamJ2hF93KbTG3r/sq2Mabr9sj5u7cMqgcIS0C0PwNfGb7IFnakQcRw
 wLfNz6tXopZtlY5rI2JyZXmVrse1OiH9/kjOEuVrBVCNMnlFGIrnH/1YT5S6IrglUJdS
 a1NpmmFT5JyijFRoCPE7cArv4QKYX0ErXqaaKSJlT6vtL7Aviy6/DU3XCWLuOW5TBExG
 xQKJYTyn5T0FzWcr7VxBEVWhz0gs7tMjJkdBfEy/4u1VgxdhUXnaex9mEhVpiOAzxZ/Z
 aWYl1Sl4C+H/82aSkOJXmgZq1qD9CsE8SwnS3WUY+Hfhis48dWdkhzpUh21HGjqRAy8S
 mPHA==
X-Gm-Message-State: AAQBX9fsEOoZ4Vl1R+T9wMZVxwf0Wqt3bIcLp3DhfKMUloJZC9++6gUF
 IzeXk6/C7qiIjsdVrQ2RrTOIzetROpk=
X-Google-Smtp-Source: AKy350ZU0WTjM8Cbws0ow+RbWzBw8ITY7HdDaJyOIud5/X0exGHuiZ/uZC3itMhIDjIdfh4Zvs1/Ig==
X-Received: by 2002:a1c:ed16:0:b0:3f0:3a57:f01e with SMTP id
 l22-20020a1ced16000000b003f03a57f01emr4067431wmh.4.1681291705350; 
 Wed, 12 Apr 2023 02:28:25 -0700 (PDT)
Received: from [10.146.62.181] ([37.162.159.181])
 by smtp.gmail.com with ESMTPSA id
 m3-20020adfdc43000000b002c5691f13eesm16742952wrj.50.2023.04.12.02.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 02:28:25 -0700 (PDT)
In-Reply-To: <3366925a-d67b-f43d-bf3a-91d8bf9a327b@web.de>
References: <1043528017.520337.1681071486811.ref@mail.yahoo.com>
 <1043528017.520337.1681071486811@mail.yahoo.com>
 <3366925a-d67b-f43d-bf3a-91d8bf9a327b@web.de>
X-Referenced-Uid: 72398
Thread-Topic: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
X-Blue-Identity: !l=88&o=188&fo=5572&pl=75&po=0&qs=PREFIX&f=HTML&n=Roberto%20Fastec&e=roberto.fastec%40gmail.com&m=!%3AZDhhYTA5YjktZDg0Zi00MGIxLThiY2QtNWU3OTM1OTY4ZDk3%3ASU5CT1g%3D%3ANzIzOTg%3D%3AANSWERED&p=75&q=SHOW
X-Is-Generated-Message-Id: true
User-Agent: Android
MIME-Version: 1.0
X-Local-Message-Id: <97bbb6e5-8d52-4ba2-b2ac-b6f60b8da11c@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Wed, 12 Apr 2023 11:28:24 +0200
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <97bbb6e5-8d52-4ba2-b2ac-b6f60b8da11c@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Thu, 13 Apr 2023 06:55:02 +0000
Subject: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============6767235015156123503=="

--===============6767235015156123503==
Content-Type: multipart/alternative; boundary="----OKCDL43YZAW5UPW858B1DHM2HFFZ1H"

------OKCDL43YZAW5UPW858B1DHM2HFFZ1H
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

P.S. needless to be said, that they eventually can reassemble damaged LVM ,=
 until LVM's metadata tables are still good enough

Il giorno 12 apr 2023, 08:39, alle ore 08:39, Roland <devzero@web.de> ha sc=
ritto:
> >Controllers remap blocks all on their own and the so-called geometry
>is entirely fictitious=C2=A0anyway
>
>so tell me then, why i have a shelf full with dead disks where half of
>them are out of business for nothing but a couple of bad sectors ?
>
>i don't see the point that hardware capable storing terabytes of data
>is
>being put to trash, because of some <0.01% of it's sectors is defective
>for this or for that reason.=C2=A0 it's that "the vendor tells it's dead n=
ow
>- so please better buy a new one" paradigm, which seems to rule
>everewhere today.
>
>i dislike this attitude.
>
>if you had a self healing diving suit which quits healing itself after
>the 5th small hole, would you throw that away after the 5th hole - or
>would you put a patch on that? same goes for bicycle inner tubing.
>there
>were times, where you put patches on that because new ones where
>expensive. nowadays, everbody puts them to trash and buys a new one.
>
>so, if some drive controller isn't able to fix your 20 broken sectors -
>i'd like to fix it myself. and i'd like to try the lvm apporach,
>because
>i think it's a sensible way of putting some abstraction layer between
>your filesystem and your rotating disks.
>
>and even if it's dumb to do or if it's something which will not succeed
>, it's at least worth a try to show if it works or show why it can't
>work - and if it doesn't work - there is at least something to learn
>about lvm or dead disks.
>
>roland
>
>
>Am 09.04.23 um 22:18 schrieb matthew patton:
>> > my plan is to scan a disk for usable sectors and map the logical
>volume
>> > around the broken sectors.
>>
>> 1977 called, they'd like their non-self-correcting HD controller
>> implementations back.
>>
>> From a real-world perspective there is ZERO (more like negative)
>> utility to this exercise. Controllers remap blocks all on their own
>> and the so-called geometry is entirely fictitious=C2=A0anyway. From a
>> script/program "because I want to" perspective you could leave LVM
>> entirely out of it and just use a file with arbitrary offsets
>> scribbled with a "bad" signature.
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO athttp://tldp.org/HOWTO/LVM-HOWTO/
>
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://listman.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------OKCDL43YZAW5UPW858B1DHM2HFFZ1H
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
 =20
  <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8">=
</head><body style=3D"zoom: 0%;"><div dir=3D"auto">P.S. needless to be said=
, that they eventually can reassemble damaged LVM , until LVM's metadata ta=
bles are still good enough</div>
<div class=3D"gmail_quote" >Il giorno 12 apr 2023, alle ore 08:39, Roland &=
lt;<a href=3D"mailto:devzero@web.de" target=3D"_blank">devzero@web.de</a>&g=
t; ha scritto:<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0p=
t 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">

 =20
    <p>&gt;<font face=3D"Helvetica Neue, Helvetica, Arial, sans-serif">Cont=
rollers
        remap blocks all on their own and the so-called geometry is
        entirely fictitious&nbsp;anyway<br>
        <br>
        so tell me then, why i have a shelf full with dead disks where
        half of them are out of business for nothing but a couple of bad
        sectors ?<br>
        <br>
        i don't see the point that hardware capable storing terabytes of
        data is being put to trash, because of some &lt;0.01% of it's
        sectors is defective for this or for that reason.&nbsp; it's that
        "the vendor tells it's dead now - so please better buy a new
        one" paradigm, which seems to rule everewhere today.&nbsp; <br>
        <br>
        i dislike this attitude.<br>
        <br>
        if you had a self healing diving suit which quits healing itself
        after the 5th small hole, would you throw that away after the
        5th hole - or would you put a patch on that? same goes for
        bicycle inner tubing. there were times, where you put patches on
        that because new ones where expensive. nowadays, everbody puts
        them to trash and buys a new one.<br>
        <br>
        so, if some drive controller isn't able to fix your 20 broken
        sectors - i'd like to fix it myself. and i'd like to try the lvm
        apporach, because i think it's a sensible way of putting some
        abstraction layer between your filesystem and your rotating
        disks.<br>
        <br>
        and even if it's dumb to do or if it's something which will not
        succeed , it's at least worth a try to show if it works or show
        why it can't work - and if it doesn't work - there is at least
        something to learn about lvm or dead disks.<br>
        <br>
        roland<br>
        <br>
        <br>
      </font></p>
    <div class=3D"moz-cite-prefix">Am 09.04.23 um 22:18 schrieb matthew
      patton:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:1043528017.520337.1681071486811@m=
ail.yahoo.com">
     =20
      <div class=3D"ydpd61ea4c3yahoo-style-wrap" style=3D"font-family: time=
s          new roman, new york, times, serif; font-size: 16px;">
        <div style=3D"">
          <div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px; =
             font-family: times new roman, new york, times, serif;">&gt;&nb=
sp;<span style=3D"font-family: Helvetica Neue, Helvetica, Arial,           =
     sans-serif;">my plan is to scan a disk for usable sectors
              and map the logical volume</span></div>
          <div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px;"=
><font face=3D"Helvetica Neue, Helvetica, Arial, sans-serif">&gt;&nbsp;</fo=
nt><span style=3D"font-family: Helvetica Neue, Helvetica, Arial,           =
     sans-serif;">around the broken sectors.</span></div>
          <div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px;"=
><span style=3D"font-family: Helvetica Neue, Helvetica, Arial,             =
   sans-serif;"><br>
            </span></div>
          <div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px;"=
><span style=3D"font-family: Helvetica Neue, Helvetica, Arial,             =
   sans-serif;">1977 called, they'd like their
              non-self-correcting HD controller implementations back.</span=
></div>
          <div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px;"=
><span style=3D"font-family: Helvetica Neue, Helvetica, Arial,             =
   sans-serif;"><br>
            </span></div>
          <div dir=3D"ltr" data-setdir=3D"false" style=3D""><font face=3D"H=
elvetica Neue, Helvetica, Arial, sans-serif">From a
              real-world perspective there is ZERO (more like negative)
              utility to this exercise. Controllers remap blocks all on
              their own and the so-called geometry is entirely
              fictitious&nbsp;anyway. From a script/program "because I want
              to" perspective you could leave LVM entirely out of it and
              just use a file with arbitrary offsets scribbled with a
              "bad" signature.</font></div>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">______________________________=
_________________
linux-lvm mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:linux-lvm@redhat.com">=
linux-lvm@redhat.com</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://listman.redhat.com/mailm=
an/listinfo/linux-lvm">https://listman.redhat.com/mailman/listinfo/linux-lv=
m</a>
read the LVM HOW-TO at <a class=3D"moz-txt-link-freetext" href=3D"http://tl=
dp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
</pre>
    </blockquote>
 =20
<pre class=3D"blue"><hr><br>linux-lvm mailing list<br>linux-lvm@redhat.com<=
br><a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm">https:=
//listman.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO =
at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO">http://tldp.org/HOWTO/LVM-HO=
WTO</a>/<br></pre></blockquote></div></body></html>
------OKCDL43YZAW5UPW858B1DHM2HFFZ1H--

--===============6767235015156123503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6767235015156123503==--

