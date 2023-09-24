Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63480E7D241
	for <linux-lvm@archiver.kernel.org>; Tue, 26 Sep 2023 06:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695711559;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3Wvk8aZfbCD/h+33yt8J5Jp61BVtfRu1g4eln3yHeE0=;
	b=i1zM//M+wvDEPCLvWFs5mRm2hHJoqdA2RTjVOE9TiOSLg1l9hhdpwUg95cvIc9JoZNIDkZ
	JMKjNFEh9KP5Wp5RDGlE248QLgXM90R+hFJu1nlLOSvtDZvFCsApQRXhviJVCr5651M/FE
	idp4f5PBZovV4Vkhn6qPaoQr4xKjXhk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-xO6d-bXuPHOGPsXKul98DQ-1; Tue, 26 Sep 2023 02:59:15 -0400
X-MC-Unique: xO6d-bXuPHOGPsXKul98DQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBF563827DE0;
	Tue, 26 Sep 2023 06:59:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2F4F492C37;
	Tue, 26 Sep 2023 06:59:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C2F01946594;
	Tue, 26 Sep 2023 06:59:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D8F70194658C
 for <linux-lvm@listman.corp.redhat.com>; Sun, 24 Sep 2023 22:10:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C652F40C6E76; Sun, 24 Sep 2023 22:10:02 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BED6840C6EA8
 for <linux-lvm@redhat.com>; Sun, 24 Sep 2023 22:10:02 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C654101A550
 for <linux-lvm@redhat.com>; Sun, 24 Sep 2023 22:10:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-v9OSg2H6NN6dULnMeCY2Og-1; Sun, 24 Sep 2023 18:09:59 -0400
X-MC-Unique: v9OSg2H6NN6dULnMeCY2Og-1
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4053d53a1bfso40406665e9.1
 for <linux-lvm@redhat.com>; Sun, 24 Sep 2023 15:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695593398; x=1696198198;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DiBdg5QjCKWicPZ9OjPMCaiCcpi4yU0YNGptM1w40zg=;
 b=dNSF5T9RsjWSi95JOYlHnu9wnqsrWkEf6z538vCfVst2TPC9sCeiIRD+0f+MatsjHy
 pyTSo7I8i7EoyS+VyuXNkmp40eaPfWNvciT6zpYlpupVLvbOKigSKuGRv1X9yIvBSUlx
 zVlr0rrKCNBw6cp+AFSlbfvVhObw328RRlsjoWcrQL3a+gkE4Xx/IBpLdlLbtxEbEgzh
 oQpQ4XEanxfh2CtfAGuZPM+x9J++Xadq59L3tJPb0x8j5RPWnOZpbpbr/1H/wcYJXqFx
 367+SRkMI4xFdgSzdF49RV0kc4diLRUKPDVIcGpMGldigUPC6D51aab5YGfc7WrWZqKO
 0MRw==
X-Gm-Message-State: AOJu0YyQvuGBzfyzyG48lvh5CAlRlbe6moFZtKhW+/fJfv91zaNhYKym
 tG7FQ7mM9WMb6Vno/lZgzsyn91mEl+6wfPPksUws/8ju
X-Google-Smtp-Source: AGHT+IHzc4v/sisRc0Hi/Zq+9iVW6J6k+tMm6SXg6mXPg7gEhbXLSDUUb8YNeHCuvCjTZWHSF063VqDrU2ifV//GPuQ=
X-Received: by 2002:a7b:ce10:0:b0:401:73b2:f043 with SMTP id
 m16-20020a7bce10000000b0040173b2f043mr3993986wmc.1.1695593398199; Sun, 24 Sep
 2023 15:09:58 -0700 (PDT)
MIME-Version: 1.0
From: Jean-Marc Saffroy <saffroy+redhat@gmail.com>
Date: Mon, 25 Sep 2023 00:09:47 +0200
Message-ID: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 26 Sep 2023 06:59:08 +0000
Subject: [linux-lvm] Can I combine LUKS and LVM to achieve encryption and
 snapshots?
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============0911203390161608283=="

--===============0911203390161608283==
Content-Type: multipart/alternative; boundary="0000000000002ee9fa0606221a61"

--0000000000002ee9fa0606221a61
Content-Type: text/plain; charset="UTF-8"

Hello LVM experts,

I am trying to create a volume with the following properties:
- the volume can be resized
- the volume is encrypted
- the volume can be snapshotted (for online backups)

So I thought I'd create the volume with LVM, encrypt it with LUKS, and
snapshot it with LVM. However, LVM doesn't want to snapshot the unencrypted
LUKS volume, as it is not an actual logical volume known to LVM (and I am
not keen on snapshotting the encrypted volume, as that means the backup
process would need the passphrase to mount the encrypted snapshot).

Is there a good way to achieve this with LUKS and LVM, or should I look
elsewhere?

I have two ideas but I don't know if they are safe or practical:
- I could try running LVM (snapshots) on top of LUKS (encryption) itself on
top of LVM (resize)
- or I could try working with dmsetup to fill the gap between LUKS and LVM

I did simple tests with dmsetup, and that *seems* to work, however I am not
sure at all if that would be robust. An outline of my test:
- create an LVM volume (lvcreate) from a larger volume group
- make it a LUKS volume (cryptsetup lukfsFormat)
- "open" the LUKS volume (cryptsetup open)
- create a snapshot-origin volume from the open LUKS volume (dmsetup create)
- mount that as my active volume
- every time I want to do a backup:
  create a temporary snapshot volume from the origin, mount it, run the
backup, unmount it, delete it

Thoughts?

Cheers,
JM

--0000000000002ee9fa0606221a61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello LVM experts,<br><br>I am trying to create a volume w=
ith the following properties:<br>- the volume can be resized<br>- the volum=
e is encrypted<br>- the volume can be snapshotted (for online backups)<br><=
br>So I thought I&#39;d create the volume with LVM, encrypt it with LUKS, a=
nd snapshot it with LVM. However, LVM doesn&#39;t want to snapshot the unen=
crypted LUKS volume, as it is not an actual logical volume known to LVM (an=
d I am not keen on snapshotting the encrypted volume, as that means the bac=
kup process would need the passphrase to mount the encrypted snapshot).<br>=
<br>Is there a good way to achieve this with LUKS and LVM, or should I look=
 elsewhere?<br><br>I have two ideas but I don&#39;t know if they are safe o=
r practical:<br>- I could try running LVM (snapshots) on<span class=3D"gmai=
l_default" style=3D"font-family:arial,helvetica,sans-serif"> top of</span> =
LUKS (encryption)<span class=3D"gmail_default" style=3D"font-family:arial,h=
elvetica,sans-serif"> itself</span> on<span class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"> top of</span> LVM (resize)<br>=
- or I could try working with dmsetup to fill the gap between LUKS and LVM<=
br><br>I did simple tests with dmsetup, and that *seems* to work, however I=
 am not sure at all if that would be robust. An outline of my test:<br>- cr=
eate an LVM volume (lvcreate) from a larger volume group<br>- make it a LUK=
S volume (cryptsetup lukfsFormat)<br>- &quot;open&quot; the LUKS volume (cr=
yptsetup open)<br>- create a snapshot-origin volume from the open LUKS volu=
me (dmsetup create)<br>- mount that as my active volume<br>- every time I w=
ant to do a backup:<br>=C2=A0 create a temporary snapshot volume from the o=
rigin, mount it, run the backup, unmount it, delete it<br><br>Thoughts?<br>=
<br>Cheers,<br>JM</div>

--0000000000002ee9fa0606221a61--

--===============0911203390161608283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0911203390161608283==--

