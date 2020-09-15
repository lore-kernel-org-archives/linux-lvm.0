Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 089AC2166BA3
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 17:01:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4258801220
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 17:01:27 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id r7so6065294ejs.11
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 10:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAJHv+s7m=Ad=mK-QpuSDKVsa8fOyGV4Ex9LnaiDkhsStud35mQ@mail.gmail.com>
	<CAAMCDefd+ugu-Myx0wAfmfRs+1TnTjX-yQSMjLkjtLPNx2tnyw@mail.gmail.com>
	<CAJHv+s6TmtZFxRTZW1Yo-2gFee4x5XPa1dpFnP_+EMxtr80DAw@mail.gmail.com>
	<CAAMCDefcYsODUt=fv5u1t=gGKXPtcPMYh8xzH1ztb7R9N0QSHQ@mail.gmail.com>
	<CAJHv+s7vjQmboxJWH73M8ZiemU+FnwcV7+rwtMhNnVStyvqc3g@mail.gmail.com>
In-Reply-To: <CAJHv+s7vjQmboxJWH73M8ZiemU+FnwcV7+rwtMhNnVStyvqc3g@mail.gmail.com>
From: KrishnaMurali Chennuboina <krishchennu414@gmail.com>
Date: Tue, 15 Sep 2020 22:31:09 +0530
Message-ID: <CAJHv+s6nVrDT7evT+c4GgCDCy5VbfqnvjKBxq4AYKpvymU0peA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b5881805af5d19e6"
Subject: Re: [linux-lvm] Issue after upgrading the LVM2 package from
 2.02.176 to 2.02.180
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

--000000000000b5881805af5d19e6
Content-Type: text/plain; charset="UTF-8"

Hi Roger,

Missed to add my comment in the earlier mail.
From the filter it should not exclude /dev/sda*. But not sure why it is
being excluded while executing pvcreate command.

Thanks.

On Tue, 15 Sep 2020 at 18:28, KrishnaMurali Chennuboina <
krishchennu414@gmail.com> wrote:

