Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70448C433FE
	for <linux-lvm@archiver.kernel.org>; Tue, 18 Oct 2022 07:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666077057;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7FDFGry53fO/IzlFfd4KIcnvewuJ+XE1N2m3YKL99ik=;
	b=GGAYzNnL6fwKdsIOk+Hm8O/Nv72RLRF/SftJtyzQkwAN+3C4MB8urMBaoGeJBkAhnqh/TL
	UdMqPDZRzY9P+iMGtnlov191gF/wfkNo7upAiB7R3Nx08FR23hfMegvvJi8vUIFRy0T+HZ
	hz0TVj72X7ro/NK1FcoUqcVg0yyJt2k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-bNwPG7NHMluRyopQWwdpVA-1; Tue, 18 Oct 2022 03:10:53 -0400
X-MC-Unique: bNwPG7NHMluRyopQWwdpVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56DDF101A52A;
	Tue, 18 Oct 2022 07:10:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A14F6404CD9A;
	Tue, 18 Oct 2022 07:10:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 76B771946595;
	Tue, 18 Oct 2022 07:10:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A6FF6194658F
 for <linux-lvm@listman.corp.redhat.com>; Mon, 17 Oct 2022 14:06:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54E98F1C6C; Mon, 17 Oct 2022 14:06:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A0AAE56C1
 for <linux-lvm@redhat.com>; Mon, 17 Oct 2022 14:06:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DB54101E14E
 for <linux-lvm@redhat.com>; Mon, 17 Oct 2022 14:06:55 +0000 (UTC)
Received: from qproxy5-pub.mail.unifiedlayer.com
 (qproxy5-pub.mail.unifiedlayer.com [69.89.21.30]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-L7AKZEC9NGmsgmfQcITQsg-1; Mon, 17 Oct 2022 10:06:52 -0400
X-MC-Unique: L7AKZEC9NGmsgmfQcITQsg-1
Received: from progateway7-pub.mail.pro1.eigbox.com
 (gproxy5-pub.mail.unifiedlayer.com [67.222.38.55])
 by qproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id 9599680317E4
 for <linux-lvm@redhat.com>; Mon, 17 Oct 2022 13:42:34 +0000 (UTC)
Received: from cmgw15.mail.unifiedlayer.com (unknown [10.0.90.130])
 by progateway7.mail.pro1.eigbox.com (Postfix) with ESMTP id 30B0010048EAF
 for <linux-lvm@redhat.com>; Mon, 17 Oct 2022 13:41:55 +0000 (UTC)
Received: from just2098.justhost.com ([173.254.31.45]) by cmsmtp with ESMTP
 id kQNPoUX2BjpD5kQNPouIap; Mon, 17 Oct 2022 13:41:55 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=T8NJ89GQ c=1 sm=1 tr=0 ts=634d5ba3
 a=0Zc1vavb5vNBbqz++vQv9A==:117 a=0Zc1vavb5vNBbqz++vQv9A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=Qawa6l4ZSaYA:10:nop_rcvd_month_year
 a=8QztvWECkzkA:10:endurance_base64_authed_username_1 a=D4Z0WP6xAAAA:8
 a=20KFwNOVAAAA:8 a=bVP7E8VSAAAA:8 a=tJ3oZm-RVdATLah63ywA:9
 a=QEXdDO2ut3YA:10:nop_charset_2 a=nxjFtI7YAAAA:8 a=Fj_eLlKyc1sR4obUV9YA:9
 a=wv7fXov7ziUh98RQ:21 a=_W_S_7VecoQA:10:nop_html
 a=lqcHg5cX4UMA:10:nop_bhvr_url2_hostname_empty a=OM-w93lT3GBXgmXbpMkA:9
 a=FfaGCDsud1wA:10:nop_attachment_filename_extension_2
 a=Ry2eTNIdGMwtTGQdmMb7:22 a=RrVVlEIVwThieI2FerfX:22 a=Ly10aoh6cllcPZKPqPQE:22
 a=_kLHa3j7RrPeVGgi_DZP:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=erwinvanlonden.net; s=default; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SlNn4pTdoAgG1m7A7yhp3BQLZF3KMuR7MaGsjoGUHq0=; b=gqdoNQYb6p2h4PSZo0Al+XoJ5S
 t+iFied0Gn1jxzWXG7dwuPCLQM+FqK1Rrh4KA1NUh5gdvwuCbSPxXeSRIv8fPKgdusZobCa28eGVJ
 fN8/l7uLitsqrspd3OfDOgc+Eyi/Jfqr27b/ho7gv6W8SqXBpJ+gwAtqr1FafjPUN0QuNQqepTP55
 Gm9vIC1FzxmKQfRTZaCmbOBp+NfHhOBHTkC7Ngg80bUd/t8fSBaYk0l0Po0VYHIlR6GDerDMKQmpK
 MmQjaiYQYDvZ86dO1wznLwCzQbQ1gB36llhigNuJMMKd0+wC63PUKu87lXPF2nz6/pULqD1/ehLBx
 6pYkui8g==;
Received: from 116-240-66-4.sta.dodo.net.au ([116.240.66.4]:33340
 helo=[10.69.1.104])
 by just2098.justhost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <erwin@erwinvanlonden.net>) id 1okQNO-001M98-Ep
 for linux-lvm@redhat.com; Mon, 17 Oct 2022 07:41:54 -0600
