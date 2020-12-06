Return-Path: <SRS0=C8ll=FK=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B742DC4361B
	for <linux-lvm@archiver.kernel.org>; Sun,  6 Dec 2020 21:07:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BABF22D08
	for <linux-lvm@archiver.kernel.org>; Sun,  6 Dec 2020 21:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BABF22D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-72U_1c_pMwSxOTYr1Rg9yQ-1; Sun, 06 Dec 2020 16:07:29 -0500
X-MC-Unique: 72U_1c_pMwSxOTYr1Rg9yQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F241B800D62;
	Sun,  6 Dec 2020 21:07:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C8F960BE2;
	Sun,  6 Dec 2020 21:07:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2D3B1809C9F;
	Sun,  6 Dec 2020 21:07:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B6L6tak003191 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 6 Dec 2020 16:06:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1462E2029F6C; Sun,  6 Dec 2020 21:06:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F6452029F6B
	for <linux-lvm@redhat.com>; Sun,  6 Dec 2020 21:06:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97C56100B165
	for <linux-lvm@redhat.com>; Sun,  6 Dec 2020 21:06:52 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1607288812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	dkim-signature; bh=FZ3DNTY+Ly/k1LQvLYUipeSb3vyvK1C78iC4Gyk0U6o=;
	b=eh01ZavCTNzMF+KQICSMDoHo5R3vOHngGxsu6udLCUeHZ9/AuE4x4cFvWXUTcc1ErVjlLD
	4jUEaJIOqfXp9kZRmoxts5A6PdmPjGy2LePfNysDJrl5mqQv/R479vfoJvHrvtQU0arh0u
	NLAJG+6B9sLe7/qIwj605hSZUF/lGI4TUPhOdyQXtHwObBhc10kIKDDs4t1aoHxrZnRUpn
	7XP9xfRSjH7Am1k2kULZT77wQqHHRCZARZH4x1P348S6gHEMChlnIk00JztG3GhVSOhzDk
	zHKcmpPU5XdlDPZHd5yQnmWqkShAx2Q6kT+Zt0Yk90ltNS2iMD390eU+lmXmvg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1607288812; a=rsa-sha256;
	cv=none;
	b=njZCNenVJ2gn/hbDSUYHmB7Kzy5KuEYBcWUoCAkI5G7l53QupCOHxv9dNfzSZ8xaU6cUsY
	w/1BYOHYbA0akmvS+bXXVYkYYeUKhYZbplz5xyEP3HsUe8oz+xYhspLH6Z3FAvHVQxmxcZ
	C56yRk4JX9j/mHZrH0g+dKTqFHN7qt5eZ6vkQ6fkNuiE7ExHSl68V9+TcLKDRT9lfzvx+W
	yRJei3sfUIObl4lk7pyDZa+wejbLKZkNoFlBqD48RLVO8UhQdW1L7ymLmdZz3hkCnwBk2R
	qmFm4DInie0HCMzsGixd9AunvZmudU/c0Pj3zF/FyFCoY8oBu/pZA02s6djsQg==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=gmx.net header.s=badeba3b8450 header.b=Drscer8F;
	dmarc=pass (policy=none) header.from=gmx.net;
	spf=pass (relay.mimecast.com: domain of devurandom@gmx.net designates
	212.227.17.20 as permitted sender)
	smtp.mailfrom=devurandom@gmx.net
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-565-gvSupWqIN_ez2CuCScyd7g-1;
	Sun, 06 Dec 2020 16:06:49 -0500
X-MC-Unique: gvSupWqIN_ez2CuCScyd7g-1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1607288808;
	bh=7CQNAEsYFZdx8egmSdwE1ZSY/n7eFbNsEF6fQdc4cHc=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=Drscer8FoAevrTvQzxH6ptOX3hpDbtBo4zNOiXNUUDizh/qQCeJJ+vl9VNJHPbR2Q
	JRO+WIvyQDmqHCMDEb452kQFhUQq7o3uuKuLdqRH+sefCs2H7DkGoNb9pJ22TAPOay
	nzmQ/W6c+8WcMuLuQ2kRAf+IeK5DxeroWL+UVng8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from monk.localnet ([79.211.252.228]) by mail.gmx.com (mrgmx105
	[212.227.17.168]) with ESMTPSA (Nemesis) id 1MHoRK-1kyiCN3otq-00ExyR
	for <linux-lvm@redhat.com>; Sun, 06 Dec 2020 22:01:45 +0100
