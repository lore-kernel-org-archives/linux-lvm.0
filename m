Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337ECC433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  3 Jan 2022 08:04:34 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-qFsAd1ekMeCdhf4cnwCUrQ-1; Mon, 03 Jan 2022 03:04:30 -0500
X-MC-Unique: qFsAd1ekMeCdhf4cnwCUrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 430EC1006AA5;
	Mon,  3 Jan 2022 08:04:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B862E10589CE;
	Mon,  3 Jan 2022 08:04:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0FDFC4CA9B;
	Mon,  3 Jan 2022 08:04:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 201I32Tj010901 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 1 Jan 2022 13:03:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ECE0E112131B; Sat,  1 Jan 2022 18:03:01 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E70491121319
	for <linux-lvm@redhat.com>; Sat,  1 Jan 2022 18:02:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D24F73C02B8F
	for <linux-lvm@redhat.com>; Sat,  1 Jan 2022 18:02:58 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
	[209.85.219.172]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-303-YTKhEmcyNg-4Tmc7Q5DSvQ-1; Sat, 01 Jan 2022 13:02:57 -0500
X-MC-Unique: YTKhEmcyNg-4Tmc7Q5DSvQ-1
Received: by mail-yb1-f172.google.com with SMTP id w13so54191129ybs.13
	for <linux-lvm@redhat.com>; Sat, 01 Jan 2022 10:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yF5tfUnnNMW8QifpL2/K4M4aMlf2RWcHDpjRd4gi4Os=;
	b=QAF4CTHKmG72/sHpbf+meyatdo1OgETJIBiulVTli+jNIM9P5s13wEMvGujRYn9Tpg
	HYL+goFtKf9MGKlqMsngMl3zX+dZXrM8P2MsRO8e/xOsek0W02VAMthxgXBEimxWbHs+
	2C9H1YO3I/Z4xS2Mp7YLFMiCJfLqQZQVMUieilsqhQDFm/ACK5iDoQY/NwOxE4Rdrd/A
	AR7lxyZXxeIsXmFtCxs7e/aDPGUMq2tnautmVKpdSzsGlOcckdASJLI9FuTRNZ+C6ap7
	r3ZfVZKMLwBMn5H53OPnRIgdh15ydReTTTZsE/nFPQDnvSVE+TC0gp7094kplZVS7uBq
	bc5g==
X-Gm-Message-State: AOAM531TzWcUr18YRm9EwfXgeZZ4ALUnp4jhxdOJwYnTHbfYQbfrfn26
	cRz7YHLyS7TY11+BRrXCEZ75BE/1Tc60XXc2lrtZdSAJy7s=
X-Google-Smtp-Source: ABdhPJxLUSPUPreN58TbfUONCO2DKjrBghBabllzKimXoXalY3MVgo/ibpuiQ6Dzo0qB0KBBn0O2WitIXtO1RHYaVbM=
X-Received: by 2002:a25:fc5:: with SMTP id 188mr49238513ybp.608.1641060175702; 
	Sat, 01 Jan 2022 10:02:55 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Sat, 1 Jan 2022 19:02:44 +0100
Message-ID: <CACrcyf+mJY9NJ8pgkZUg00kaHpVN96pZ94n7ZF0E4xkS2=yJcA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 03 Jan 2022 03:04:08 -0500
Subject: [linux-lvm] Can't get merge in background using blockdev api to work
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6905133246224537004=="

--===============6905133246224537004==
Content-Type: multipart/alternative; boundary="000000000000d3eee805d489187d"

--000000000000d3eee805d489187d
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to start a merge to the previous snapshot to be started with
the "-b" flag (background). But it seems to be that the merging has not
started in the background at all.

        BDExtraArg      lv_arg = {"--background",""};
        const BDExtraArg        *extra_args[2] = {&lv_arg, NULL};

        BDPluginSpec lvm_plugin = {BD_PLUGIN_LVM, "libbd_lvm.so.2"};
        BDPluginSpec *plugins[] = {&lvm_plugin,NULL};

        bd_switch_init_checks (FALSE, &error);
        bd_ensure_init (plugins, NULL, &error);
        bd_lvm_lvsnapshotmerge(vg_name,lv_snap,extra_args,&error);

Couldn't find any details about how to do this using the libblockdev api,
but according to the documentation, it should be possible to add the same
flags as for the normal LVM commands.

Could you please give me a hint of what I am doing wrong?

Regards Tomas

--000000000000d3eee805d489187d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am trying to start a m=
erge to the previous snapshot to be started with the &quot;-b&quot; flag (b=
ackground). But it seems to be that the merging has not started in the back=
ground at all.</div><div><span style=3D"font-family:monospace"><br></span><=
/div><div><span style=3D"font-family:monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 BDExtraArg =C2=A0 =C2=A0 =C2=A0lv_arg =3D {&quot;--background&quot;,&quot;=
&quot;};<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 const BDExtraArg =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*extra_args[2] =3D {&amp;lv_arg, NULL};<br><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BDPluginSpec lvm_plugin =3D {BD_PLUGIN_LVM, &quot;libbd_lvm.so.2=
&quot;};<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 BDPluginSpec *plugins[] =3D {&amp;l=
vm_plugin,NULL};<br><br>=09 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 bd_switch_init=
_checks (FALSE, &amp;error);<br>=09 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
d_ensure_init (plugins, NULL, &amp;error);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
d_lvm_lvsnapshotmerge(vg_name,lv_snap,extra_args,&amp;error);</span><br>=09=
=09</div><div><br></div><div>Couldn&#39;t find any details about how to do =
this using the libblockdev api, but according to the documentation, it shou=
ld be possible to add the same flags as for the normal LVM commands.</div><=
div><br></div><div>Could you please give me a hint of what I am doing wrong=
?</div><div><br></div><div>Regards Tomas<br></div><div><br>=09</div></div>

--000000000000d3eee805d489187d--

--===============6905133246224537004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6905133246224537004==--