Message-ID: <2cb2e4787c7b4c30b67ec0d171f5b1f3aa9a9f71.camel@erwinvanlonden.net>
From: Erwin van Londen <erwin@erwinvanlonden.net>
To: linux-lvm@redhat.com
Date: Mon, 17 Oct 2022 23:41:44 +1000
In-Reply-To: <0e032336-8658-5686-3dfb-0e50cdcb7d91@gmail.com>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <91261aec-d0fd-7884-1f38-a575b4e540e2@gmail.com>
 <SI2P153MB0444EE48C7C6E92FB448262ED7249@SI2P153MB0444.APCP153.PROD.OUTLOOK.COM>
 <0e032336-8658-5686-3dfb-0e50cdcb7d91@gmail.com>
Organization: EvL Consulting
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - just2098.justhost.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - erwinvanlonden.net
X-BWhitelist: no
X-Source-IP: 116.240.66.4
X-Source-L: No
X-Exim-ID: 1okQNO-001M98-Ep
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 116-240-66-4.sta.dodo.net.au ([10.69.1.104])
 [116.240.66.4]:33340
X-Source-Auth: erwin@erwinvanlonden.net
X-Email-Count: 1
X-Source-Cap: aGl0YWNoaTE7aGl0YWNoaTE7anVzdDIwOTguanVzdGhvc3QuY29t
X-Local-Domain: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 18 Oct 2022 07:10:45 +0000
Subject: Re: [linux-lvm] [EXTERNAL] Re: LVM2 : performance drop even after
 deleting the snapshot
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
Content-Type: multipart/mixed; boundary="===============4654760674950068345=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2


--===============4654760674950068345==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-0Cv2WFWSBIV4UobCpb3X"


--=-0Cv2WFWSBIV4UobCpb3X
Content-Type: multipart/alternative; boundary="=-ii4bWuCLhFTeix4ZrPR2"


--=-ii4bWuCLhFTeix4ZrPR2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=46rom the looks of it the disk, as provisioned out of an Azure pool, is
likely backed by an enterprise raid array. When you provision the pools
with =C2=A0discard_passdown the removal of the snapshot will also be pushed
down to the underlying hypervisor or disk array. You would need to wait
till that process is completed in order to make any comparisons.

ThinVolGrp-ThinDataLV-tpool: 0 1006632960 thin-pool 1 4878/4145152
8325/7864320 - rw discard_passdown queue_if_no_space - 1024

As per man page

--discards passdown|nopassdown|ignore
Specifies how the device-mapper thin pool layer in the kernel should
handle discards. ignore causes the thin pool to ignore discards.
nopassdown causes the
thin pool to process discards itself to allow reuse of unneeded extents
in the thin pool. passdown causes the thin pool to process discards
itself (like
nopassdown) and pass the discards to the underlying device.=C2=A0

