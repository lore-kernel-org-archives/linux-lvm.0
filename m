Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C2785C25F
	for <linux-lvm@redhat.com>; Mon,  5 Feb 2018 07:42:11 +0000 (UTC)
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF5264E8BA
	for <linux-lvm@redhat.com>; Mon,  5 Feb 2018 07:42:09 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id q194so40309705lfe.13
	for <linux-lvm@redhat.com>; Sun, 04 Feb 2018 23:42:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <38d3b050-7cc7-66cb-5579-5513a5d7b37e@suse.com>
References: <CAPE0SYxuLG3sqoaez=CV4ZjQEcB+iqzB+CM7q6jrLg9z+L6kzQ@mail.gmail.com>
	<38d3b050-7cc7-66cb-5579-5513a5d7b37e@suse.com>
From: Liwei <xieliwei@gmail.com>
Date: Mon, 5 Feb 2018 15:42:04 +0800
Message-ID: <CAPE0SYxR2NtM_vdrqSMBsy==YT2MF8we_Q+HJ9Upeb6an2PLpQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a11402e24f630ff056472325b"
Subject: Re: [linux-lvm] Unsync-ed LVM Mirror
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
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--001a11402e24f630ff056472325b
Content-Type: text/plain; charset="UTF-8"

Hi Eric,
    Thanks for answering! Here are the details:

# lvm version
  LVM version:     2.02.176(2) (2017-11-03)
  Library version: 1.02.145 (2017-11-03)
  Driver version:  4.37.0
  Configuration:   ./configure --build=x86_64-linux-gnu --prefix=/usr
--includedir=${prefix}/include --mandir=${prefix}/share/man
--infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var
--disable-silent-rules --libdir=${prefix}/lib/x86_64-linux-gnu
--libexecdir=${prefix}/lib/x86_64-linux-gnu --runstatedir=/run
--disable-maintainer-mode --disable-dependency-tracking --exec-prefix=
--bindir=/bin --libdir=/lib/x86_64-linux-gnu --sbindir=/sbin
--with-usrlibdir=/usr/lib/x86_64-linux-gnu --with-optimisation=-O2
--with-cache=internal --with-clvmd=corosync --with-cluster=internal
--with-device-uid=0 --with-device-gid=6 --with-device-mode=0660
--with-default-pid-dir=/run --with-default-run-dir=/run/lvm
--with-default-locking-dir=/run/lock/lvm --with-thin=internal
--with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump
--with-thin-repair=/usr/sbin/thin_repair --enable-applib
--enable-blkid_wiping --enable-cmdlib --enable-cmirrord --enable-dmeventd
--enable-dbus-service --enable-lvmetad --enable-lvmlockd-dlm
--enable-lvmlockd-sanlock --enable-lvmpolld --enable-notify-dbus
--enable-pkgconfig --enable-readline --enable-udev_rules --enable-udev_sync

# uname -a
Linux dataserv 4.14.0-3-amd64 #1 SMP Debian 4.14.13-1 (2018-01-14) x86_64
GNU/Linux

Warm regards,
Liwei

On 5 Feb 2018 15:27, "Eric Ren" <zren@suse.com> wrote:

