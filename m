Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7NBEBON024076
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 07:14:11 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7NBEAug024768
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 07:14:10 -0400
Received: by eaac11 with SMTP id c11so176053eaa.33
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 04:14:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
Date: Thu, 23 Aug 2012 16:44:09 +0530
Message-ID: <CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b343f065e8cc504c7ecf547
Subject: [linux-lvm] lvextend NEVER works but screws up
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

--047d7b343f065e8cc504c7ecf547
Content-Type: text/plain; charset=ISO-8859-1

Hi, i was a big fan of lvm and used to advocate it's use at my workplace
but each time i try to use lvreduce or lvextend on production it has ALWAYS
been a major let down and messed up our production data and caused major
outages and not to forget the big stick up *** .

please look at the sequence and this is what I did

 vgs
  VG   #PV #LV #SN Attr   VSize   VFree
  vg0    1   2   0 wz--n- 492.72G     * 42.72G*
*
*
*df -kh*
*/dev/mapper/vg0-logs   99G   43G   52G  46% /bin-logs*
*
*
I wanted to use the free 42.7 G and allocate it to /bin-logs so this is
what I ran in order to extended

# lvextend -L +42.7G -n /dev/vg0/logs
  Rounding up size to full physical extent 42.70 GB
  Extending logical volume logs to 142.70 GB
  Logical volume logs successfully resized

#resize2fs /dev/vg0/logs    ( and it gets screwed up here )
resize2fs 1.39 (29-May-2006)
*resize2fs: Filesystem has unsupported feature(s) while trying to open
/dev/vg0/logs*
*Couldn't find valid filesystem superblock.*
*
*
and the free space of 42.7G is also gone ,

 # vgs
  VG   #PV #LV #SN Attr   VSize   VFree
  vg0    1   2   0 wz--n- 492.72G  * 20.00M*
*
*
*
lvm version
  LVM version:     2.02.88(2)-RHEL5 (2012-01-20)
  Library version: 1.02.67-RHEL5 (2011-10-14)
  Driver version:  4.11.6

*
*
*
It' so annoying to see this happen , from what I know that's the cmd
sequence to extend an existing LVM online , now I am not sure what this did
to my filesystem and  hoping it hasn't ****ED my data yet .

your insights would greatly be appreciated .







-- 
*Tariq Wali.*




-- 
*Tariq Wali.*

--047d7b343f065e8cc504c7ecf547
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><br><div dir=3D"ltr">Hi, i was =
a big fan of lvm and used to advocate it&#39;s use at my workplace but each=
 time i try to use lvreduce or lvextend on production it has ALWAYS been a =
major let down and messed up our production data and caused major outages a=
nd not to forget the big stick up *** .=A0<div>

<br></div><div>please look at the sequence and this is what I did</div><div=
><br></div><div>=A0vgs<div>=A0 VG =A0 #PV #LV #SN Attr =A0 VSize =A0 VFree=
=A0</div><div>=A0 vg0 =A0 =A01 =A0 2 =A0 0 wz--n- 492.72G =A0 =A0 <b>=A042.=
72G</b></div><div><b><br>

</b></div><div><b>df -kh</b></div><div><b>/dev/mapper/vg0-logs =A0 99G =A0 =
43G =A0 52G =A046% /bin-logs</b></div><div><b><br></b></div><div>I wanted t=
o use the free 42.7 G and allocate it to /bin-logs so this is what I ran in=
 order to extended</div>

<div><br></div><div><div># lvextend -L +42.7G -n /dev/vg0/logs</div><div>=
=A0 Rounding up size to full physical extent 42.70 GB</div><div>=A0 Extendi=
ng logical volume logs to 142.70 GB</div><div>=A0 Logical volume logs succe=
ssfully resized</div>

</div><div><br></div><div><div>#resize2fs /dev/vg0/logs =A0 =A0( and it get=
s screwed up here )</div><div>resize2fs 1.39 (29-May-2006)</div><div><b>res=
ize2fs: Filesystem has unsupported feature(s) while trying to open /dev/vg0=
/logs</b></div>

<div><b>Couldn&#39;t find valid filesystem superblock.</b></div></div><div>=
<b><br></b></div><div>and the free space of 42.7G is also gone ,=A0</div><d=
iv><br></div><div>=A0# vgs</div><div>=A0 VG =A0 #PV #LV #SN Attr =A0 VSize =
=A0 VFree=A0</div>

<div>=A0 vg0 =A0 =A01 =A0 2 =A0 0 wz--n- 492.72G =A0<b> 20.00M</b></div><di=
v><b><br></b></div><div><b><div>lvm version</div><div>=A0 LVM version: =A0 =
=A0 2.02.88(2)-RHEL5 (2012-01-20)</div><div>=A0 Library version: 1.02.67-RH=
EL5 (2011-10-14)</div>

<div>=A0 Driver version: =A04.11.6</div><div><br></div></b></div><div><b><b=
r></b></div><div>It&#39; so annoying to see this happen , from what I know =
that&#39;s the cmd sequence to extend an existing LVM online , now I am not=
 sure what this did to my filesystem and =A0hoping it hasn&#39;t ****ED my =
data yet .</div>

<div><br></div><div>your insights would greatly be appreciated .</div><span=
 class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div><br></div><di=
v>=A0</div><div><br></div><div><br></div><div><br></div><div><br></div>-- <=
br>
<div dir=3D"ltr"><i style=3D"background-color:rgb(255,0,0);color:rgb(0,102,=
0)">Tariq Wali.</i><span><span style=3D"background-color:rgb(255,255,153)">=
</span></span><br>
</div><br>
</font></span></div></div>
</div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"><i style=
=3D"background-color:rgb(255,0,0);color:rgb(0,102,0)">Tariq Wali.</i><span>=
<span style=3D"background-color:rgb(255,255,153)"></span></span><br></div><=
br>

</div>

--047d7b343f065e8cc504c7ecf547--