Try the same operation after changing the thin volume

lvchange --discards nopassdown VG/ThinPoolLV



--=20
Kind regards,
Erwin van LondenEvL Consulting
ABN 43 560 744 507

Mobile+61-434-325795Phone+61-7-
53213176Webhttp://erwinvanlonden.netConferencehttps://iene.3cx.com.au/meet/=
erwinvlwebmeet
Web Talkhttps://iene.3cx.com.au/callus/#erwinvlwebphone


On Mon, 2022-10-17 at 15:10 +0200, Zdenek Kabelac wrote:
> Dne 14. 10. 22 v 21:31 Mitta Sai Chaithanya napsal(a):
> > Hi Zdenek Kabelac,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thanks for=
 your quick reply and suggestions.
> >=20
> > We conducted couple of tests on Ubuntu 22.04 and observed similar
> > performance=20
> > behavior post thin snapshot deletion without writing any data
> > anywhere.
> >=20
> > *Commands used to create Thin LVM volume*:
> > - lvcreate=C2=A0=C2=A0-L 480G --poolmetadataspare n --poolmetadatasize =
16G=20
> > --chunksize=3D64K --thinpool=C2=A0=C2=A0ThinDataLV ThinVolGrp
> > - lvcreate -n ext4.ThinLV -V 100G --thinpool ThinDataLV ThinVolGrp
>=20
>=20
> Hi
>=20
> So now it's clear you are talking about thin snapshots - this is a
> very=20
> different story going on here (as we normally use term "COW" volumes
> for thick=20
> old snapshots)
>=20
> I'll consult more with thinp author - however it does look to me you
> are using=20
> same device to store=C2=A0 data & metadata.
>=20
> This is always a highly sub-optimal solution - the metadata device is
> likely=20
> best to be stored on fast (low latency) devices.
>=20
> So my wild guess - you are possibly using rotational device backend
> to store=20
> your=C2=A0 thin-pools metadata volume and then your setups gets very
> sensitive on=20
> the metadata fragmentation.
>=20
> Thin-pool was designed to be used with SSD/NVMe for metadata which is
> way less=20
> sensitive on seeking.
>=20
> So when you 'create' snapshot - metadata gets updated - when you
> remove thin=20
> snapshot - metadata gets again a lots of changes (especially when
> your origin=20
> volume is already populated) - and fragmentation is inevitable and
> you are=20
> getting high penalty of holding metadata device on the same drive as
> your data=20
> device.
>=20
> So while there are some plans to improve some metadata logistic - I'd
> not=20
> expect miracles on you particular setup - I'd highly recommend to
> plug-in some=20
> =C2=A0 SSD/NVMe storage for storing your thinpool metadata - this is the
> way to go=20
> to get better 'benchmarking' numbers here.
>=20
> For an improvement on your setup - try to seek larger chunk size
> values where=20
> your data 'sharing' is still reasonably valuable - this depends on
> data-type=20
> usage - but chunk size 256K might be possibly a good compromise (with
> disabled=20
> zeroing - if you hunt for the best performance).
>=20
>=20
> Regards
>=20
> Zdenek
>=20
> PS: later mails suggest you are using some 'MS Azure' devices?? - so
> please=20
> redo your testing with your local hardware/storage - where you have
> precise=20
> guarantees of storage drive performance - testing in the Cloud is
> random by=20
> design....
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=-ii4bWuCLhFTeix4ZrPR2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>From the looks of it the disk, as provisioned=
 out of an Azure pool, is likely backed by an enterprise raid array. When y=
