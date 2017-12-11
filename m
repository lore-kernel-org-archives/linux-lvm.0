Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8658517B6C
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2017 02:27:29 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDC1B5D3
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2017 02:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 2C06A430
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2017 03:27:27 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 4CEf0micjKAU for <linux-lvm@redhat.com>;
	Mon, 11 Dec 2017 03:27:26 +0100 (CET)
Received: from [IPv6:2003:86:4564:d200:5024:e5ed:93b0:67f8]
	(p200300864564D2005024E5ED93B067F8.dip0.t-ipconnect.de
	[IPv6:2003:86:4564:d200:5024:e5ed:93b0:67f8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id A9BE442D
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2017 03:27:26 +0100 (CET)
From: Oliver Rath <rath@mglug.de>
Message-ID: <cd9e1cf3-2680-ef50-8629-161215d467a0@mglug.de>
Date: Mon, 11 Dec 2017 03:27:26 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------6539668FCD0A80DA64CA411E"
Content-Language: en-US
Subject: [linux-lvm] addendum [was: lvmdbusd failure(s) at ubuntu ]
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
--------------6539668FCD0A80DA64CA411E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi list,

trying to compile lvm2 with these flags:

./configure --enable-lvmetad --enable-lvmpolld --enable-dmfilemapd
--enable-applib --enable-cmdlib --enable-dbus-service
--enable-notify-dbus --enable-python3_bindings

make
..

make install
..
warning: install_lib: 'build/lib.linux-x86_64-3.6' does not exist -- no
Python modules to install

What does this mean?

Tfh!

Oliver


--------------6539668FCD0A80DA64CA411E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi list,</p>
    trying to compile lvm2 with these flags: <br>
    <br>
    ./configure --enable-lvmetad --enable-lvmpolld --enable-dmfilemapd
    --enable-applib --enable-cmdlib --enable-dbus-service
    --enable-notify-dbus --enable-python3_bindings<br>
    <br>
    make <br>
    ..<br>
    <br>
    make install <br>
    ..<br>
    warning: install_lib: 'build/lib.linux-x86_64-3.6' does not exist --
    no Python modules to install<br>
    <br>
    What does this mean?<br>
    <br>
    Tfh!<br>
    <br>
    Oliver<br>
    <br>
    <ul>
    </ul>
  </body>
</html>

--------------6539668FCD0A80DA64CA411E--