> Hi Roger,
>
> Thanks for the information shared.
> Filter which we used in our conf file was,
>         # Accept every block device:
>           filter = [ "r|^/dev/drbd.*|" ]
>
>
> Thanks.
>
> On Tue, 15 Sep 2020 at 16:36, Roger Heflin <rogerheflin@gmail.com> wrote:
>
>> #1:
>> Device /dev/sda3 excluded by a filter.)
>> Failed to execute command: pvcreate -ffy /dev/sda3
>> ec=0
>>
>> excluded by filter is likely the issue, I think there was a bug were
>> it allowed that pvcreate to work when it should have blocked it
>> because of the filter.  It should not allow a pvcreate against
>> something blocked by a filter.
>>
>> #2: Read-only locking type set. Write locks are prohibited.
>> I am going to guess either / is not mounted rw, or you don't have the
>> directory mounted rw that is needed to create the locks (/var/run/lvm
>> usually).
>>
>> On Tue, Sep 15, 2020 at 1:42 AM KrishnaMurali Chennuboina
>> <krishchennu414@gmail.com> wrote:
>> >
>> > Hi Roger,
>> >
>> > I have tried this with the older LVM package(.176) and this issue was
>> not seen. Issue was seen with .180 version every time.
>> > # executing command: vgchange -ay
>> > (status, output): (0,   WARNING: Failed to connect to lvmetad. Falling
>> back to device scanning.)
>> >   WARNING: Failed to connect to lvmetad. Falling back to device
>> scanning.
>> > # executing command: pvcreate -ffy /dev/sda3
>> > (status, output): (5,   WARNING: Failed to connect to lvmetad. Falling
>> back to device scanning.
>> >   Error reading device /dev/sda3 at 0 length 4096.
>> >   Error reading device /dev/ram0 at 0 length 4096.
>> >   Error reading device /dev/loop0 at 0 length 4096.
>> >   Error reading device /dev/sda at 0 length 512.
>> >   Error reading device /dev/sda at 0 length 4096.
>> >   Error reading device /dev/ram1 at 0 length 4096.
>> >   Error reading device /dev/sda1 at 0 length 4096.
>> >   Error reading device /dev/ram2 at 0 length 4096.
>> >   Error reading device /dev/sda2 at 0 length 4096.
>> >   Error reading device /dev/ram3 at 0 length 4096.
>> >   Error reading device /dev/ram4 at 0 length 4096.
>> >   Error reading device /dev/ram5 at 0 length 4096.
>> >   Error reading device /dev/ram6 at 0 length 4096.
>> >   Error reading device /dev/ram7 at 0 length 4096.
>> >   Error reading device /dev/ram8 at 0 length 4096.
>> >   Error reading device /dev/ram9 at 0 length 4096.
>> >   Error reading device /dev/ram10 at 0 length 4096.
>> >   Error reading device /dev/ram11 at 0 length 4096.
>> >   Error reading device /dev/ram12 at 0 length 4096.
>> >   Error reading device /dev/ram13 at 0 length 4096.
>> >   Error reading device /dev/ram14 at 0 length 4096.
>> >   Error reading device /dev/ram15 at 0 length 4096.
>> >   Device /dev/sda3 excluded by a filter.)
>> > Failed to execute command: pvcreate -ffy /dev/sda3
>> > ec=0
>> >
>> > I have tried with different options of pvcreate but didnt helped much.
>> After the system got halted with the above error, i tried to executing pvs
>> command but got the below error.
>> > bash-4.4# pvs
>> >   Error reading device /dev/ram0 at 0 length 4096.
>> >   Error reading device /dev/loop0 at 0 length 4096.
>> >   Error reading device /dev/sda at 0 length 512.
>> >   Error reading device /dev/sda at 0 length 4096.
>> >   Error reading device /dev/ram1 at 0 length 4096.
>> >   Error reading device /dev/sda1 at 0 length 4096.
>> >   Error reading device /dev/ram2 at 0 length 4096.
>> >   Error reading device /dev/sda2 at 0 length 4096.
>> >   Error reading device /dev/ram3 at 0 length 4096.
>> >   Error reading device /dev/sda3 at 0 length 4096.
>> >   Error reading device /dev/ram4 at 0 length 4096.
>> >   Error reading device /dev/sda4 at 0 length 4096.
>> >   Error reading device /dev/ram5 at 0 length 4096.
>> >   Error reading device /dev/ram6 at 0 length 4096.
>> >   Error reading device /dev/ram7 at 0 length 4096.
>> >   Error reading device /dev/ram8 at 0 length 4096.
>> >   Error reading device /dev/ram9 at 0 length 4096.
>> >   Error reading device /dev/ram10 at 0 length 4096.
>> >   Error reading device /dev/ram11 at 0 length 4096.
>> >   Error reading device /dev/ram12 at 0 length 4096.
>> >   Error reading device /dev/ram13 at 0 length 4096.
>> >   Error reading device /dev/ram14 at 0 length 4096.
>> >   Error reading device /dev/ram15 at 0 length 4096.
>> >   Error reading device /dev/sdb at 0 length 512.
>> >   Error reading device /dev/sdb at 0 length 4096.
>> >   Error reading device /dev/sdb1 at 0 length 4096.
>> >   Error reading device /dev/sdb2 at 0 length 4096.
>> >   Error reading device /dev/sdb3 at 0 length 4096.
>> >   Read-only locking type set. Write locks are prohibited.
>> >   Recovery of standalone physical volumes failed.
>> >   Cannot process standalone physical volumes
>> > bash-4.4#
>> >
>> > Attached the complete log in initial mail.
>> >
>> > Thanks.
>> >
>> > On Mon, 14 Sep 2020 at 20:29, Roger Heflin <rogerheflin@gmail.com>
>> wrote:
>> >>
>> >> In general I would suggest fully disabling lvmetad from the config
>> >> files and from being started up.
>> >>
>> >> Issues around it not answering (like above) and answering but somehow
>> >> having stale/wrong info have burned me too many times to trust it.  It
>> >> may be a lvmetad bug, or be udevd weirdness.
>> >>
>> >> The only significant improvement it makes is it reduces the lvm
>> >> command time on installs with significant numbers of devices, but
>> >> given that the info has been wrong often enough that is not worth the
>> >> risk.
>> >>
>> >> On Mon, Sep 14, 2020 at 2:25 AM KrishnaMurali Chennuboina
>> >> <krishchennu414@gmail.com> wrote:
>> >> >
>> >> > Hi Team,
>> >> >
>> >> > While trying to analyze one the issue, we felt that upgrading the
>> current LVM2 package in our repository will be the best approach.
>> >> > As part of that, we have updated the respective package from
>> 2.02.176 to 2.02.180. We have verified the same and booted x86_64 hardware
>> without any issues.
>> >> >
>> >> > But while trying to boot mips64 hardware we have started observing
>> the below issue.  Providing the snippet of the log,
>> >> >
>> >> > # executing command: vgchange -an
>> >> > (status, output): (0,   WARNING: Failed to connect to lvmetad.
>> Falling back to device scanning.)
>> >> >   WARNING: Failed to connect to lvmetad. Falling back to device
>> scanning.
>> >> >
>> >> > Attached the detailed log for reference. There is no other change
>> included other than the LVM2 update.
>> >> >
>> >> > LVM2 Version: 2.02.176
>> >> > Updated LVM2 version: 2.02.180
>> >> >
>> >> > Please share inputs on why this issue is being observed with .180
>> version?
>> >> > Please let me know if i can share any other information.
>> >> >
>> >> > Thanks.
>> >> >
>> >> > _______________________________________________
>> >> > linux-lvm mailing list
>> >> > linux-lvm@redhat.com
>> >> > https://www.redhat.com/mailman/listinfo/linux-lvm
>> >> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> >>
>> >> _______________________________________________
>> >> linux-lvm mailing list
>> >> linux-lvm@redhat.com
>> >> https://www.redhat.com/mailman/listinfo/linux-lvm
>> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> >>
>> > _______________________________________________
>> > linux-lvm mailing list
>> > linux-lvm@redhat.com
>> > https://www.redhat.com/mailman/listinfo/linux-lvm
>> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>