From: Dennis Schridde <devurandom@gmx.net>
To: linux-lvm@redhat.com
Date: Sun, 06 Dec 2020 22:01:37 +0100
Message-ID: <4384449.LvFx2qVVIh@monk>
MIME-Version: 1.0
X-Provags-ID: V03:K1:3JchekstvymsZUVo3nRMQOKGRzLDziIsGBstGj+fKA7VB4yXsQJ
	F3xFPzKNpnc36lPS9kc0iZ+05IOlDgpS/KPQTwLxPyoXf/q7zBPbSnEPfAmpXABrRGyDlPe
	/pW/Er1j2Pa0FqeDb/vi8EVbe8ss1914XmtJx2SCB0tYWg5hEWArnlCTOc16nHywZtVK/ZL
	/wEtJTEGqOUjNOdFr50VQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C+OWq7eMS0I=:/G8drnU47arkD8mIc8luHf
	keynw1MXo5LPPlnNHd0TkR15PQpj/D3sp52woQzoe1jpqD+lZVfNsE61wTD3B8Jv8by8Kjv5e
	05NFNWHcmAUIiRbMw6RNAA1dIvv7Sfh+3xXNcLmIfrvtcduJJbdFkEGEMgurPc/m38P8/bPb9
	PeCn/wzPXqPnqlL5w7nJVv5pA5P1tr1PhhtJxv/2+ybN+kaw3GrpEDVRCBYK7xwYFGXIIZJpq
	E6H61iuthKh0f7rjH9bLj+1BWSZn72imkAYKi3C87F6G6vOxV1jNwnzOUPqQ78VPKEXkBVq49
	mNBIuyQgcF0BsNRiasDH0q3LuqWUkox3x3LzJRScJlmfsjEjeqqbndXFAJLFX2Ga9y+5yrDsw
	fz9hBtxXHLHN7D+twIIlm9x0pwj5QKAkuw8eFEdIkzhSVCjYnz4efl4qx1tSptACaqsCUG9Je
	sQIUIInDpkxS8Rq4dWhlMzu7tp0XCr+synOqc+iiFsYLHnp2uBlYzXWrvk/O/k5clRfS5B0+3
	OOYe8OnW676odlP+UYx7D7koymDymzfOG9Tgt3Ex1j5E+hOhNbt8AVNtQwfg6gEOz8l7jGcOJ
	UoBY9/mH3BvA7HEzXBEPtq++h/BRQ3ohsDYmtaxcZckcWr+e/4r0DXMC0HOu30kV/gSBnc7KN
	ClRu+1yDx4pkNmzxgrkMm6giG1i2+sNUm5a7yDR/HG7KrP3z9tvjyAXtRf8pvnYZUQob68/QP
	YQ14hD9TfguAc94hjPfjlSppCOC3A40CAfyy2bj+CxnvlKePsjA3fiUNOTId6VekL9rPZ96nK
	lKX2z4Pz16ssVwFqzy8SJbR2Ed3UCnBx+tUh4Qak2qSaMLCzWz11o6RRcL+e8+LGy+ekGw0Zw
	kShEgmU1ZdZ29/8Rb47Q==
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=gmx.net header.s=badeba3b8450 header.b=Drscer8F;
	dmarc=pass (policy=none) header.from=gmx.net;
	spf=pass (relay.mimecast.com: domain of devurandom@gmx.net designates
	212.227.17.20 as permitted sender)
	smtp.mailfrom=devurandom@gmx.net
X-Mimecast-Spam-Score: 1
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
Subject: [linux-lvm] cache_check --clear-needs-check-flag does not clear
	needs_check flag?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5467768819162327274=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12

--===============5467768819162327274==
Content-Type: multipart/signed; boundary="nextPart2284696.ElGaqSPkdT";
	micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2284696.ElGaqSPkdT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Dennis Schridde <devurandom@gmx.net>
To: linux-lvm@redhat.com
Subject: cache_check --clear-needs-check-flag does not clear needs_check flag?
Date: Sun, 06 Dec 2020 22:01:37 +0100
Message-ID: <4384449.LvFx2qVVIh@monk>

Hello!

A cached logical volume of mine cannot be activated anymore:

$ sudo vgchange -ay
   device-mapper: reload ioctl on   (253:6) failed: Invalid argument
   0 logical volume(s) in volume group "vg_ernie" now active


dmesg logs:

device-mapper: cache: 253:6: unable to switch cache to write mode until
repaired.
device-mapper: cache: 253:6: switching cache to read-only mode
device-mapper: table: 253:6: cache: Unable to get write access to metadata,
please check/repair metadata.
device-mapper: ioctl: error adding target to table


The code in question seems to be: https://github.com/torvalds/linux/blob/v5=
.8/
drivers/md/dm-cache-target.c#L957-L964


Hence I set out to check the cache and, if it is clean, clear the needs_che=
ck
flag:

$ sudo lvchange -ay vg_ernie/lv_cache
Do you want to activate component LV in read-only mode? [y/n]: y
   Allowing activation of component LV.

$ sudo cache_check /dev/vg_ernie/lv_cache
examining superblock
examining mapping array
examining hint array
examining discard bitset

$ sudo cache_check --clear-needs-check-flag /dev/vg_ernie/lv_cache
examining superblock
examining mapping array
examining hint array
examining discard bitset

$ sudo lvchange -an vg_ernie/lv_cache


But the problem persists:

$ sudo vgchange -ay
   device-mapper: reload ioctl on   (253:6) failed: Invalid argument
   0 logical volume(s) in volume group "vg_ernie" now active


I tried again in read/write mode, in case that would make a difference /
silently fail:

