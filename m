Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F586C6FD1D
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Mar 2023 06:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680158001;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sBA1GdSAp7R1whm8d46gfGqPln7UzgAiDGbk1BBzjOA=;
	b=jRrJ3Ti4vd/2cnmfVJ65dB0V4TJZto15teoUo4u1djd9P/AdnkiWP8HdFb24scFiIn9nC7
	Da/dxQqFiCihH7NrkWoxt73Edz6YMZQwiGTdfCxSvc9QS+l52AJ+EQ72MfUd0iPUuFqnSd
	QhcMFDvhzEeF+31tQcHDdoO8JyIRAio=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-hyKzGHdHN6-0bpsNak3RWA-1; Thu, 30 Mar 2023 02:33:17 -0400
X-MC-Unique: hyKzGHdHN6-0bpsNak3RWA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD648858297;
	Thu, 30 Mar 2023 06:33:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A5FC492B00;
	Thu, 30 Mar 2023 06:33:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC9591946595;
	Thu, 30 Mar 2023 06:33:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 284421946587
 for <linux-lvm@listman.corp.redhat.com>; Thu, 30 Mar 2023 03:34:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D811640BC799; Thu, 30 Mar 2023 03:34:44 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D051C40BC798
 for <linux-lvm@redhat.com>; Thu, 30 Mar 2023 03:34:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B239780C8C1
 for <linux-lvm@redhat.com>; Thu, 30 Mar 2023 03:34:44 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-d_CC_KuhNn6WxddPYzY-Ww-1; Wed, 29 Mar 2023 23:34:42 -0400
X-MC-Unique: d_CC_KuhNn6WxddPYzY-Ww-1
Received: by mail-yb1-f176.google.com with SMTP id p204so21918358ybc.12
 for <linux-lvm@redhat.com>; Wed, 29 Mar 2023 20:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680147282;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zOlh72mnGhN5qAVUGxO3gLufezslG5N3dbHkfwUiBQE=;
 b=ADT64aER5KWqQdB6NBfN/ONS/waza3TEr3diykfJ1xM1R33eoG/iDv/Bbs6EsDbOQY
 jM1ds3ARiBRnTTPH38CRfJ8KOieEnxX61u8Z2xp6STHDpYC0fOaI3UDHve5IeQcdW233
 s3+yaDixFgIrCiT2H9Q0Go6YShCainukSNWDoF8g0ol9343WNiYd4N1BPiRaTTEcHm/B
 EpEk8XP2+IgVY+CLD+M1F6lEP1kFmHbPRelnhcXVagroev7Tq8+T5eC2rvC1e/7uup3H
 TBmgniKd/FHzddNfBbjsKpJB2g9ueN1RQkJE7TqeIeul3oJ+0R2TZS36nLPYjPnFfuVw
 vkkw==
X-Gm-Message-State: AAQBX9c9oBqEsqyCYH7RhTycPB4rnMvE6dNqNtpgosGaOqwJryUbOFx+
 GvB4fUFySNw4cndo3m3gxF69n+/QBg88OO1r00gURoAst/Q=
X-Google-Smtp-Source: AKy350ZXdkXXbFxrlrp3tprXB26gdnV8y+KTpyK5P8YK3sBervH/dVJ65kpaWrYTWHkFyStatD+RSEL96o1OHZqm3gs=
X-Received: by 2002:a05:6902:1141:b0:b73:caa7:f06f with SMTP id
 p1-20020a056902114100b00b73caa7f06fmr14317480ybu.5.1680147281839; Wed, 29 Mar
 2023 20:34:41 -0700 (PDT)
MIME-Version: 1.0
From: Delarians <alexsifm@gmail.com>
Date: Thu, 30 Mar 2023 08:34:48 +0500
Message-ID: <CANbQTxuYo6gR0-bOSQWTpUgo6_0O34PqWkAw7GTzbs6MBsvGng@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Thu, 30 Mar 2023 06:33:08 +0000
Subject: [linux-lvm] bad checksum in superblock, wanted
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
Content-Type: multipart/mixed; boundary="===============0537346753047380039=="

--===============0537346753047380039==
Content-Type: multipart/alternative; boundary="000000000000e7891705f815c517"

--000000000000e7891705f815c517
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good afternoon, I'm asking for help in recovering damaged metadata after a
220V drop on the server, when the power was restored and the server booted
up, I got an error in the Proxmox panel

Check of pool pve/data failed (status:1). Manual repair required!

then booted from LiveCD debian mounted corrupted metadata and tried to
repair

root@debian:/home/user# lvchange -ay /dev/pve/data_tdata
    Do you want to activate component LV in read-only mode? [y/n]: y
    Allowing activation of component LV.
