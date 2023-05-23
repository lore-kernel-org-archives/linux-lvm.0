Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C08BC7EE23
	for <linux-lvm@archiver.kernel.org>; Wed, 24 May 2023 04:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684903854;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UzB2XSObui1N3x62Yz6faOupsG8uhJL/Mez6e6zqzIo=;
	b=Mfeofe0LSV4A66i5FWjFx3LA51NoR7jKZ6msUY5iD7xyRdp6Rll5gKYfYlkoKSi4kWgoeE
	SOUfftprZHTOahPm6vBXPHuoOikB2pjEk6CBFsriZRCBPV7vbh6/3xCcIOidW23F7W65yu
	mnPfztufZ22+oqQudVAUobdBPBpmF14=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-dFpMzpMqN26bJXEj_k1m9A-1; Wed, 24 May 2023 00:50:50 -0400
X-MC-Unique: dFpMzpMqN26bJXEj_k1m9A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E074B101A597;
	Wed, 24 May 2023 04:50:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C09F6492B00;
	Wed, 24 May 2023 04:50:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C3E919465B3;
	Wed, 24 May 2023 04:50:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 87E7819465A0
 for <linux-lvm@listman.corp.redhat.com>; Tue, 23 May 2023 19:44:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CC6ED20296C6; Tue, 23 May 2023 19:44:56 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4856200AD47
 for <linux-lvm@redhat.com>; Tue, 23 May 2023 19:44:56 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9C9785A5A8
 for <linux-lvm@redhat.com>; Tue, 23 May 2023 19:44:56 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-MA6qaF83Ny-Xu0qSBjihHw-1; Tue, 23 May 2023 15:44:54 -0400
X-MC-Unique: MA6qaF83Ny-Xu0qSBjihHw-1
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-541f4ee6f89so81618eaf.2
 for <linux-lvm@redhat.com>; Tue, 23 May 2023 12:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684871093; x=1687463093;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CunrLd6Xx+97p3pAjBEj/mvWfLz33w4I35Mpc4/kExM=;
 b=P+KNnHV3tu8PU5VH4lg/TyNUx0VVY31iFIzE3sJjASbsaryhMTQPvu0mJ82f+PR3wN
 N+p21TrHCPyUf3qvqd/dYYnEaSRrqTxOtM7PM40k4vFVnvR+68+QbAaOvdECqqtE7bIK
 w64/qWG++Ns6/KMZFvTG8hVw9kISTPJuXqnYMbvfh1PdnKfEOGMYCRaKe5yCQYoJXHjy
 8YtAPberXrYPX31Zz8vP6sTQbsNlPlO4VJ8f+OSRTa9051Lhm7GxclhZC4S+KJE8rBpC
 GcsIQMEnQch3VMLEFw9AY4Kz/4qaqwE0gMgJyD+YW3sdoSU7DdwnXeCmuQIq29UAre3Q
 PgsQ==
X-Gm-Message-State: AC+VfDzqWqbZMVU8fXejLguA7hJSLKFdZ76+cr4TyQN7sKCMCUb1tSkF
 cHg//0MB5exwihK8Z5Yyj4EWE6qOn1bzhOlg4uhCv5XgDAfoQ0/6
X-Google-Smtp-Source: ACHHUZ4OFsn1bvX3YeLOd4Y0XCz1JMVy81zmdjXZ0GqXZaSjJz/hf9MoJYBCJBWI6wbTvZR8bjzEMnKxtaK308Vo988=
X-Received: by 2002:a4a:921e:0:b0:555:2f29:f3c0 with SMTP id
 f30-20020a4a921e000000b005552f29f3c0mr4195638ooh.8.1684871093318; Tue, 23 May
 2023 12:44:53 -0700 (PDT)
MIME-Version: 1.0
From: Michael McCracken <michael.mccracken@gmail.com>
Date: Tue, 23 May 2023 12:44:42 -0700
Message-ID: <CAG-gt+ztONBXGPtCw+L+=4rAEJyM=m+drN2t9nop4KXJhUvFig@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 24 May 2023 04:50:43 +0000
Subject: [linux-lvm] intermittent transaction ID mismatch with rapid use of
 thin snapshots
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
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============0375285779362117747=="

--===============0375285779362117747==
Content-Type: multipart/alternative; boundary="00000000000002786d05fc619f73"

--00000000000002786d05fc619f73
Content-Type: text/plain; charset="UTF-8"

Hi, I am seeing occasional hard to reproduce failures to lvcreate a thin LV,
with transaction ID mismatch errors.

The system is a self-managed compute node that uses thin LVs for base system
software and containers - each service has a separate thin LV as its
rootfs, and
the system takes a fresh thin snapshot of the installed contents at every
boot.

During system bring up we have two concurrent processes adding, deleting,
and
renaming thin LVs from a single thin pool:

1 - a login script that creates a thin snapshot of a minimal rootfs for each
user, then launches an LXC container with that rootfs, and leaves the user
in
bash running in that container. If any issues occur in any of that process,
it
will lvremove the snapshot and retry several times. Although it creates a
container, the script itself runs as sudo root, not inside any
container/namespaces.

2 - a software install service that takes system services packaged as
containers
and creates thin LVs based on the container image layer set, and then takes
an
additional thin snapshot to be mounted for the current boot. this last
snapshot
is multi-step, with an initial lvcreate of a temp name and a final lvrename.

Neither of these processes are in containers or on a VM with a shared
volume, so
they should be seeing the same LVM lock files, as far as I can tell.

