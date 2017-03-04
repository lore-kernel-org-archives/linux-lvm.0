Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v24Dwugb024420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 4 Mar 2017 08:58:56 -0500
Received: from nm4-vm6.bullet.mail.ir2.yahoo.com
	(nm4-vm6.bullet.mail.ir2.yahoo.com [212.82.96.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E4EA76E3
	for <linux-lvm@redhat.com>; Sat,  4 Mar 2017 13:58:55 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <87a0048c-d443-bbda-5b27-ab7332278061@yahoo.co.uk>
Date: Sat, 4 Mar 2017 13:58:52 +0000
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------CC58C6B21F41C8AC2C5F550F"
Subject: [linux-lvm] lvextend does not change/fix stripes & stripesize for
	the whole LV?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------CC58C6B21F41C8AC2C5F550F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

right?
Or it does?
 From man pages my understanding is - it does not, an 
expression "the extension" is used there.

If I have a LV with 2 stripes and 64KiB stripesizes, then 
adding two more stripes, like this:

$ lvextend h300Int1/0 -i 2 -I 16 /dev/sd3 /dev/sd4 (if it 
was to succeed)

will change the LV into 4 stripes LV, but what would 
happened to stripesize(s)?

many thanks,
L.

--------------CC58C6B21F41C8AC2C5F550F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    right?<br>
    Or it does?<br>
    From man pages my understanding is - it does not, an expression "the
    extension" is used there.<br>
    <br>
    If I have a LV with 2 stripes and 64KiB stripesizes, then adding two
    more stripes, like this:<br>
    <br>
    $ lvextend h300Int1/0 -i 2 -I 16 /dev/sd3 /dev/sd4 (if it was to
    succeed)<br>
    <br>
    will change the LV into 4 stripes LV, but what would happened to
    stripesize(s)?<br>
    <br>
    many thanks,<br>
    L.<br>
  </body>
</html>

--------------CC58C6B21F41C8AC2C5F550F--
