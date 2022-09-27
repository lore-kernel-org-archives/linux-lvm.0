Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E560C07E9D
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Sep 2022 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664435243;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=x2gY7NnX+/R5H0hmR+e8/Rb4hG/G+Nydpk5eUfY+LQU=;
	b=XJIqj/F0bEx3Tfg6sPcYwTAIp6w2LQ7s8lqeH6Nkr7Zbr5L/WVNumYsvXxmyvnwReCmU3w
	7fgH43tTd7fGbPOKs/GVJ6IG9pKvtoouBaA4vO1iLnMWSd0kOOGpeocfQXHmHgGX0i6Ist
	GXBbgsBA8gLzuAZjzgloQk8DwsLFWFg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-DR3XL1a7MTqD9ktu62zTiw-1; Thu, 29 Sep 2022 03:07:20 -0400
X-MC-Unique: DR3XL1a7MTqD9ktu62zTiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71006858F17;
	Thu, 29 Sep 2022 07:07:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49415C15BA4;
	Thu, 29 Sep 2022 07:07:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1ABA21946A48;
	Thu, 29 Sep 2022 07:07:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 63BFB1946586
 for <linux-lvm@listman.corp.redhat.com>; Tue, 27 Sep 2022 10:11:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C869A2027061; Tue, 27 Sep 2022 10:11:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1D892027062
 for <linux-lvm@redhat.com>; Tue, 27 Sep 2022 10:11:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A301A3C025AC
 for <linux-lvm@redhat.com>; Tue, 27 Sep 2022 10:11:14 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-BMrqRYGgNOGqluS8bR2OXA-1; Tue, 27 Sep 2022 06:11:09 -0400
X-MC-Unique: BMrqRYGgNOGqluS8bR2OXA-1
Received: by mail-pg1-f179.google.com with SMTP id s26so8970588pgv.7
 for <linux-lvm@redhat.com>; Tue, 27 Sep 2022 03:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=HJJvbzeNQRhcCQxojPOSBSumTA+3non3B9gfb2yOhvY=;
 b=utRVr7EvLjLgAW+8hafwPCiKYG+fZkbW69oJHF4rc0K0Ac6DAm0lXuaw/X1L02V7mZ
 oTMvXwtBbtwB00BPTYZB+IcxfNYS88H6fcD1bYdh6lQiKjNmYLBHQ36zQaKRy5n8Ild1
 UtHl6PmXoTzRcthhufrSaRxix5Wx1q/99mB5gNtyqXQ9IYSk8mMboCuVki+k1k2S33qv
 mZ6lGgCp6dkGAakAcCi1RMVrFW1nFKUOrn3ohAYbEnknUzDGH3Rjiiy9WWEUgraMgWjp
 f0xT17LH/3PbyYD4+yqO5d2ajn1jqF4L2qR8Je7l4D18Wo4SD2pecTVWN549M0uN8MdN
 pMtA==
X-Gm-Message-State: ACrzQf1YBxT2a9eW2MGptaW+LUpEXwxIY6fEtGsRgjkHVF+FyOWQggf+
 27BFRgYgf5kTNf8+O0IAekfHdDQ1lwGEOFl6rSeEQbry52jT4Q==
X-Google-Smtp-Source: AMsMyM6mEHtF8rGp0xGK1j0x5TOFB9aIpSjTWzhYEHA5cRbMCI0VQHdZ4Jlw5kr0nsQwJ+CIgFh0yEcbju/8KD3Q3M4=
X-Received: by 2002:a63:a549:0:b0:43c:b43f:526a with SMTP id
 r9-20020a63a549000000b0043cb43f526amr8840281pgu.521.1664273467830; Tue, 27
 Sep 2022 03:11:07 -0700 (PDT)