This overall approach has been stable for a long time, but a recent change
has
caused these to overlap more frequently, and we are now seeing failures in
lvcreate with a transaction id mismatch when the install service tries to
create
its temporary LV - here's a snippet from one such log:


Error: lvm lvcreate --activate=y --setactivationskip=y
--ignoreactivationskip --name=tmp-extract-414e5ec83c02133eae2984ee4
25b22589bca058d --snapshot
vg_ifc0/5e9a280e11efbc75ed8f01bdd7b58559c373b451b72921555be5c2eaf93d27b2:
exit status 5:   /dev/sdh: open failed: No medium found
/dev/sdi: open failed: No medium found
/dev/sdj:ound
/dev/sdk: open failed: No medium found
/dev/sdh: open failed: No medium found
/dev/sdi: open failed: No medium found
/dev/sdj: open failed: No medium found
/dev/sdk: open failed: No medium fou
ThinDataLV-tpool (251:3) transaction_id is 147, while expected 148.
Failed to suspend vg_ifc0/ThinDataLV with queued messages.


Due to some failure recovery loops, these services are running
lvcreate/lvremove/lvrename (on same VG but different LVs) as often as 5
times
per second, which seems fast but doesn't seem like it should be a problem.

Looking through past messages to this list, it looks like previous cases
were
due to sharing volumes between containers/vms without a common lock dir,
which
we are not doing.

Any thoughts on how to further debug or avoid this issue?


I can provide the lvm metadata backup files if that would help - there are
a lot
of them, as once it starts failing, the system retries frequently.

Ihis is on Ubuntu 20.04, with lvm 2.03.07(2)
(ubuntu package version 2.03.07-1ubuntu1)
and a custom kernel built from 5.15.68.

Thanks!
-mike

--00000000000002786d05fc619f73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, I am seeing occasional hard to reproduce failures to l=
vcreate a thin LV,<br>with transaction ID mismatch errors.<br><br>The syste=
m is a self-managed compute node that uses thin LVs for base system<br>soft=
ware and containers - each service has a separate thin LV as its rootfs, an=
d<br>the system takes a fresh thin snapshot of the installed contents at ev=
ery boot.<br><br>During system bring up we have two concurrent processes ad=
ding, deleting, and<br>renaming thin LVs from a single thin pool:<br><br>1 =
- a login script that creates a thin snapshot of a minimal rootfs for each<=
br>user, then launches an LXC container with that rootfs, and leaves the us=
er in<br>bash running in that container. If any issues occur in any of that=
 process, it<br>will lvremove the snapshot and retry several times. Althoug=
h it creates a<br>container, the script itself runs as sudo root, not insid=
e any<br>container/namespaces.<br><br>2 - a software install service that t=
akes system services packaged as containers<br>and creates thin LVs based o=
n the container image layer set, and then takes an<br>additional thin snaps=
hot to be mounted for the current boot. this last snapshot<br>is multi-step=
, with an initial lvcreate of a temp name and a final lvrename.<br><br>Neit=
her of these processes are in containers or on a VM with a shared volume, s=
o<br>they should be seeing the same LVM lock files, as far as I can tell.<b=
r><br>This overall approach has been stable for a long time, but a recent c=
hange has<br>caused these to overlap more frequently, and we are now seeing=
 failures in<br>lvcreate with a transaction id mismatch when the install se=
rvice tries to create<br>its temporary LV - here&#39;s a snippet from one s=
uch log:<br><br><br>Error: lvm lvcreate --activate=3Dy --setactivationskip=
=3Dy --ignoreactivationskip --name=3Dtmp-extract-414e5ec83c02133eae2984ee4<=
br>25b22589bca058d --snapshot vg_ifc0/5e9a280e11efbc75ed8f01bdd7b58559c373b=
451b72921555be5c2eaf93d27b2: exit status 5:=C2=A0 =C2=A0/dev/sdh: open fail=
ed: No medium found<br>/dev/sdi: open failed: No medium found<br>/dev/sdj:o=
und<br>/dev/sdk: open failed: No medium found<br>/dev/sdh: open failed: No =
medium found<br>/dev/sdi: open failed: No medium found<br>/dev/sdj: open fa=
iled: No medium found<br>/dev/sdk: open failed: No medium fou<br>ThinDataLV=
-tpool (251:3) transaction_id is 147, while expected 148.<br>Failed to susp=
end vg_ifc0/ThinDataLV with queued messages.<br><br><br>Due to some failure=
 recovery loops, these services are running<br>lvcreate/lvremove/lvrename (=
on same VG but different LVs) as often as 5 times<br>per second, which seem=
s fast but doesn&#39;t seem like it should be a problem.<br><br>Looking thr=
ough past messages to this list, it looks like previous cases were<br>due t=
o sharing volumes between containers/vms without a common lock dir, which<b=
r>we are not doing.<br><br>Any thoughts on how to further debug or avoid th=
is issue?<br><br><br>I can provide the lvm metadata backup files if that wo=
uld help - there are a lot<br>of them, as once it starts failing, the syste=
m retries frequently.<br><br>Ihis is on Ubuntu 20.04, with lvm 2.03.07(2)<b=
r>(ubuntu package version 2.03.07-1ubuntu1)<br>and a custom kernel built fr=
om 5.15.68.<br><br>Thanks!<br>-mike<div class=3D"gmail-yj6qo"></div><br cla=
ss=3D"gmail-Apple-interchange-newline"></div>

--00000000000002786d05fc619f73--

--===============0375285779362117747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0375285779362117747==--

