MIME-Version: 1.0
References: <CA+p0dM=1BmTA3LyPwGFMH0gO6G7bVa-FUVs-Z8Z8vcRPqHODMQ@mail.gmail.com>
	<20180511082128.jabbpuxnq4c7ypxr@reti>
	<6546b6c6-14fb-3180-9b4d-62aa638a2fb3@redhat.com>
In-Reply-To: <6546b6c6-14fb-3180-9b4d-62aa638a2fb3@redhat.com>
From: John Hamilton <john.l.hamilton@gmail.com>
Date: Fri, 11 May 2018 12:09:44 -0500
Message-ID: <CA+p0dMk313yLwfoMpGwzbsXk5qQ67dy04OWCZ_ZZMkxU6ij7=Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000089803f056bf134bf"
Subject: Re: [linux-lvm] inconsistency between thin pool metadata
 mapped_blocks and lvs output
Reply-To: john.l.hamilton@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Marian Csontos <mcsontos@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--00000000000089803f056bf134bf
Content-Type: text/plain; charset="UTF-8"

Thanks for the response.

>Is this everything?

Yes, that is everything in the metadata xml dump.  I just removed all of
the *_mapping entries for brevity.  For the lvs output I removed other
logical volumes that aren't related to this pool.

>Is this a pool used by docker, which does not (did not) use LVM to manage
thin-volumes?

It's not docker, but it is an application called serviced that uses
docker's library for managing the volumes

>LVM just queries DM, and displays whatever that provides

Yeah, it looks like dmsetup status output matches lvs:

myvg-my--pool: 0 5242880000 thin-pool 70 207941/4145152
29018611/40960000 - rw discard_passdown queue_if_no_space -
myvg-my--pool_tdata: 0 4194304000 <(419)%20430-4000> linear
myvg-my--pool_tdata: 4194304000 1048576000 linear
myvg-my--pool_tmeta: 0 33161216 linear

>What is kernel/lvm version?

# uname -r
3.10.0-693.21.1.el7.x86_64

# lvm version
LVM version:     2.02.171(2)-RHEL7 (2017-05-03)
Library version: 1.02.140-RHEL7 (2017-05-03)
Driver version:  4.35.0
Configuration:   ./configure --build=x86_64-redhat-linux-gnu
--host=x86_64-redhat-linux-gnu --program-prefix=
--disable-dependency-tracking --prefix=/usr --exec-prefix=/usr
--bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc
--datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64
--libexecdir=/usr/libexec --localstatedir=/var
--sharedstatedir=/var/lib --mandir=/usr/share/man
--infodir=/usr/share/info --with-default-dm-run-dir=/run
--with-default-run-dir=/run/lvm --with-default-pid-dir=/run
--with-default-locking-dir=/run/lock/lvm --with-usrlibdir=/usr/lib64
--enable-lvm1_fallback --enable-fsadm --with-pool=internal
--enable-write_install --with-user= --with-group= --with-device-uid=0
--with-device-gid=6 --with-device-mode=0660 --enable-pkgconfig
--enable-applib --enable-cmdlib --enable-dmeventd
--enable-blkid_wiping --enable-python2-bindings
--with-cluster=internal --with-clvmd=corosync --enable-cmirrord
--with-udevdir=/usr/lib/udev/rules.d --enable-udev_sync
--with-thin=internal --enable-lvmetad --with-cache=internal
--enable-lvmpolld --enable-lvmlockd-dlm --enable-lvmlockd-sanlock
--enable-dmfilemapd

>Is thin_check_executable configured in lvm.conf?

Yes

I also just found out that they apparently ran thin_check recently and got
a message about a corrupt superblock, but didn't repair it.  They were
still able to re-activate the pool though. We'll run a repair as soon as we
get a chance and see if that fixes it.

Thanks,

John

On Fri, May 11, 2018 at 3:54 AM Marian Csontos <mcsontos@redhat.com> wrote:

