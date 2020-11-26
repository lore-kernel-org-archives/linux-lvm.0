Return-Path: <SRS0=nNlY=FE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B757C63777
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 07:03:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D3F206CB
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 07:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D3F206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-Xw4pvO6zMtGtoAJ8_DNsRQ-1; Mon, 30 Nov 2020 02:03:19 -0500
X-MC-Unique: Xw4pvO6zMtGtoAJ8_DNsRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BABF48144E0;
	Mon, 30 Nov 2020 07:03:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AB2927C22;
	Mon, 30 Nov 2020 07:03:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 869471809CA3;
	Mon, 30 Nov 2020 07:02:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQEjW2C014286 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 09:45:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F55A2026D38; Thu, 26 Nov 2020 14:45:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 198A82026D36
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2020 14:45:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 351E7185A794
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2020 14:45:26 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-169-vAWYyaYWMZ2vQPxMRzIJ8A-1; Thu, 26 Nov 2020 09:45:23 -0500
X-MC-Unique: vAWYyaYWMZ2vQPxMRzIJ8A-1
Received: by mail-lj1-f175.google.com with SMTP id f24so2578774ljk.13
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2020 06:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=r3Bz42nYkBM4ggmunHYPIkvy/LMQi6LcGKtHYxu8hSs=;
	b=YCJeMzcZG26rrdttkRAXUV3iNz/Ag3+Thy1wetgQcjxgNSMOWp0CIdyykONz32BOZS
	RX9k5RD60NPCAUvqXl3X58/VQR19zxsJ0deD7HCPNC0auAjbzmi0Y4cqcKsaK9VbuXXG
	Kaw4yhdrFBJeLv4wlO88rdltZV0qWbrxWobqox2GL5UAUwgNqJDJi3Xi3SoCmL329uu8
	Yg8HUjunBxBA9RGiwd27OtLeYbBQpxfTTULx8o49kNZDBIRUp85JX+Oajeuj8pSbwpHY
	Gp+3A6cW23uaOvc0N3E8EBGKbVs8RX8a9dgC7JZgVxRNvvzbwFx7GoXVcLjdHzqOKG65
	ZDgQ==
X-Gm-Message-State: AOAM530KpNEkGyo99AhN8F9m/czVygHqPCkub3fmrUG8tAiNtMfaNOUq
	UymrKEpXWOs5fOgo/GeaBkIN+I7C1gxyR266p4dRUwNP96WyHjTN
X-Google-Smtp-Source: ABdhPJwZW62LX4quvZVS1N1mtq0dTTEJJoZ1vT5HNzwu6qct4P2l0dl+KyQ7pUFvGLIRVQf5rfKcFcCIu+WH2ADz5FY=
X-Received: by 2002:a2e:8011:: with SMTP id j17mr1491895ljg.325.1606401921142; 
	Thu, 26 Nov 2020 06:45:21 -0800 (PST)
MIME-Version: 1.0
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Thu, 26 Nov 2020 20:15:10 +0530
Message-ID: <CAMaziXtCk662ZfaG-crzrrKpi_efQqqOLbVCnSvLDsCOpLS0zw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
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
X-Mailman-Approved-At: Mon, 30 Nov 2020 02:02:55 -0500
Subject: [linux-lvm] System completely unstable after migrating to thin pools
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
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8565579325134047519=="

--===============8565579325134047519==
Content-Type: multipart/alternative; boundary="000000000000e051de05b50397b8"

--000000000000e051de05b50397b8
Content-Type: text/plain; charset="UTF-8"

Hi,

I have migrated to thin pools using partclone.

But now that I am using thin pools my system is completely unstable.

My swap is not activated :

swapon[1004]: swapon: /fedora.swap: read swap header failed
systemd[1]: fedora.swap.swap: Swap process exited, code=exited,
status=255/EXCEPTION

systemd[1]: fedora.swap.swap: Failed with result 'exit-code'.
 Failed to activate swap /fedora.swap.
 Dependency failed for Swap.
 swap.target: Job swap.target/start failed with result 'dependency'.

My System logging service is not started:

rsyslog.service: Failed with result 'core-dump'.
 Failed to start System Logging Service.
 SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295
subj=system_u:system_r:init_t:s0 msg='unit=rsyslog comm="systemd"
exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=failed'
 rsyslog.service: Scheduled restart job, restart counter is at 1.

And device mapper gives me weird messages during startup like:

 kernel: device-mapper: btree spine: node_check failed: csum 3318704195 !=
wanted 3318554075
 kernel: device-mapper: block manager: btree_node validator check failed
