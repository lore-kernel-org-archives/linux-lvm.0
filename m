Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8HLhUNC030015
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2014 17:43:30 -0400
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8HLhRgc002684
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2014 17:43:28 -0400
Received: by mail-qa0-f54.google.com with SMTP id v10so2625374qac.41
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2014 14:43:27 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 17 Sep 2014 14:43:27 -0700
Message-ID: <CAA8m+Y0nXi3w6tHjSr1sbUazeCJ7THdQVO66hNkn-=7K6MgsTw@mail.gmail.com>
From: Pirate Fibonacci <pirate112358@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c250d61bea51050349c208
Subject: [linux-lvm] =?utf-8?b?4oCYTFZNRVRBRF9QSURGSUxF4oCZIHVuZGVjbGFy?=
	=?utf-8?q?ed_when_compiling?=
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--001a11c250d61bea51050349c208
Content-Type: text/plain; charset=UTF-8

error happens from lvm2/daemons/lvmetad

I'm using lvm2 from git repo. master branch as of this morning.
on fedora20.

in lvm2 base dir

# grep LVMETAD_PIDFILE *config*
config.log:LVMETAD_PIDFILE=''
config.status:S["LVMETAD_PIDFILE"]=""
configure:LVMETAD_PIDFILE
configure:  withval=$with_lvmetad_pidfile; LVMETAD_PIDFILE=$withval
configure:  LVMETAD_PIDFILE="$DEFAULT_PID_DIR/lvmetad.pid"
configure:#define LVMETAD_PIDFILE "$LVMETAD_PIDFILE"
configure.in:               LVMETAD_PIDFILE=$withval,
configure.in:               LVMETAD_PIDFILE="$DEFAULT_PID_DIR/lvmetad.pid")
configure.in:   AC_DEFINE_UNQUOTED(LVMETAD_PIDFILE, ["$LVMETAD_PIDFILE"],
configure.in:AC_SUBST(LVMETAD_PIDFILE)


the log says it's unset... not sure how to tell configure how to set this
variable in
the header files?

thanks

Jeffrey

--001a11c250d61bea51050349c208
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><br></div><div>error happens from lvm2/daemons/l=
vmetad<br></div><div><br></div>I&#39;m using lvm2 from git repo. master bra=
nch as of this morning.<br>on fedora20. <br><br></div>in lvm2 base dir<br><=
div><br># grep LVMETAD_PIDFILE *config*<br>config.log:LVMETAD_PIDFILE=3D&#3=
9;&#39;<br>config.status:S[&quot;LVMETAD_PIDFILE&quot;]=3D&quot;&quot;<br>c=
onfigure:LVMETAD_PIDFILE<br>configure:=C2=A0 withval=3D$with_lvmetad_pidfil=
e; LVMETAD_PIDFILE=3D$withval<br>configure:=C2=A0 LVMETAD_PIDFILE=3D&quot;$=
DEFAULT_PID_DIR/lvmetad.pid&quot;<br>configure:#define LVMETAD_PIDFILE &quo=
t;$LVMETAD_PIDFILE&quot;<br><a href=3D"http://configure.in">configure.in</a=
>:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 LVMETAD_PIDFILE=3D$withval,<br><a href=3D"http://configure.in"=
>configure.in</a>:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 LVMETAD_PIDFILE=3D&quot;$DEFAULT_PID_DIR/lvmeta=
d.pid&quot;)<br><a href=3D"http://configure.in">configure.in</a>:=C2=A0=C2=
=A0 AC_DEFINE_UNQUOTED(LVMETAD_PIDFILE, [&quot;$LVMETAD_PIDFILE&quot;],<br>=
configure.in:AC_SUBST(LVMETAD_PIDFILE)<br><br><br></div><div>the log says i=
t&#39;s unset... not sure how to tell configure how to set this variable in=
<br>the header files?<br><br></div><div>thanks<br><br>Jeffrey<br></div><div=
><br><br></div></div>

--001a11c250d61bea51050349c208--
