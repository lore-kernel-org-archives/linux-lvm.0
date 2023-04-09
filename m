Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7915FC77B71
	for <linux-lvm@archiver.kernel.org>; Tue, 11 Apr 2023 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681195479;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=INNl6K5gcipkTRQZ3DPGJEbrAsJ19wtU/1IctCLXOqU=;
	b=TaQ5uHNX0J60tDPZ6EslPG7N8pRp7nFFv39vK7V6egjC0gsQMYosoJuMSiV/YFzwb4RojU
	zmWkpOHTMUgMjKhF/qix9gzjjvYJDbiXqBUCTq7GIojIy6nSA0jxaQCtKoESyqrDgPRtan
	WVUEkP6b8xpUkhVg1HaeT/n1jzSjCF4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-Exg-BoCMPSGnCOKY0ir2nw-1; Tue, 11 Apr 2023 02:44:35 -0400
X-MC-Unique: Exg-BoCMPSGnCOKY0ir2nw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07F4128237C2;
	Tue, 11 Apr 2023 06:44:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C093C40C845F;
	Tue, 11 Apr 2023 06:44:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A443D19465BD;
	Tue, 11 Apr 2023 06:44:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7D2EA1946586
 for <linux-lvm@listman.corp.redhat.com>; Sun,  9 Apr 2023 12:22:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1D16B202701F; Sun,  9 Apr 2023 12:22:05 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15440202701E
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 12:22:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAA1A101A531
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 12:22:04 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-hHHqKMr6NZymgINXBiqTAg-1; Sun, 09 Apr 2023 08:22:02 -0400
X-MC-Unique: hHHqKMr6NZymgINXBiqTAg-1
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-1842d8976d9so3341250fac.9
 for <linux-lvm@redhat.com>; Sun, 09 Apr 2023 05:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681042921; x=1683634921;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fjIkTPfZQF7CKVw9KGGdNl5YytV/KYSehLC9xy3c6OI=;
 b=zf1Xf22WAwzkYRjQRmhF1voT6ObJoYkOLobrR4grvviC0roWI1RxArkdQ71wd+qczK
 h8gvH09CdYNuAakq8Ynk8e+Q7ID3nfZBLWTtbnQXlXFTE8WhGPV5jDsex5u7UJS/LkLz
 TdlEvlUMDfqPe4GWZkac54L25TlReBUO12az3BBZHHXWcDr6VSImLhjbApPNX9fWODpX
 OnRPH6PyGXT33Yg+XtVeUKcuzfVp2gVJNDyvX8KV4jPbpQjo/1pmtuk4cxSPWbS8eLcm
 qb+FtGJPGqQFSt/vvUqtbRdEqZsWp49dvrBmqnYIPRNBC71ZyVHRV9a/qOj62gLLmVmt
 A3Cw==
X-Gm-Message-State: AAQBX9c4nI6vh7wAsXqihTFOX6WG0dOVxxJ7Hywk9Je5YeBq/ewkxif7
 jhKqKDEKdkv1NPHBNJObKkt8QTycERwvdLQUM+HY2BZSjcSR/bTsjMs=
X-Google-Smtp-Source: AKy350YSz3+1quvHHP+LJ+Wd8E8BDTNxciNl0Yb2az2RDUhPBHkxbtZWNeNwJcByPmWYjqcLGaxZyfFDVCFvpXdgCSc=
X-Received: by 2002:a05:6870:1fd4:b0:184:44a1:b410 with SMTP id
 gp20-20020a0568701fd400b0018444a1b410mr566402oac.10.1681042921673; Sun, 09
 Apr 2023 05:22:01 -0700 (PDT)
MIME-Version: 1.0
From: Arvid Picciani <aep@exys.org>
Date: Sun, 9 Apr 2023 14:21:50 +0200
Message-ID: <CACD9L=A9i6QFzXtnQh6e3=gD9u6cy3VJAtCEaf1WsoCU_eE3kQ@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Tue, 11 Apr 2023 06:44:28 +0000
Subject: [linux-lvm] is lvmraid 1 thinpool with integrity safe?
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: exys.org
Content-Type: multipart/mixed; boundary="===============2989942025575544214=="

--===============2989942025575544214==
Content-Type: multipart/alternative; boundary="00000000000032ed9e05f8e64ebc"

--00000000000032ed9e05f8e64ebc
Content-Type: text/plain; charset="UTF-8"

Hi,

doing some performance tests i noticed that lvmraid + integrity + thinpool
outperforms zfs z1 by 5x while offering the same features. (snapshots,
integrity)

Is this somehow unsafe or how come it is so unpopular?

lvcreate --type raid1 --mirrors 1 --size '100M' loop --name loopmeta
--raidintegritymode journal
lvcreate --type raid1 --mirrors 1 --size '700M' loop --name loopdata
--raidintegritymode journal
lvconvert --type thin-pool --poolmetadata loop/loopmeta loop/loop

-- 
+4916093821054

--00000000000032ed9e05f8e64ebc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>doing some performance tests i noti=
ced that lvmraid=C2=A0+ integrity=C2=A0+ thinpool outperforms zfs z1 by 5x =
while offering the same features. (snapshots, integrity)</div><div><br></di=
v><div>Is this somehow unsafe or how come it is so unpopular?</div><div><br=
></div><div><div>lvcreate --type raid1 --mirrors 1 --size &#39;100M&#39; lo=
op --name loopmeta=C2=A0 --raidintegritymode journal</div></div><div>lvcrea=
te --type raid1 --mirrors 1 --size &#39;700M&#39; loop --name loopdata=C2=
=A0 --raidintegritymode journal</div><div>lvconvert --type thin-pool --pool=
metadata loop/loopmeta loop/loop<br clear=3D"all"><div><br></div><span clas=
s=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature">+4916093821054</div></div></d=
iv>

--00000000000032ed9e05f8e64ebc--

--===============2989942025575544214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============2989942025575544214==--