> On 05/11/2018 10:21 AM, Joe Thornber wrote:
> > On Thu, May 10, 2018 at 07:30:09PM +0000, John Hamilton wrote:
> >> I saw something today that I don't understand and I'm hoping somebody
> can
> >> help.  We had a ~2.5TB thin pool that was showing 69% data utilization
> in
> >> lvs:
> >>
> >> # lvs -a
> >>    LV                    VG       Attr       LSize  Pool Origin Data%
> >> Meta%  Move Log Cpy%Sync Convert
> >>    my-pool         myvg twi-aotz--  2.44t             69.04  4.90
> >>    [my-pool_tdata] myvg Twi-ao----  2.44t
> >>    [my-pool_tmeta] myvg ewi-ao---- 15.81g
>
> Is this everything? Is this a pool used by docker, which does not (did
> not) use LVM to manage thin-volumes?
>
> >> However, when I dump the thin pool metadata and look at the
> mapped_blocks
> >> for the 2 devices in the pool, I can only account for about 950GB.
> Here is
> >> the superblock and device entries from the metadata xml.  There are no
> >> other devices listed in the metadata:
> >>
> >> <superblock uuid="" time="34" transaction="68" flags="0" version="2"
> >> data_block_size="128" nr_data_blocks="0">
> >>    <device dev_id="1" mapped_blocks="258767" transaction="0"
> >> creation_time="0" snap_time="14">
> >>    <device dev_id="8" mapped_blocks="15616093" transaction="27"
> >> creation_time="15" snap_time="34">
> >>
> >> That first device looks like it has about 16GB allocated to it and the
> >> second device about 950GB.  So, I would expect lvs to show somewhere
> >> between 950G-966G Is something wrong, or am I misunderstanding how to
> read
> >> the metadata dump?  Where is the other 700 or so GB that lvs is showing
> >> used?
> >
> > The non zero snap_time suggests that you're using snapshots.  I which
> case it
> > could just be there is common data shared between volumes that is
> getting counted
> > more than once.
> >
> > You can confirm this using the thin_ls tool and specifying a format line
> that
> > includes EXCLUSIVE_BLOCKS, or SHARED_BLOCKS.  Lvm doesn't take shared
> blocks into
> > account because it has to scan all the metadata to calculate what's
> shared.
>
> LVM just queries DM, and displays whatever that provides. You could see
> that in `dmsetup status` output, there are two pairs of '/' separated
> entries - first is metadata usage (USED_BLOCKS/ALL_BLOCKS), second data
> usage (USED_CHUNKS/ALL_CHUNKS).
>
> So the error lies somewhere between dmsetup and kernel.
>
> What is kernel/lvm version?
> Is thin_check_executable configured in lvm.conf?
>
> -- Martian
>

