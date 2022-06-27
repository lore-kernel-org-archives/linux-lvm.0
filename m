Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4735AC433EF
	for <linux-lvm@archiver.kernel.org>; Tue, 28 Jun 2022 06:38:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641--s0IC02eN1qKf8NWXZ0IjQ-1; Tue, 28 Jun 2022 02:38:29 -0400
X-MC-Unique: -s0IC02eN1qKf8NWXZ0IjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FD6F803B22;
	Tue, 28 Jun 2022 06:38:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B594B1415108;
	Tue, 28 Jun 2022 06:38:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 97E17194704E;
	Tue, 28 Jun 2022 06:38:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4D16B19466DF
 for <linux-lvm@listman.corp.redhat.com>; Mon, 27 Jun 2022 07:52:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3BB9B400F8FD; Mon, 27 Jun 2022 07:52:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 372F1404E4C8
 for <linux-lvm@redhat.com>; Mon, 27 Jun 2022 07:52:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19D988032E7
 for <linux-lvm@redhat.com>; Mon, 27 Jun 2022 07:52:16 +0000 (UTC)
Received: from b-painless.mh.aa.net.uk (b-painless.mh.aa.net.uk
 [81.187.30.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-C1YLnbhfNyirTORwsL-Ssg-1; Mon, 27 Jun 2022 03:52:12 -0400
X-MC-Unique: C1YLnbhfNyirTORwsL-Ssg-1
Received: from 4.13.169.217.in-addr.arpa ([217.169.13.4] helo=[192.168.10.122])
 by painless-b.tch.aa.net.uk with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <roger@beardandsandals.co.uk>) id 1o5ibt-001qPl-4E
 for linux-lvm@redhat.com; Mon, 27 Jun 2022 07:52:36 +0100
From: Roger James <roger@beardandsandals.co.uk>
To: <linux-lvm@redhat.com>
Date: Mon, 27 Jun 2022 07:52:28 +0100
Message-ID: <181a3eed7e0.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
User-Agent: AquaMail/1.36.0 (build: 103600147)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Tue, 28 Jun 2022 06:38:22 +0000
Subject: [linux-lvm] Recovering from a failed pvmove
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6625747554495683181=="

This is a multi-part message in MIME format.
--===============6625747554495683181==
Content-Type: multipart/alternative; boundary="181a3eedbbf35d027a593b49cf"

This is a multi-part message in MIME format.
--181a3eedbbf35d027a593b49cf
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

Hi,

I am struggling to recover from a failed pvmove. Unfortunately I only have 
a limited knowledge of lvm. I setup my lvm configuration many years ago.

I was trying to move a lv to a SSD using pvmove. Unfortunately my brand new 
SSD choose that moment to fail (never buy cheap SSDs, lesson learnt!").

This is the current status.

roger@dragon:~$ sudo pvs
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last 
written to [unknown]).
  PV VG Fmt Attr PSize PFree
  /dev/sda1 wd lvm2 a-- <465.76g 0
  /dev/sdb1 wd lvm2 a-- <465.76g <80.45g
  /dev/sdc2 wd lvm2 a-- 778.74g 278.74g
  /dev/sdd1 wd lvm2 a-- <465.76g 0
  [unknown] wd lvm2 a-m <784.49g 685.66g
roger@dragon:~$ sudo lvs
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last 
written to [unknown]).
  LV VG Attr LSize Pool Origin Data% Meta% Move Log Cpy%Sync Convert
  home wd -wi------- 1.46t
  root wd -wI-----p- <108.83g
  swap wd -wi------- 8.00g
  work wd -wi------- 200.00g
roger@dragon:~$ sudo vgs
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last 
written to [unknown]).
  VG #PV #LV #SN Attr VSize VFree
  wd 5 4 0 wz-pn- 2.89t 1.02t

This is a recap of what I have tried so far.

roger@dragon:~$ sudo pvmove --abort
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last 
written to [unknown]).
  LVM command executed by lvmpolld failed.
  For more information see lvmpolld messages in syslog or lvmpolld log file.
