Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1PBJx2I001252
	for <linux-lvm@redhat.com>; Tue, 25 Feb 2014 06:19:59 -0500
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1PBJvM0031253
	for <linux-lvm@redhat.com>; Tue, 25 Feb 2014 06:19:58 -0500
Received: by mail-ob0-f171.google.com with SMTP id vb8so8379267obc.2
	for <linux-lvm@redhat.com>; Tue, 25 Feb 2014 03:19:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAE7pJ3AZ6NoyqzjnHxa-skCFYZtcH_0ozs4yxYHHaw3iuONb+w@mail.gmail.com>
References: <20140222071408.GA10598@localhost.localdomain>
	<CAE7pJ3ASKEJ0ExqVn7w9pDhv-SRC7HX-60CFJcswROVOmdWBNA@mail.gmail.com>
	<20140224185629.GA28182@ssh2.neuro.berkeley.edu>
	<20140224215125.GA31189@ssh2.neuro.berkeley.edu>
	<CAE7pJ3AZ6NoyqzjnHxa-skCFYZtcH_0ozs4yxYHHaw3iuONb+w@mail.gmail.com>
Date: Tue, 25 Feb 2014 12:19:57 +0100
Message-ID: <CAE7pJ3CyAraHb-_Tq=K2eLVBiL6K_C=uCOsARGT2XQz5GHQpxA@mail.gmail.com>
From: emmanuel segura <emi2fast@gmail.com>
Content-Type: multipart/alternative; boundary=089e013c5d2eacb71f04f3394432
Subject: Re: [linux-lvm] LV mirror extents on same physical device
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

--089e013c5d2eacb71f04f3394432
Content-Type: text/plain; charset=ISO-8859-1

Hi Julie,

Thanks for your comment, but you are using mirror over mirror, i don't need
to learn anything like that :)


2014-02-25 12:18 GMT+01:00 emmanuel segura <emi2fast@gmail.com>:

> Hi Julie,
>
> Thanks for your comment, but you mirror over mirror, i don't need to learn
> anything like that :)
>
>
>
> 2014-02-24 22:51 GMT+01:00 Julie Ashworth <ashworth@berkeley.edu>:
>
> I doubt anybody else will have this problem, but just in case...
>> my solution was to upgrade lvm2, convert my mirrors to linear arrays, and
>> recreate the mirrors. After the lvm2 upgrade, I didn't see allocation
>> errors when creating the mirrored log.
>>
>> lvconvert -m0 /dev/VolGroup00/lvname
>> lvconvert -m1 --mirrorlog=mirrored /dev/VolGroup00/lvname
>>
>> best,
>> Julie
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>
>
> --
> esta es mi vida e me la vivo hasta que dios quiera
>



-- 
esta es mi vida e me la vivo hasta que dios quiera

--089e013c5d2eacb71f04f3394432
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julie,<br><br></div>Thanks for your comment, but y=
ou are using mirror over mirror, i don&#39;t need to learn anything like th=
at :)<br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote=
">2014-02-25 12:18 GMT+01:00 emmanuel segura <span dir=3D"ltr">&lt;<a href=
=3D"mailto:emi2fast@gmail.com" target=3D"_blank">emi2fast@gmail.com</a>&gt;=
</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi Julie,<br><br></div=
>Thanks for your comment, but you mirror over mirror, i don&#39;t need to l=
earn anything like that :)<br>
<br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">201=
4-02-24 22:51 GMT+01:00 Julie Ashworth <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ashworth@berkeley.edu" target=3D"_blank">ashworth@berkeley.edu</a>&gt;<=
/span>:<div>
<div class=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">I doubt anybody else will have this problem,=
 but just in case...<br>
my solution was to upgrade lvm2, convert my mirrors to linear arrays, and r=
ecreate the mirrors. After the lvm2 upgrade, I didn&#39;t see allocation er=
rors when creating the mirrored log.<br>
<br>
lvconvert -m0 /dev/VolGroup00/lvname<br>
lvconvert -m1 --mirrorlog=3Dmirrored /dev/VolGroup00/lvname<br>
<div><div><br>
best,<br>
Julie<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div></div></div><br><br clear=3D"all"><div class=
=3D""><br>-- <br>esta es mi vida e me la vivo hasta que dios quiera
</div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br>esta es mi vida e me la=
 vivo hasta que dios quiera
</div>

--089e013c5d2eacb71f04f3394432--
