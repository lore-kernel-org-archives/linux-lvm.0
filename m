Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7RBkxhe029921
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2012 07:46:59 -0400
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7RBkvhk005839
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2012 07:46:57 -0400
Received: by eekc1 with SMTP id c1so873351eek.33
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2012 04:46:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <50376BB7.7010008@bmsi.com>
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
	<39598.78.154.109.125.1345731038.squirrel@yellowside.org.uk>
	<CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
	<50376BB7.7010008@bmsi.com>
Date: Mon, 27 Aug 2012 17:16:56 +0530
Message-ID: <CAGQjrKYUdQ5VL4hw+Oo=pgp4d_a9nsQA60gYHXhwVdWKtpX1qQ@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b621e40fd9f2704c83de1e2
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: tariq wali <ganaiwali@gmail.com>

--047d7b621e40fd9f2704c83de1e2
Content-Type: text/plain; charset=ISO-8859-1

Guys , thanks much for your time on the issue, really appreciate it . I had
tried everything suggested so far (lvresize/extend) updated filesystem
tools etc

@Stuart D Gathman , YOU ARE THE MAN SIR :) and nailed it down .

I wanted to reproduce the same issue again and i did that not know how
ignorant I was being ..

# lvextend -L +40G /dev/vg0/bin-logs
  Extending logical volume bin-logs to 110.00 GB
  Logical volume bin-logs successfully resized


lvs
  LV       VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
  bin-logs vg0  -wi-ao *110.00G*
  data     vg0  -wi-ao 380.00G

resize2fs /dev/vg0/bin-logs
resize2fs 1.39 (29-May-2006)
resize2fs: Filesystem has unsupported feature(s) while trying to open
/dev/vg0/bin-logs
Couldn't find valid filesystem superblock.

#this is where I would get psyched , i did the same thing to all my ext2/3
filesystems and have extended file systems online without an issue for
years ..but did I fforget the file system type this time , yes indeed I for
got we have started doing ext4 on all our new servers and didn't realise
ext4 fancies it's own bells and whistles ..

I ran the all new resize4fs as suggested by Stuart , and it made my day in
fact it made for the whole week's frustration :)

resize4fs /dev/vg0/logs
resize4fs 1.41.12 (17-May-2010)
Filesystem at /dev/vg0/logs is mounted on /bin-logs; on-line resizing
required
old desc_blocks = 7, new_desc_blocks = 9
Performing an on-line resize of /dev/vg0/logs to 37408768 (4k) blocks.

The filesystem on /dev/vg0/logs is now 37408768 blocks long.


lvs
  LV   VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
  data vg0  -wi-ao 350.00G
  logs vg0  -wi-ao *142.70G *


PS: I am raving fan of lvm all over again :)


thanks everyone and issue closed !


Tariq










On Fri, Aug 24, 2012 at 5:25 PM, Stuart D Gathman <stuart@bmsi.com> wrote:

>  On 08/23/2012 11:18 AM, tariq wali wrote:
>
>  lvresize to extend an lvm ? how
>
>  also I cant create a new lvm don't have that much space and the to
> extend the new one and it would mean downtime . don't think it's an issue
> with filesystem tools , lvm has NEVER been consistent in my case .
>
>   The resize2fs on RHEL5 does not support ext4.  Your error message is
> the one reported when you try to resize an ext4 filesystem with ext2/ext3
> tools.  You need to either install e4fsprogrs and use resize4fs (and
> e4fsck), or do the resize in the virtual machine you are apparently running
> a newer OS in.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
*Tariq Wali.*

--047d7b621e40fd9f2704c83de1e2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Guys , thanks much for your time on the issue, really=
 appreciate it . I had tried everything suggested so far (lvresize/extend) =
updated filesystem tools etc=A0</div><div><br></div><div>@Stuart D Gathman =
, YOU ARE THE MAN SIR :) and nailed it down .</div>

<div><br></div><div>I wanted to reproduce the same issue again and i did th=
at not know how ignorant I was being ..</div><div><br></div><div><div># lve=
xtend -L +40G /dev/vg0/bin-logs=A0</div><div>=A0 Extending logical volume b=
in-logs to 110.00 GB</div>
<div>=A0 Logical volume bin-logs successfully resized</div></div><div><br><=
/div><div><br></div><div><div>lvs</div><div>=A0 LV =A0 =A0 =A0 VG =A0 Attr =
=A0 LSize =A0 Origin Snap% =A0Move Log Copy% =A0Convert</div><div>=A0 bin-l=
ogs vg0 =A0-wi-ao <b>110.00G</b> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
<div>=A0 data =A0 =A0 vg0 =A0-wi-ao 380.00G =A0 =A0</div></div><div><div><b=
r></div></div><div><span class=3D"Apple-style-span" style=3D"background-col=
or:rgb(255,255,255)"><font class=3D"Apple-style-span" color=3D"#ff0000">res=
ize2fs /dev/vg0/bin-logs=A0</font></span></div>
<div><div><span class=3D"Apple-style-span" style=3D"background-color:rgb(25=
5,255,255)"><font class=3D"Apple-style-span" color=3D"#ff0000">resize2fs 1.=
39 (29-May-2006)</font></span></div><div><span class=3D"Apple-style-span" s=
tyle=3D"background-color:rgb(255,255,255)"><font class=3D"Apple-style-span"=
 color=3D"#ff0000">resize2fs: Filesystem has unsupported feature(s) while t=