> Hi,
>
> Your LVM version and kernel version please?
>
> like:
> """"
> # lvm version
>   LVM version:     2.02.177(2) (2017-12-18)
>   Library version: 1.03.01 (2017-12-18)
>   Driver version:  4.35.0
>
> # uname -a
> Linux sle15-c1-n1 4.12.14-9.1-default #1 SMP Fri Jan 19 09:13:51 UTC 2018
> (849a2fe) x86_64 x86_64 x86_64 GNU/Linux
> """
>
> Eric
>
> On 02/03/2018 05:43 PM, Liwei wrote:
>
>> Hi list,
>>      I had a LV that I was converting from linear to mirrored (not
>> raid1) whose source device failed partway-through during the initial
>> sync.
>>
>>      I've since recovered the source device, but it seems like the
>> mirror is still acting as if some blocks are not readable? I'm getting
>> this in my logs, and the FS is full of errors:
>>
>> [  +1.613126] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.000278] device-mapper: raid1: Primary mirror (253:25) failed
>> while out-of-sync: Reads may fail.
>> [  +0.085916] device-mapper: raid1: Mirror read failed.
>> [  +0.196562] device-mapper: raid1: Mirror read failed.
>> [  +0.000237] Buffer I/O error on dev dm-27, logical block 5371800560,
>> async page read
>> [  +0.592135] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.082882] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.246945] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.107374] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.083344] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.114949] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.085056] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.203929] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.157953] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +3.065247] recovery_complete: 23 callbacks suppressed
>> [  +0.000001] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.128064] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.103100] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.107827] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.140871] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.132844] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.124698] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.138502] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.117827] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [  +0.125705] device-mapper: raid1: Unable to read primary mirror
>> during recovery
>> [Feb 3 17:09] device-mapper: raid1: Mirror read failed.
>> [  +0.167553] device-mapper: raid1: Mirror read failed.
>> [  +0.000268] Buffer I/O error on dev dm-27, logical block 5367765816,
>> async page read
>> [  +0.135138] device-mapper: raid1: Mirror read failed.
>> [  +0.000238] Buffer I/O error on dev dm-27, logical block 5367765816,
>> async page read
>> [  +0.000365] device-mapper: raid1: Mirror read failed.
>> [  +0.000315] device-mapper: raid1: Mirror read failed.
>> [  +0.000213] Buffer I/O error on dev dm-27, logical block 5367896888,
>> async page read
>> [  +0.000276] device-mapper: raid1: Mirror read failed.
>> [  +0.000199] Buffer I/O error on dev dm-27, logical block 5367765816,
>> async page read
>>
>>      However, if I take down the destination device and restart the LV
>> with --activateoption partial, I can read my data and everything
>> checks out.
>>
>>      My theory (and what I observed) is that lvm continued the initial
>> sync even after the source drive stopped responding, and has now
>> mapped the blocks that it 'synced' as dead. How can I make lvm retry
>> those blocks again?
>>
>>      In fact, I don't trust the mirror anymore, is there a way I can
>> conduct a scrub of the mirror after the initial sync is done? I read
>> about --syncaction check, but seems like it only notes the number of
>> inconsistencies. Can I have lvm re-mirror the inconsistencies from the
>> source to destination device? I trust the source device because we ran
>> a btrfs scrub on it and it reported that all checksums are valid.
>>
>>      It took months for the mirror sync to get to this stage (actually,
>> why does it take months to mirror 20TB?), I don't want to start it all
>> over again.
>>
>> Warm regards,
>> Liwei
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>

