Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4D662028E91
	for <linux-lvm@redhat.com>; Mon, 24 Aug 2020 09:26:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAB4E8EB54A
	for <linux-lvm@redhat.com>; Mon, 24 Aug 2020 09:26:50 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id b2so7413682edw.5
	for <linux-lvm@redhat.com>; Mon, 24 Aug 2020 02:26:45 -0700 (PDT)
MIME-Version: 1.0
From: KrishnaMurali Chennuboina <krishchennu414@gmail.com>
Date: Mon, 24 Aug 2020 14:56:33 +0530
Message-ID: <CAJHv+s7x_iWxcR5krcyhSqbMTnYFQHjUMej51bCs-jmD-sBe=w@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000059fc0e05ad9c2f12"
Subject: [linux-lvm] Regarding the configure error while updating the LVM2
	package
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

--00000000000059fc0e05ad9c2f12
Content-Type: text/plain; charset="UTF-8"

Hi,

While updating the LVM2 package to lvm2-2_02_180, configure is failing with
biling out error.
Error Message Observed:
checking for langinfo.h... yes
checking libaio.h usability... no
checking libaio.h presence... no
checking for libaio.h... no
configure: error: bailing out


Snippet of the build script where configure is used:
pkg_unpack
##
# HACK: sbindir needs to be defined to ensure the systemd unit files don't
get a
# ${exec_prefix} prefix in executables' paths.
##
CFLAGS="-g" ./configure --build=none --host=$TOOL_TRIPLET --prefix=/usr \
       --libdir="/usr/$LIB_NAME" --enable-udev_rules --with-lvm1=none \
       --enable-lvmetad --sbindir=/usr/bin \
       ac_cv_func_malloc_0_nonnull=yes \
       ac_cv_func_realloc_0_nonnull=yes

Tried without passing any arguments to configure but still getting the same
error message. Could you please suggest if the mentioned version is having
dependency with any package??

BR,
KCH

--00000000000059fc0e05ad9c2f12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>While updating the LVM2 package to=
=C2=A0lvm2-2_02_180, configure is failing with biling out error.</div><div>=
Error Message Observed:</div><div>checking for langinfo.h... yes<br>checkin=
g libaio.h usability... no<br>checking libaio.h presence... no<br>checking =
for libaio.h... no<br>configure: error: bailing out<br></div><div><br></div=
><div><br></div><div>Snippet of the build script where configure is used:</=
div><div>pkg_unpack<br>##<br># HACK: sbindir needs to be defined to ensure =
the systemd unit files don&#39;t get a<br># ${exec_prefix} prefix in execut=
ables&#39; paths.<br>##<br>CFLAGS=3D&quot;-g&quot; ./configure --build=3Dno=
ne --host=3D$TOOL_TRIPLET --prefix=3D/usr \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0-=
-libdir=3D&quot;/usr/$LIB_NAME&quot; --enable-udev_rules --with-lvm1=3Dnone=
 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-lvmetad --sbindir=3D/usr/bin \<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_func_malloc_0_nonnull=3Dyes \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0ac_cv_func_realloc_0_nonnull=3Dyes<br></div><div><br></=
div><div>Tried without passing any arguments to configure but still getting=
 the same error message. Could you please suggest if the mentioned version =
is having dependency with any package??</div><div><br></div><div>BR,</div><=
div>KCH</div></div>

--00000000000059fc0e05ad9c2f12--
