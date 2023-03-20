Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A03C6FD1D
	for <linux-lvm@archiver.kernel.org>; Tue, 21 Mar 2023 07:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679385276;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=kyg97dVIBIJTWRGvGF0fL46skvawh9DayzMv5D3K21o=;
	b=b7O6XHUz62QNbyQyS6HIQR8vSiO+b6KzXO2qRA0EyGipZEEHceOXau6dnIft3QoZq6fJET
	HO92Y1nb19Mt+1YpNtlalwU97gXkG7da1rduysb3ekMbnTrQUqS4Y+SM3TmKdyXgJcWFoq
	aUoUnaNtyhyfEB6LGMzMgtsHsLYCNns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-WIjb1Q75PpOajVelShRHGA-1; Tue, 21 Mar 2023 03:54:34 -0400
X-MC-Unique: WIjb1Q75PpOajVelShRHGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E817985530D;
	Tue, 21 Mar 2023 07:54:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D0662027047;
	Tue, 21 Mar 2023 07:54:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 979E819465A3;
	Tue, 21 Mar 2023 07:54:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F7E11946594
 for <linux-lvm@listman.corp.redhat.com>; Mon, 20 Mar 2023 16:38:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D3EDE40C20FA; Mon, 20 Mar 2023 16:38:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC3DF40C83AC
 for <linux-lvm@redhat.com>; Mon, 20 Mar 2023 16:38:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B017B857FB9
 for <linux-lvm@redhat.com>; Mon, 20 Mar 2023 16:38:06 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-WoB3LmgHNXiavqjF6hL5tA-1; Mon, 20 Mar 2023 12:38:03 -0400
X-MC-Unique: WoB3LmgHNXiavqjF6hL5tA-1
Received: by mail-ed1-f54.google.com with SMTP id eg48so49025805edb.13
 for <linux-lvm@redhat.com>; Mon, 20 Mar 2023 09:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679330282;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Dhh2AZelI4kL4AOVWhu7/w7X92iJh61WMmuzBFAiOw=;
 b=oh0S3cSKXIq5ij+usz6+40kheH1NgSz66s+xg3SaNx4S6C2WUg7nWlJShmAHzSjTPs
 ova6KWJMFTZ3SA1iVY4M2DCRF8W3+GHUMrNc3zLGM5NnvKT4PGb+UJz/6C6zlgDKTL6o
 lHRI6LdenSq+7krP1GkZTEmdBugusswweTW/XKtTfyRq81jbar4/UrY9JLgonqdCIdOj
 Wu4ovvYry++G8Iz1OmiT6FK12WRXUJCvA+rcm+66fkdlsh7S+lxifyyKOyN1Bld17U1N
 7RssmHiPuUt/5PZem3jSovp+KxbZE7mksWZHPojQu/WCoxI3LMFV7ODF21P35UsNoDO8
 tDCA==
X-Gm-Message-State: AO0yUKU9xx3n3wlePaau3vG3+8AA2P8LxMqYrw8X1g4ytRz2XrZuIaRC
 HwGlJt3toENgMCNMDlkD2nH0uubwj/frPTo/Mpr3J9P0TsL10yjK
X-Google-Smtp-Source: AK7set+kth7ZH+E1BmBsV7NL+CCmKvqeFcun8DqWfQLj1UGKhH+YaXB3ZhpvW3zoIeuZ2umQDnh5XGXsXKnoe81HlzY=
X-Received: by 2002:a17:906:ceca:b0:92d:878e:8566 with SMTP id
 si10-20020a170906ceca00b0092d878e8566mr4394017ejb.10.1679330281987; Mon, 20
 Mar 2023 09:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAGhAaddYD7Y8ObY6Q3Yprhruzb8s6-q0t+GJUv5oYGLR3LCpRg@mail.gmail.com>
 <5b9e31d6-2675-8903-619c-cf33c48f1ba8@gmail.com>
 <CAGhAade3Uzobn5amNYVB489NJ-OOj2MFW591eHVaK3ZoEKr15Q@mail.gmail.com>
In-Reply-To: <CAGhAade3Uzobn5amNYVB489NJ-OOj2MFW591eHVaK3ZoEKr15Q@mail.gmail.com>
From: lacsaP Patatetom <patatetom@gmail.com>
Date: Mon, 20 Mar 2023 17:37:34 +0100
Message-ID: <CAGhAaddCmjQeOrdqueHHpM6znVpvMK_vy8XfTxgsMgWPLwyndQ@mail.gmail.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 21 Mar 2023 07:54:18 +0000
Subject: Re: [linux-lvm] LVM and RO device/partition(s)
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2643057528223429277=="

--===============2643057528223429277==
Content-Type: multipart/alternative; boundary="000000000000eb20ba05f7578c6c"

--000000000000eb20ba05f7578c6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi,

I come back to you with the memo mentioned :
https://github.com/patatetom/lvm-on-readonly-block-device
I hope that it will allow you to better understand this problem of
alteration of the disk.

as I mentioned, LVM should normally/theoretically not touch the disk as
long as it is read-only, but what bothers me the most is the fact that I
can't "catch up" by correcting the new 6.1.15 kernel as I did before.

regards, lacsaP.

Le lun. 20 mars 2023 =C3=A0 15:15, lacsaP Patatetom <patatetom@gmail.com> a
=C3=A9crit :

