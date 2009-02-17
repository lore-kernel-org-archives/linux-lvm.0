MIME-Version: 1.0
In-Reply-To: <499A96CD.20808@redhat.com>
References: <9d1973c20902170225m7e0f87d2ydda7622a2c0dccf7@mail.gmail.com>
	<499A96CD.20808@redhat.com>
Date: Tue, 17 Feb 2009 16:35:53 +0530
Message-ID: <9d1973c20902170305h14bfb304h84f839f5ac301b03@mail.gmail.com>
Subject: Re: [linux-lvm] File system size difference betwen lvdisplay & df -h
From: Dayanand Math <dmmath@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd29bf061346604631b49fd
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
To: bmr@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

--000e0cd29bf061346604631b49fd
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

The following df -h & lvdisplay shows the discrpancy..What could be the
reson?
I am referring to the discrepancy between LV Size in lvdisplay &  total
size df -h output of the corresponding file system.

 df -h /test
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/vg00-lv_test
                      124M   11M  107M   9% /test

# lvdisplay -v /dev/vg00/lv_test
    Using logical volume(s) on command line
  --- Logical volume ---
  LV Name                /dev/vg00/lv_test
  VG Name                vg00
  LV UUID                t9RjGa-hKR3-AQmA-sLqD-4PaI-fkJ3-99c1dx
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                128.00 MB
  Current LE             4
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:3


# df -h /home
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/vg00-lv_home
                     1008M   37M  921M   4% /home

# lvdisplay -v /dev/vg00/lv_home
    Using logical volume(s) on command line
  --- Logical volume ---
  LV Name                /dev/vg00/lv_home
  VG Name                vg00
  LV UUID                1wlyyE-RFID-0Dbi-DES8-lrDk-GLlB-6wpEBZ
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             32
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1
Regs,
DM


On 2/17/09, Bryn M. Reeves <bmr@redhat.com> wrote:
>
> Dayanand Math wrote:
>
>> Hi,
>>
>> I am observing the file system size difference between df -h & lvdisplay
>> output for the systems with RHEL 4 (update 3 & 6). Its showing the
>> discrepancy in size between lvdisplay & df -h , If lvsize is less than 1GB
>> .. Is there any specific reason for that..
>>
>> Regs, DM
>>
>
> You don't tell us what the discrepancy is or give an example, so it's
> hard to make any useful suggestions.
>
> Can you provide sample command output that shows the discrepancy you
> are referring to?
>
> Regards,
> Bryn.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--000e0cd29bf061346604631b49fd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>&nbsp;</div>
<div>The following df -h &amp; lvdisplay shows the discrpancy..What could b=
e the reson?</div>
<div>I am referring to the discrepancy between LV Size in lvdisplay &amp;&n=
bsp; total&nbsp; size df -h output of the corresponding file system.</div>
<div>
<p>&nbsp;df -h /test<br>Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used Avail Use% Mounted on<br>/dev/map=
per/vg00-lv_test<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 124=
M&nbsp;&nbsp; 11M&nbsp; 107M&nbsp;&nbsp; 9% /test</p>
<p># lvdisplay -v /dev/vg00/lv_test<br>&nbsp;&nbsp;&nbsp; Using logical vol=
ume(s) on command line<br>&nbsp; --- Logical volume ---<br>&nbsp; LV Name&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /dev/vg00/lv_test<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg00<br>&n=
bsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; t9RjGa-hKR3-AQmA-sLqD-4PaI-fkJ3-99c1dx<br>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write=
<br>&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; available<br>&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<b=
r>&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 128.00 MB<br>&nbsp; Current LE&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<br>&nbsp; Seg=
ments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 1<br>&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<br>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Block device&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:3</p>
<p><br># df -h /home<br>Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used Avail Use% Mounted on<br>/dev/map=
per/vg00-lv_home<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1008M&nbs=
p;&nbsp; 37M&nbsp; 921M&nbsp;&nbsp; 4% /home</p>
<p># lvdisplay -v /dev/vg00/lv_home<br>&nbsp;&nbsp;&nbsp; Using logical vol=
ume(s) on command line<br>&nbsp; --- Logical volume ---<br>&nbsp; LV Name&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /dev/vg00/lv_home<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg00<br>&n=
bsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 1wlyyE-RFID-0Dbi-DES8-lrDk-GLlB-6wpEBZ<br>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write=
<br>&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; available<br>&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<b=
r>&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.00 GB<br>&nbsp; Current LE&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32<br>&nbsp; Segm=
ents&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 1<br>&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<br>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Block device&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:1</p>Regs,<=
br>DM<br><br>&nbsp;</div>
<div><span class=3D"gmail_quote">On 2/17/09, <b class=3D"gmail_sendername">=
Bryn M. Reeves</b> &lt;<a href=3D"mailto:bmr@redhat.com">bmr@redhat.com</a>=
&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<div><span class=3D"e" id=3D"q_11f83dd589b1873e_0">Dayanand Math wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hi,<br><br>I am observing the fi=
le system size difference between df -h &amp; lvdisplay output for the syst=
ems with RHEL 4 (update 3 &amp; 6). Its showing the discrepancy in size bet=
ween lvdisplay &amp; df -h , If lvsize is less than 1GB .. Is there any spe=
cific reason for that..<br>
<br>Regs, DM<br></blockquote><br></span></div>You don&#39;t tell us what th=
e discrepancy is or give an example, so it&#39;s<br>hard to make any useful=
 suggestions.<br><br>Can you provide sample command output that shows the d=
iscrepancy you<br>
are referring to?<br><br>Regards,<br>Bryn.<br><br>_________________________=
______________________<br>linux-lvm mailing list<br><a onclick=3D"return to=
p.js.OpenExtLink(window,event,this)" href=3D"mailto:linux-lvm@redhat.com" t=
arget=3D"_blank">linux-lvm@redhat.com</a><br>
<a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"https:/=
/www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.r=
edhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a oncli=
ck=3D"return top.js.OpenExtLink(window,event,this)" href=3D"http://tldp.org=
/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><b=
r>
</blockquote></div><br>

--000e0cd29bf061346604631b49fd--
