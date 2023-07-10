Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1ADEB64DC
	for <linux-lvm@archiver.kernel.org>; Mon, 10 Jul 2023 06:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688971657;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Zw/JKEpiJsTcFj+B8L1GlxCtxn5VltJ87pb4RwIDYZE=;
	b=JkhKWZwgF03dzJiurHusSn1INb2KVFXQhxRdCHkC3ae6xFXUVRQA5zHgnonPPUmRhuJbsq
	cl+tBOZO/hNqc3CN+V7n9EBgXRCRLlpGQXZSHWQUq+OnkYGitLX7mm9zUH9G1bHqINLAC7
	v0t/nT4YFS7JqR4RWsLHdFehSDRmrmE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-Ywq4EWk3Pc6KESjeXlu63w-1; Mon, 10 Jul 2023 02:47:34 -0400
X-MC-Unique: Ywq4EWk3Pc6KESjeXlu63w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E1AB3C11CC3;
	Mon, 10 Jul 2023 06:47:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A104111DCE7;
	Mon, 10 Jul 2023 06:47:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 96D7019452C2;
	Mon, 10 Jul 2023 06:47:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 976811946586
 for <linux-lvm@listman.corp.redhat.com>; Mon, 10 Jul 2023 04:41:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 81E28200AD6E; Mon, 10 Jul 2023 04:41:30 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79BFB200A7CA
 for <linux-lvm@redhat.com>; Mon, 10 Jul 2023 04:41:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3882D2A5954F
 for <linux-lvm@redhat.com>; Mon, 10 Jul 2023 04:41:30 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-a9iHVEqHPCSBJA35trjWbg-1; Mon, 10 Jul 2023 00:41:24 -0400
X-MC-Unique: a9iHVEqHPCSBJA35trjWbg-1
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3465ec72cc8so5434335ab.0
 for <linux-lvm@redhat.com>; Sun, 09 Jul 2023 21:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688964082; x=1691556082;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WXDmrc81gNLMvJG+Lrgwi2JjMA84q6TrOQh8dv/qch0=;
 b=DwUi99PNnqr8+SQHQ7CnL9xOK+ptdBLLJX06ETA2wzlwBKWwIkWfuk+LLgMBivXhEU
 kffWHy2qUS7MoG2CdJGHLjCMl00nULHBSNVwqKwfuko/G4zDmzXt8OSzLDwnlU1wFYX9
 r8tCLPayMNQ53MxjyBrsLP4ATyHYnBNTWndYZ6VvKW4Px//p5CZOQ3iE47XCAShUvGw8
 /otD8whZ1xY9RkcjJG5RLhIxMvY5S+h5COrU3V51OaagRRtctXpbQIaecSRrm4KOyQdv
 4nIO+2Kl+Ji4W/p392yyq4YXDL6tDCgIIM1aUr0UHtHmkq8cKerEnr8n+b0DshxFXVgO
 Hwaw==
X-Gm-Message-State: ABy/qLb2Nnlxc5ceuauLJo9bHdZV3aG8ySyqG+0kRsNTv+xQed537cwR
 LgPfOyTcHODArfsl1iyRXACY3sAaEhUgKoaqIFduSszecZIGTV5LvWg=
X-Google-Smtp-Source: APBJJlEdTEVCnrIpkP16AfLEGaI7ZQgykEl5PKLqJb9hKOocGtEmiPuSVo+YrISebj2BsLD8W6QkrbJdHlHKM8ixG6w=
X-Received: by 2002:a92:d7c8:0:b0:346:8b4:34c with SMTP id
 g8-20020a92d7c8000000b0034608b4034cmr13231333ilq.16.1688964082307; 
 Sun, 09 Jul 2023 21:41:22 -0700 (PDT)
MIME-Version: 1.0
From: "Tim 'mithro' Ansell" <me@mith.ro>
Date: Sun, 9 Jul 2023 21:41:10 -0700
Message-ID: <CAHLUNMxrWdjgsL-mT=sWxvoAEHUP=4dqmSXt6+ZppdnwSyykSg@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Mon, 10 Jul 2023 06:47:23 +0000
Subject: [linux-lvm] Documentation about allowing >2 disk failures?
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mith.ro
Content-Type: multipart/mixed; boundary="===============7343666859739001088=="

--===============7343666859739001088==
Content-Type: multipart/alternative; boundary="0000000000002a2e6306001a98cd"

--0000000000002a2e6306001a98cd
Content-Type: text/plain; charset="UTF-8"

Hello!

RAID5 survives 1 disk failure and RAID6 survives 2 disk failures. What
about going beyond 2 disk failures? Does anyone know where I can find
information on what good options might be?

I was looking at RAID10, but every extra mirror added only increases
failure tolerance by 1 disk. I am also not seeing any inbuilt support in
LVM for RAID50 or RAID60 but it seems like if I manually build the
sub-volumes, things should still be fine?

My system has 25 disks and I'd like to tolerate up to ~1/3rd of the disks
failing so I was thinking that a RAID1 with 3 mirrors built out of RAID6
with 8 disks each (and 1 hot spare) would be a potentially good option?

Thank you for your help!

Tim 'mithro' Ansell

--0000000000002a2e6306001a98cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello!<div><br></div><div>RAID5 survives 1 disk failure an=
d RAID6 survives 2 disk failures. What about going beyond 2 disk failures? =
Does anyone know where I can find information on what good options might be=
?</div><div><br></div><div>I was looking at RAID10, but every extra mirror =
added only increases failure tolerance by 1 disk. I am also not seeing any =
inbuilt support in LVM for RAID50 or RAID60 but it seems like if I manually=
 build the sub-volumes, things should still be fine?</div><div><br></div><d=
iv>My system has 25 disks and I&#39;d like to tolerate up to ~1/3rd of the =
disks failing so I was thinking that a RAID1 with 3 mirrors built out of RA=
ID6 with 8 disks each (and 1 hot spare) would be a potentially good option?=
</div><div><br></div><div>Thank you for your help!</div><div><br></div><div=
>Tim &#39;mithro&#39; Ansell</div><div><br></div><div><br></div><div><br></=
div></div>

--0000000000002a2e6306001a98cd--

--===============7343666859739001088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7343666859739001088==--