> thank you for this first feedback.
>
> I am writing a memo on github and will communicate the url soon.
>
> my question is in the context of digital investigation which does not
> admit the alteration of the medium.
> of course, there are combinations (/etc/lvm.conf + snap@nbd for example)
> which allow in fine not to alter the media but I don't understand why a
> media set in read-only mode - eg. chmod 444 + blockdev --setro set before
> LVM process - is not protected against LVM modifications...
>
> regards, lacsaP.
>
> Le lun. 20 mars 2023 =C3=A0 15:00, Zdenek Kabelac <zdenek.kabelac@gmail.c=
om> a
> =C3=A9crit :
>
>> Dne 19. 03. 23 v 11:27 Pascal napsal(a):
>> > hi,
>> >
>> > the bio_check_ro function of the blk-core.c source file of the Linux
>> kernel
>> > refers to LVM :
>> >
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/bl=
ock/blk-core.c?h=3Dv6.2.7#n500
>> <
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/bl=
ock/blk-core.c?h=3Dv6.2.7#n500
>> >
>> >
>> > how does LVM currently behave when faced with a device marked as
>> readonly ?
>> > does it automatically switch itself in readonly mode?
>> >
>> > according to some tests carried out in a virtual machine, it seems tha=
t
>> it
>> > doesn't and that LVM modifies the disk/partition(s) even though they
>> are all
>> > readonly (chmod 444 && blockdev --setro).
>>
>>
>> Hi
>>
>> There is no extra logic around RO devices in lvm2.  When lvm2 succeeds
>> opening
>> device in write mode, it'll use it for writing.
>>
>> Also note - when you 'activate' a LV in read-write mode - someone opens
>> such
>> LV/device and you later on 'lvchange' such active LV to read-only mode -
>> all
>> writers will keep writing to such device.
>>
>> It's not quite clear which kind of problem you are actually hitting - so
>> maybe
>> adding some more descriptive  environment +  logs  might give more info
>> about
>> your individual case.
>>
>> Note: root admin typically can overwrite any 'mild' protections...
>>
>> Regards
>>
>> Zdenek
>>
>>

--000000000000eb20ba05f7578c6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi,</div><div><br></div><div>I come back to you with =
the memo mentioned : <a href=3D"https://github.com/patatetom/lvm-on-readonl=
y-block-device">https://github.com/patatetom/lvm-on-readonly-block-device</=
a></div><div>I hope that it will allow you to better understand this proble=
m of alteration of the disk.</div><div><br></div><div>as I mentioned, LVM s=
hould normally/theoretically not touch the disk as long as it is read-only,=
 but what bothers me the most is the fact that I can&#39;t &quot;catch up&q=
uot; by correcting the new 6.1.15 kernel as I did before.</div><div><br></d=
iv><div>regards, lacsaP.<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 20 mars 2023 =C3=A0=C2=A015:=
15, lacsaP Patatetom &lt;<a href=3D"mailto:patatetom@gmail.com">patatetom@g=
mail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div>thank you for this first feedbac=
k.</div><div><br></div><div>I am writing a memo on github and will communic=
ate the url soon.</div><div><br></div>my question is in the context of digi=
tal investigation which does not admit the alteration of the medium.<br><di=
v>of course, there are combinations (/etc/lvm.conf + snap@nbd for example) =
which allow in fine not to alter the media but I don&#39;t understand why a=
 media set in read-only mode - eg. chmod 444 + blockdev --setro set before =
LVM process - is not protected against LVM modifications...</div><div><br><=
/div><div>regards, lacsaP.<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 20 mars 2023 =C3=A0=C2=A01=
5:00, Zdenek Kabelac &lt;<a href=3D"mailto:zdenek.kabelac@gmail.com" target=
=3D"_blank">zdenek.kabelac@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Dne 19. 03. 23 v 11:27 Pas=
cal napsal(a):<br>
&gt; hi,<br>
&gt; <br>
&gt; the bio_check_ro function of the blk-core.c source file of the Linux k=
ernel <br>
&gt; refers to LVM :<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x.git/tree/block/blk-core.c?h=3Dv6.2.7#n500" rel=3D"noreferrer" target=3D"_=
blank">https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tre=
e/block/blk-core.c?h=3Dv6.2.7#n500</a> &lt;<a href=3D"https://git.kernel.or=
g/pub/scm/linux/kernel/git/stable/linux.git/tree/block/blk-core.c?h=3Dv6.2.=
7#n500" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm=
/linux/kernel/git/stable/linux.git/tree/block/blk-core.c?h=3Dv6.2.7#n500</a=
>&gt;<br>
&gt; <br>
&gt; how does LVM currently behave when faced with a device marked as reado=
nly ?<br>
&gt; does it automatically switch itself in readonly mode?<br>
&gt; <br>
&gt; according to some tests carried out in a virtual machine, it seems tha=
t it <br>
&gt; doesn&#39;t and that LVM modifies the disk/partition(s) even though th=
ey are all <br>
&gt; readonly (chmod 444 &amp;&amp; blockdev --setro).<br>
<br>
<br>
Hi<br>
<br>
There is no extra logic around RO devices in lvm2.=C2=A0 When lvm2 succeeds=
 opening <br>
device in write mode, it&#39;ll use it for writing.<br>
<br>
Also note - when you &#39;activate&#39; a LV in read-write mode - someone o=
pens such <br>
LV/device and you later on &#39;lvchange&#39; such active LV to read-only m=
ode - all <br>
writers will keep writing to such device.<br>
<br>
It&#39;s not quite clear which kind of problem you are actually hitting - s=
o maybe <br>
adding some more descriptive=C2=A0 environment +=C2=A0 logs=C2=A0 might giv=
e more info about <br>
your individual case.<br>
<br>
Note: root admin typically can overwrite any &#39;mild&#39; protections...<=
br>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000eb20ba05f7578c6c--

--===============2643057528223429277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============2643057528223429277==--

