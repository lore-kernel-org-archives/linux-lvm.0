References: <ba2de1c3-518b-f252-1435-9c4ebd7aa6fd@mnl.de>
	<a59d907d-1092-804a-20a0-8227b2aebc10@redhat.com>
From: Michael Lipp <mnl@mnl.de>
Message-ID: <f0c8e9bc-1eca-337e-479d-cfcb9cf53c51@mnl.de>
Date: Thu, 21 Jun 2018 17:03:36 +0200
MIME-Version: 1.0
In-Reply-To: <a59d907d-1092-804a-20a0-8227b2aebc10@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------B87F4B99880B2188B6F9A3B0"
Content-Language: de-DE
Subject: Re: [linux-lvm] How to get a list of all logical groups or volumes
 using dbus API
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
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------B87F4B99880B2188B6F9A3B0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> I think `object_manager.GetManagedObjects()` is one of supported ways
> (used by the test suite).

Thanks! I didn't try this one. It's still a bit of a hack, though.
According to https://dbus.freedesktop.org/doc/dbus-api-design.html:

"The specification also defines the org.freedesktop.DBus.ObjectManager
<http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfa=
ces-objectmanager>
interface, which should be used whenever a service needs to expose a
variable number of objects of the same class..."

The objects I get are not of the same class (Manager, LV, PV). I still
have to "pattern match", only on a higher level ("instance/type match").

But it's a way to go.



--------------B87F4B99880B2188B6F9A3B0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix"><br>
    </div>
    <blockquote type="cite"
      cite="mid:a59d907d-1092-804a-20a0-8227b2aebc10@redhat.com">I think
      `object_manager.GetManagedObjects()` is one of supported ways
      (used by the test suite).
      <br>
    </blockquote>
    <br>
    Thanks! I didn't try this one. It's still a bit of a hack, though.
    According to <a class="moz-txt-link-freetext" href="https://dbus.freedesktop.org/doc/dbus-api-design.html">https://dbus.freedesktop.org/doc/dbus-api-design.html</a>:<br>
    <br>
    "The specification also defines the <span class="link"><a
href="http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager"
title="http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager"><span
          class="code">org.freedesktop.DBus.ObjectManager</span></a></span>
    interface, which should be used whenever a service needs to expose a
    variable number of objects of the same class..."<br>
    <br>
    The objects I get are not of the same class (Manager, LV, PV). I
    still have to "pattern match", only on a higher level
    ("instance/type match").<br>
    <br>
    But it's a way to go.<br>
    <br>
    <br>
  </body>
</html>

--------------B87F4B99880B2188B6F9A3B0--