roger@dragon:~$ sudo vgreduce --removemissing wd
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last 
written to [unknown]).
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  WARNING: Partial LV root needs to be repaired or removed.
  WARNING: Partial LV pvmove0 needs to be repaired or removed.
  There are still partial LVs in VG wd.
  To remove them unconditionally use: vgreduce --removemissing --force.
  To remove them unconditionally from mirror LVs use: vgreduce 
--removemissing --mirrorsonly --force.
  WARNING: Proceeding to remove empty missing PVs.
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
roger@dragon:~$ sudo lvchange -an wd/root
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last 
written to [unknown]).
roger@dragon:~$ sudo vgreduce --removemissing wd
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last 
written to [unknown]).
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  WARNING: Partial LV root needs to be repaired or removed.
  WARNING: Partial LV pvmove0 needs to be repaired or removed.
  There are still partial LVs in VG wd.
  To remove them unconditionally use: vgreduce --removemissing --force.
  To remove them unconditionally from mirror LVs use: vgreduce 
--removemissing --mirrorsonly --force.
  WARNING: Proceeding to remove empty missing PVs.
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
roger@dragon:~$ sudo lvremove wd/pvmove0
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last 
written to [unknown]).
  WARNING: Couldn't find device with uuid 
uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.
  Can't remove locked logical volume wd/pvmove0.

I am quite happy to loose the root lv, I just need the home and work lvs. 
What am I missing?

Help!

Roger

--181a3eedbbf35d027a593b49cf
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">I am struggling to recover=
 from a failed pvmove. Unfortunately I only have a limited knowledge of lvm=
. I setup my lvm configuration many years ago.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">I was trying to move a lv to a SSD using pvmove. Unf=
ortunately my brand new SSD choose that moment to fail (never buy cheap SSD=
s, lesson learnt!").</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thi=
s is the current status.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>roger@dragon:~$ sudo pvs</div><div dir=3D"auto">&nbsp; WARNING: Couldn't f=
ind device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=
=3D"auto">&nbsp; WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4=
Sw-XSKNXZ (last written to [unknown]).</div><div dir=3D"auto">&nbsp; PV    =
     VG Fmt  Attr PSize    PFree</div><div dir=3D"auto">&nbsp; /dev/sda1  w=
d lvm2 a--  &lt;465.76g      0</div><div dir=3D"auto">&nbsp; /dev/sdb1  wd =
lvm2 a--  &lt;465.76g &lt;80.45g</div><div dir=3D"auto">&nbsp; /dev/sdc2  w=
d lvm2 a--   778.74g 278.74g</div><div dir=3D"auto">&nbsp; /dev/sdd1  wd lv=
m2 a--  &lt;465.76g      0</div><div dir=3D"auto">&nbsp; [unknown]  wd lvm2=
 a-m  &lt;784.49g 685.66g</div><div dir=3D"auto">roger@dragon:~$ sudo lvs</=
div><div dir=3D"auto">&nbsp; WARNING: Couldn't find device with uuid uMtjop=
-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">&nbsp; WARNING: VG=
 wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [=
unknown]).</div><div dir=3D"auto">&nbsp; LV   VG Attr       LSize    Pool O=
rigin Data%  Meta%  Move Log Cpy%Sync Convert</div><div dir=3D"auto">&nbsp;=
 home wd -wi-------    1.46t&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div dir=3D"auto">&nbsp;=
 root wd -wI-----p- &lt;108.83g&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div dir=3D"auto">&nb=
sp; swap wd -wi-------    8.00g&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div dir=3D"auto">&nb=
sp; work wd -wi-------  200.00g&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div dir=3D"auto">rog=
er@dragon:~$ sudo vgs</div><div dir=3D"auto">&nbsp; WARNING: Couldn't find =
device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"a=
uto">&nbsp; WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XS=
KNXZ (last written to [unknown]).</div><div dir=3D"auto">&nbsp; VG #PV #LV =
#SN Attr   VSize VFree</div><div dir=3D"auto">&nbsp; wd   5   4   0 wz-pn- =
2.89t 1.02t</div><div dir=3D"auto"><br></div><div dir=3D"auto">This is a re=
cap of what I have tried so far.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">roger@dragon:~$ sudo pvmove --abort</div><div dir=3D"auto">&nbsp;=
 WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XS=
