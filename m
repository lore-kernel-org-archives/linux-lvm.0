Return-Path: <dice@mfa.kfki.hu>
Date: Sun, 17 Jun 2001 15:38:58 +0200 (CEST)
From: Gergely Tamas <dice@mfa.kfki.hu>
Message-ID: <Pine.LNX.4.33.0106171519240.14970-200000@moon.dice.hu>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1150544603-992785138=:14970"
Subject: [linux-lvm] another nice feature for packagers ...
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: AJ Lewis <lewis@sistina.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--8323328-1150544603-992785138=:14970
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi!

First of all, thanks for the ${DESTDIR} definition.

Another nice feature for packagers would be to split the installation of
liblvm.a and liblvm.so parts.

This would be good because liblvm.a's destination should be e.g. /usr/lib
and liblvm.so's destination should be /lib (because of lvm utils).

So I thought about the introduction of a new variable in make.tmpl.in (I
called it ``sharedlibdir''). Its default value is equal to ``libdir''.

So if somebody installs the package with ``make install'' or ``make -e
DESTDIR=... install'' the installation procedure will be the same as the
current. But if the installer (script) defines a sharedlibdir value other
than the default ``make -e sharedlibdir=... DESTDIR=... install'' the
installation of the shared libraries will go into that directory.

Note, that sharedlibdir needs to be specified with the DESTDIR value e.g.
``make -e sharedlibdir=$DESTDIR/$CPID/lib DESTDIR=$DESTDIR/$CPID install''

If you like this feature please include ...

Thanks,
Gergely

ps: I also attached my compile/package script; maybe somebody is
    interested in it...

diff -ur LVM-orig/make.tmpl.in LVM/make.tmpl.in
--- LVM-orig/make.tmpl.in	Fri Jun 15 16:16:02 2001
+++ LVM/make.tmpl.in	Sun Jun 17 12:45:36 2001
@@ -37,6 +37,7 @@
 exec_prefix = @exec_prefix@
 bindir = ${DESTDIR}/@bindir@
 libdir = ${DESTDIR}/@libdir@
+sharedlibdir = ${libdir}
 sbindir = ${DESTDIR}/@sbindir@
 infodir = ${DESTDIR}/@infodir@
 mandir = ${DESTDIR}/@mandir@
diff -ur LVM-orig/tools/lib/Makefile.in LVM/tools/lib/Makefile.in
--- LVM-orig/tools/lib/Makefile.in	Tue Apr 24 16:29:21 2001
+++ LVM/tools/lib/Makefile.in	Sun Jun 17 12:48:41 2001
@@ -44,18 +44,24 @@
 	@echo ""

 install_this:
-	@echo "*** Installing $(ARCHIVE) and $(SO) in ${prefix}/lib ***"
-	@rm -f ${libdir}/${SO} ${libdir}/${SOV} ${libdir}/${SOM} ${libdir}/$(ARCHIVE);
+	@echo "*** Installing $(ARCHIVE) in ${libdir} ***"
+	@rm -f ${libdir}/$(ARCHIVE);
 	@INSTALL@ -d ${libdir}
-	@INSTALL@ -o ${OWNER} -g ${GROUP} $(ARCHIVE) $(SOV) ${libdir}
+	@INSTALL@ -o ${OWNER} -g ${GROUP} $(ARCHIVE) ${libdir}
 	chmod 444 ${libdir}/$(ARCHIVE)
-	chmod 555 ${libdir}/$(SOV)
-	ln -s $(SOV) ${libdir}/${SO}
-	ln -s $(SOV) ${libdir}/${SOM}
+	@echo "*** Installing $(SO) in ${sharedlibdir} ***"
+	@rm -f ${sharedlibdir}/${SO} ${sharedlibdir}/${SOV} ${sharedlibdir}/${SOM};
+	@INSTALL@ -d ${sharedlibdir}
+	@INSTALL@ -o ${OWNER} -g ${GROUP} $(SOV) ${sharedlibdir}
+	chmod 555 ${sharedlibdir}/$(SOV)
+	ln -s $(SOV) ${sharedlibdir}/${SO}
+	ln -s $(SOV) ${sharedlibdir}/${SOM}

 remove_this:
-	@echo "*** Removing $(ARCHIVE) and $(SO) in ${prefix}/lib ***"
-	@rm -f ${libdir}/${SO} ${libdir}/${SOV} ${libdir}/${SOM} ${libdir}/$(ARCHIVE);
+	@echo "*** Removing $(ARCHIVE) in ${libdir} ***"
+	@rm -f ${libdir}/$(ARCHIVE);
+	@echo "*** Removing $(SO) in ${sharedlibdir} ***"
+	@rm -f ${libdir}/${SO} ${libdir}/${SOV} ${libdir}/${SOM};

 $(ALL_SOURCES):	liblvm.h $(OTHER_DEP)


--8323328-1150544603-992785138=:14970
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="lvm-20010616.BUILD.sh"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.33.0106171538580.14970@moon.dice.hu>
Content-Description: 
Content-Disposition: attachment; filename="lvm-20010616.BUILD.sh"

