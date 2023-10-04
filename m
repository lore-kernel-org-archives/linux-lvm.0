Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD600E7C4E7
	for <linux-lvm@archiver.kernel.org>; Wed,  4 Oct 2023 18:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696442407;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=oYtGLPFaxF4qotwqvUJ/VYoUp6A0irYLUhZtR3aa5oA=;
	b=OY+ES4aO85YS1SmJ8hVb8qjPel1HXr+uWNIZb5Y+DZCcEF7S9GvC9R3pMmd1E4SL0AqAfP
	R+GSnc18/nHbF28JSsy/KTz87wVLteYLOMZoBOK2M1eIKOfBhmagi2MqKC3MpO9NxJxlIi
	slsDilZWqxNU2VopeCZyiqs26WNsVyI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-e6mnJZkQNRG617uDqlu7FA-1; Wed, 04 Oct 2023 13:59:58 -0400
X-MC-Unique: e6mnJZkQNRG617uDqlu7FA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B486E3C025C8;
	Wed,  4 Oct 2023 17:59:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6A09493113;
	Wed,  4 Oct 2023 17:59:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 80C4219465A2;
	Wed,  4 Oct 2023 17:59:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 641F1194658F
 for <linux-lvm@listman.corp.redhat.com>; Wed,  4 Oct 2023 17:59:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 306465CC01; Wed,  4 Oct 2023 17:59:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27D85440E3
 for <linux-lvm@redhat.com>; Wed,  4 Oct 2023 17:59:48 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A814811E86
 for <linux-lvm@redhat.com>; Wed,  4 Oct 2023 17:59:48 +0000 (UTC)
Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca
 [69.165.217.196]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-wdRp8NQcNjeQ7x7eck4NrA-1; Wed, 04 Oct 2023 13:59:36 -0400
X-MC-Unique: wdRp8NQcNjeQ7x7eck4NrA-1
Received: from pc.interlinx.bc.ca (pc.interlinx.bc.ca
 [IPv6:fd31:aeb1:48df:0:3b14:e643:83d8:7017])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by server.interlinx.bc.ca (Postfix) with ESMTPSA id CE91E2F699
 for <linux-lvm@redhat.com>; Wed,  4 Oct 2023 13:59:34 -0400 (EDT)
Message-ID: <588df601b080ad0f69b36e86fd1d7bcd6380af6e.camel@interlinx.bc.ca>
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: linux-lvm@redhat.com
Date: Wed, 04 Oct 2023 13:59:34 -0400
In-Reply-To: <87wmw2le5j.fsf@vps.thesusis.net>
References: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
 <87pm1wn9j0.fsf@vps.thesusis.net>
 <f510c5de56008c4c74a7d22f267ab2f8e2f37c96.camel@interlinx.bc.ca>
 <87v8boviwj.fsf@vps.thesusis.net>
 <800e8363150ab830a3b2514e3133794e088d242f.camel@interlinx.bc.ca>
 <878r8ksihe.fsf@vps.thesusis.net>
 <d6e03767fe9d155812fc1d6f1e13c1c64f0391d7.camel@interlinx.bc.ca>
 <87wmw2le5j.fsf@vps.thesusis.net>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] Is MD array (containing a PV) reducible?
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
Content-Type: multipart/mixed; boundary="===============3518313018262321911=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10


--===============3518313018262321911==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-sXSSS3hsdeviRdtZkNRX"


--=-sXSSS3hsdeviRdtZkNRX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-10-04 at 09:18 -0400, Phillip Susi wrote:
>=20
> Yep.

Much thanks.

But I did just think of the other benefit of using MD to sync the new
device and that's having a recovery path.

That is, if I add luks-backup to /dev/md0 and then wait for it to
finish syncing, I can then shut down the machine, remove /dev/sdc from
the machine and start it back up and ensure that all of the needed
initialization bits are in place to make the luks component come up and
be readable.  If it is, I just remove it from md0 and use it stand-
alone (as it is itself a RAID-1 recall).  Reboot again to make sure
it's all still working and good.

If any of the above goes sideways, I still have the sdc disk as an md0
member and can put it back in the machine to get back to my starting
position and try again, trying to figure out where I went wrong.

With pvmove, once the move is complete there is no going back to my
starting position if something is not right and I cannot access my new
luks device.

So given that, and given that I have stared my pvmove with --atomic and
--interval, do I just SIGINT the pvmove?  Or should I do pvmove --abort
on another terminal?  How can I know when the the abort is complete and
that I can vgreduce luks-backup out of the backups volume group?

Once I have vgreduced, is there anything I should do to
/dev/mapper/luks-backup before I mdadm --manage /dev/md0 --add
/dev/mapper/luks-backup just to wipe any remnants of it being a PV
previously?

I really do appreciate all of the help, advise and patience you have
given/shown me.

Cheers,
b.


--=-sXSSS3hsdeviRdtZkNRX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEE8B/A+mOVz5cTNBuZ2sHQNBbLyKAFAmUdqAYACgkQ2sHQNBbL
yKB3/wf/TZN/J74PzRtSlxh3nHGNui9ZFCUC9JwBuVsYKBy2qtzwhicfS5tCj85/
UniD+wa/L55UhRwq9WaFKxwu8KtVor+3OzJ7EA+TSBF5jXYz6CMW2o07ft22EEqh
9uK9+9xlXV0nXl7kEd/6NlGluZH5SczJ230p2JVWnS7RCiPnf3iDiGAiNGgATaxw
52RVxVO4ME7oOGqSdbvgE+li1lJu4lWtriTcY3hYHdnEssKn+DBB10eCrqHbGNED
KJ+RTw5ZbgoM9+6haT5kycexRxhqszyWGfbrWjamlCTDPOJpFnnmF+HvBWsORhc8
S9SqnoJwknjgdPEZ05EFEBHB7zHO2g==
=jymQ
-----END PGP SIGNATURE-----

--=-sXSSS3hsdeviRdtZkNRX--


--===============3518313018262321911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============3518313018262321911==--