KNXZ.</div><div dir=3D"auto">&nbsp; WARNING: VG wd is missing PV uMtjop-PmM=
T-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).</div><div dir=3D"=
auto">&nbsp; LVM command executed by lvmpolld failed.</div><div dir=3D"auto=
">&nbsp; For more information see lvmpolld messages in syslog or lvmpolld l=
og file.</div><div dir=3D"auto">roger@dragon:~$ sudo vgreduce --removemissi=
ng wd</div><div dir=3D"auto">&nbsp; WARNING: Couldn't find device with uuid=
 uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">&nbsp; WARN=
ING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last writt=
en to [unknown]).</div><div dir=3D"auto">&nbsp; WARNING: Couldn't find devi=
ce with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto"=
>&nbsp; WARNING: Partial LV root needs to be repaired or removed.</div><div=
 dir=3D"auto">&nbsp; WARNING: Partial LV pvmove0 needs to be repaired or re=
moved.</div><div dir=3D"auto">&nbsp; There are still partial LVs in VG wd.<=
/div><div dir=3D"auto">&nbsp; To remove them unconditionally use: vgreduce =
--removemissing --force.</div><div dir=3D"auto">&nbsp; To remove them uncon=
ditionally from mirror LVs use: vgreduce --removemissing --mirrorsonly --fo=
rce.</div><div dir=3D"auto">&nbsp; WARNING: Proceeding to remove empty miss=
ing PVs.</div><div dir=3D"auto">&nbsp; WARNING: Couldn't find device with u=
uid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">roger@dr=
agon:~$ sudo lvchange -an wd/root</div><div dir=3D"auto">&nbsp; WARNING: Co=
uldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><=
div dir=3D"auto">&nbsp; WARNING: VG wd is missing PV uMtjop-PmMT-603f-GWWQ-=
fR4f-s4Sw-XSKNXZ (last written to [unknown]).</div><div dir=3D"auto">roger@=
dragon:~$ sudo vgreduce --removemissing wd</div><div dir=3D"auto">&nbsp; WA=
RNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNX=
Z.</div><div dir=3D"auto">&nbsp; WARNING: VG wd is missing PV uMtjop-PmMT-6=
03f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unknown]).</div><div dir=3D"aut=
o">&nbsp; WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4=
f-s4Sw-XSKNXZ.</div><div dir=3D"auto">&nbsp; WARNING: Partial LV root needs=
 to be repaired or removed.</div><div dir=3D"auto">&nbsp; WARNING: Partial =
LV pvmove0 needs to be repaired or removed.</div><div dir=3D"auto">&nbsp; T=
here are still partial LVs in VG wd.</div><div dir=3D"auto">&nbsp; To remov=
e them unconditionally use: vgreduce --removemissing --force.</div><div dir=
=3D"auto">&nbsp; To remove them unconditionally from mirror LVs use: vgredu=
ce --removemissing --mirrorsonly --force.</div><div dir=3D"auto">&nbsp; WAR=
NING: Proceeding to remove empty missing PVs.</div><div dir=3D"auto">&nbsp;=
 WARNING: Couldn't find device with uuid uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XS=
KNXZ.</div><div dir=3D"auto">roger@dragon:~$ sudo lvremove wd/pvmove0</div>=
<div dir=3D"auto">&nbsp; WARNING: Couldn't find device with uuid uMtjop-PmM=
T-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">&nbsp; WARNING: VG wd =
is missing PV uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ (last written to [unkn=
own]).</div><div dir=3D"auto">&nbsp; WARNING: Couldn't find device with uui=
d uMtjop-PmMT-603f-GWWQ-fR4f-s4Sw-XSKNXZ.</div><div dir=3D"auto">&nbsp; Can=
't remove locked logical volume wd/pvmove0.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I am quite happy to loose the root lv, I just need the =
home and work lvs. What am I missing?</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Help!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Roge=
r</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--181a3eedbbf35d027a593b49cf--

--===============6625747554495683181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6625747554495683181==--

