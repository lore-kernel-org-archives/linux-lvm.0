Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E083617B64
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2017 02:02:13 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4E704E02A
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2017 02:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 60B8B42D
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2017 02:53:51 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id vwDiIYsKBV-T for <linux-lvm@redhat.com>;
	Mon, 11 Dec 2017 02:53:36 +0100 (CET)
Received: from [IPv6:2003:86:4564:d200:5024:e5ed:93b0:67f8]
	(p200300864564D2005024E5ED93B067F8.dip0.t-ipconnect.de
	[IPv6:2003:86:4564:d200:5024:e5ed:93b0:67f8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 196E4427
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2017 02:53:36 +0100 (CET)
From: Oliver Rath <rath@mglug.de>
Message-ID: <178294ff-5cb8-5dbd-9475-0cafb8958547@mglug.de>
Date: Mon, 11 Dec 2017 02:53:35 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------18DFCD4648462CA2B66399C7"
Content-Language: en-US
Subject: [linux-lvm] lvmdbusd failure(s) at ubuntu
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
--------------18DFCD4648462CA2B66399C7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi list,

Im playing around with the dbus-daemon, which shows me some strange
behaviours:

  * lvmdbusd doesnt run with the message
    # lvmdbusd
    Traceback (most recent call last):
      File "/sbin/lvmdbusd", line 13, in <module>
        from lvmdbusd import main
    ModuleNotFoundError: No module named 'lvmdbusd'
    *but* the module seems to be installed:
    # find /usr/lib/ -iname "lvmdbusd"
    /usr/lib/python3.6/site-packages/lvmdbusd
    /usr/lib/python3.5/site-packages/lvmdbusd

    Btw, lvmdbusd seems not to be installed for python2
  * lvmdbusd is a python-script, but the installer says "python is
    deprecated, use dbus instead". Can I use the dbus-interface (Im
    working on some examples in Rust for this) without the lvmdbusd?

Is lvm via dbus possibly out of date and not longer useable?

My system is ubuntu 17.10 with lvm2-git installed:

# lvdisplay --version
  LVM version:     2.02.177(2)-git (2017-11-03)
  Library version: 1.02.146-git (2017-11-03)
  Driver version:  4.37.0
  Configuration:   ./configure --enable-lvmetad --enable-lvmpolld
--enable-dmfilemapd --enable-cmdlib --enable-applib
--enable-dbus-service --enable-notify-dbus --enable-python2_bindings

TfH

Oliver



--------------18DFCD4648462CA2B66399C7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi list,</p>
    <p>Im playing around with the dbus-daemon, which shows me some
      strange behaviours:</p>
    <ul>
      <li>lvmdbusd doesnt run with the message <br>
        # lvmdbusd <br>
        Traceback (most recent call last):<br>
          File "/sbin/lvmdbusd", line 13, in &lt;module&gt;<br>
            from lvmdbusd import main<br>
        ModuleNotFoundError: No module named 'lvmdbusd'<br>
        *but* the module seems to be installed:<br>
        # find /usr/lib/ -iname "lvmdbusd"<br>
        /usr/lib/python3.6/site-packages/lvmdbusd<br>
        /usr/lib/python3.5/site-packages/lvmdbusd<br>
        <br>
        Btw, lvmdbusd seems not to be installed for python2</li>
      <li>lvmdbusd is a python-script, but the installer says "python is
        deprecated, use dbus instead". Can I use the dbus-interface (Im
        working on some examples in Rust for this) without the lvmdbusd?</li>
    </ul>
    <p>Is lvm via dbus possibly out of date and not longer useable?</p>
    <p>My system is ubuntu 17.10 with lvm2-git installed:</p>
    <p># lvdisplay --version<br>
        LVM version:     2.02.177(2)-git (2017-11-03)<br>
        Library version: 1.02.146-git (2017-11-03)<br>
        Driver version:  4.37.0<br>
        Configuration:   ./configure --enable-lvmetad --enable-lvmpolld
      --enable-dmfilemapd --enable-cmdlib --enable-applib
      --enable-dbus-service --enable-notify-dbus
      --enable-python2_bindings<br>
      <br>
    </p>
    <p>TfH</p>
    <p>Oliver</p>
    <p><br>
    </p>
    <ul>
    </ul>
  </body>
</html>

--------------18DFCD4648462CA2B66399C7--