MIME-Version: 1.0
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Tue, 27 Sep 2022 12:10:56 +0200
Message-ID: <CADoUXWv+Po7pdhcAUk=JSwaDYJ2qp6B7aXm_djOuaOB0r9Usrw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Thu, 29 Sep 2022 07:07:12 +0000
Subject: [linux-lvm] LVM2 Metadata structure, extents ordering,
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
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7055175143580850343=="

--===============7055175143580850343==
Content-Type: multipart/alternative; boundary="000000000000dbf6f505e9a5dcfd"

--000000000000dbf6f505e9a5dcfd
Content-Type: text/plain; charset="UTF-8"

Dear friends of the LVM mailing list

I suppose this question is for some real LVM2 guru or even developer

Here I kindly make three question with three premises

premises
1. I'm a total noob about LVM2 low level logic, so I'm sorry of the
questions will sound silly :-)
2. The following applies to a whole md RAID (in my example it will be a
RAID5 made of 4 drives 1TB each so useful available space more or less
2.7TB)
3. I assign whole those 2.7TB to one single PV and one single VG and one
single LV.

questions
1. Given the premise 3. The corresponding LVM2 metadata/tables are and will
be just a (allow me the term) "grid" "mapping that space" in an ordered
sequence to in the subsequent use (and filling) of the RAID space "just
mark" the used ones and the free ones? Or those grid cells will/could be in
a messed order ?
And explicitly I mean. In case of metadata corruption (always with respect
of premise 3.) , could we just generate a dummy metadata table with all the
extents marked as "used" in such a way that we can anyway access them
And can we expect to have them ordered?

2. Does it exist a sort of "fsck" for the LVM2 metadata ? We do technical
assistance and recently, specifically with those NAS devices that make use
of LVM2, we have experienced really easy metadata corruption in occurence
of just nothing or because of a electric power interruption (which is
really astonishing). We mean no drives failures , no bad SMARTs . Just
corruption from "nowhere" and "nocause"

Thank you for any hint

Robert
Fastec

--000000000000dbf6f505e9a5dcfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear friends of the LVM mailing list</div><div><br></=
div><div>I suppose this question is for some real LVM2 guru or even develop=
er</div><div><br></div><div>Here I kindly make three question with three pr=
emises</div><div><br></div><div>premises</div><div>1. I&#39;m a total noob =
about LVM2 low level logic, so I&#39;m sorry of the questions will sound si=
lly :-)<br></div><div>2. The following applies to a whole md RAID (in my ex=
ample it will be a RAID5 made of 4 drives 1TB each so useful available spac=
e more or less 2.7TB)</div><div>3.=20
 I assign whole those 2.7TB to one single PV and one single VG and one sing=
le LV.=20

</div><div><br></div><div>questions</div><div>1. Given the premise 3. The c=
orresponding LVM2 metadata/tables are and will be just a (allow me the term=
) &quot;grid&quot; &quot;mapping that space&quot; in an ordered sequence to=
 in the subsequent use (and filling) of the RAID space &quot;just mark&quot=
; the used ones and the free ones? Or those grid cells will/could be in a m=
essed order ?</div><div>And explicitly I mean. In case of metadata corrupti=
on (always with respect of premise 3.) , could we just generate a dummy met=
adata table with all the extents marked as &quot;used&quot; in such a way t=
hat we can anyway access them <br></div><div>And can we expect to have them=
 ordered?</div><div><br></div><div>2. Does it exist a sort of &quot;fsck&qu=
ot; for the LVM2 metadata ? We do technical assistance and recently, specif=
ically with those NAS devices that make use of LVM2, we have experienced re=
ally easy metadata corruption in occurence of just nothing or because of a =
electric power interruption (which is really astonishing). We mean no drive=
s failures , no bad SMARTs . Just corruption from &quot;nowhere&quot; and &=
quot;nocause&quot;</div><div><br></div><div>Thank you for any hint <br></di=
v><div><br></div><div>Robert</div><div>Fastec<br></div></div>

--000000000000dbf6f505e9a5dcfd--

--===============7055175143580850343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7055175143580850343==--

