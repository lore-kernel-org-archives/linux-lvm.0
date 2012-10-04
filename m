MIME-Version: 1.0
In-Reply-To: <CAGQjrKajQYDc48i+FZhB5zUAJKHtMe4FqSgwx8Ed-z7wRuDVQQ@mail.gmail.com>
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
	<39598.78.154.109.125.1345731038.squirrel@yellowside.org.uk>
	<CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
	<50376BB7.7010008@bmsi.com>
	<CAGQjrKYUdQ5VL4hw+Oo=pgp4d_a9nsQA60gYHXhwVdWKtpX1qQ@mail.gmail.com>
	<503C8ABB.10401@redhat.com>
	<CAGQjrKajQYDc48i+FZhB5zUAJKHtMe4FqSgwx8Ed-z7wRuDVQQ@mail.gmail.com>
Date: Thu, 4 Oct 2012 12:02:16 +0530
Message-ID: <CAGQjrKYEyBjnZi=vZ4CeT60Cw=SmRJmaiCaoWmekE7qy=01tfg@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b603c7a9fb05f04cb35eab7
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@redhat.com

--047d7b603c7a9fb05f04cb35eab7
Content-Type: text/plain; charset=ISO-8859-1

thought I will update this thread , there is no e4fsprogs on  RHEL 6 for
ext4, and e2fsprogs ( e2fsck/resize2fs works just fine ) .

On Wed, Aug 29, 2012 at 2:00 PM, tariq wali <ganaiwali@gmail.com> wrote:

> not sure if -r with lvresize would pick ext4 filesystem also . but I will
> give it a try ..thanks
>
>
> On Tue, Aug 28, 2012 at 2:39 PM, Zdenek Kabelac <zkabelac@redhat.com>wrote:
>
>> Dne 27.8.2012 13:46, tariq wali napsal(a):
>>
>>> Guys , thanks much for your time on the issue, really appreciate it . I
>>> had
>>> tried everything suggested so far (lvresize/extend) updated filesystem
>>> tools etc
>>>
>>> @Stuart D Gathman , YOU ARE THE MAN SIR :) and nailed it down .
>>>
>>> I wanted to reproduce the same issue again and i did that not know how
>>> ignorant I was being ..
>>>
>>> # lvextend -L +40G /dev/vg0/bin-logs
>>>    Extending logical volume bin-logs to 110.00 GB
>>>    Logical volume bin-logs successfully resized
>>>
>>>
>>> lvs
>>>    LV       VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
>>>    bin-logs vg0  -wi-ao *110.00G*
>>>
>>>    data     vg0  -wi-ao 380.00G
>>>
>>> resize2fs /dev/vg0/bin-logs
>>> resize2fs 1.39 (29-May-2006)
>>> resize2fs: Filesystem has unsupported feature(s) while trying to open
>>> /dev/vg0/bin-logs
>>> Couldn't find valid filesystem superblock.
>>>
>>> #this is where I would get psyched , i did the same thing to all my
>>> ext2/3
>>> filesystems and have extended file systems online without an issue for
>>> years ..but did I fforget the file system type this time , yes indeed I
>>> for
>>> got we have started doing ext4 on all our new servers and didn't realise
>>> ext4 fancies it's own bells and whistles ..
>>>
>>> I ran the all new resize4fs as suggested by Stuart , and it made my day
>>> in
>>> fact it made for the whole week's frustration :)
>>>
>>> resize4fs /dev/vg0/logs
>>> resize4fs 1.41.12 (17-May-2010)
>>> Filesystem at /dev/vg0/logs is mounted on /bin-logs; on-line resizing
>>> required
>>> old desc_blocks = 7, new_desc_blocks = 9
>>> Performing an on-line resize of /dev/vg0/logs to 37408768 (4k) blocks.
>>>
>>> The filesystem on /dev/vg0/logs is now 37408768 blocks long.
>>>
>>>
>>> lvs
>>>    LV   VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
>>>    data vg0  -wi-ao 350.00G
>>>    logs vg0  -wi-ao *142.70G *
>>>
>>>
>>>
>>> PS: I am raving fan of lvm all over again :)
>>>
>>>
>>> thanks everyone and issue closed !
>>>
>>>
>> How about checking 'man lvresize'
>> and using option  '-r'  i.e.:
>>
>> lvresize -r -L +40G /dev/vg0/bin-logs
>>
>> That would be time-saver...
>>
>> Zdenek
>>
>>
>
>
> --
> *Tariq Wali.*
>
>


-- 
*Tariq Wali.*