ou provision the pools with &nbsp;discard_passdown the removal of the snaps=
hot will also be pushed down to the underlying hypervisor or disk array. Yo=
u would need to wait till that process is completed in order to make any co=
mparisons.</div><div><br></div><div><div><span style=3D"caret-color: rgb(36=
, 36, 36); color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, sans-=
serif; font-size: 14px; text-indent: 48px;">ThinVolGrp-ThinDataLV-tpool: 0 =
1006632960 thin-pool 1 4878/4145152 8325/7864320 - rw discard_passdown queu=
e_if_no_space - 1024</span></div></div><div><br></div><div>As per man page<=
/div><div><br></div><div>--discards passdown|nopassdown|ignore</div><div>  =
            Specifies how the device-mapper thin pool layer in the kernel s=
hould handle discards.  ignore causes the thin pool to ignore discards.  no=
passdown causes the</div><div>              thin pool to process discards i=
tself to allow reuse of unneeded extents in the thin pool.  passdown causes=
 the thin pool to process discards itself (like</div><div>              nop=
assdown) and pass the discards to the underlying device.&nbsp;</div><div><b=
r></div><div>Try the same operation after changing the thin volume</div><di=
v><br></div><div>lvchange --discards nopassdown VG/ThinPoolLV</div><div><br=
></div><div><br></div><div><br></div><div><span><pre>-- <br></pre>Kind rega=
rds,<br>Erwin van Londen<div>EvL Consulting</div><div>ABN 43 560 744 507<br=
><br><table width=3D"334px" align=3D"left" bgcolor=3D"#ffffff" border=3D"0"=
><tbody><tr><td>Mobile</td><td>+61-434-325795</td></tr><tr><td>Phone</td><t=
d>+61-7-53213176</td></tr><tr><td>Web</td><td><a href=3D"http://erwinvanlon=
den.net/">http://erwinvanlonden.net</a></td></tr><tr><td>Conference</td><td=
><a href=3D"https://iene.3cx.com.au/meet/erwinvlwebmeet">https://iene.3cx.c=
om.au/meet/erwinvlwebmeet</a></td></tr><tr><td>Web Talk</td><td><a href=3D"=
https://iene.3cx.com.au/callus/#erwinvlwebphone">https://iene.3cx.com.au/ca=
llus/#erwinvlwebphone</a></td></tr><tr><td></td><td></td></tr></tbody></tab=
le><br><div><br></div></div></span></div><div><br></div><div>On Mon, 2022-1=
0-17 at 15:10 +0200, Zdenek Kabelac wrote:</div><blockquote type=3D"cite" s=
tyle=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">=
<div>Dne 14. 10. 22 v 21:31 Mitta Sai Chaithanya napsal(a):<br></div><block=
quote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf sol=
id;padding-left:1ex"><div>Hi Zdenek Kabelac,<br></div><div>&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks for your quick reply an=
d suggestions.<br></div><div><br></div><div>We conducted couple of tests on=
 Ubuntu 22.04 and observed similar performance <br></div><div>behavior post=
 thin snapshot deletion without writing any data anywhere.<br></div><div><b=
r></div><div>*Commands used to create Thin LVM volume*:<br></div><div>- lvc=
reate&nbsp;&nbsp;-L 480G --poolmetadataspare n --poolmetadatasize 16G <br><=
/div><div>--chunksize=3D64K --thinpool&nbsp;&nbsp;ThinDataLV ThinVolGrp<br>=
</div><div>- lvcreate -n ext4.ThinLV -V 100G --thinpool ThinDataLV ThinVolG=
rp<br></div></blockquote><div><br></div><div><br></div><div>Hi<br></div><di=
v><br></div><div>So now it's clear you are talking about thin snapshots - t=
his is a very <br></div><div>different story going on here (as we normally =
use term "COW" volumes for thick <br></div><div>old snapshots)<br></div><di=
v><br></div><div>I'll consult more with thinp author - however it does look=
 to me you are using <br></div><div>same device to store&nbsp; data &amp; m=
etadata.<br></div><div><br></div><div>This is always a highly sub-optimal s=
olution - the metadata device is likely <br></div><div>best to be stored on=
 fast (low latency) devices.<br></div><div><br></div><div>So my wild guess =
