Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6288EC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 10 Mar 2022 07:47:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-b9H37mKtNS6oRByud4Wo7Q-1; Thu, 10 Mar 2022 02:46:04 -0500
X-MC-Unique: b9H37mKtNS6oRByud4Wo7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDD7C101AA46;
	Thu, 10 Mar 2022 07:46:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D759040FF711;
	Thu, 10 Mar 2022 07:46:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A7DA1195357E;
	Thu, 10 Mar 2022 07:45:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 24E291953540
 for <linux-lvm@listman.corp.redhat.com>; Wed,  9 Mar 2022 17:17:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F2E2F41136E9; Wed,  9 Mar 2022 17:17:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE01B41136E0
 for <linux-lvm@redhat.com>; Wed,  9 Mar 2022 17:17:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D375B29AB449
 for <linux-lvm@redhat.com>; Wed,  9 Mar 2022 17:17:32 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-yNNC-OqkPtOvxO3i1xjMlQ-1; Wed, 09 Mar 2022 12:17:30 -0500
X-MC-Unique: yNNC-OqkPtOvxO3i1xjMlQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 956CB1F382;
 Wed,  9 Mar 2022 17:17:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5AE8813D7C;
 Wed,  9 Mar 2022 17:17:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NeYUFCnhKGIQFQAAMHmgww
 (envelope-from <mwilck@suse.com>); Wed, 09 Mar 2022 17:17:29 +0000
Message-ID: <7b5a4ea3c3c058b591c30db68bfaa311e9b15657.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Roger Heflin <rogerheflin@gmail.com>, LVM general discussion and
 development <linux-lvm@redhat.com>
Date: Wed, 09 Mar 2022 18:17:28 +0100
In-Reply-To: <CAAMCDedvvBpq3jt6A=+OruDpnwu5qsgRZbU+JFt3PSPq4L4WnQ@mail.gmail.com>
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
 <20220309162711.GA5819@redhat.com>
 <CAAMCDedvvBpq3jt6A=+OruDpnwu5qsgRZbU+JFt3PSPq4L4WnQ@mail.gmail.com>
User-Agent: Evolution 3.42.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Thu, 10 Mar 2022 07:45:56 +0000
Subject: Re: [linux-lvm] LVM autoactivation and udev
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
Cc: Peter Rajnoha <prajnoha@redhat.com>, Heming Zhao <heming.zhao@suse.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-03-09 at 11:07 -0600, Roger Heflin wrote:
>=20
> I have also had luck with making sure multipath is in the initramfs,
> and adding rd.lvm.vg=3D<rootvgnameneededforboot> on the kernel boot
> line
> so that in the initramfs only the VG needed for boot up is started up
> early inside the initramfs.=A0=A0=A0=A0=A0 That has typically let multipa=
thd
> inside the initrd grab any other devices and configure them for
> multipath before LVM=A0 activates them.
>=20

Agreed, tricks like this are often helpful.

My goal is (and has to be, as the maintainer of the multipath package
on a distro) to make this work out of the box, without any
configuration effort on the part of the user, in arbitrary environments
and storage setups. If this stuff fails, users end up in emergency
mode, and with no clue how to recover.=A0

Recent changes in multipath-tools have modified multipathd startup to
occur earlier in the boot sequence, which is a good thing in general,
but tends to increase the visibilty of shortcomings in other layers of
the storage stack.

Regards,
Martin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

