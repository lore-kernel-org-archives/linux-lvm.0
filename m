Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CEAC433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Nov 2021 07:33:42 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-udGZ5REQOCWcjyOCH9F6Jw-1; Tue, 23 Nov 2021 02:33:37 -0500
X-MC-Unique: udGZ5REQOCWcjyOCH9F6Jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E8C4107B0E0;
	Tue, 23 Nov 2021 07:33:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 583DF60C13;
	Tue, 23 Nov 2021 07:33:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 665291832E81;
	Tue, 23 Nov 2021 07:33:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AMGOSMK024461 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 22 Nov 2021 11:24:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7DE1740CFD15; Mon, 22 Nov 2021 16:24:28 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7868340CFD0B
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2021 16:24:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E6DA85A5BB
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2021 16:24:28 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-551-LaVZBvuSPd-_MKmLXD2Y4Q-1; Mon, 22 Nov 2021 11:24:25 -0500
X-MC-Unique: LaVZBvuSPd-_MKmLXD2Y4Q-1
Received: by mail-ed1-f48.google.com with SMTP id y13so79313742edd.13
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2021 08:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Ea6LcclXyTkoKjTofMajfu1QtAc0huDtg8q3tx0lgQA=;
	b=qqg7+vrBzN0BExdZ0j7aPwr+jhz1RC3UXxCGDJ8YyMWIUYlgtXbZjhqDGm4TDv4CvS
	RmCnUG/eywz0N+VXrUvGvHFUxmRWTXixOyWkJ/uDZrySGC/JtUkaKS9MjIENFtS+duRJ
	tjVfPJM1NHtxwxFs/nycVQOpEAAt5f6ynZpUnmiTSbmjKHoZvmmJjnsbLIyJphyQ0tpE
	TZxNfcOIP+F9teus7yUipfjRDTkVL/5Al3z5eNEecojzWG7sO5/THq4kTix3InQXBiPb
	Vpjt3bLS9q6dpEUKY4kkmUN+CFkixH6sfGfNPgJXHtIXwZRxmdDLg2CYZMUTQ4G1WGu/
	+bvw==
X-Gm-Message-State: AOAM531WKV2mNb+1pvOZKRuXlpVjHIbNskCbaMnXZu6GMopwTsrgmXqP
	DXZY9hAe0T5UGD8VWr5QAHet23oHMR/8Q9HQU02BIT/5gfM=
X-Google-Smtp-Source: ABdhPJyeUKvH3UH7j77vxk0T5RftStEZiZFXPP19/HsNLSTom2slis+zacMsZLWy7k+LP3z8zqVp4Jn0ManWFz/PVVY=
X-Received: by 2002:a17:907:2454:: with SMTP id
	yw20mr42256598ejb.428.1637598261670; 
	Mon, 22 Nov 2021 08:24:21 -0800 (PST)
MIME-Version: 1.0
From: pavel olenev <pavel.olenev@gmail.com>
Date: Mon, 22 Nov 2021 19:24:10 +0300
Message-ID: <CAA_4Ct05hULieFePu0fAEddODEN52w8MBC4nZ3UvRVBWQv-4kQ@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 23 Nov 2021 02:33:14 -0500
Subject: [linux-lvm] LVM Thin - bad checksum in superblock - cannot perform
	operations on metadata
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6053144658064130496=="

--===============6053144658064130496==
Content-Type: multipart/alternative; boundary="000000000000ad21f805d1630e97"

--000000000000ad21f805d1630e97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.
I am looking for advice on how to act in such a situation. Perhaps anyone
has gone through something similar?
We used lvm thin provisioning on one of our arrays. But after raid
controller failure we got problem with activation of all thin volumes:

# lvchange -a y data/thin
  Check of pool data/thin failed (status:1). Manual repair required!

I tried to use lvconvert --repair data/thin, but have this:

# lvconvert --repair data/thin
truncating metadata device to 4161600 4k blocks
bad checksum in superblock, wanted 1494954599
  Repair of thin metadata volume of thin pool data/thin failed (status:1).
Manual repair required!

I have seen recipes related to thin_dump but I cannot use them, since in
particular thin_dump works with a mounted device. =D0=90nd I, due to a faul=
ty
superblock, cannot achieve the presence of the LVM partitions in
/dev/mapper/ for working such a device