IyEvYmluL3NoDQoNCiMgPT0gZ2VuZXJhdGVkIGJ5IG1rc2tlbCAwLjAuMnIx
OSwgKGMpIDIwMDEgYnkgRGlDRS9Qc3ljaG9NaXggPT0NCg0KRElSTkFNRT0i
TFZNIjsNClBSRUZJWD0iL3VzciI7DQpERVNURElSPSIvdG1wL3BrZyI7DQpC
SU5UU1Q9InRvb2xzL3ZnY2hhbmdlIjsNCg0KQVVUT1JVTj1mYWxzZTsNCg0K
ZXJyb3IgKCkgeyBlY2hvICQxOyBleGl0IDE7IH0NCg0KaWYgWyAhIC1kICRE
SVJOQU1FIF07DQp0aGVuDQogIGd6aXAgLWRjIGx2bS0yMDAxMDYxNi50YXIu
Z3ogfCB0YXIgeHZmIC07DQogICRBVVRPUlVOIHx8IGV4aXQ7DQpmaQ0KDQpj
ZCAkRElSTkFNRTsNCg0KaWYgWyAtZiAuLi9sdm0tMjAwMTA2MTYucGF0Y2gu
YnoyIF0gJiYgWyAhIC1mIC4uL2x2bS0yMDAxMDYxNi5wYXRjaGVkIF07DQp0
aGVuDQogIGJ6aXAyIC1kYyAgLi4vbHZtLTIwMDEwNjE2LnBhdGNoLmJ6MiB8
IHBhdGNoIC1wMTsNCiAgdG91Y2ggLi4vbHZtLTIwMDEwNjE2LnBhdGNoZWQ7
DQogICRBVVRPUlVOIHx8IGV4aXQ7DQpmaQ0KDQppZiBbICEgLWYgY29uZmln
LmNhY2hlIF0gJiYgWyAteCAuL2NvbmZpZ3VyZSBdOw0KdGhlbg0KICB0b3Vj
aCBjb25maWcuY2FjaGU7DQogIC4vY29uZmlndXJlIC0tcHJlZml4PSRQUkVG
SVggXA0KICAgICAgICAgICAgICAtLXNiaW5kaXI9L3NiaW4gXA0KCSAgICAg
IC0tbGliZGlyPSRQUkVGSVgvbGliIFwNCgkgICAgICAtLWluY2x1ZGVkaXI9
JFBSRUZJWC9pbmNsdWRlIFwNCgkgICAgICAtLW1hbmRpcj0kUFJFRklYL21h
biBcDQoJICAgICAgLS1pbmZvZGlyPSRQUkVGSVgvaW5mbw0KICAkQVVUT1JV
TiB8fCBleGl0Ow0KZmkNCg0KaWYgWyAhIC14ICRCSU5UU1QgXTsNCnRoZW4N
CiAgbWFrZTsNCiAgJEFVVE9SVU4gfHwgZXhpdDsNCmZpDQoNCmlmIFsgLWYg
Li4vJDAudGVtcCBdOw0KdGhlbg0KICBDUElEPWBjYXQgLi4vJDAudGVtcGA7
DQogIFsgISAtZCAkREVTVERJUi8kQ1BJRCBdICYmIGVycm9yICIkREVTVERJ
Ui8kQ1BJRCBub3QgZm91bmQuIjsNCmVsc2UNCiAgQ1BJRD0kJDsNCiAgaWYg
WyAhIC1kICRERVNURElSLyRDUElEIF07DQogIHRoZW4NCiAgICBta2RpciAt
cCAkREVTVERJUi8kQ1BJRDsNCiAgICBlY2hvICIkQ1BJRCIgPiAuLi8kMC50
ZW1wDQogICAgbWFrZSAtZSBzaGFyZWRsaWJkaXI9JERFU1RESVIvJENQSUQv
bGliIFwNCiAgICAgICAgICAgIERFU1RESVI9JERFU1RESVIvJENQSUQgaW5z
dGFsbCAyPiYxIHwgdGVlIC4uL2x2bS0yMDAxMDYxNi5pbnN0YWxsX2xvZzsN
CiAgICBDUFdEPWBwd2RgOw0KICAgIGNkICRERVNURElSLyRDUElEOw0KICAg
IGZvciBpIGluIGBmaW5kIC4gLXR5cGUgZiB8IGdyZXAgIi9tYW4vIiB8IGdy
ZXAgLXYgIi5neiIgfCBncmVwIC12ICIuYnoyImA7DQogICAgZG8NCiAgICAg
IE1OQU1FPWBiYXNlbmFtZSAkaWA7DQogICAgICBlY2hvICIkTU5BTUUgLT4g
JE1OQU1FLmd6IjsNCiAgICAgIGd6aXAgJGk7DQogICAgZG9uZQ0KICAgIGNk
ICRDUFdEOw0KICAgICRBVVRPUlVOIHx8IGV4aXQ7DQogIGZpDQpmaQ0KDQpj
ZCAuLjsNCg0KaWYgIFsgLWQgJERFU1RESVIvJENQSUQgXTsNCnRoZW4NCiAg
Q1BXRD1gcHdkYDsNCiAgY2QgJERFU1RESVIvJENQSUQ7DQogIG1ha2Vwa2cg
JENQV0QvbHZtLTIwMDEwNjE2LnRnejsNCiAgY2QgLi47DQogIHJtIC1SZiAk
Q1BJRDsNCiAgY2QgJENQV0Q7DQpmaQ0KDQpybSAtZiAkMC50ZW1wIGx2bS0y
MDAxMDYxNi5wYXRjaGVkOw0K
--8323328-1150544603-992785138=:14970--