root@debian:/home/user# lvs
      LV                                        VG                     Attr
      LSize    Pool Origin                                    Data%  Meta%
 Move Log Cpy%Sync Convert
  vm-102-disk-0                             local-hdd-volume1-pve1
-wi-a-----   50.00g
  vm-103-disk-0                             local-hdd-volume1-pve1
-wi-a-----  250.00g
  vm-104-disk-0                             local-hdd-volume1-pve1
-wi-a-----  150.00g
  vm-108-disk-0                             local-hdd-volume1-pve1
-wi-a-----   20.00g
  vm-109-disk-0                             local-hdd-volume1-pve1
-wi-a-----  160.00g
  vm-110-disk-0                             local-hdd-volume1-pve1
-wi-a-----   20.00g
  base-101-disk-0                           pve
 Vri---tz-k   20.00g data
  base-105-disk-0                           pve
 Vri---tz-k   15.00g data
  data                                      pve
 twi---tz-- <858.97g
  root                                      pve
 -wi-a-----   30.00g
  snap_vm-106-disk-0_Installed              pve
 Vri---tz-k   15.00g data
  snap_vm-106-disk-0_Installed_CspAndVipnet pve
 Vri---tz-k   15.00g data
  swap                                      pve
 -wi-a-----    8.00g
  vm-100-disk-0                             pve
 Vwi---tz--   20.00g data
  vm-100-disk-1                             pve
 Vwi---tz--   60.00g data
  vm-102-disk-0                             pve
 Vwi---tz--   20.00g data
  vm-103-disk-0                             pve
 Vwi---tz--   30.00g data
  vm-104-disk-0                             pve
 Vwi---tz--   25.00g data
  vm-106-disk-0                             pve
 Vwi---tz--   15.00g data snap_vm-106-disk-0_Installed_CspAndVipnet
  vm-107-disk-0                             pve
 Vwi---tz--   20.00g data
  vm-108-disk-0                             pve
 Vwi---tz--   30.00g data
  vm-109-disk-0                             pve
 Vwi---tz--   35.00g data
  vm-110-disk-0                             pve
 Vwi---tz--   20.00g data

root@debian:/home/user# vgs
  VG                     #PV #LV #SN Attr   VSize    VFree
  local-hdd-volume1-pve1   1   6   0 wz--n-    3.27t  <2.64t
  pve                      1  17   0 wz--n- <930.50g <16.00g

root@debian:/home/user# ls -la /dev/mapper/ | grep -v vm
total 0
drwxr-xr-x  2 root root     240 Mar 29 17:48 .
drwxr-xr-x 19 root root    3700 Mar 29 17:48 ..
crw-------  1 root root 10, 236 Mar 29 17:35 control
lrwxrwxrwx  1 root root       7 Mar 29 17:48 pve-data_tdata -> ../dm-2
lrwxrwxrwx  1 root root       7 Mar 29 17:35 pve-root -> ../dm-1
lrwxrwxrwx  1 root root       7 Mar 29 17:35 pve-swap -> ../dm-0

root@debian:/home/user# thin_dump --repair /dev/mapper/pve-data_tdata >
repaired.xml
The following field needs to be provided on the command line due to
corruption in the superblock: transaction id

root@debian:/home/user# thin_check /dev/mapper/pve-data_tdata
examining superblock
  superblock is corrupt
    bad checksum in superblock, wanted 2018675394

however, I don=E2=80=99t know how to specify the transaction id and, most
importantly, what id - where to find it

Kernel Version: Linux 5.15.30-2-pve #1 SMP PVE 5.15.30-3 (Fri, 22 Apr 2022
18:08:27 +0200)
PVE Manager Version: pve-manager/7.2-3/c743d6c1

--000000000000e7891705f815c517
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(35,38,41);font-family:-apple-syst=
em,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&q=
uot;Liberation Sans&quot;,sans-serif;font-size:15px">Good afternoon, I&#39;=
m asking for help in recovering damaged metadata after a 220V drop on the s=
erver, when the power was restored and the server booted up, I got an error=
 in the Proxmox panel</span><br><div><span style=3D"color:rgb(35,38,41);fon=
t-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&qu=
ot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px"><b=
r></span></div><div>Check of pool pve/data failed (status:1). Manual repair=
 required!<span style=3D"color:rgb(35,38,41);font-family:-apple-system,Blin=
kMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Lib=
eration Sans&quot;,sans-serif;font-size:15px"><br></span></div><div><br></d=
iv><div><span style=3D"color:rgb(20,22,24);font-family:&quot;Open Sans&quot=
;,Roboto,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Oxygen,Ubunt=
u,Cantarell,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Ne=
ue&quot;,sans-serif;font-size:14px">then booted from LiveCD debian mounted =
corrupted metadata and tried to repair</span><br style=3D"box-sizing:border=
-box;color:rgb(20,22,24);font-family:&quot;Open Sans&quot;,Roboto,-apple-sy=
stem,BlinkMacSystemFont,&quot;Segoe UI&quot;,Oxygen,Ubuntu,Cantarell,&quot;=
Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-seri=
f;font-size:14px"></div><div><span style=3D"color:rgb(20,22,24);font-family=
:&quot;Open Sans&quot;,Roboto,-apple-system,BlinkMacSystemFont,&quot;Segoe =
UI&quot;,Oxygen,Ubuntu,Cantarell,&quot;Fira Sans&quot;,&quot;Droid Sans&quo=
t;,&quot;Helvetica Neue&quot;,sans-serif;font-size:14px"><br></span></div><=
div>root@debian:/home/user# lvchange -ay /dev/pve/data_tdata<br>=C2=A0 =C2=
=A0 Do you want to activate component LV in read-only mode? [y/n]: y<br>=C2=
=A0 =C2=A0 Allowing activation of component LV.<br>root@debian:/home/user# =
lvs<br>=C2=A0 =C2=A0 =C2=A0 LV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 Attr =C2=A0 =C2=A0 =C2=A0 LSize =C2=A0 =C2=A0Pool Ori=
gin =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Data% =C2=A0Meta% =
=C2=A0Move Log Cpy%Sync Convert<br>=C2=A0 vm-102-disk-0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 local-hdd-volume1-pve1 -wi-a----- =C2=A0 50.00g<br>=C2=A0 vm-103-dis=
k-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local-hdd-volume1-pve1 -wi-a----- =C2=A0250.00g=
<br>=C2=A0 vm-104-disk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local-hdd-volume1-pve1 -wi=
-a----- =C2=A0150.00g<br>=C2=A0 vm-108-disk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local=
-hdd-volume1-pve1 -wi-a----- =C2=A0 20.00g<br>=C2=A0 vm-109-disk-0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 local-hdd-volume1-pve1 -wi-a----- =C2=A0160.00g<br>=C2=A0=
 vm-110-disk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local-hdd-volume1-pve1 -wi-a----- =
=C2=A0 20.00g<br>=C2=A0 base-101-disk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vri---tz-k =C2=A0 20=
.00g data<br>=C2=A0 base-105-disk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vri---tz-k =C2=A0 15.00=
g data<br>=C2=A0 data =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0pve =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0twi---tz-- &lt;858.97g<br>=C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pve =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0-wi-a----- =C2=A0 30.00g<br>=C2=A0 snap_vm-106-d=
isk-0_Installed =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pve =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vri---tz-k =
=C2=A0 15.00g data<br>=C2=A0 snap_vm-106-disk-0_Installed_CspAndVipnet pve =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vri---=
tz-k =C2=A0 15.00g data<br>=C2=A0 swap =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pve =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-wi-a----- =C2=A0 =C2=A08.00g<br>=C2=A0 vm-100-disk=
-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Vwi---tz-- =C2=A0 20.00g data<br>=C2=A0 vm-100-d=
isk-1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Vwi---tz-- =C2=A0 60.00g data<br>=C2=A0 vm-102-d=
isk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Vwi---tz-- =C2=A0 20.00g data<br>=C2=A0 vm-103-d=
isk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Vwi---tz-- =C2=A0 30.00g data<br>=C2=A0 vm-104-d=
isk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Vwi---tz-- =C2=A0 25.00g data<br>=C2=A0 vm-106-d=
isk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Vwi---tz-- =C2=A0 15.00g data snap_vm-106-disk-0=
_Installed_CspAndVipnet<br>=C2=A0 vm-107-disk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vwi---=
tz-- =C2=A0 20.00g data<br>=C2=A0 vm-108-disk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vwi---=
tz-- =C2=A0 30.00g data<br>=C2=A0 vm-109-disk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vwi---=
tz-- =C2=A0 35.00g data<br>=C2=A0 vm-110-disk-0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pve =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vwi---=
tz-- =C2=A0 20.00g data<br><br>root@debian:/home/user# vgs<br>=C2=A0 VG =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #PV #LV =
#SN Attr =C2=A0 VSize =C2=A0 =C2=A0VFree<br>=C2=A0 local-hdd-volume1-pve1 =
=C2=A0 1 =C2=A0 6 =C2=A0 0 wz--n- =C2=A0 =C2=A03.27t =C2=A0&lt;2.64t<br>=C2=
=A0 pve =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A01 =C2=A017 =C2=A0 0 wz--n- &lt;930.50g &lt;16.00g<br><br>root@deb=
ian:/home/user# ls -la /dev/mapper/ | grep -v vm<br>total 0<br>drwxr-xr-x =
=C2=A02 root root =C2=A0 =C2=A0 240 Mar 29 17:48 .<br>drwxr-xr-x 19 root ro=
ot =C2=A0 =C2=A03700 Mar 29 17:48 ..<br>crw------- =C2=A01 root root 10, 23=
6 Mar 29 17:35 control<br>lrwxrwxrwx =C2=A01 root root =C2=A0 =C2=A0 =C2=A0=
 7 Mar 29 17:48 pve-data_tdata -&gt; ../dm-2<br>lrwxrwxrwx =C2=A01 root roo=