--00000000000089803f056bf134bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the response.=C2=A0=C2=A0<div><br></div><div>&g=
t;<span style=3D"color:rgb(33,33,33)">Is this everything?</span></div><div>=
<span style=3D"color:rgb(33,33,33)"><br></span></div><div><span style=3D"co=
lor:rgb(33,33,33)">Yes, that is everything in the metadata xml dump.=C2=A0 =
I just removed all of the *_mapping entries for brevity.=C2=A0 For the lvs =
output I removed other logical volumes that aren&#39;t related to this pool=
.</span></div><div dir=3D"ltr"><div><span style=3D"color:rgb(33,33,33)"><br=
></span></div><div><span style=3D"color:rgb(33,33,33)">&gt;</span><span sty=
le=3D"color:rgb(33,33,33)">Is this a pool used by docker, which does not (d=
id</span><span style=3D"color:rgb(33,33,33)">=C2=A0</span><span style=3D"co=
lor:rgb(33,33,33)">not) use LVM to manage thin-volumes?</span></div></div><=
div dir=3D"ltr"><div><span style=3D"color:rgb(33,33,33)"><br></span></div><=
div><span style=3D"color:rgb(33,33,33)">It&#39;s not docker, but it is an a=
pplication called serviced that uses docker&#39;s library for managing the =
volumes</span></div></div><div dir=3D"ltr"><div><span style=3D"color:rgb(33=
,33,33)"><br></span></div><div><span style=3D"color:rgb(33,33,33)">&gt;</sp=
an><span style=3D"color:rgb(33,33,33)">LVM just queries DM, and displays wh=
atever that provides</span></div></div><div dir=3D"ltr"><div><span style=3D=
"color:rgb(33,33,33)"><br></span></div><div><span style=3D"color:rgb(33,33,=
33)">Yeah, it looks like dmsetup status output matches lvs:</span></div><di=
v><pre style=3D"padding:6px 10px;font-family:Consolas,&quot;Liberation Mono=
&quot;,Menlo,&quot;Bitstream Vera Sans Mono&quot;,Courier,monospace;font-si=
ze:12.025px;color:rgb(51,51,51);border-radius:3px;margin-top:15px;margin-bo=
ttom:15px;line-height:19px;word-break:break-all;word-wrap:break-word;white-=
space:pre-line;background:rgb(248,248,248);border:1px solid rgb(204,204,204=
);outline:0px;vertical-align:baseline"><code style=3D"padding:0px;font-fami=
ly:Consolas,&quot;Liberation Mono&quot;,Menlo,&quot;Bitstream Vera Sans Mon=
o&quot;,Courier,monospace;font-size:12px;color:inherit;border-radius:3px;ba=
ckground:none;border:0px;margin:0px;outline:0px;vertical-align:baseline;whi=
te-space:pre-wrap;word-break:break-word">myvg-my--pool: 0 5242880000 thin-p=
ool 70 207941/4145152 29018611/40960000 - rw discard_passdown queue_if_no_s=
pace -
myvg-my--pool_tdata: 0 <a href=3D"tel:(419)%20430-4000" value=3D"+141943040=
00" target=3D"_blank">4194304000</a> linear
myvg-my--pool_tdata: 4194304000 1048576000 linear
myvg-my--pool_tmeta: 0 33161216 linear</code></pre></div><div>&gt;<span sty=
le=3D"color:rgb(33,33,33)">What is kernel/lvm version?</span></div><div><pr=
e style=3D"padding:6px 10px;font-family:Consolas,&quot;Liberation Mono&quot=
;,Menlo,&quot;Bitstream Vera Sans Mono&quot;,Courier,monospace;font-size:12=
.025px;color:rgb(51,51,51);border-radius:3px;margin-top:15px;margin-bottom:=
15px;line-height:19px;word-break:break-all;word-wrap:break-word;white-space=
:pre-line;background:rgb(248,248,248);border:1px solid rgb(204,204,204);out=
line:0px;vertical-align:baseline"><code style=3D"padding:0px;font-family:Co=
nsolas,&quot;Liberation Mono&quot;,Menlo,&quot;Bitstream Vera Sans Mono&quo=
t;,Courier,monospace;font-size:12px;color:inherit;border-radius:3px;backgro=
und:none;border:0px;margin:0px;outline:0px;vertical-align:baseline;white-sp=
ace:pre-wrap;word-break:break-word"># uname -r
3.10.0-693.21.1.el7.x86_64</code></pre></div></div><div><pre style=3D"paddi=
ng:6px 10px;font-family:Consolas,&quot;Liberation Mono&quot;,Menlo,&quot;Bi=
tstream Vera Sans Mono&quot;,Courier,monospace;font-size:12.025px;color:rgb=
(51,51,51);border-radius:3px;margin-top:15px;margin-bottom:15px;line-height=
:19px;word-break:break-all;word-wrap:break-word;white-space:pre-line;backgr=
ound:rgb(248,248,248);border:1px solid rgb(204,204,204);outline:0px;vertica=
l-align:baseline"><code style=3D"padding:0px;font-family:Consolas,&quot;Lib=
eration Mono&quot;,Menlo,&quot;Bitstream Vera Sans Mono&quot;,Courier,monos=
pace;font-size:12px;color:inherit;border-radius:3px;background:none;border:=
0px;margin:0px;outline:0px;vertical-align:baseline;white-space:pre-wrap;wor=
d-break:break-word"># lvm version
LVM version:     2.02.171(2)-RHEL7 (2017-05-03)
Library version: 1.02.140-RHEL7 (2017-05-03)
Driver version:  4.35.0
Configuration:   ./configure --build=3Dx86_64-redhat-linux-gnu --host=3Dx86=
_64-redhat-linux-gnu --program-prefix=3D --disable-dependency-tracking --pr=
efix=3D/usr --exec-prefix=3D/usr --bindir=3D/usr/bin --sbindir=3D/usr/sbin =
--sysconfdir=3D/etc --datadir=3D/usr/share --includedir=3D/usr/include --li=
bdir=3D/usr/lib64 --libexecdir=3D/usr/libexec --localstatedir=3D/var --shar=
edstatedir=3D/var/lib --mandir=3D/usr/share/man --infodir=3D/usr/share/info=
 --with-default-dm-run-dir=3D/run --with-default-run-dir=3D/run/lvm --with-=
