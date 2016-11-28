Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uASBwdqZ012518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2016 06:58:39 -0500
Received: from mail.topit.si (mail.topit.si [91.250.118.231])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D39244E4CB
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2016 11:58:37 +0000 (UTC)
Received: from tomazb-desktop.topit.ng (BSN-61-68-33.static.siol.net
	[86.61.68.33]) by mail.topit.si (Postfix) with ESMTPSA id D27E013B7
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2016 12:58:35 +0100 (CET)
From: Tomaz Beltram <tomaz.beltram@topit.si>
Message-ID: <59a4ab68-65cc-5205-65c6-6cd7ea41f582@topit.si>
Date: Mon, 28 Nov 2016 12:58:35 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------E3E6E7FE848DE467A5CFAFC2"
Subject: [linux-lvm] deadlock during lvm snapshot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------E3E6E7FE848DE467A5CFAFC2
Content-Type: multipart/alternative;
	boundary="------------B4D2E3DF93BC5EC5FB417AB7"


--------------B4D2E3DF93BC5EC5FB417AB7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

I'm doing backup of a running mongodb using LVM snapshot. Sometimes I
run into a deadlock situation and kernel reports blocked tasks for jbd2,
mongod, dmeventd and my tar doing backup.

This happens very rarely (one in a thousand) but the effect is rather
severe as mongodb stops working. I also can't remove and unmount the
snapshot. I have attached syslog of two occurrences. The stack traces of
the blocked tasks are very similar so I suspect a potential race
condition between the affected tasks.

Sep 15 17:06:53 dss2 kernel: [719277.567904] INFO: task jbd2/dm-2-8:9048
blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568130] INFO: task mongod:23239
blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568267] INFO: task mongod:23242
blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568350] INFO: task mongod:23243
blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568397] INFO: task dmeventd:12427
blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568523] INFO: task
kworker/u16:2:31890 blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568713] INFO: task tar:12446
blocked for more than 120 seconds.
Sep 15 17:08:53 dss2 kernel: [719397.567614] INFO: task jbd2/dm-2-8:9048
blocked for more than 120 seconds.
Sep 15 17:08:53 dss2 kernel: [719397.567731] INFO: task mongod:23239
blocked for more than 120 seconds.
Sep 15 17:08:53 dss2 kernel: [719397.567870] INFO: task mongod:23240
blocked for more than 120 seconds.

Nov 25 17:10:56 dss2 kernel: [282360.865020] INFO: task jbd2/dm-4-8:878
blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.865624] INFO: task mongod:1652
blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.866279] INFO: task mongod:1655
blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.866771] INFO: task mongod:1656
blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.867294] INFO: task dmeventd:3504
blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.867783] INFO: task
kworker/u16:2:8016 blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.868351] INFO: task tar:3560 blocked
for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.868865] INFO: task
kworker/u16:1:5561 blocked for more than 120 seconds.
Nov 25 17:12:56 dss2 kernel: [282480.868656] INFO: task jbd2/dm-4-8:878
blocked for more than 120 seconds.
Nov 25 17:12:56 dss2 kernel: [282480.869015] INFO: task mongod:1652
blocked for more than 120 seconds.

Full syslogs of two occurrences are attached.

I have Ubuntu 16.04.1 (lvm2 2.02.133-1ubuntu10) with mongod 3.2.9 on a
64bit system.

wbr Tomaz


--------------B4D2E3DF93BC5EC5FB417AB7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>
    </p>
    <div class="moz-text-plain" wrap="true" graphical-quote="true"
      style="font-family: -moz-fixed; font-size: 12px;" lang="x-unicode">
      <pre wrap="">Hi,

I'm doing backup of a running mongodb using LVM snapshot. Sometimes I
run into a deadlock situation and kernel reports blocked tasks for jbd2,
mongod, dmeventd and my tar doing backup.

This happens very rarely (one in a thousand) but the effect is rather
severe as mongodb stops working. I also can't remove and unmount the
snapshot. I have attached syslog of two occurrences. The stack traces of
the blocked tasks are very similar so I suspect a potential race
condition between the affected tasks.

Sep 15 17:06:53 dss2 kernel: [719277.567904] INFO: task jbd2/dm-2-8:9048
blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568130] INFO: task mongod:23239
blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568267] INFO: task mongod:23242
blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568350] INFO: task mongod:23243
blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568397] INFO: task dmeventd:12427
blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568523] INFO: task
kworker/u16:2:31890 blocked for more than 120 seconds.
Sep 15 17:06:53 dss2 kernel: [719277.568713] INFO: task tar:12446
blocked for more than 120 seconds.
Sep 15 17:08:53 dss2 kernel: [719397.567614] INFO: task jbd2/dm-2-8:9048
blocked for more than 120 seconds.
Sep 15 17:08:53 dss2 kernel: [719397.567731] INFO: task mongod:23239
blocked for more than 120 seconds.
Sep 15 17:08:53 dss2 kernel: [719397.567870] INFO: task mongod:23240
blocked for more than 120 seconds.

Nov 25 17:10:56 dss2 kernel: [282360.865020] INFO: task jbd2/dm-4-8:878
blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.865624] INFO: task mongod:1652
blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.866279] INFO: task mongod:1655
blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.866771] INFO: task mongod:1656
blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.867294] INFO: task dmeventd:3504
blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.867783] INFO: task
kworker/u16:2:8016 blocked for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.868351] INFO: task tar:3560 blocked
for more than 120 seconds.
Nov 25 17:10:56 dss2 kernel: [282360.868865] INFO: task
kworker/u16:1:5561 blocked for more than 120 seconds.
Nov 25 17:12:56 dss2 kernel: [282480.868656] INFO: task jbd2/dm-4-8:878
blocked for more than 120 seconds.
Nov 25 17:12:56 dss2 kernel: [282480.869015] INFO: task mongod:1652
blocked for more than 120 seconds.

Full syslogs of two occurrences are attached.

I have Ubuntu 16.04.1 (lvm2 2.02.133-1ubuntu10) with mongod 3.2.9 on a
64bit system.

wbr Tomaz

</pre>
    </div>
  </body>
</html>

--------------B4D2E3DF93BC5EC5FB417AB7--

--------------E3E6E7FE848DE467A5CFAFC2
Content-Type: application/gzip;
 name="syslog.2.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="syslog.2.gz"

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
--------------E3E6E7FE848DE467A5CFAFC2
Content-Type: application/gzip;
 name="syslog.4.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="syslog.4.gz"

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
--------------E3E6E7FE848DE467A5CFAFC2--
