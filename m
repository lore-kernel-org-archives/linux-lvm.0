Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58AEC433F5
	for <linux-lvm@archiver.kernel.org>; Tue,  4 Jan 2022 08:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641283774;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qAXgtug3wHbqR8H/nHl7g8RVbttrUeC05I6SZMyiYPM=;
	b=TGCk2/pyFkJYj8csXIw647vW++ibxxLxRS5Fccsc1J44QdF1izpH9mDICTNE0SZiuc72Jz
	HNEL/Y3dLKzBXXJdIvgWDWtnn1SftHtOU3eqfwUd6awVMOsEeCWz9Ou/opMd6PQpe25OCK
	DK439ap9WK1Y4HSMQz3YsrPKR8ZTHOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-cw3APETDMOuniEzUJ0uOaw-1; Tue, 04 Jan 2022 03:09:31 -0500
X-MC-Unique: cw3APETDMOuniEzUJ0uOaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D39C918397D5;
	Tue,  4 Jan 2022 08:09:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BB9E5ED4D;
	Tue,  4 Jan 2022 08:09:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 427001809CB9;
	Tue,  4 Jan 2022 08:09:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 203FnKNQ025512 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 3 Jan 2022 10:49:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C82DD515994; Mon,  3 Jan 2022 15:49:20 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C47CC515987
	for <linux-lvm@redhat.com>; Mon,  3 Jan 2022 15:49:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABF84108C0E2
	for <linux-lvm@redhat.com>; Mon,  3 Jan 2022 15:49:20 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-256-bMKoUKpcPtym2dq4xAyWMw-1; Mon, 03 Jan 2022 10:49:19 -0500
X-MC-Unique: bMKoUKpcPtym2dq4xAyWMw-1
Received: by mail-io1-f70.google.com with SMTP id
	j6-20020a6b5506000000b00601e1eac0ecso16114878iob.3
	for <linux-lvm@redhat.com>; Mon, 03 Jan 2022 07:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=tGQoEmoVsA/nY65Ks1taVqKqaBHI4xchuI3qmKuSOHs=;
	b=zg8lybQS4IKYTnWeMlCghN8rDMtsDHCDZBthyVOPNrqJXQZOqsPEXWGppGeJnt/Mh4
	pd16RHxNu5vDhk/tXQmfmeOy0jfnmNI8GsuiiyFBcMlS6qmaSXmbbyMH12Zw3HYwDBH/
	fMv0BhNTl3OSEvOvk5MdEBIvD5RwetqAFFPAEVP1zffofmiMQXOBmLTeXJ7VUgsCEtiI
	OojMqG4C/oz2GANHFj2na+3CndKeZbb9MtsHHi12pPst5/Jy1GgUBLwPBcMWNN7UkGN4
	CMMUoqZQXUE2l/VZXWZhOumPkka+xMu/nu9hau/mluFH+PU2rGgx/FuEXHyuerp+1r9i
	F5CQ==
X-Gm-Message-State: AOAM5329foNyxh6gG4pFC2jyWXZnl0f3D3wkOTTvyqxdvR5dk2AZXDUo
	h1sM4vWsCDRYbw98SBU4lf7UP6sQ70G2U+dliyG/UZWcdeQY1rXPq2qdDbfz1nM+VnxP5dlcjK2
	Ztz+SNVJ8pMHjii/RxNZ6Yx/2qyMhswbC
X-Received: by 2002:a02:c882:: with SMTP id m2mr18721314jao.30.1641224958468; 
	Mon, 03 Jan 2022 07:49:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiSQd83V5FeejlsXFoDf3GSULpT9bzIETEkN6ZWMDQMuN/D4DhZtECqnzem1byaWnqOTyziZi8eWNYS7iptpU=
X-Received: by 2002:a02:c882:: with SMTP id m2mr18721303jao.30.1641224958254; 
	Mon, 03 Jan 2022 07:49:18 -0800 (PST)
MIME-Version: 1.0
References: <CACrcyf+mJY9NJ8pgkZUg00kaHpVN96pZ94n7ZF0E4xkS2=yJcA@mail.gmail.com>
In-Reply-To: <CACrcyf+mJY9NJ8pgkZUg00kaHpVN96pZ94n7ZF0E4xkS2=yJcA@mail.gmail.com>
From: Vojtech Trefny <vtrefny@redhat.com>
Date: Mon, 3 Jan 2022 16:49:07 +0100
Message-ID: <CAAkhNO3NOZPHc5SoRGOQBcg=hC14hAx69diwMVqss5W6UWA8SA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 04 Jan 2022 03:09:01 -0500
Subject: Re: [linux-lvm] Can't get merge in background using blockdev api to
	work
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1130184232940371141=="

--===============1130184232940371141==
Content-Type: multipart/alternative; boundary="000000000000a231e805d4af762d"

--000000000000a231e805d4af762d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, libblockdev maintainer here, libblockdev is a separate project from LVM
so it's better to ask on our GitHub[1], but I'm reading this ML too so I
can answer here.