default-pid-dir=3D/run --with-default-locking-dir=3D/run/lock/lvm --with-us=
rlibdir=3D/usr/lib64 --enable-lvm1_fallback --enable-fsadm --with-pool=3Din=
ternal --enable-write_install --with-user=3D --with-group=3D --with-device-=
uid=3D0 --with-device-gid=3D6 --with-device-mode=3D0660 --enable-pkgconfig =
--enable-applib --enable-cmdlib --enable-dmeventd --enable-blkid_wiping --e=
nable-python2-bindings --with-cluster=3Dinternal --with-clvmd=3Dcorosync --=
enable-cmirrord --with-udevdir=3D/usr/lib/udev/rules.d --enable-udev_sync -=
-with-thin=3Dinternal --enable-lvmetad --with-cache=3Dinternal --enable-lvm=
polld --enable-lvmlockd-dlm --enable-lvmlockd-sanlock --enable-dmfilemapd</=
code></pre></div><div>&gt;<span style=3D"color:rgb(33,33,33);font-size:13px=
">Is thin_check_executable configured in lvm.conf?</span></div><div><span s=
tyle=3D"color:rgb(33,33,33);font-size:13px"><br></span></div><div><span sty=
le=3D"color:rgb(33,33,33);font-size:13px">Yes</span></div><div><span style=
=3D"color:rgb(33,33,33);font-size:13px"><br></span></div><div>I also just f=
ound out that they apparently ran thin_check recently and got a message abo=
ut a corrupt superblock, but didn&#39;t repair it.=C2=A0 They were still ab=
le to re-activate the pool though. We&#39;ll run a repair as soon as we get=
 a chance and see if that fixes it.<br></div><div><br></div><div>Thanks,</d=
iv><div><br></div><div>John</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr">On Fri, May 11, 2018 at 3:54 AM Marian Csontos &lt;<a href=3D"mailto:=
mcsontos@redhat.com" target=3D"_blank">mcsontos@redhat.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On 05/11/2018 10:21 AM, Joe Thornber=
 wrote:<br>
