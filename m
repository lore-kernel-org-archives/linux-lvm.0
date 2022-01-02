Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DB1C433EF
	for <linux-lvm@archiver.kernel.org>; Mon,  3 Jan 2022 08:04:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-JMOnB2ClPPKt-e_i2QkNfw-1; Mon, 03 Jan 2022 03:04:33 -0500
X-MC-Unique: JMOnB2ClPPKt-e_i2QkNfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15BBF18460E8;
	Mon,  3 Jan 2022 08:04:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4B0B10589CD;
	Mon,  3 Jan 2022 08:04:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE1524CA93;
	Mon,  3 Jan 2022 08:04:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 202NW8hA024650 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 2 Jan 2022 18:32:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9CC23492CA9; Sun,  2 Jan 2022 23:32:08 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9823C492CA6
	for <linux-lvm@redhat.com>; Sun,  2 Jan 2022 23:32:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2018A8011A5
	for <linux-lvm@redhat.com>; Sun,  2 Jan 2022 23:32:08 +0000 (UTC)
Received: from mail.bitfolk.com (use.bitfolk.com [85.119.80.223]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-290-1_PXIY6fPACW3U26IgIDrw-1; Sun, 02 Jan 2022 18:32:06 -0500
X-MC-Unique: 1_PXIY6fPACW3U26IgIDrw-1
Received: from andy by mail.bitfolk.com with local (Exim 4.89)
	(envelope-from <andy@strugglers.net>) id 1n4A1r-0002Lo-1J
	for linux-lvm@redhat.com; Sun, 02 Jan 2022 23:12:43 +0000
Date: Sun, 2 Jan 2022 23:12:42 +0000
From: Andy Smith <andy@strugglers.net>
To: linux-lvm@redhat.com
Message-ID: <20220102231242.jebpzbtuxgio7l2m@bitfolk.com>
References: <97c9434a-d291-dc92-4418-89ab2c7d48e1@web.de>
MIME-Version: 1.0
In-Reply-To: <97c9434a-d291-dc92-4418-89ab2c7d48e1@web.de>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false
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
X-Mailman-Approved-At: Mon, 03 Jan 2022 03:04:08 -0500
Subject: Re: [linux-lvm] convert logical sector -> physical sector + pv/vg
 extent number
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
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Roland,

On Sun, Jan 02, 2022 at 08:00:30PM +0100, Roland wrote:
> if i have a logical sector/block "x" on a lvm logical volume ,=A0 is ther=
e
> a way to easily calculate/determine (optimally by script/cli) the
> corresponding physical sector of the physical device it belongs to and
> the extent number of the appropiate pv/vg where it resides ?

lvdisplay --maps /path/to/lv

tells you all the mappings of logical extents within the LV to
physical extents within the PV.

pvdisplay --units s /dev/yourpv | grep 'PE Size'

tells you the size of a physical extent in sectors.

Between those you can work out the sector number on the physical
device for a sector number on a logical volume.

Cheers,
Andy

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