Are there any chances of a successful recovery? And what can be done in
such a situation?

Best regards,
Pavel

P.S. And some output:

# pvscan
  PV /dev/sdc1   VG data            lvm2 [<10.90 TiB / <4.87 TiB free]

# vgs
  VG   #PV #LV #SN Attr   VSize    VFree
  data   1  11   0 wz--n-  <10.90t <4.87t

# lvs -a
  LV              VG   Attr       LSize   Pool Origin Data%  Meta%  Move
Log Cpy%Sync Convert
  [lvol0_pmspare] data ewi-------  16.00g
  thin            data twi---tz--   6.00t
  [thin_tdata]    data Twi-------   6.00t
  [thin_tmeta]    data ewi-------  16.00g
  vm-105-disk-0   data Vwi---tz--  40.00g thin
  vm-105-disk-1   data Vwi---tz-- 500.00g thin
  vm-107-disk-1   data Vwi---tz--  40.00g thin
  vm-107-disk-2   data Vwi---tz--  40.00g thin
  vm-107-disk-3   data Vwi---tz-- 500.00g thin
  vm-123-disk-0   data Vwi---tz--  32.00g thin
  vm-148-disk-0   data Vwi---tz--   1.17t thin
  vm-161-disk-0   data Vwi---tz--  32.00g thin
  vm-166-disk-0   data Vwi---tz--  32.00g thin
  vm-168-disk-0   data Vwi---tz--  50.00g thin

# lvscan -a
File descriptor 7 (pipe:[224496]) leaked on lvscan invocation. Parent PID
24064: bash
  inactive          '/dev/data/thin' [6.00 TiB] inherit
  inactive          '/dev/data/vm-107-disk-1' [40.00 GiB] inherit
  inactive          '/dev/data/vm-107-disk-2' [40.00 GiB] inherit
  inactive          '/dev/data/vm-107-disk-3' [500.00 GiB] inherit
  inactive          '/dev/data/vm-105-disk-0' [40.00 GiB] inherit
  inactive          '/dev/data/vm-105-disk-1' [500.00 GiB] inherit
  inactive          '/dev/data/vm-148-disk-0' [1.17 TiB] inherit
  inactive          '/dev/data/vm-161-disk-0' [32.00 GiB] inherit
  inactive          '/dev/data/vm-166-disk-0' [32.00 GiB] inherit
  inactive          '/dev/data/vm-123-disk-0' [32.00 GiB] inherit
  inactive          '/dev/data/vm-168-disk-0' [50.00 GiB] inherit
  inactive          '/dev/data/lvol0_pmspare' [16.00 GiB] inherit
  inactive          '/dev/data/thin_tmeta' [16.00 GiB] inherit
  inactive          '/dev/data/thin_tdata' [6.00 TiB] inherit

--000000000000ad21f805d1630e97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello.<br>I am looking for advice on how to act in such a =
situation. Perhaps anyone has gone through something similar?<br>We used lv=
m thin provisioning on one of our arrays. But after raid controller failure=
 we got problem with activation of all thin volumes:<br><br># lvchange -a y=
 data/thin<br>=C2=A0 Check of pool data/thin failed (status:1). Manual repa=
ir required!<br><br>I tried to use lvconvert --repair data/thin, but have t=
his:<br><br># lvconvert --repair data/thin<br>truncating metadata device to=
 4161600 4k blocks<br>bad checksum in superblock, wanted 1494954599<br>=C2=
=A0 Repair of thin metadata volume of thin pool data/thin failed (status:1)=
. Manual repair required!<br><br>I have seen recipes related to thin_dump b=
ut I cannot use them, since in particular thin_dump works with a mounted de=
vice. =D0=90nd I, due to a faulty superblock, cannot achieve the presence o=
f the LVM partitions in /dev/mapper/ for working such a device<br><br>Are t=
here any chances of a successful recovery? And what can be done in such a s=
ituation?<br><br>Best regards,<br>Pavel<br><br>P.S. And some output:<br><br=
># pvscan<br>=C2=A0 PV /dev/sdc1 =C2=A0 VG data =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0lvm2 [&lt;10.90 TiB / &lt;4.87 TiB free]<br><br># vgs<br>=C2=
=A0 VG =C2=A0 #PV #LV #SN Attr =C2=A0 VSize =C2=A0 =C2=A0VFree<br>=C2=A0 da=
ta =C2=A0 1 =C2=A011 =C2=A0 0 wz--n- =C2=A0&lt;10.90t &lt;4.87t<br><br># lv=
s -a<br>=C2=A0 LV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG =C2=A0=
 Attr =C2=A0 =C2=A0 =C2=A0 LSize =C2=A0 Pool Origin Data% =C2=A0Meta% =C2=