&gt; On Thu, May 10, 2018 at 07:30:09PM +0000, John Hamilton wrote:<br>
&gt;&gt; I saw something today that I don&#39;t understand and I&#39;m hopi=
ng somebody can<br>
&gt;&gt; help.=C2=A0 We had a ~2.5TB thin pool that was showing 69% data ut=
ilization in<br>
&gt;&gt; lvs:<br>
&gt;&gt;<br>
&gt;&gt; # lvs -a<br>
&gt;&gt;=C2=A0 =C2=A0 LV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 VG=C2=A0 =C2=A0 =C2=A0 =C2=A0Attr=C2=A0 =C2=A0 =C2=A0 =
=C2=A0LSize=C2=A0 Pool Origin Data%<br>
&gt;&gt; Meta%=C2=A0 Move Log Cpy%Sync Convert<br>
&gt;&gt;=C2=A0 =C2=A0 my-pool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0myvg twi-aot=
z--=C2=A0 2.44t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A069.04=C2=A0 =
4.90<br>
&gt;&gt;=C2=A0 =C2=A0 [my-pool_tdata] myvg Twi-ao----=C2=A0 2.44t<br>
&gt;&gt;=C2=A0 =C2=A0 [my-pool_tmeta] myvg ewi-ao---- 15.81g<br>
<br>
Is this everything? Is this a pool used by docker, which does not (did <br>
not) use LVM to manage thin-volumes?<br>
<br>
&gt;&gt; However, when I dump the thin pool metadata and look at the mapped=
_blocks<br>
&gt;&gt; for the 2 devices in the pool, I can only account for about 950GB.=
=C2=A0 Here is<br>
&gt;&gt; the superblock and device entries from the metadata xml.=C2=A0 The=
re are no<br>
&gt;&gt; other devices listed in the metadata:<br>
&gt;&gt;<br>
&gt;&gt; &lt;superblock uuid=3D&quot;&quot; time=3D&quot;34&quot; transacti=
on=3D&quot;68&quot; flags=3D&quot;0&quot; version=3D&quot;2&quot;<br>
&gt;&gt; data_block_size=3D&quot;128&quot; nr_data_blocks=3D&quot;0&quot;&g=
t;<br>
&gt;&gt;=C2=A0 =C2=A0 &lt;device dev_id=3D&quot;1&quot; mapped_blocks=3D&qu=
ot;258767&quot; transaction=3D&quot;0&quot;<br>
&gt;&gt; creation_time=3D&quot;0&quot; snap_time=3D&quot;14&quot;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 &lt;device dev_id=3D&quot;8&quot; mapped_blocks=3D&qu=
ot;15616093&quot; transaction=3D&quot;27&quot;<br>
&gt;&gt; creation_time=3D&quot;15&quot; snap_time=3D&quot;34&quot;&gt;<br>
&gt;&gt;<br>
&gt;&gt; That first device looks like it has about 16GB allocated to it and=
 the<br>
&gt;&gt; second device about 950GB.=C2=A0 So, I would expect lvs to show so=
mewhere<br>
&gt;&gt; between 950G-966G Is something wrong, or am I misunderstanding how=
 to read<br>
&gt;&gt; the metadata dump?=C2=A0 Where is the other 700 or so GB that lvs =
is showing<br>
&gt;&gt; used?<br>
&gt; <br>
&gt; The non zero snap_time suggests that you&#39;re using snapshots.=C2=A0=
 I which case it<br>
&gt; could just be there is common data shared between volumes that is gett=
ing counted<br>
&gt; more than once.<br>
&gt; <br>
&gt; You can confirm this using the thin_ls tool and specifying a format li=
ne that<br>
&gt; includes EXCLUSIVE_BLOCKS, or SHARED_BLOCKS.=C2=A0 Lvm doesn&#39;t tak=
e shared blocks into<br>
&gt; account because it has to scan all the metadata to calculate what&#39;=
s shared.<br>
<br>
LVM just queries DM, and displays whatever that provides. You could see <br=
>
that in `dmsetup status` output, there are two pairs of &#39;/&#39; separat=
ed <br>
entries - first is metadata usage (USED_BLOCKS/ALL_BLOCKS), second data <br=
>
usage (USED_CHUNKS/ALL_CHUNKS).<br>
<br>
So the error lies somewhere between dmsetup and kernel.<br>
<br>
What is kernel/lvm version?<br>
Is thin_check_executable configured in lvm.conf?<br>
<br>
-- Martian<br>
</blockquote></div></div>

--00000000000089803f056bf134bf--