--047d7b603c7a9fb05f04cb35eab7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">thought I will update this thread , there is no=A0e4fsprog=
s on =A0RHEL 6 for ext4, and=A0e2fsprogs ( e2fsck/resize2fs works just fine=
 ) .<br><br><div class=3D"gmail_quote">On Wed, Aug 29, 2012 at 2:00 PM, tar=
iq wali <span dir=3D"ltr">&lt;<a href=3D"mailto:ganaiwali@gmail.com" target=
=3D"_blank">ganaiwali@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">not sure if -r with lvresiz=
e would pick ext4 filesystem also . but I will give it a try ..thanks<div><=
div class=3D"h5">
<br><br><div class=3D"gmail_quote">On Tue, Aug 28, 2012 at 2:39 PM, Zdenek =
Kabelac <span dir=3D"ltr">&lt;<a href=3D"mailto:zkabelac@redhat.com" target=
=3D"_blank">zkabelac@redhat.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Dne 27.8.2012 13:46, tariq wali napsal(a):<b=
r>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>
Guys , thanks much for your time on the issue, really appreciate it . I had=
<br>
tried everything suggested so far (lvresize/extend) updated filesystem<br>
tools etc<br>
<br>
@Stuart D Gathman , YOU ARE THE MAN SIR :) and nailed it down .<br>
<br>
I wanted to reproduce the same issue again and i did that not know how<br>
ignorant I was being ..<br>
<br>
# lvextend -L +40G /dev/vg0/bin-logs<br>
=A0 =A0Extending logical volume bin-logs to 110.00 GB<br>
=A0 =A0Logical volume bin-logs successfully resized<br>
<br>
<br>
lvs<br>
=A0 =A0LV =A0 =A0 =A0 VG =A0 Attr =A0 LSize =A0 Origin Snap% =A0Move Log Co=
py% =A0Convert<br></div>
=A0 =A0bin-logs vg0 =A0-wi-ao *110.00G*<div><br>
=A0 =A0data =A0 =A0 vg0 =A0-wi-ao 380.00G<br>
<br>
resize2fs /dev/vg0/bin-logs<br>
resize2fs 1.39 (29-May-2006)<br>
resize2fs: Filesystem has unsupported feature(s) while trying to open<br>
/dev/vg0/bin-logs<br>
Couldn&#39;t find valid filesystem superblock.<br>
<br>
#this is where I would get psyched , i did the same thing to all my ext2/3<=
br>
filesystems and have extended file systems online without an issue for<br>
years ..but did I fforget the file system type this time , yes indeed I for=
<br>
got we have started doing ext4 on all our new servers and didn&#39;t realis=
e<br>
ext4 fancies it&#39;s own bells and whistles ..<br>
<br>
I ran the all new resize4fs as suggested by Stuart , and it made my day in<=
br>
fact it made for the whole week&#39;s frustration :)<br>
<br>
resize4fs /dev/vg0/logs<br>
resize4fs 1.41.12 (17-May-2010)<br>
Filesystem at /dev/vg0/logs is mounted on /bin-logs; on-line resizing<br>
required<br>
old desc_blocks =3D 7, new_desc_blocks =3D 9<br>
Performing an on-line resize of /dev/vg0/logs to 37408768 (4k) blocks.<br>
<br>
The filesystem on /dev/vg0/logs is now 37408768 blocks long.<br>
<br>
<br>
lvs<br>
=A0 =A0LV =A0 VG =A0 Attr =A0 LSize =A0 Origin Snap% =A0Move Log Copy% =A0C=
onvert<br>
=A0 =A0data vg0 =A0-wi-ao 350.00G<br></div>
=A0 =A0logs vg0 =A0-wi-ao *142.70G *<div><br>
<br>
<br>
PS: I am raving fan of lvm all over again :)<br>
<br>
<br>
thanks everyone and issue closed !<br>
<br>
</div></blockquote>
<br>
How about checking &#39;man lvresize&#39;<br>
and using option =A0&#39;-r&#39; =A0i.e.:<br>
<br>
lvresize -r -L +40G /dev/vg0/bin-logs<br>
<br>
That would be time-saver...<span><font color=3D"#888888"><br>
<br>
Zdenek<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div></div=
></div><span class=3D"HOEnZb"><font color=3D"#888888">-- <br><div dir=3D"lt=
r"><i style=3D"background-color:rgb(255,0,0);color:rgb(0,102,0)">Tariq Wali=
.</i><span><span style=3D"background-color:rgb(255,255,153)"></span></span>=
<br>

</div><br>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr"><i style=3D"background-color:rgb(255,0,0);color:rgb(0,102,0)">Tariq Wa=
li.</i><span><span style=3D"background-color:rgb(255,255,153)"></span></spa=
n><br>
</div><br>
</div>

--047d7b603c7a9fb05f04cb35eab7--