=A0Move Log Cpy%Sync Convert<br>=C2=A0 [lvol0_pmspare] data ewi------- =C2=
=A016.00g<br>=C2=A0 thin =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data twi-=
--tz-- =C2=A0 6.00t<br>=C2=A0 [thin_tdata] =C2=A0 =C2=A0data Twi------- =C2=
=A0 6.00t<br>=C2=A0 [thin_tmeta] =C2=A0 =C2=A0data ewi------- =C2=A016.00g<=
br>=C2=A0 vm-105-disk-0 =C2=A0 data Vwi---tz-- =C2=A040.00g thin<br>=C2=A0 =
vm-105-disk-1 =C2=A0 data Vwi---tz-- 500.00g thin<br>=C2=A0 vm-107-disk-1 =
=C2=A0 data Vwi---tz-- =C2=A040.00g thin<br>=C2=A0 vm-107-disk-2 =C2=A0 dat=
a Vwi---tz-- =C2=A040.00g thin<br>=C2=A0 vm-107-disk-3 =C2=A0 data Vwi---tz=
-- 500.00g thin<br>=C2=A0 vm-123-disk-0 =C2=A0 data Vwi---tz-- =C2=A032.00g=
 thin<br>=C2=A0 vm-148-disk-0 =C2=A0 data Vwi---tz-- =C2=A0 1.17t thin<br>=
=C2=A0 vm-161-disk-0 =C2=A0 data Vwi---tz-- =C2=A032.00g thin<br>=C2=A0 vm-=
166-disk-0 =C2=A0 data Vwi---tz-- =C2=A032.00g thin<br>=C2=A0 vm-168-disk-0=
 =C2=A0 data Vwi---tz-- =C2=A050.00g thin<br><br># lvscan -a<br>File descri=
ptor 7 (pipe:[224496]) leaked on lvscan invocation. Parent PID 24064: bash<=
br>=C2=A0 inactive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/dev/data/thin&#3=
9; [6.00 TiB] inherit<br>=C2=A0 inactive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;/dev/data/vm-107-disk-1&#39; [40.00 GiB] inherit<br>=C2=A0 inactive =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/dev/data/vm-107-disk-2&#39; [40.00 =
GiB] inherit<br>=C2=A0 inactive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/dev=
/data/vm-107-disk-3&#39; [500.00 GiB] inherit<br>=C2=A0 inactive =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;/dev/data/vm-105-disk-0&#39; [40.00 GiB] inher=
it<br>=C2=A0 inactive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/dev/data/vm-1=
05-disk-1&#39; [500.00 GiB] inherit<br>=C2=A0 inactive =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;/dev/data/vm-148-disk-0&#39; [1.17 TiB] inherit<br>=C2=
=A0 inactive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/dev/data/vm-161-disk-0=
&#39; [32.00 GiB] inherit<br>=C2=A0 inactive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;/dev/data/vm-166-disk-0&#39; [32.00 GiB] inherit<br>=C2=A0 inact=
ive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/dev/data/vm-123-disk-0&#39; [32=
.00 GiB] inherit<br>=C2=A0 inactive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
/dev/data/vm-168-disk-0&#39; [50.00 GiB] inherit<br>=C2=A0 inactive =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/dev/data/lvol0_pmspare&#39; [16.00 GiB] in=
herit<br>=C2=A0 inactive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/dev/data/t=
hin_tmeta&#39; [16.00 GiB] inherit<br>=C2=A0 inactive =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;/dev/data/thin_tdata&#39; [6.00 TiB] inherit<br></div>

--000000000000ad21f805d1630e97--

--===============6053144658064130496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6053144658064130496==--