for block 220
 kernel: device-mapper: btree spine: node_check failed: csum 3318704195 !=
wanted 3318554075
 kernel: device-mapper: block manager: btree_node validator check failed
for block 220
 kernel: device-mapper: btree spine: node_check failed: csum 3318704195 !=
wanted 3318554075
 kernel: device-mapper: block manager: btree_node validator check failed
for block 220
 kernel: device-mapper: btree spine: node_check failed: csum 3318704195 !=
wanted 3318554075
 kernel: device-mapper: block manager: btree_node validator check failed
for block 220

Also some dracut module is missing:

dracut-initqueue[867]: /usr/sbin/thin_check: execvp failed: No such file or
directory
 dracut-initqueue[867]: WARNING: Check is skipped, please install
recommended missing binary /usr/sbin/thin_check!


In short my system has gone to hell.

This all started when I did a fstrim like this:

sudo fstrim -v /

And it returned an input/output error.

My logical volumes were marked with two 'XX', I don't know what that means.
After that I restarted.

What can I do to get my system back to normal ?

Please help.

-- 
Regards,
Sreyan Chakravarty

--000000000000e051de05b50397b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I have migrated to thin pools using=
 partclone.</div><div><br></div><div>But now that I am using thin pools my =
system is completely unstable.</div><div><br></div><div>My swap is not acti=
vated :</div><div><br></div><div>swapon[1004]: swapon: /fedora.swap: read s=
wap header failed<br>systemd[1]: fedora.swap.swap: Swap process exited, cod=
e=3Dexited, status=3D255/EXCEPTION</div><div><br></div><div>systemd[1]: fed=
ora.swap.swap: Failed with result &#39;exit-code&#39;.<br>=C2=A0Failed to a=
ctivate swap /fedora.swap.<br>=C2=A0Dependency failed for Swap.<br>=C2=A0sw=
ap.target: Job swap.target/start failed with result &#39;dependency&#39;.</=
div><div><br></div><div>My System logging service is not started:</div><div=
><br></div><div>rsyslog.service: Failed with result &#39;core-dump&#39;.<br=
>=C2=A0Failed to start System Logging Service.<br>=C2=A0SERVICE_START pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:in=
it_t:s0 msg=3D&#39;unit=3Drsyslog comm=3D&quot;systemd&quot; exe=3D&quot;/u=
sr/lib/systemd/systemd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dfaile=
d&#39;<br>=C2=A0rsyslog.service: Scheduled restart job, restart counter is =
at 1.</div><div><br></div><div>And device mapper gives me weird messages du=
ring startup like:</div><div><br></div><div>=C2=A0kernel: device-mapper: bt=
ree spine: node_check failed: csum 3318704195 !=3D wanted 3318554075<br>=C2=
=A0kernel: device-mapper: block manager: btree_node validator check failed =
for block 220<br>=C2=A0kernel: device-mapper: btree spine: node_check faile=
d: csum 3318704195 !=3D wanted 3318554075<br>=C2=A0kernel: device-mapper: b=
lock manager: btree_node validator check failed for block 220<br>=C2=A0kern=
el: device-mapper: btree spine: node_check failed: csum 3318704195 !=3D wan=
ted 3318554075<br>=C2=A0kernel: device-mapper: block manager: btree_node va=
lidator check failed for block 220<br>=C2=A0kernel: device-mapper: btree sp=
ine: node_check failed: csum 3318704195 !=3D wanted 3318554075<br>=C2=A0ker=
nel: device-mapper: block manager: btree_node validator check failed for bl=
ock 220</div><div><br></div><div>Also some dracut module is missing:</div><=
div><br></div><div>dracut-initqueue[867]: /usr/sbin/thin_check: execvp fail=
ed: No such file or directory<br>=C2=A0dracut-initqueue[867]: WARNING: Chec=
k is skipped, please install recommended missing binary /usr/sbin/thin_chec=
k!<br clear=3D"all"><div><br></div><div><br></div><div>In short my system h=
as gone to hell.</div><div><br></div><div>This all started when I did a fst=
rim like this:</div><div><br></div><div>sudo fstrim -v /</div><div><br></di=
v><div>And it returned an input/output error.</div><div><br></div><div>My l=
ogical volumes were marked with two &#39;XX&#39;, I don&#39;t know what tha=
t means. After that I restarted.</div><div><br></div><div>What can I do to =
get my system back to normal ?</div><div><br></div><div>Please help.</div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr">Regards,<div>Sreyan Chakravarty</div></div></div></div></div>

--000000000000e051de05b50397b8--

--===============8565579325134047519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============8565579325134047519==--