--000000000000b5881805af5d19e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Roger,<div><br></div><div>Missed to add my comment in t=
he earlier mail.</div><div>From the filter it should not exclude /dev/sda*.=
 But not sure why it is being excluded while executing pvcreate command.</d=
iv><div><br></div><div>Thanks.=C2=A0=C2=A0</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 15 Sep 2020 at 18:2=
8, KrishnaMurali Chennuboina &lt;<a href=3D"mailto:krishchennu414@gmail.com=
">krishchennu414@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr">Hi Roger,<div><br></div><div>Tha=
nks for the information shared.=C2=A0</div><div>Filter which we used in our=
 conf file was,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Accept every block =
device:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filter =3D [ &quot;r|^/dev/dr=
bd.*|&quot; ]<br></div><div><br></div><div><br></div><div>Thanks.</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, 15 Sep 2020 at 16:36, Roger Heflin &lt;<a href=3D"mailto:rogerheflin@gm=
ail.com" target=3D"_blank">rogerheflin@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">#1:<br>
Device /dev/sda3 excluded by a filter.)<br>
Failed to execute command: pvcreate -ffy /dev/sda3<br>
ec=3D0<br>
<br>
excluded by filter is likely the issue, I think there was a bug were<br>
it allowed that pvcreate to work when it should have blocked it<br>
because of the filter.=C2=A0 It should not allow a pvcreate against<br>
something blocked by a filter.<br>
<br>
#2: Read-only locking type set. Write locks are prohibited.<br>
I am going to guess either / is not mounted rw, or you don&#39;t have the<b=
r>
directory mounted rw that is needed to create the locks (/var/run/lvm<br>
usually).<br>
<br>
On Tue, Sep 15, 2020 at 1:42 AM KrishnaMurali Chennuboina<br>
&lt;<a href=3D"mailto:krishchennu414@gmail.com" target=3D"_blank">krishchen=
nu414@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Roger,<br>
&gt;<br>
&gt; I have tried this with the older LVM package(.176) and this issue was =
not seen. Issue was seen with .180 version every time.<br>
&gt; # executing command: vgchange -ay<br>
&gt; (status, output): (0,=C2=A0 =C2=A0WARNING: Failed to connect to lvmeta=
d. Falling back to device scanning.)<br>
&gt;=C2=A0 =C2=A0WARNING: Failed to connect to lvmetad. Falling back to dev=
ice scanning.<br>
&gt; # executing command: pvcreate -ffy /dev/sda3<br>
&gt; (status, output): (5,=C2=A0 =C2=A0WARNING: Failed to connect to lvmeta=
d. Falling back to device scanning.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda3 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram0 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/loop0 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda at 0 length 512.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram1 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda1 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram2 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda2 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram3 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram4 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram5 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram6 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram7 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram8 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram9 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram10 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram11 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram12 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram13 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram14 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram15 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Device /dev/sda3 excluded by a filter.)<br>
&gt; Failed to execute command: pvcreate -ffy /dev/sda3<br>
&gt; ec=3D0<br>
&gt;<br>
&gt; I have tried with different options of pvcreate but didnt helped much.=
 After the system got halted with the above error, i tried to executing pvs=
 command but got the below error.<br>
