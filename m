Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB19BC43334
	for <linux-lvm@archiver.kernel.org>; Wed,  1 Jun 2022 21:58:47 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-THH6A67hOT2pjTD85qGp2A-1; Wed, 01 Jun 2022 17:58:42 -0400
X-MC-Unique: THH6A67hOT2pjTD85qGp2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33FD32806947;
	Wed,  1 Jun 2022 21:58:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12334404754D;
	Wed,  1 Jun 2022 21:58:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D11D81947B89;
	Wed,  1 Jun 2022 21:58:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 232CE1947B88
 for <linux-lvm@listman.corp.redhat.com>; Wed,  1 Jun 2022 21:58:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 060AA40CFD0A; Wed,  1 Jun 2022 21:58:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02251400F75F
 for <linux-lvm@redhat.com>; Wed,  1 Jun 2022 21:58:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE2713C138B1
 for <linux-lvm@redhat.com>; Wed,  1 Jun 2022 21:58:33 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
 [172.104.24.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-jmezmiwJOK6cWbozId3xMQ-1; Wed, 01 Jun 2022 17:58:32 -0400
X-MC-Unique: jmezmiwJOK6cWbozId3xMQ-1
Received: from quad.stoffel.org (068-116-170-226.res.spectrum.com
 [68.116.170.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.stoffel.org (Postfix) with ESMTPSA id BC8CF1E18A
 for <linux-lvm@redhat.com>; Wed,  1 Jun 2022 17:58:31 -0400 (EDT)
Received: by quad.stoffel.org (Postfix, from userid 1000)
 id 4142DA7C48; Wed,  1 Jun 2022 17:58:31 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <25239.57607.208850.622855@quad.stoffel.home>
Date: Wed, 1 Jun 2022 17:58:31 -0400
From: "John Stoffel" <john@stoffel.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <617ddb5b-3993-8d9a-fac2-32f457077c60@syseleven.de>
References: <4ea715cc-3a58-bb47-af41-f40e630f93f3@syseleven.de>
 <25234.19124.329350.465135@quad.stoffel.home>
 <e86ef2bc-84f5-188c-cde4-5848a1c95648@syseleven.de>
 <617ddb5b-3993-8d9a-fac2-32f457077c60@syseleven.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [linux-lvm] raid10 with missing redundancy,
 but health status claims it is ok.
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>>>>> "Olaf" =3D=3D Olaf Seibert <o.seibert@syseleven.de> writes:

Olaf> Replying to myself:
Olaf> On 30.05.22 10:16, Olaf Seibert wrote:
>> First, John, thanks for your reply.

Olaf> I contacted the customer and it turned out their VM's disk (this
Olaf> LV) was broken anyway. So there is no need any more to try to
Olaf> repair it...

So I'm not really surprised, because when that disk dies, it probably
took out their data, or at least a chunk of it, so even though it
looks like it might have kept running, it probably also got corrupted
in a big way too. =20


So I think you guys need to re-architect your storage design.  If you
have paying customers on there, you should really be using MD with
RAID10, and a hot spare disk on there as well, so when a disk dies, it
can be automatically replaced, even if it fails at 2am in the
morning.  It's not cheap, but neither is a customer losing data. =20

The other critical thing to do here is to make sure you're using disks
with proper SCTERC timeouts, so that when they have problems, the
disks just fail quickly, without blocking the system and causing
outages.

Look back in the linux-raid mailing list archives for discussions on
this.

And of course I'd also try to setup a remote backup server with even
bigger disks, so that you can replicate customer data onto other
storage just in case. =20

Olaf> Thanks for your thoughts anyway.

Glad I could try to help, been flat out busy with $WORK and just now
following up here.  Sorry!

Olaf> --=20
Olaf> SysEleven GmbH
Olaf> Boxhagener Stra=DFe 80
Olaf> 10245 Berlin

Olaf> T +49 30 233 2012 0
Olaf> F +49 30 616 7555 0

Olaf> http://www.syseleven.de
Olaf> http://www.facebook.com/SysEleven
Olaf> https://www.instagram.com/syseleven/

Olaf> Aktueller System-Status immer unter:
Olaf> http://www.twitter.com/syseleven

Olaf> Firmensitz: Berlin
Olaf> Registergericht: AG Berlin Charlottenburg, HRB 108571 B
Olaf> Gesch=E4ftsf=FChrer: Marc Korthaus, Jens Ihlenfeld, Andreas Hermann

Olaf> _______________________________________________
Olaf> linux-lvm mailing list
Olaf> linux-lvm@redhat.com
Olaf> https://listman.redhat.com/mailman/listinfo/linux-lvm
Olaf> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