rying to open /dev/vg0/bin-logs</font></span></div>
<div><span class=3D"Apple-style-span" style=3D"background-color:rgb(255,255=
,255)"><font class=3D"Apple-style-span" color=3D"#ff0000">Couldn&#39;t find=
 valid filesystem superblock.</font></span></div></div><div><br></div><div>=
#this is where I would get psyched , i did the same thing to all my ext2/3 =
filesystems and have extended file systems online without an issue for year=
s ..but did I fforget the file system type this time , yes indeed I for got=
 we have started doing ext4 on all our new servers and didn&#39;t realise e=
xt4 fancies it&#39;s own bells and whistles ..</div>
<div><br></div><div>I ran the all new resize4fs as suggested by Stuart , an=
d it made my day in fact it made for the whole week&#39;s frustration :)</d=
iv><div><br></div><div><div><font class=3D"Apple-style-span" color=3D"#33ff=
33" style=3D"background-color:rgb(0,102,0)">resize4fs /dev/vg0/logs=A0</fon=
t></div>
<div><font class=3D"Apple-style-span" color=3D"#33ff33" style=3D"background=
-color:rgb(0,102,0)">resize4fs 1.41.12 (17-May-2010)</font></div><div><font=
 class=3D"Apple-style-span" color=3D"#33ff33" style=3D"background-color:rgb=
(0,102,0)">Filesystem at /dev/vg0/logs is mounted on /bin-logs; on-line res=
izing required</font></div>
<div><font class=3D"Apple-style-span" color=3D"#33ff33" style=3D"background=
-color:rgb(0,102,0)">old desc_blocks =3D 7, new_desc_blocks =3D 9</font></d=
iv><div><font class=3D"Apple-style-span" color=3D"#33ff33" style=3D"backgro=
und-color:rgb(0,102,0)">Performing an on-line resize of /dev/vg0/logs to 37=
408768 (4k) blocks.</font></div>
<div><font class=3D"Apple-style-span" color=3D"#33ff33" style=3D"background=
-color:rgb(0,102,0)"><br></font></div><div><font class=3D"Apple-style-span"=
 color=3D"#33ff33"><span class=3D"Apple-style-span" style=3D"background-col=
or:rgb(0,102,0)">The filesystem on /dev/vg0/logs is now 37408768 blocks lon=
g</span>.</font></div>
</div><div><br></div><div><br></div><div>lvs</div><div><div>=A0 LV =A0 VG =
=A0 Attr =A0 LSize =A0 Origin Snap% =A0Move Log Copy% =A0Convert</div><div>=
=A0 data vg0 =A0-wi-ao 350.00G =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div><div>=A0 logs vg0 =A0-wi-ao <b style=
=3D"background-color:rgb(0,102,0)">142.70G=A0</b></div>
</div><div><br></div><div><br></div><div>PS: I am raving fan of lvm all ove=
r again :)</div><div><br></div><div><br></div><div>thanks everyone and issu=
e closed !</div><div><br></div><div><br></div><div>Tariq</div><div><br>
</div><div><br></div><div><br></div><div><br></div><div><br></div><div><br>=
</div><div><br></div><div><br></div><br><br><div class=3D"gmail_quote">On F=
ri, Aug 24, 2012 at 5:25 PM, Stuart D Gathman <span dir=3D"ltr">&lt;<a href=
=3D"mailto:stuart@bmsi.com" target=3D"_blank">stuart@bmsi.com</a>&gt;</span=
> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div>
    <div>On 08/23/2012 11:18 AM, tariq wali
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><span style=3D"color:rgb(34,34,34);font-size:13px;fo=
nt-family:arial,sans-serif">=A0lvresize
          to extend an lvm ? how=A0</span>
        <div><font color=3D"#222222" face=3D"arial,
            sans-serif"><br>
          </font></div>
        <div><font color=3D"#222222" face=3D"arial,
            sans-serif">also I cant create a new lvm don&#39;t have that
            much space and the to extend the new one and it would mean
            downtime . don&#39;t think it&#39;s an issue with filesystem to=
ols ,
            lvm has NEVER been consistent in my case .<br>
          </font><br>
        </div>
      </div>
    </blockquote></div>
    The resize2fs on RHEL5 does not support ext4.=A0 Your error message is
    the one reported when you try to resize an ext4 filesystem with
    ext2/ext3 tools.=A0 You need to either install e4fsprogrs and use
    resize4fs (and e4fsck), or do the resize in the virtual machine you
    are apparently running a newer OS in.<br>
  </div>

<br>_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>=
<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"><i style=3D"backgr=
ound-color:rgb(255,0,0);color:rgb(0,102,0)">Tariq Wali.</i><span><span styl=
e=3D"background-color:rgb(255,255,153)"></span></span><br>

</div><br>
</div>

--047d7b621e40fd9f2704c83de1e2--
