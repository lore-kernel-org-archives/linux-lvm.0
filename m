Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 454CF100414D
	for <linux-lvm@redhat.com>; Mon, 24 Aug 2020 16:16:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16C75800296
	for <linux-lvm@redhat.com>; Mon, 24 Aug 2020 16:16:51 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id k25so8558894edj.13
	for <linux-lvm@redhat.com>; Mon, 24 Aug 2020 09:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAJHv+s7x_iWxcR5krcyhSqbMTnYFQHjUMej51bCs-jmD-sBe=w@mail.gmail.com>
In-Reply-To: <CAJHv+s7x_iWxcR5krcyhSqbMTnYFQHjUMej51bCs-jmD-sBe=w@mail.gmail.com>
From: KrishnaMurali Chennuboina <krishchennu414@gmail.com>
Date: Mon, 24 Aug 2020 21:46:31 +0530
Message-ID: <CAJHv+s7cZp4qzEzjK7osikZeYT1F=Hh_-LogqqMwAFfOiuaG7Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007a976805ada1e96c"
Subject: Re: [linux-lvm] Regarding the configure error while updating the
	LVM2 package
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

--0000000000007a976805ada1e96c
Content-Type: text/plain; charset="UTF-8"

Hi,

After further investigating the error message, i found that the below line
in configure file is causing the issue.

for ac_header in assert.h ctype.h dirent.h errno.h fcntl.h float.h \
  getopt.h inttypes.h langinfo.h libaio.h libgen.h limits.h locale.h
paths.h \
  signal.h stdarg.h stddef.h stdio.h stdlib.h string.h sys/file.h \
  sys/ioctl.h syslog.h sys/mman.h sys/param.h sys/resource.h sys/stat.h \
  sys/time.h sys/types.h sys/utsname.h sys/wait.h time.h \
  unistd.h

While processing the above for loop the error message is getting observed
for libaio.h file.

BR,
KCH

On Mon, 24 Aug 2020 at 14:56, KrishnaMurali Chennuboina <
krishchennu414@gmail.com> wrote:

> Hi,
>
> While updating the LVM2 package to lvm2-2_02_180, configure is failing
> with biling out error.
> Error Message Observed:
> checking for langinfo.h... yes
> checking libaio.h usability... no
> checking libaio.h presence... no
> checking for libaio.h... no
> configure: error: bailing out
>
>
> Snippet of the build script where configure is used:
> pkg_unpack
> ##
> # HACK: sbindir needs to be defined to ensure the systemd unit files don't
> get a
> # ${exec_prefix} prefix in executables' paths.
> ##
> CFLAGS="-g" ./configure --build=none --host=$TOOL_TRIPLET --prefix=/usr \
>        --libdir="/usr/$LIB_NAME" --enable-udev_rules --with-lvm1=none \
>        --enable-lvmetad --sbindir=/usr/bin \
>        ac_cv_func_malloc_0_nonnull=yes \
>        ac_cv_func_realloc_0_nonnull=yes
>
> Tried without passing any arguments to configure but still getting the
> same error message. Could you please suggest if the mentioned version is
> having dependency with any package??
>
> BR,
> KCH
>

--0000000000007a976805ada1e96c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>After further investigating the err=
or message, i found that the below line in configure file is causing the is=
sue.</div><div><br></div><div><div style=3D"box-sizing:border-box;font-fami=
ly:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,sans-serif;font-size:14px">for ac_header in assert.h ctype.=
h dirent.h errno.h fcntl.h float.h \<br>
=C2=A0 getopt.h inttypes.h langinfo.h libaio.h libgen.h limits.h locale.h p=
aths.h \<br>
=C2=A0 signal.h stdarg.h stddef.h stdio.h stdlib.h string.h sys/file.h \<br=
>
=C2=A0 sys/ioctl.h syslog.h sys/mman.h sys/param.h sys/resource.h sys/stat.=
h \<br>
=C2=A0 sys/time.h sys/types.h sys/utsname.h sys/wait.h time.h \<br>
=C2=A0 unistd.h</div></div><div style=3D"box-sizing:border-box;font-family:=
&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI=
 Emoji&quot;,sans-serif;font-size:14px"><br></div><div style=3D"box-sizing:=
border-box;font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emo=
ji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px">While proces=
sing the above for loop the error message is getting observed for libaio.h =
file.</div><div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&q=
uot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,san=
s-serif;font-size:14px"><br></div><div style=3D"box-sizing:border-box;font-=
family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;S=
egoe UI Emoji&quot;,sans-serif;font-size:14px">BR,</div><div style=3D"box-s=
izing:border-box;font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Col=
or Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px">KCH</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, 24 Aug 2020 at 14:56, KrishnaMurali Chennuboina &lt;<a href=3D"m=
ailto:krishchennu414@gmail.com">krishchennu414@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi=
,<div><br></div><div>While updating the LVM2 package to=C2=A0lvm2-2_02_180,=
 configure is failing with biling out error.</div><div>Error Message Observ=
ed:</div><div>checking for langinfo.h... yes<br>checking libaio.h usability=
... no<br>checking libaio.h presence... no<br>checking for libaio.h... no<b=
r>configure: error: bailing out<br></div><div><br></div><div><br></div><div=
>Snippet of the build script where configure is used:</div><div>pkg_unpack<=
br>##<br># HACK: sbindir needs to be defined to ensure the systemd unit fil=
es don&#39;t get a<br># ${exec_prefix} prefix in executables&#39; paths.<br=
>##<br>CFLAGS=3D&quot;-g&quot; ./configure --build=3Dnone --host=3D$TOOL_TR=
IPLET --prefix=3D/usr \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0--libdir=3D&quot;/usr=
/$LIB_NAME&quot; --enable-udev_rules --with-lvm1=3Dnone \<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0--enable-lvmetad --sbindir=3D/usr/bin \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0ac_cv_func_malloc_0_nonnull=3Dyes \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0ac_cv_func_realloc_0_nonnull=3Dyes<br></div><div><br></div><div>Tried wi=
thout passing any arguments to configure but still getting the same error m=
essage. Could you please suggest if the mentioned version is having depende=
ncy with any package??</div><div><br></div><div>BR,</div><div>KCH</div></di=
v>
</blockquote></div>

--0000000000007a976805ada1e96c--