$ sudo lvchange -ay vg_ernie/lv_cache
Do you want to activate component LV in read-only mode? [y/n]: n

$ sudo cache_check --clear-needs-check-flag /dev/vg_ernie/lv_cache
examining superblock
examining mapping array
examining hint array
examining discard bitset

$ sudo lvchange -an vg_ernie/lv_cache


With the same results:

$ sudo vgchange -ay
   device-mapper: reload ioctl on   (253:6) failed: Invalid argument
   0 logical volume(s) in volume group "vg_ernie" now active


A bit puzzling is that the status of the needs_check flag appears to be
"unknown":

$ sudo lvs -a -o +lv_check_needed
   LV                        VG          Attr          LSize    Pool
Origin                  Data%   Meta%   Move Log Cpy%Sync Convert CheckNeed=
ed
   [lv_cache]            vg_ernie CRi-a-C--- 232.88g
unknown
   lv_system             vg_ernie Cwi---C---   <1.82t [lv_cache]
[lv_system_corig]
unknown
   [lv_system_corig] vg_ernie owi---C---   <1.82t
unknown


The live system I am running these commands from is a Fedora 33:

$ uname -a
Linux localhost-live 5.8.15-301.fc33.x86_64 #1 SMP Thu Oct 15 16:58:06 UTC
2020 x86_64 x86_64 x86_64 GNU/Linux

$ sudo lvm version
   LVM version:       2.03.10(2) (2020-08-09)
   Library version: 1.02.173 (2020-08-09)
   Driver version:   4.42.0
   Configuration:    ./configure --build=3Dx86_64-redhat-linux-gnu --
host=3Dx86_64-redhat-linux-gnu --program-prefix=3D --disable-dependency-tra=
cking
--prefix=3D/usr --exec-prefix=3D/usr --bindir=3D/usr/bin --sbindir=3D/usr/s=
bin --
sysconfdir=3D/etc --datadir=3D/usr/share --includedir=3D/usr/include --libd=
ir=3D/usr/
lib64 --libexecdir=3D/usr/libexec --localstatedir=3D/var --sharedstatedir=
=3D/var/lib
--mandir=3D/usr/share/man --infodir=3D/usr/share/info --with-default-dm-run=
-dir=3D/
run --with-default-run-dir=3D/run/lvm --with-default-pid-dir=3D/run --with-
default-locking-dir=3D/run/lock/lvm --with-usrlibdir=3D/usr/lib64 --enable-=
fsadm
--enable-write_install --with-user=3D --with-group=3D --with-device-uid=3D0=
 --with-
device-gid=3D6 --with-device-mode=3D0660 --enable-pkgconfig --enable-cmdlib=
 --
enable-dmeventd --enable-blkid_wiping --with-cluster=3Dinternal --enable-
cmirrord --with-udevdir=3D/usr/lib/udev/rules.d --enable-udev_sync --with-
thin=3Dinternal --with-cache=3Dinternal --enable-lvmpolld --enable-lvmlockd=
-dlm --
enable-lvmlockd-dlmcontrol --enable-lvmlockd-sanlock --enable-dbus-service =
--
enable-notify-dbus --enable-dmfilemapd --with-writecache=3Dinternal --with-
vdo=3Dinternal --with-vdo-format=3D/usr/bin/vdoformat --disable-silent-rule=
s


Is it possible that `cache_check --clear-needs-check-flag does not clear
needs_check flag` does not actually clear the needs_check flag in my case?


Any help to get the system back online (without data loss, if possible) is
appreciated!

Best regards,
Dennis

--nextPart2284696.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAl/NRrEACgkQz+h/M161
qdyWSgv+PRr3kYyqIs0Q9sRw6SOoB1SMTBZll1aa8faaaVeKzEp2k0ULEknvyrBa
7lnt/z4MN6a47txWHHwRX+HgpLvZ9FJDmV8UPWxqSmDEtf8h+unW4FwaTnl7Xxn1
aQXdbROGBkQnU8Z/ypZDw3JJIh7c3v/v6BQu59WiwFJr6VWwAv7nGwZWuVdurcJJ
4t6hPC1uXamYsr+DTBwxiS7J42ZwWIG+qTuQjJcP+vuK4UNy9SZB6hWV6lU4o6k0
KJOD58pExsj/Ntt/l/cWfctKUwqrrlX3wxi3AhQ49cOdSVIqjT0H475amQsK0mz5
2iHx2E08xN7vO4mv3yEtDETR+R23ITs/OGlc5ar0PL1G0CPh2kiATuBGYl7UASnr
e6BwLGloN9z4HVCj/P16ETdFo9OkCXSl4LQS25ak3vdssbmFLXjNBzDhiM7mRLva
4eq95+zDD+eKa23+A2lYEiZ1Fdr01MCGD/W1v9Uu7SMhmTXi1dJanNAGvmn+SLpw
UayyJ4Ze
=+xPz
-----END PGP SIGNATURE-----

--nextPart2284696.ElGaqSPkdT--




--===============5467768819162327274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============5467768819162327274==--