- you are possibly using rotational device backend to store <br></div><div>=
your&nbsp; thin-pools metadata volume and then your setups gets very sensit=
ive on <br></div><div>the metadata fragmentation.<br></div><div><br></div><=
div>Thin-pool was designed to be used with SSD/NVMe for metadata which is w=
ay less <br></div><div>sensitive on seeking.<br></div><div><br></div><div>S=
o when you 'create' snapshot - metadata gets updated - when you remove thin=
 <br></div><div>snapshot - metadata gets again a lots of changes (especiall=
y when your origin <br></div><div>volume is already populated) - and fragme=
ntation is inevitable and you are <br></div><div>getting high penalty of ho=
lding metadata device on the same drive as your data <br></div><div>device.=
<br></div><div><br></div><div>So while there are some plans to improve some=
 metadata logistic - I'd not <br></div><div>expect miracles on you particul=
ar setup - I'd highly recommend to plug-in some <br></div><div>&nbsp; SSD/N=
VMe storage for storing your thinpool metadata - this is the way to go <br>=
</div><div>to get better 'benchmarking' numbers here.<br></div><div><br></d=
iv><div>For an improvement on your setup - try to seek larger chunk size va=
lues where <br></div><div>your data 'sharing' is still reasonably valuable =
- this depends on data-type <br></div><div>usage - but chunk size 256K migh=
t be possibly a good compromise (with disabled <br></div><div>zeroing - if =
you hunt for the best performance).<br></div><div><br></div><div><br></div>=
<div>Regards<br></div><div><br></div><div>Zdenek<br></div><div><br></div><d=
iv>PS: later mails suggest you are using some 'MS Azure' devices?? - so ple=
ase <br></div><div>redo your testing with your local hardware/storage - whe=
re you have precise <br></div><div>guarantees of storage drive performance =
- testing in the Cloud is random by <br></div><div>design....<br></div><div=
><br></div><div>_______________________________________________<br></div><d=
iv>linux-lvm mailing list<br></div><div><a href=3D"mailto:linux-lvm@redhat.=
com">linux-lvm@redhat.com</a><br></div><div><a href=3D"https://listman.redh=
at.com/mailman/listinfo/linux-lvm">https://listman.redhat.com/mailman/listi=
nfo/linux-lvm</a><br></div><div>read the LVM HOW-TO at <a href=3D"http://tl=
dp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></div></bl=
ockquote></body></html>

--=-ii4bWuCLhFTeix4ZrPR2--

--=-0Cv2WFWSBIV4UobCpb3X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABAgAdFiEECs4noK6S/O3i8ikZKyLwPQgKSVMFAmNNW5gACgkQKyLwPQgK
SVNNQQwAqJD0WZdWgyAuwSWJJFUi56bXSbjNiaZrgnKlNo7aNRzyrKtHOlPd+SlA
AHr7oa2HrsGtlkwoFR9U8M0S76EjOhiP5Nv6UYnIYTTZJxFJR8ig2F3zimWrWMVQ
gEXkEbCM3fR+5bZVMoRfcykm1yAnSDXAHm/K9jSqHpn8xtCnUlYoRca7NxakeSux
gbYvRPDVeNtoFCj/v+yPdvnofePH59N+IhA8lqdpss37yGGXz4VxXxCMHNMyjn1Z
+JdRHamSLCQbOKsbaXB71t1jFY5RZaA4owelYcHDZKF6iNr9bbltNfDL4cBwBtXw
KJnZ55q/2c4sRjLfSaY6qRERtD7x/uiJXlEI0u2/+cgRs4yMBQRagFDIcUBs7p3m
d/GYEZGCfsKf3IWXWWe6HplXG8KzG62PfuQFm50ujuG7FI/x+i04ocS6hl1xmBdS
N0vSPDFIV7e4+9DqiA2B8LiXCEaQtIgCGGp4MAi9pnuSzy02erRksHSxynZPwTy3
kEIzQxwK
=xGkU
-----END PGP SIGNATURE-----

--=-0Cv2WFWSBIV4UobCpb3X--


--===============4654760674950068345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============4654760674950068345==--

