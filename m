Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881F2C7619A
	for <linux-lvm@archiver.kernel.org>; Wed, 12 Apr 2023 06:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681281594;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=c9Nnt9BbciPfzontPD0oE0RlAsIPKOixLeW8IiAOujs=;
	b=I5KKHXRXdPQOx42y0gb6r3DtjiTu7gxMaMAcnH9LXY1mHi5sWuc//7kiD3fHCkNth1TBcJ
	cYjDWjc6zfpbJ6XD+YDt2x96Cd4lBMHfgnoMpe/qRYGuOibyPlzsGneSdRgkazUXZZITR/
	2XTS33Hek2/5Z/oVPGpcP+mtALFKQ6w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-fOfMYPmTP8aN7X9IzvgIlQ-1; Wed, 12 Apr 2023 02:39:25 -0400
X-MC-Unique: fOfMYPmTP8aN7X9IzvgIlQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA22238123CE;
	Wed, 12 Apr 2023 06:39:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C5B4492C13;
	Wed, 12 Apr 2023 06:39:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 041951946A44;
	Wed, 12 Apr 2023 06:39:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B3AE11946586
 for <linux-lvm@listman.corp.redhat.com>; Tue, 11 Apr 2023 07:15:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 833072166B30; Tue, 11 Apr 2023 07:15:02 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B96A2166B31
 for <linux-lvm@redhat.com>; Tue, 11 Apr 2023 07:15:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FEAA29ABA1C
 for <linux-lvm@redhat.com>; Tue, 11 Apr 2023 07:15:02 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-313-LI0VIYQtNI-QsJtdOMr4TA-1; Tue,
 11 Apr 2023 03:14:59 -0400
