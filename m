Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6A0868B23
	for <linux-lvm@redhat.com>; Wed, 13 Dec 2017 12:52:57 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11EB57E437
	for <linux-lvm@redhat.com>; Wed, 13 Dec 2017 12:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id C4882428
	for <linux-lvm@redhat.com>; Wed, 13 Dec 2017 13:52:52 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id HyP4Qd8D2WIg for <linux-lvm@redhat.com>;
	Wed, 13 Dec 2017 13:52:34 +0100 (CET)
Received: from [IPv6:2003:f6:ebc4:1f00:c0c1:b7b8:a3ef:a1e4]
	(p200300F6EBC41F00C0C1B7B8A3EFA1E4.dip0.t-ipconnect.de
	[IPv6:2003:f6:ebc4:1f00:c0c1:b7b8:a3ef:a1e4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id A8E4642E
	for <linux-lvm@redhat.com>; Wed, 13 Dec 2017 13:52:25 +0100 (CET)
References: <178294ff-5cb8-5dbd-9475-0cafb8958547@mglug.de>
From: Oliver Rath <rath@mglug.de>
Message-ID: <193652b5-40ab-b647-d072-673bb95c9a93@mglug.de>
Date: Wed, 13 Dec 2017 13:52:24 +0100
MIME-Version: 1.0
In-Reply-To: <178294ff-5cb8-5dbd-9475-0cafb8958547@mglug.de>
Content-Type: multipart/alternative;
	boundary="------------6D6BF7F78A7EBEA34C71F926"
Content-Language: en-US
Subject: [linux-lvm] SOLVED [was: lvmdbusd failure(s) at ubuntu]
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
--------------6D6BF7F78A7EBEA34C71F926
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi list,

Ive found the reason for failing lvmdbusd: The install-script installs
the python-module-dir "lvmdbusd" into /usr/lib/python3.6/site-packages.
Unfortunatly this path is not in the standard-python(3)-modulepath included:

--------------- snip -------------------------

ver@w541:~/gits/lvm2$ python3 -m site
sys.path = [
    '/home/oliver/gits/lvm2',
    '/usr/lib/python36.zip',
    '/usr/lib/python3.6',
    '/usr/lib/python3.6/lib-dynload',
    '/usr/local/lib/python3.6/dist-packages',
    '/usr/lib/python3/dist-packages',
    '/usr/lib/python3.6/dist-packages',
]
USER_BASE: '/home/oliver/.local' (exists)
USER_SITE: '/home/oliver/.local/lib/python3.6/site-packages' (doesn't exist)
ENABLE_USER_SITE: True

--------------- snap -------------------------

It seems the "site-packages" dir is in Ubuntu a local one in the current
home dir. Putting the moduledir "lvmdbusd" into
/usr/lib/python3.6/dist-packages works fine. For me it is sufficient to
change the installation-path to this dir.

I don't know, how the paths are organized in other distros like fedora
or redhat, but maybe you find a way installing the lvm2-python3-parts
for lvmdbusd in a way which works also out of the box for ubuntu, too.

Tfh!

Oliver



On 11.12.2017 02:53, Oliver Rath wrote:
>
> Hi list,
>
> Im playing around with the dbus-daemon, which shows me some strange
> behaviours:
>
>   * lvmdbusd doesnt run with the message
>     # lvmdbusd
>     Traceback (most recent call last):
>       File "/sbin/lvmdbusd", line 13, in <module>
>         from lvmdbusd import main
>     ModuleNotFoundError: No module named 'lvmdbusd'
>     *but* the module seems to be installed:
>     # find /usr/lib/ -iname "lvmdbusd"
>     /usr/lib/python3.6/site-packages/lvmdbusd
>     /usr/lib/python3.5/site-packages/lvmdbusd
>
>     Btw, lvmdbusd seems not to be installed for python2
>   * lvmdbusd is a python-script, but the installer says "python is
>     deprecated, use dbus instead". Can I use the dbus-interface (Im
>     working on some examples in Rust for this) without the lvmdbusd?
>
> Is lvm via dbus possibly out of date and not longer useable?
>
> My system is ubuntu 17.10 with lvm2-git installed:
>
> # lvdisplay --version
>   LVM version:     2.02.177(2)-git (2017-11-03)
>   Library version: 1.02.146-git (2017-11-03)
>   Driver version:  4.37.0
>   Configuration:   ./configure --enable-lvmetad --enable-lvmpolld
> --enable-dmfilemapd --enable-cmdlib --enable-applib
> --enable-dbus-service --enable-notify-dbus --enable-python2_bindings
>
> TfH
>
> Oliver
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------6D6BF7F78A7EBEA34C71F926
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi list,</p>
    <p>Ive found the reason for failing lvmdbusd: The install-script
      installs the python-module-dir "lvmdbusd" into
      /usr/lib/python3.6/site-packages. Unfortunatly this path is not in
      the standard-python(3)-modulepath included:</p>
    <p>--------------- snip -------------------------<br>
    </p>
    <p>ver@w541:~/gits/lvm2$ python3 -m site <br>
      sys.path = [<br>
          '/home/oliver/gits/lvm2',<br>
          '/usr/lib/python36.zip',<br>
          '/usr/lib/python3.6',<br>
          '/usr/lib/python3.6/lib-dynload',<br>
          '/usr/local/lib/python3.6/dist-packages',<br>
          '/usr/lib/python3/dist-packages',<br>
          '/usr/lib/python3.6/dist-packages',<br>
      ]<br>
      USER_BASE: '/home/oliver/.local' (exists)<br>
      USER_SITE: '/home/oliver/.local/lib/python3.6/site-packages'
      (doesn't exist)<br>
      ENABLE_USER_SITE: True<br>
    </p>
    <p>--------------- snap -------------------------<br>
    </p>
    <p>It seems the "site-packages" dir is in Ubuntu a local one in the
      current home dir. Putting the moduledir "lvmdbusd" into
      /usr/lib/python3.6/dist-packages works fine. For me it is
      sufficient to change the installation-path to this dir.</p>
    <p>I don't know, how the paths are organized in other distros like
      fedora or redhat, but maybe you find a way installing the
      lvm2-python3-parts for lvmdbusd in a way which works also out of
      the box for ubuntu, too.<br>
    </p>
    <p>Tfh!</p>
    <p>Oliver</p>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11.12.2017 02:53, Oliver Rath wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:178294ff-5cb8-5dbd-9475-0cafb8958547@mglug.de">
      <meta http-equiv="Context-Type" content="text/html; charset=utf-8">
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
        <li>lvmdbusd is a python-script, but the installer says "python
          is deprecated, use dbus instead". Can I use the dbus-interface
          (Im working on some examples in Rust for this) without the
          lvmdbusd?</li>
      </ul>
      <p>Is lvm via dbus possibly out of date and not longer useable?</p>
      <p>My system is ubuntu 17.10 with lvm2-git installed:</p>
      <p># lvdisplay --version<br>
          LVM version:     2.02.177(2)-git (2017-11-03)<br>
          Library version: 1.02.146-git (2017-11-03)<br>
          Driver version:  4.37.0<br>
          Configuration:   ./configure --enable-lvmetad
        --enable-lvmpolld --enable-dmfilemapd --enable-cmdlib
        --enable-applib --enable-dbus-service --enable-notify-dbus
        --enable-python2_bindings<br>
        <br>
      </p>
      <p>TfH</p>
      <p>Oliver</p>
      <p><br>
      </p>
      <ul>
      </ul>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------6D6BF7F78A7EBEA34C71F926--