&gt; bash-4.4# pvs<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram0 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/loop0 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda at 0 length 512.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram1 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda1 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram2 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda2 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram3 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda3 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram4 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sda4 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram5 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram6 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram7 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram8 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram9 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram10 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram11 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram12 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram13 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram14 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/ram15 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sdb at 0 length 512.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sdb at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sdb1 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sdb2 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Error reading device /dev/sdb3 at 0 length 4096.<br>
&gt;=C2=A0 =C2=A0Read-only locking type set. Write locks are prohibited.<br=
>
&gt;=C2=A0 =C2=A0Recovery of standalone physical volumes failed.<br>
&gt;=C2=A0 =C2=A0Cannot process standalone physical volumes<br>
&gt; bash-4.4#<br>
&gt;<br>
&gt; Attached the complete log in initial mail.<br>
&gt;<br>
&gt; Thanks.<br>
&gt;<br>
&gt; On Mon, 14 Sep 2020 at 20:29, Roger Heflin &lt;<a href=3D"mailto:roger=
heflin@gmail.com" target=3D"_blank">rogerheflin@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; In general I would suggest fully disabling lvmetad from the config=
<br>
&gt;&gt; files and from being started up.<br>
&gt;&gt;<br>
&gt;&gt; Issues around it not answering (like above) and answering but some=
how<br>
&gt;&gt; having stale/wrong info have burned me too many times to trust it.=
=C2=A0 It<br>
&gt;&gt; may be a lvmetad bug, or be udevd weirdness.<br>
&gt;&gt;<br>
&gt;&gt; The only significant improvement it makes is it reduces the lvm<br=
>
&gt;&gt; command time on installs with significant numbers of devices, but<=
br>
&gt;&gt; given that the info has been wrong often enough that is not worth =
the<br>
&gt;&gt; risk.<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 14, 2020 at 2:25 AM KrishnaMurali Chennuboina<br>
&gt;&gt; &lt;<a href=3D"mailto:krishchennu414@gmail.com" target=3D"_blank">=
krishchennu414@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Team,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; While trying to analyze one the issue, we felt that upgrading=
 the current LVM2 package in our repository will be the best approach.<br>
&gt;&gt; &gt; As part of that, we have updated the respective package from=
=C2=A0 2.02.176 to 2.02.180. We have verified the same and booted x86_64 ha=
rdware without any issues.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; But while trying to boot mips64 hardware we have started obse=
rving the below issue.=C2=A0 Providing the snippet of the log,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; # executing command: vgchange -an<br>
&gt;&gt; &gt; (status, output): (0,=C2=A0 =C2=A0WARNING: Failed to connect =
to lvmetad. Falling back to device scanning.)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0WARNING: Failed to connect to lvmetad. Falling ba=
ck to device scanning.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Attached the detailed log for reference. There is no other ch=
ange included other than the LVM2 update.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; LVM2 Version: 2.02.176<br>
&gt;&gt; &gt; Updated LVM2 version: 2.02.180<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Please share inputs on why this issue is being observed with =
.180 version?<br>
&gt;&gt; &gt; Please let me know if i can share any other information.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; linux-lvm mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">lin=
ux-lvm@redhat.com</a><br>
&gt;&gt; &gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm"=
 rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/mailman/listin=
fo/linux-lvm</a><br>
&gt;&gt; &gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-H=
OWTO/" rel=3D"noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO=
/</a><br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; linux-lvm mailing list<br>
&gt;&gt; <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lv=
m@redhat.com</a><br>
&gt;&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=
=3D"noreferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/l=
inux-lvm</a><br>
&gt;&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/=
" rel=3D"noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a>=
<br>
&gt;&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@re=
dhat.com</a><br>
&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"n=
oreferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-=
lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" re=
l=3D"noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000b5881805af5d19e6--