X-MC-Unique: LI0VIYQtNI-QsJtdOMr4TA-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.179.90] ([89.0.109.233]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M4bUg-1plaWF3gYw-001jcr; Tue, 11
 Apr 2023 09:14:57 +0200
Message-ID: <3366925a-d67b-f43d-bf3a-91d8bf9a327b@web.de>
Date: Tue, 11 Apr 2023 09:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: LVM general discussion and development <linux-lvm@redhat.com>,
 matthew patton <pattonme@yahoo.com>
References: <1043528017.520337.1681071486811.ref@mail.yahoo.com>
 <1043528017.520337.1681071486811@mail.yahoo.com>
From: Roland <devzero@web.de>
In-Reply-To: <1043528017.520337.1681071486811@mail.yahoo.com>
X-Provags-ID: V03:K1:r+TaXTDZMi+wy6DEr6Pe6MvE5zZILfwdPo2/KQIrgrU3k8M0kwM
 mtMihxOxUNkBHCBhbi/sfudcYjXiYDRRtuvrtltPDZq+ifLlnL2xpLrb9mHiezlh7h1LDH3
 Jp8kS9jniejA3fQSbwLbA7SNBbccuWF4NB5BXH5LXagkcDzhAuYClthp0Rv/5tQMGZRzhra
 F9MBHgduRm9iH48DCpw6w==
UI-OutboundReport: notjunk:1;M01:P0:aPfTfJ/w/no=;nxM+KsAdwtsUfiJxvaFQZmw0NPr
 yu0TyR3QlttgHChgoX+LGYtJYvPxfNWrc5W7Eg7ar4Or82W7JBGh81G14xyQ6sxwxY9cES704
 e2azDT4PNPEAEy959cR5BMsM9/Er8JsU4QMYYP/A5aGgpHrfn6j0k2C+wmjNEF6V+P6czuYll
 CHeukTpP9kCPPmmhDA8nVAG98CIWUK38wRVJjO0yCXjKRHTvHcmwIFq3HUh/85pot8N1O+22J
 bU4T4SEsRp9mGW6G17PjM1VUtofI6xesAU3LO9GFeM8qNGs6J/OZaTyqZ00LUsHN8OlCDVMUy
 V1l4lqsHIxMknTluKVtn1yDBh6QD2cjt4HjqDXcNbTLQWOCw71IchHusxcKNyUA40970Ge4hA
 1007QJc42A0bkhHxTVbhjEJFCIwOGxGloCWJu5gHQ6AhD3dovBSRTod4VnLBoN1r0HDuu/EWW
 ov8mfaeeM3rd22eoWc0BTsFktk5W81oqUA7k+/knTkxKCWNlhVhV0MthLLTGKCLX/6FYdjzjX
 V0/FHmTI4iYENnsnGXiPr8DJJkdD4HdjP7320k6/vs9/Ahuag9pSv4CvcENQ2tCw+1pZAZSO0
 mV7f30+QmUJY21AJ8mDXYfS5nGyJ8PcoBpR+URYVoJY1b8vuBtlVT7UGoN0YQA0ui5x4QfR2d
 8o30VF+MxImQq/t4C8LQSv1FAPc3UEotYnAx/VZT9Akv+66UuAGjPasCaqjywOPSHtLDPaV2w
 PWcLVvJY6LTo27nvubD/JPWLzcy2CD+2Zg3TCtSGo96NJfJG5+H/7WxV8xOWi+ll2ASiUgJWB
 f5cloZ0D96I89uN/TBjYIXDZ5MEM7lmL4V7309shibHJ/dMn93VlpyAYnm3EIwqeSm9mHwVq2
 VH7lFqa1fc4FB+NbYegjr/bcOMeLY90uhyBjf51ejvWxOTuy7/zDL8GxewaH4WBx+QCXchyFe
 2s5h82vpG8/nd3A+dLYRkKzdWD8=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Wed, 12 Apr 2023 06:39:14 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: web.de
Content-Type: multipart/mixed; boundary="===============3514161062160729225=="

This is a multi-part message in MIME format.
--===============3514161062160729225==
Content-Type: multipart/alternative;
 boundary="------------pqaRDrp0jHjO0Tv0r6t18e6w"

This is a multi-part message in MIME format.
--------------pqaRDrp0jHjO0Tv0r6t18e6w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

 >Controllers remap blocks all on their own and the so-called geometry
is entirely fictitious=C2=A0anyway

so tell me then, why i have a shelf full with dead disks where half of
them are out of business for nothing but a couple of bad sectors ?

i don't see the point that hardware capable storing terabytes of data is
being put to trash, because of some <0.01% of it's sectors is defective
for this or for that reason.=C2=A0 it's that "the vendor tells it's dead no=
w
- so please better buy a new one" paradigm, which seems to rule
everewhere today.

i dislike this attitude.

if you had a self healing diving suit which quits healing itself after
the 5th small hole, would you throw that away after the 5th hole - or
would you put a patch on that? same goes for bicycle inner tubing. there
were times, where you put patches on that because new ones where
expensive. nowadays, everbody puts them to trash and buys a new one.

so, if some drive controller isn't able to fix your 20 broken sectors -
i'd like to fix it myself. and i'd like to try the lvm apporach, because
i think it's a sensible way of putting some abstraction layer between
your filesystem and your rotating disks.

and even if it's dumb to do or if it's something which will not succeed
, it's at least worth a try to show if it works or show why it can't
work - and if it doesn't work - there is at least something to learn
about lvm or dead disks.

roland


Am 09.04.23 um 22:18 schrieb matthew patton:
> > my plan is to scan a disk for usable sectors and map the logical volume
> > around the broken sectors.
>
> 1977 called, they'd like their non-self-correcting HD controller
> implementations back.
>
> From a real-world perspective there is ZERO (more like negative)
> utility to this exercise. Controllers remap blocks all on their own
> and the so-called geometry is entirely fictitious=C2=A0anyway. From a
> script/program "because I want to" perspective you could leave LVM
> entirely out of it and just use a file with arbitrary offsets
> scribbled with a "bad" signature.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO athttp://tldp.org/HOWTO/LVM-HOWTO/

--------------pqaRDrp0jHjO0Tv0r6t18e6w
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>&gt;<font face=3D"Helvetica Neue, Helvetica, Arial, sans-serif">Cont=
rollers
        remap blocks all on their own and the so-called geometry is
        entirely fictitious=C2=A0anyway<br>
        <br>
        so tell me then, why i have a shelf full with dead disks where
        half of them are out of business for nothing but a couple of bad
        sectors ?<br>
        <br>
        i don't see the point that hardware capable storing terabytes of
        data is being put to trash, because of some &lt;0.01% of it's
        sectors is defective for this or for that reason.=C2=A0 it's that
        "the vendor tells it's dead now - so please better buy a new
        one" paradigm, which seems to rule everewhere today.=C2=A0 <br>
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
    <blockquote type=3D"cite"
      cite=3D"mid:1043528017.520337.1681071486811@mail.yahoo.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
      <div class=3D"ydpd61ea4c3yahoo-style-wrap" style=3D"font-family: time=
s
        new roman, new york, times, serif; font-size: 16px;">
        <div style=3D"">
          <div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px;
            font-family: times new roman, new york, times, serif;">&gt;=C2=
=A0<span
              style=3D"font-family: Helvetica Neue, Helvetica, Arial,
              sans-serif;">my plan is to scan a disk for usable sectors
              and map the logical volume</span></div>
          <div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px;"=
><font
              face=3D"Helvetica Neue, Helvetica, Arial, sans-serif">&gt;=C2=
=A0</font><span
              style=3D"font-family: Helvetica Neue, Helvetica, Arial,
              sans-serif;">around the broken sectors.</span></div>
          <div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px;"=
><span
              style=3D"font-family: Helvetica Neue, Helvetica, Arial,
              sans-serif;"><br>
            </span></div>
          <div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px;"=
><span
              style=3D"font-family: Helvetica Neue, Helvetica, Arial,
              sans-serif;">1977 called, they'd like their
              non-self-correcting HD controller implementations back.</span=
></div>
          <div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px;"=
><span
              style=3D"font-family: Helvetica Neue, Helvetica, Arial,
              sans-serif;"><br>
            </span></div>
          <div dir=3D"ltr" data-setdir=3D"false" style=3D""><font
              face=3D"Helvetica Neue, Helvetica, Arial, sans-serif">From a
              real-world perspective there is ZERO (more like negative)
              utility to this exercise. Controllers remap blocks all on
              their own and the so-called geometry is entirely
              fictitious=C2=A0anyway. From a script/program "because I want
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
  </body>
</html>

--------------pqaRDrp0jHjO0Tv0r6t18e6w--

--===============3514161062160729225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============3514161062160729225==--

