Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBTKcio2005426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2016 15:38:44 -0500
Received: from mail.knebb.de (mail.knebb.de [85.25.100.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5980C0092B7
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2016 20:38:42 +0000 (UTC)
Received: from [192.168.0.229] (p5DE005BF.dip0.t-ipconnect.de [93.224.5.191])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested) (Authenticated sender: cvoelker)
	by mail.knebb.de (Postfix) with ESMTPSA id 2DEFF9C0A30
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2016 21:28:48 +0100 (CET)
From: knebb@knebb.de
Message-ID: <45f36905-feee-8fdf-8545-05d4937a95c1@knebb.de>
Date: Thu, 29 Dec 2016 21:28:04 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------65373BB53B1A4C72669361F1"
Subject: [linux-lvm] LVM filter ignored?
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
--------------65373BB53B1A4C72669361F1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi all,

I am using LVM for several years but now I face an issue where I have no
clue how to deal with.

I want to have a VG on top of a drbd device (Distributed Replicated
Block Device) which should not be an issue according to docs:
https://www.drbd.org/en/doc/users-guide-83/s-lvm-drbd-as-pv

Unfortunately I am always getting "duplicate device" errors as LVM
recons a pv on /dev/sdb (underlying device for drbd) as well as on
/dev/drbd0

Now I tried to configure filters to match my setup. But it seems I do
not understand the filter rules.

I need to enable /dev/sda incl. all partitions. (for root)
I need to disable /dev/sdb at all as it is the device for drbd!
I need to enable /dev/drbd0 as the "real" PV.
I can disable all others.

So I tried:
filter = [ "r|sdb.*/|","a|drbd0/|","a|.*/|" ]

Which results in the duplicate-issue:
[root@backuppc ~]# pvcreate /dev/drbd0
  Physical volume "/dev/drbd0" successfully created.
[root@backuppc ~]# pvscan --cache
  WARNING: PV eEpd0B-VaET-V2mH-9InB-pYab-P5Bp-hjfOhh on /dev/sdb was
already found on /dev/drbd0.
  WARNING: Disabling lvmetad cache which does not support duplicate PVs.
  WARNING: Not using lvmetad because duplicate PVs were found.


So anyone having an idea what is wrong with my filter config? As the
docs are very unclear about the exact syntax I did as well some other
versions but no one leads to the resul I want to have...

So what are correct filter rules?

Greetings

/christian


--------------65373BB53B1A4C72669361F1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi all,<br>
    <br>
    I am using LVM for several years but now I face an issue where I
    have no clue how to deal with.<br>
    <br>
    I want to have a VG on top of a drbd device (<span class="st">Distributed
      Replicated Block Device) which should not be an issue according to
      docs: <br>
      <a class="moz-txt-link-freetext" href="https://www.drbd.org/en/doc/users-guide-83/s-lvm-drbd-as-pv">https://www.drbd.org/en/doc/users-guide-83/s-lvm-drbd-as-pv</a><br>
      <br>
      Unfortunately I am always getting "duplicate device" errors as LVM
      recons a pv on /dev/sdb (underlying device for drbd) as well as on
      /dev/drbd0<br>
      <br>
      Now I tried to configure filters to match my setup. But it seems I
      do not understand the filter rules.<br>
      <br>
      I need to enable /dev/sda incl. all partitions. (for root)<br>
      I need to disable /dev/sdb at all as it is the device for drbd!<br>
      I need to enable /dev/drbd0 as the "real" PV.<br>
      I can disable all others.<br>
      <br>
      So I tried:<br>
      filter = [ "r|sdb.*/|","a|drbd0/|","a|.*/|" ]<br>
      <br>
      Which results in the duplicate-issue:<br>
      [root@backuppc ~]# pvcreate /dev/drbd0<br>
        Physical volume "/dev/drbd0" successfully created.<br>
      [root@backuppc ~]# pvscan --cache<br>
        WARNING: PV eEpd0B-VaET-V2mH-9InB-pYab-P5Bp-hjfOhh on /dev/sdb
      was already found on /dev/drbd0.<br>
        WARNING: Disabling lvmetad cache which does not support
      duplicate PVs.<br>
        WARNING: Not using lvmetad because duplicate PVs were found.<br>
      <br>
      <br>
      So anyone having an idea what is wrong with my filter config? As
      the docs are very unclear about the exact syntax I did as well
      some other versions but no one leads to the resul I want to
      have...<br>
      <br>
      So what are correct filter rules?<br>
      <br>
      Greetings<br>
      <br>
      /christian<br>
      <br>
    </span>
  </body>
</html>

--------------65373BB53B1A4C72669361F1--
