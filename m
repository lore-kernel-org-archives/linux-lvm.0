Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD537C433F5
	for <linux-lvm@archiver.kernel.org>; Thu,  3 Mar 2022 09:22:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-vnWZZle7MGWhUFvrqgQHKA-1; Thu, 03 Mar 2022 04:22:33 -0500
X-MC-Unique: vnWZZle7MGWhUFvrqgQHKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B62191006AA5;
	Thu,  3 Mar 2022 09:22:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 829F01F427;
	Thu,  3 Mar 2022 09:22:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB9D21809C83;
	Thu,  3 Mar 2022 09:22:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222Mv26E023141 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 17:57:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C4D13697C9B; Wed,  2 Mar 2022 22:57:02 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0AD9697C9A
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2022 22:57:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A880138025E8
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2022 22:57:02 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
	[209.85.219.175]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-498-dM9zSXpbNXuqksQgs9GnTw-1; Wed, 02 Mar 2022 17:56:59 -0500
X-MC-Unique: dM9zSXpbNXuqksQgs9GnTw-1
Received: by mail-yb1-f175.google.com with SMTP id bt13so6576199ybb.2
	for <linux-lvm@redhat.com>; Wed, 02 Mar 2022 14:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=fbCKKxVb/80FsOQcUwgwUy9xLHLJDwCSwptCv8GHaW0=;
	b=5cpsXs2XgFPlp1sk5Z/EFZY1xe7Si7DihfCmm9T4ca/vGWj/7uVTIfekCmmR/dqA1F
	Hbvi6eLQfjqlK5uxgStFeBEwa+IpUVt/j1CsZWsPAjMux/N+LtX2y2E1TI3co/nsxWX4
	VxZ1nB/fwGe0gj/6SRq6+LgxV4PwCuohxyq7LoihmTim7VtiHL2unokZHXo1t2TsEAY0
	ZF5T+QP4TXwV+024sJLcCTzPIzOD9NYikwz3ukmeZhedmVMcbUuCMKwOAvrP/ggMzE5s
	zxw4RbFmWgWjJ0dG0Pwfeyb6lYkYyFlWpHz77J1Nsg5+KTkAbxKTeuW62Ymli+Y4oHK0
	65nA==
X-Gm-Message-State: AOAM533U22OCzx9fMUVkdeadxJ3Y55GRXsQRF0IrLS11wUPw4huWfIia
	JF7OgV2xTxmI5u+xriz56//VIWAwOA4MXDGVpHxbd+Qg
X-Google-Smtp-Source: ABdhPJx0dPQKJrBTL2pZKTPPggsm1E5PMpdDdi2d3tkaXk2wZ9xL6mofUYiFb1XK4d4WOOs7XTlGMYrYw9ZlOd497IA=
X-Received: by 2002:a25:db84:0:b0:628:7901:4ec1 with SMTP id
	g126-20020a25db84000000b0062879014ec1mr9915959ybf.102.1646261818748;
	Wed, 02 Mar 2022 14:56:58 -0800 (PST)
MIME-Version: 1.0
From: Christian Blume <chr.blume@gmail.com>
Date: Thu, 3 Mar 2022 11:56:48 +1300
Message-ID: <CAGP7Hd7gBGOWRyCugfp-Mhay2rGx=Upw2fWTCL6DYKynM+_jEQ@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 03 Mar 2022 04:21:51 -0500
Subject: [linux-lvm] LVM limits
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello!

Could you please point me to the documentation that describes the
limits around creating VGs, LVs, PVs etc on a 64bit system?

In particular I would like to know the max size for a VG and the max
size for an LV.

Thank you!
Christian

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