t =C2=A0 =C2=A0 =C2=A0 7 Mar 29 17:35 pve-root -&gt; ../dm-1<br>lrwxrwxrwx =
=C2=A01 root root =C2=A0 =C2=A0 =C2=A0 7 Mar 29 17:35 pve-swap -&gt; ../dm-=
0<br><br>root@debian:/home/user# thin_dump --repair /dev/mapper/pve-data_td=
ata &gt; repaired.xml<br>The following field needs to be provided on the co=
mmand line due to corruption in the superblock: transaction id<br><br>root@=
debian:/home/user# thin_check /dev/mapper/pve-data_tdata<br>examining super=
block<br>=C2=A0 superblock is corrupt<br>=C2=A0 =C2=A0 bad checksum in supe=
rblock, wanted 2018675394<span style=3D"color:rgb(20,22,24);font-family:&qu=
ot;Open Sans&quot;,Roboto,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&q=
uot;,Oxygen,Ubuntu,Cantarell,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&=
quot;Helvetica Neue&quot;,sans-serif;font-size:14px"><br></span></div><div>=
<br></div><div><span style=3D"color:rgb(20,22,24);font-family:&quot;Open Sa=
ns&quot;,Roboto,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Oxyge=
n,Ubuntu,Cantarell,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helve=
tica Neue&quot;,sans-serif;font-size:14px">however, I don=E2=80=99t know ho=
w to specify the transaction id and, most importantly, what id - where to f=
ind it</span><br style=3D"box-sizing:border-box;color:rgb(20,22,24);font-fa=
mily:&quot;Open Sans&quot;,Roboto,-apple-system,BlinkMacSystemFont,&quot;Se=
goe UI&quot;,Oxygen,Ubuntu,Cantarell,&quot;Fira Sans&quot;,&quot;Droid Sans=
&quot;,&quot;Helvetica Neue&quot;,sans-serif;font-size:14px"><br style=3D"b=
ox-sizing:border-box;color:rgb(20,22,24);font-family:&quot;Open Sans&quot;,=
Roboto,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Oxygen,Ubuntu,=
Cantarell,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue=
&quot;,sans-serif;font-size:14px"><span style=3D"color:rgb(20,22,24);font-f=
amily:&quot;Open Sans&quot;,Roboto,-apple-system,BlinkMacSystemFont,&quot;S=
egoe UI&quot;,Oxygen,Ubuntu,Cantarell,&quot;Fira Sans&quot;,&quot;Droid San=
s&quot;,&quot;Helvetica Neue&quot;,sans-serif;font-size:14px">Kernel Versio=
n: Linux 5.15.30-2-pve #1 SMP PVE 5.15.30-3 (Fri, 22 Apr 2022 18:08:27 +020=
0)</span><br style=3D"box-sizing:border-box;color:rgb(20,22,24);font-family=
:&quot;Open Sans&quot;,Roboto,-apple-system,BlinkMacSystemFont,&quot;Segoe =
UI&quot;,Oxygen,Ubuntu,Cantarell,&quot;Fira Sans&quot;,&quot;Droid Sans&quo=
t;,&quot;Helvetica Neue&quot;,sans-serif;font-size:14px"><span style=3D"col=
or:rgb(20,22,24);font-family:&quot;Open Sans&quot;,Roboto,-apple-system,Bli=
nkMacSystemFont,&quot;Segoe UI&quot;,Oxygen,Ubuntu,Cantarell,&quot;Fira San=
s&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;font-s=
ize:14px">PVE Manager Version: pve-manager/7.2-3/c743d6c1</span><br></div><=
/div>

--000000000000e7891705f815c517--

--===============0537346753047380039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0537346753047380039==--

