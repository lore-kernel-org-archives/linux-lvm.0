Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB9Jw1V21126
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:58:01 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.199])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB9JvsAc002100
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:57:55 -0500
Received: by zproxy.gmail.com with SMTP id s18so1101136nze
	for <linux-lvm@redhat.com>; Fri, 09 Dec 2005 11:57:54 -0800 (PST)
Message-ID: <52fe6b680512091157j2cec853ey557d0bb3133d298e@mail.gmail.com>
Date: Sat, 10 Dec 2005 01:27:54 +0530
From: Anil Kumar Sharma <xplusaks@gmail.com>
Subject: Re: [linux-lvm] Newbie of LVM
In-Reply-To: <4399D72B.80408@mattgillen.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_11728_22333768.1134158274255"
References: <20051209033914.33441.qmail@web32605.mail.mud.yahoo.com>
	<4399D72B.80408@mattgillen.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_11728_22333768.1134158274255
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Yes, it is possible and this is the way LVM is supposed to work else who
will touch it?
U will need to copy your data at least once,
I mean, to merge, U must have your data on LVM - so get it there !!

Since U will have a shining brand new HDD, and your taste says it will be
bigger than previous one - has to be, else drop the idea or data!

So brief steps would be (Details, please work out precisely before
proceeding or ask)

0. Read LVM things before hand - they will come very handy because U are no=
w
embracing LVM.

1. plug New HDD in the box, and get it going.
2. Get LVM on new disk going. PV, PE, VG, LV, etc all done.
3. Copy (please note - copy it is - not move - not shift)  copy data to new
disc to LVM partition created on new disk.

4. Reboot and "confirm" that new data is available (Do not skip this step).

5. "ReConfirm" by all means that your data is safe sound and reachable on
new disc. Like use it again and again and earn confidence with it.
Check data presence through your software etc etc etc etc.

6. I do not wish to use capitals but "do not delete your old data on md5"
"do not delete your old data on md5".
6.1 Keep it as backup for few days till U become comfortable with your data
in new location.

 ### Important ### U C, U have a new disc, may be, twice the size of old
disc.... just wait before U delete old data.

7. Then onwards it will be like house keeping. I mean merging of partitions
starts now . And for that u will have to reformat (or wait for FC8, it may
be sooner) your old partition. Read LVM thoroughly, it is good only with
caution.

I again remind that U are playing with data, keep backup.



> >
> >     My md5 is almost full and I wanna use LVM to merge
> > my md5 with a new partition from a new hdd. I wanna
> > ask if this possible for LVM to merge 2 partition
> > together while one of them have data on it? I can't
> > suffer any data loss and want to make sure that LVM
> > works perfectly to what I want.
> >    Thanks all.
>
>
> --
> Anil Kumar Shrama

------=_Part_11728_22333768.1134158274255
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Yes, it is possible and this is&nbsp;the way LVM is supposed to work e=
lse who will touch it?</div>
<div>U will need to copy your data at least once,</div>
<div>I mean, to merge, U must have your data on LVM - so get it there !!</d=
iv>
<div>&nbsp;</div>
<div>Since U will have a shining brand new HDD, and your taste says it will=
 be bigger than previous one -&nbsp;has to be, else drop the idea or data!<=
/div>
<div>&nbsp;</div>
<div>So brief steps would be (Details, please work out precisely before pro=
ceeding or ask)</div>
<div>&nbsp;</div>
<div>0. Read LVM things before hand - they will come very handy because U a=
re now embracing LVM.</div>
<div>&nbsp;</div>
<div>1. plug New HDD in the box, and get it going.</div>
<div>2. Get LVM on new disk going. PV, PE, VG, LV, etc all done.</div>
<div>3. Copy (please note -&nbsp;copy it is - not move - not shift)&nbsp; c=
opy data to new disc&nbsp;to LVM partition created on new disk. </div>
<div>&nbsp;</div>
<div>4. Reboot and &quot;confirm&quot; that new data is available (Do not s=
kip this step).</div>
<div>&nbsp;</div>
<div>5. &quot;ReConfirm&quot; by all means that your data is safe sound and=
 reachable on new disc. Like use it again and again and earn confidence wit=
h it. Check&nbsp;data presence through your software etc etc etc etc.</div>

<div>&nbsp;</div>
<div>6. I do not wish to use capitals but &quot;do not delete your old data=
 on md5&quot; &quot;do not delete your old data on md5&quot;.</div>
<div>6.1 Keep it as backup for few days till U become comfortable with your=
 data in new location.</div>
<div>&nbsp;</div>
<div>&nbsp;### Important ### U C, U have a new disc, may be, twice the size=
 of old disc.... just wait before U delete old data.</div>
<div>&nbsp;</div>
<div>7. Then onwards it will be like house keeping. I mean merging of parti=
tions starts now . And for that u will have to reformat (or wait for&nbsp;F=
C8, it may be sooner) your old partition. Read LVM thoroughly, it is good o=
nly with caution.
</div>
<div>&nbsp;</div>
<div>I again remind that U are playing with data, keep backup.<br><br>&nbsp=
;</div>
<div>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&n=
bsp; My md5 is almost full and I wanna use LVM to merge<br>&gt; my md5 with=
 a new partition from a new hdd. I wanna
<br>&gt; ask if this possible for LVM to merge 2 partition<br>&gt; together=
 while one of them have data on it? I can't<br>&gt; suffer any data loss an=
d want to make sure that LVM<br>&gt; works perfectly to what I want.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;Thanks all.<br><br clear=3D"all"><br>-- <br>Ani=
l Kumar Shrama </blockquote></div>

------=_Part_11728_22333768.1134158274255--