I did a quick test and the background merge works for me, so I think the
problem is somewhere in LVM or with your setup, not in libblockdev -- all
we do is run the "lvm lvconvert --merge <vg>/<snap> --background" command
so there isn't a big room for a bug in our code (but I'm not saying there
isn't one). I've modified your code a little bit[2], can you try running it
again? I've just added logging so we can see what we actually tell LVM to
run and also enabled LVM logging and saved the log to /tmp/lvm.log.

[1] https://github.com/storaged-project/libblockdev
[2] https://gist.github.com/vojtechtrefny/7f379596958a0c4cd4c287c3f7a7dddd

On Mon, Jan 3, 2022 at 9:06 AM Tomas Dalebj=C3=B6rk <tomas.dalebjork@gmail.=
com>
wrote:

> Hi,
>
> I am trying to start a merge to the previous snapshot to be started with
> the "-b" flag (background). But it seems to be that the merging has not
> started in the background at all.
>
>         BDExtraArg      lv_arg =3D {"--background",""};
>         const BDExtraArg        *extra_args[2] =3D {&lv_arg, NULL};
>
>         BDPluginSpec lvm_plugin =3D {BD_PLUGIN_LVM, "libbd_lvm.so.2"};
>         BDPluginSpec *plugins[] =3D {&lvm_plugin,NULL};
>
>         bd_switch_init_checks (FALSE, &error);
>         bd_ensure_init (plugins, NULL, &error);
>         bd_lvm_lvsnapshotmerge(vg_name,lv_snap,extra_args,&error);
>
> Couldn't find any details about how to do this using the libblockdev api,
> but according to the documentation, it should be possible to add the same
> flags as for the normal LVM commands.
>
> Could you please give me a hint of what I am doing wrong?
>
> Regards Tomas
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--000000000000a231e805d4af762d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, libblockdev maintainer here, libblockdev is a sep=
arate project from LVM so it&#39;s better to ask on our GitHub[1], but I&#3=
9;m reading this ML too so I can answer here.<br><br></div>I did a quick te=
st and the background merge works for me, so I think the problem is somewhe=
re in LVM or with your setup, not in libblockdev -- all we do is run the &q=
uot;lvm lvconvert --merge &lt;vg&gt;/&lt;snap&gt; --background&quot; comman=
d so there isn&#39;t a big room for a bug in our code (but I&#39;m not sayi=
ng there isn&#39;t one). I&#39;ve modified your code a little bit[2], can y=
ou try running it again? I&#39;ve just added logging so we can see what we =
actually tell LVM to run and also enabled LVM logging and saved the log to =
<span class=3D"gmail-pl-s">/tmp/lvm.log.<br><br>[1] <a href=3D"https://gith=
ub.com/storaged-project/libblockdev">https://github.com/storaged-project/li=
bblockdev</a><br>[2] <a href=3D"https://gist.github.com/vojtechtrefny/7f379=
596958a0c4cd4c287c3f7a7dddd">https://gist.github.com/vojtechtrefny/7f379596=
958a0c4cd4c287c3f7a7dddd</a></span></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 3, 2022 at 9:06 AM Tomas Dal=
ebj=C3=B6rk &lt;<a href=3D"mailto:tomas.dalebjork@gmail.com">tomas.dalebjor=
k@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am trying t=
o start a merge to the previous snapshot to be started with the &quot;-b&qu=
ot; flag (background). But it seems to be that the merging has not started =
in the background at all.</div><div><span style=3D"font-family:monospace"><=
br></span></div><div><span style=3D"font-family:monospace">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BDExtraArg =C2=A0 =C2=A0 =C2=A0lv_arg =3D {&quot;--background=
&quot;,&quot;&quot;};<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 const BDExtraArg =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*extra_args[2] =3D {&amp;lv_arg, NULL};<br><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 BDPluginSpec lvm_plugin =3D {BD_PLUGIN_LVM, &quot;=
libbd_lvm.so.2&quot;};<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 BDPluginSpec *plugins=
[] =3D {&amp;lvm_plugin,NULL};<br><br>=09 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 =
bd_switch_init_checks (FALSE, &amp;error);<br>=09 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bd_ensure_init (plugins, NULL, &amp;error);<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 bd_lvm_lvsnapshotmerge(vg_name,lv_snap,extra_args,&amp;error)=
;</span><br>=09=09</div><div><br></div><div>Couldn&#39;t find any details a=
bout how to do this using the libblockdev api, but according to the documen=
tation, it should be possible to add the same flags as for the normal LVM c=
ommands.</div><div><br></div><div>Could you please give me a hint of what I=
 am doing wrong?</div><div><br></div><div>Regards Tomas<br></div><div><br>=
=09</div></div>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockqu=
ote></div>

--000000000000a231e805d4af762d--

--===============1130184232940371141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============1130184232940371141==--

