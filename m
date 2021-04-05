Return-Path: <SRS0=b3wJ=JD=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88380C433ED
	for <linux-lvm@archiver.kernel.org>; Tue,  6 Apr 2021 11:41:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F9D61394
	for <linux-lvm@archiver.kernel.org>; Tue,  6 Apr 2021 11:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F9D61394
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=erwinvanlonden.net
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-V5k3PYMzOiyE-LrvwEQuew-1; Tue, 06 Apr 2021 07:41:31 -0400
X-MC-Unique: V5k3PYMzOiyE-LrvwEQuew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14175846378;
	Tue,  6 Apr 2021 11:41:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1864960C17;
	Tue,  6 Apr 2021 11:41:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C056E4A7C8;
	Tue,  6 Apr 2021 11:41:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1351TUl3004177 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 4 Apr 2021 21:29:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC37F2026D64; Mon,  5 Apr 2021 01:29:30 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6C552026D46
	for <linux-lvm@redhat.com>; Mon,  5 Apr 2021 01:29:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C5EF805C1D
	for <linux-lvm@redhat.com>; Mon,  5 Apr 2021 01:29:28 +0000 (UTC)
Received: from gateway21.websitewelcome.com (gateway21.websitewelcome.com
	[192.185.45.155]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-403-7gavAer_PcakCmCmbC95-g-1; Sun, 04 Apr 2021 21:29:25 -0400
X-MC-Unique: 7gavAer_PcakCmCmbC95-g-1
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
	by gateway21.websitewelcome.com (Postfix) with ESMTP id 997A9400CE381
	for <linux-lvm@redhat.com>; Sun,  4 Apr 2021 20:04:55 -0500 (CDT)
Received: from just2098.justhost.com ([173.254.31.45]) by cmsmtp with SMTP
	id TDfjlG9z5PkftTDfjlhc3z; Sun, 04 Apr 2021 20:04:55 -0500
X-Authority-Reason: nr=8
Received: from 116-240-66-4.sta.dodo.net.au ([116.240.66.4]:48190
	helo=[192.168.1.104])
	by just2098.justhost.com with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <erwin@erwinvanlonden.net>) id 1lTDfi-001UCf-K9
	for linux-lvm@redhat.com; Sun, 04 Apr 2021 19:04:55 -0600
Message-ID: <c9f3d5c03f27e73c11ec6a033d09c49eda26564c.camel@erwinvanlonden.net>
From: Erwin van Londen <erwin@erwinvanlonden.net>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <20210404181856.6hevvwxwyflsm373@helios>
References: <20210404181856.6hevvwxwyflsm373@helios>
Date: Mon, 05 Apr 2021 10:59:46 +1000
MIME-Version: 1.0
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - just2098.justhost.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - erwinvanlonden.net
X-BWhitelist: no
X-Source-IP: 116.240.66.4
X-Source-L: No
X-Exim-ID: 1lTDfi-001UCf-K9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 116-240-66-4.sta.dodo.net.au ([192.168.1.104])
	[116.240.66.4]:48190
X-Source-Auth: erwin@erwinvanlonden.net
X-Email-Count: 1
X-Source-Cap: aGl0YWNoaTE7aGl0YWNoaTE7anVzdDIwOTguanVzdGhvc3QuY29t
X-Local-Domain: yes
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 06 Apr 2021 07:35:42 -0400
Subject: Re: [linux-lvm] move dm-integrity metadata to another PV
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0304696234209733229=="

--===============0304696234209733229==
Content-Type: multipart/alternative; boundary="=-CnuNmOUDYBgIXxaoCjgE"

--=-CnuNmOUDYBgIXxaoCjgE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe an idea to add a cache volume to the LV?? Not 100% sure if this
works but would be nice to try.

On Sun, 2021-04-04 at 20:18 +0200, Sebastian Bachmann wrote:
> Hello,
>=20
> I played around with the new dm-integrity integration in lvm.
> Unfortunately, it
> is very slow, as the checksums has to be written and read on - which
> is the
> price to pay obviously.
>=20
> I thought that it might be a good idea to move the metadata to a fast
> disk,
> i.e., a SSD, however that is not possible and I get an error message
> on pvmove:
>=20
> # pvmove -n r10_int_rimage_0_imeta /dev/sdd /dev/sda2
> =C2=A0 Unable to pvmove device used for raid with integrity.
>=20
> I could not find a reason why this should not be done in theory, thus
> I guess
> that this is simply not supported by LVM right now?
> Or is there another reason why you should keep the metadata always on
> the same
> device?
>=20
> Best,
> Sebastian
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

--=-CnuNmOUDYBgIXxaoCjgE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>Maybe an idea to add a cache volume to the LV=
?? Not 100% sure if this works but would be nice to try.</div><div><span></=
span></div><div><br></div><div>On Sun, 2021-04-04 at 20:18 +0200, Sebastian=
 Bachmann wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;=
 border-left:2px #729fcf solid;padding-left:1ex"><div>Hello,<br></div><div>=
<br></div><div>I played around with the new dm-integrity integration in lvm=
. Unfortunately, it<br></div><div>is very slow, as the checksums has to be =
written and read on - which is the<br></div><div>price to pay obviously.<br=
></div><div><br></div><div>I thought that it might be a good idea to move t=
he metadata to a fast disk,<br></div><div>i.e., a SSD, however that is not =
possible and I get an error message on pvmove:<br></div><div><br></div><div=
># pvmove -n r10_int_rimage_0_imeta /dev/sdd /dev/sda2<br></div><div>&nbsp;=
 Unable to pvmove device used for raid with integrity.<br></div><div><br></=
div><div>I could not find a reason why this should not be done in theory, t=
hus I guess<br></div><div>that this is simply not supported by LVM right no=
w?<br></div><div>Or is there another reason why you should keep the metadat=
a always on the same<br></div><div>device?<br></div><div><br></div><div>Bes=
t,<br></div><div>Sebastian<br></div><div><br></div><div>___________________=
____________________________<br></div><div>linux-lvm mailing list<br></div>=
<div><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br></=
div><div><a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm">=
https://listman.redhat.com/mailman/listinfo/linux-lvm</a><br></div><div>rea=
d the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tld=
p.org/HOWTO/LVM-HOWTO/</a><br></div><div><br></div></blockquote></body></ht=
ml>

--=-CnuNmOUDYBgIXxaoCjgE--

--===============0304696234209733229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0304696234209733229==--