--001a11402e24f630ff056472325b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Eric,<div dir=3D"auto">=C2=A0 =C2=A0 Thanks for answer=
ing! Here are the details:</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"># lvm version<div dir=3D"auto">=C2=A0 LVM version:=C2=A0 =C2=A0 =C2=A02.=
02.176(2) (2017-11-03)</div><div dir=3D"auto">=C2=A0 Library version: 1.02.=
145 (2017-11-03)</div><div dir=3D"auto">=C2=A0 Driver version:=C2=A0 4.37.0=
</div><div dir=3D"auto">=C2=A0 Configuration:=C2=A0 =C2=A0./configure --bui=
ld=3Dx86_64-linux-gnu --prefix=3D/usr --includedir=3D${prefix}/include --ma=
ndir=3D${prefix}/share/man --infodir=3D${prefix}/share/info --sysconfdir=3D=
/etc --localstatedir=3D/var --disable-silent-rules --libdir=3D${prefix}/lib=
/x86_64-linux-gnu --libexecdir=3D${prefix}/lib/x86_64-linux-gnu --runstated=
ir=3D/run --disable-maintainer-mode --disable-dependency-tracking --exec-pr=
efix=3D --bindir=3D/bin --libdir=3D/lib/x86_64-linux-gnu --sbindir=3D/sbin =
--with-usrlibdir=3D/usr/lib/x86_64-linux-gnu --with-optimisation=3D-O2 --wi=
th-cache=3Dinternal --with-clvmd=3Dcorosync --with-cluster=3Dinternal --wit=
h-device-uid=3D0 --with-device-gid=3D6 --with-device-mode=3D0660 --with-def=
ault-pid-dir=3D/run --with-default-run-dir=3D/run/lvm --with-default-lockin=
g-dir=3D/run/lock/lvm --with-thin=3Dinternal --with-thin-check=3D/usr/sbin/=
thin_check --with-thin-dump=3D/usr/sbin/thin_dump --with-thin-repair=3D/usr=
/sbin/thin_repair --enable-applib --enable-blkid_wiping --enable-cmdlib --e=
nable-cmirrord --enable-dmeventd --enable-dbus-service --enable-lvmetad --e=
nable-lvmlockd-dlm --enable-lvmlockd-sanlock --enable-lvmpolld --enable-not=
ify-dbus --enable-pkgconfig --enable-readline --enable-udev_rules --enable-=
udev_sync</div><div dir=3D"auto"><br></div><div dir=3D"auto"># uname -a<br>=
</div><div dir=3D"auto">Linux dataserv 4.14.0-3-amd64 #1 SMP Debian 4.14.13=
-1 (2018-01-14) x86_64 GNU/Linux</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Warm regards,=C2=A0</div><div dir=3D"auto">Liwei</div></div></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 5 Feb 2018 15=
:27, &quot;Eric Ren&quot; &lt;<a href=3D"mailto:zren@suse.com">zren@suse.co=
m</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,=
<br>
<br>
Your LVM version and kernel version please?<br>
<br>
like:<br>
&quot;&quot;&quot;&quot;<br>
# lvm version<br>
=C2=A0 LVM version:=C2=A0=C2=A0=C2=A0=C2=A0 2.02.177(2) (2017-12-18)<br>
=C2=A0 Library version: 1.03.01 (2017-12-18)<br>
=C2=A0 Driver version:=C2=A0 4.35.0<br>
<br>
# uname -a<br>
Linux sle15-c1-n1 4.12.14-9.1-default #1 SMP Fri Jan 19 09:13:51 UTC 2018 (=
849a2fe) x86_64 x86_64 x86_64 GNU/Linux<br>
&quot;&quot;&quot;<br>
<br>
Eric<br>
<br>
On 02/03/2018 05:43 PM, Liwei wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi list,<br>
=C2=A0 =C2=A0 =C2=A0I had a LV that I was converting from linear to mirrore=
d (not<br>
raid1) whose source device failed partway-through during the initial<br>
sync.<br>
<br>
=C2=A0 =C2=A0 =C2=A0I&#39;ve since recovered the source device, but it seem=
s like the<br>
mirror is still acting as if some blocks are not readable? I&#39;m getting<=
br>
this in my logs, and the FS is full of errors:<br>
<br>
[=C2=A0 +1.613126] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.000278] device-mapper: raid1: Primary mirror (253:25) failed<br>
while out-of-sync: Reads may fail.<br>
[=C2=A0 +0.085916] device-mapper: raid1: Mirror read failed.<br>
[=C2=A0 +0.196562] device-mapper: raid1: Mirror read failed.<br>
[=C2=A0 +0.000237] Buffer I/O error on dev dm-27, logical block 5371800560,=
<br>
async page read<br>
[=C2=A0 +0.592135] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.082882] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.246945] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.107374] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.083344] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.114949] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.085056] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.203929] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.157953] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +3.065247] recovery_complete: 23 callbacks suppressed<br>
[=C2=A0 +0.000001] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.128064] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.103100] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.107827] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.140871] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.132844] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.124698] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.138502] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.117827] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[=C2=A0 +0.125705] device-mapper: raid1: Unable to read primary mirror<br>
during recovery<br>
[Feb 3 17:09] device-mapper: raid1: Mirror read failed.<br>
[=C2=A0 +0.167553] device-mapper: raid1: Mirror read failed.<br>
[=C2=A0 +0.000268] Buffer I/O error on dev dm-27, logical block 5367765816,=
<br>
async page read<br>
[=C2=A0 +0.135138] device-mapper: raid1: Mirror read failed.<br>
[=C2=A0 +0.000238] Buffer I/O error on dev dm-27, logical block 5367765816,=
<br>
async page read<br>
[=C2=A0 +0.000365] device-mapper: raid1: Mirror read failed.<br>
[=C2=A0 +0.000315] device-mapper: raid1: Mirror read failed.<br>
[=C2=A0 +0.000213] Buffer I/O error on dev dm-27, logical block 5367896888,=
<br>
async page read<br>
[=C2=A0 +0.000276] device-mapper: raid1: Mirror read failed.<br>
[=C2=A0 +0.000199] Buffer I/O error on dev dm-27, logical block 5367765816,=
<br>
async page read<br>
<br>
=C2=A0 =C2=A0 =C2=A0However, if I take down the destination device and rest=
art the LV<br>
with --activateoption partial, I can read my data and everything<br>
checks out.<br>
<br>
=C2=A0 =C2=A0 =C2=A0My theory (and what I observed) is that lvm continued t=
he initial<br>
sync even after the source drive stopped responding, and has now<br>
mapped the blocks that it &#39;synced&#39; as dead. How can I make lvm retr=
y<br>
those blocks again?<br>
<br>
=C2=A0 =C2=A0 =C2=A0In fact, I don&#39;t trust the mirror anymore, is there=
 a way I can<br>
conduct a scrub of the mirror after the initial sync is done? I read<br>
about --syncaction check, but seems like it only notes the number of<br>
inconsistencies. Can I have lvm re-mirror the inconsistencies from the<br>
source to destination device? I trust the source device because we ran<br>
a btrfs scrub on it and it reported that all checksums are valid.<br>
<br>
=C2=A0 =C2=A0 =C2=A0It took months for the mirror sync to get to this stage=
 (actually,<br>
why does it take months to mirror 20TB?), I don&#39;t want to start it all<=
br>
over again.<br>
<br>
Warm regards,<br>
Liwei<br>
<br>
______________________________<wbr>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman<wbr>/listinfo/linux-=
lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWT<wbr>O/</a><br>
<br>
</blockquote>
<br>
</blockquote></div></div>

--001a11402e24f630ff056472325b--
