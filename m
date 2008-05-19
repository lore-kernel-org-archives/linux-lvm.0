Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4JFfshN005219
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 11:41:54 -0400
Received: from gv-out-0910.google.com (gv-out-0910.google.com [216.239.58.189])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4JFfdnZ004614
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 11:41:40 -0400
Received: by gv-out-0910.google.com with SMTP id n8so272993gve.13
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 08:41:39 -0700 (PDT)
Message-ID: <1c748a490805190841i5cfdcddfuf978893981f03718@mail.gmail.com>
Date: Mon, 19 May 2008 08:41:38 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] lvm partition on ramdisk
In-Reply-To: <1c748a490805190823t42deb053o1714c7f0b4d74ecb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_13951_16260047.1211211698915"
References: <1c748a490805130716y558520d7i7b2781816bd743e1@mail.gmail.com>
	<Pine.LNX.4.44.0805131309330.29266-100000@bmsred.bmsi.com>
	<1c748a490805190737h35a11073le7dede4a98ae78c0@mail.gmail.com>
	<A78DB34D00374344A0AB65B6523C05DC02FA9324@marsden.win.datacash.com>
	<1c748a490805190823t42deb053o1714c7f0b4d74ecb@mail.gmail.com>
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

------=_Part_13951_16260047.1211211698915
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Rereading your question more precisely, the performances were (write speeds=
,
as percentage of long sequential writes to raw device, 64GB timed, with
pre-filling of buffers in all tests):

97%    ramdisk-assisted FAT32
79%    ext2 (fastest non-ramdisk-assisted FS)
59%    FAT32
58%    xfs

So, in respect of performance loss, the ramdisk results in at least a
tenfold improvement. In the test, not only the FAT but the directory was on
ramdisk - and this is realistic.

Larry

On 5/19/08, Larry Dickson <ldickson@cuttedge.com> wrote:
>
> The purpose was to move seeking operations onto the ramdisk (ultimately
> NVRAM or battery-backed), and use a file system that allocates disk secto=
rs
> in sequential order for scientific (no-delete) data streaming writes. It
> allows near full speed writing to the main (big RAID) storage, and yet a
> standard file system structure appears on the recorded data at little cos=
t.
> Log-structured file systems serve a similar purpose, but the structure of
> the data and metadata is quite complex, and an additional step of "cappin=
g"
> is needed if random-access reads are to be reasonably fast.
>
> Larry
>
>  On 5/19/08, Gerrard Geldenhuis <Gerrard.Geldenhuis@datacash.com> wrote:
>>
>>  Thanks for the update. I have not followed the thread closely=85 did yo=
u
>> see any significant measured peformance increase in using lvm on a ramdi=
sk?
>>
>>
>>
>> Regards
>>
>>
>>   ------------------------------
>>
>> *From:* linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.co=
m]
>> *On Behalf Of *Larry Dickson
>> *Sent:* 19 May 2008 15:37
>> *To:* LVM general discussion and development
>> *Subject:* Re: [linux-lvm] lvm partition on ramdisk
>>
>>
>>
>> Final results FYI in this investigation: A recent Ubuntu release gets pa=
st
>> the 1TB limit. I found binaries for dosfstools_2.11-2.1ubuntu3 at
>>
>> http://packages.ubuntu.com/feisty/otherosfs/dosfstools
>>
>> and unpacked them with ar -x. The source is in
>>
>> https://launchpad.net/ubuntu/+source/dosfstools/2.11-2.1ubuntu3
>>
>>
>>   With 4KB sectors, it defaults to 128KB clusters and reaches over 97%
>> write speed on an 8TB volume. The ramdisk area needed is a little over
>> 512MB, so if you use 768MB you get quite a bit of room for directories a=
lso
>> on ramdisk, and with a little finesse you can even make the subdirectori=
es
>> lay themselves down on ramdisk. To be "Windows-legal" you could use 32KB
>> clusters and a little over 2GB ramdisk (or a little over 1GB with one FA=
T).
>> Linux is happy with the big clusters, and according to the design should
>> actually be willing to go to 16TB.
>>
>> Larry
>>
>>
>>
>> On 5/13/08, *Stuart D. Gathman* <stuart@bmsi.com> wrote:
>>
>> On Tue, 13 May 2008, Larry Dickson wrote:
>>
>> > on the full, unpartitioned lv. Then it mounted, with the entire FAT on
>> > ramdisk, and wrote very fast because FAT32 (like DOS) lays down data i=
n
>> > order from the start of a disk and does not skip around (I'd be
>> interested
>> > if anyone knows any other file systems with that property).
>>
>> The SysV filesystem put a fixed size inode table at the beginning of a
>> partition.  More modern filesystems from ext to reiser try to distribute
>> the meta-data to keep it closer to the data.  This is, of course, counte=
r
>> productive when the beginning of a disk is significantly faster and
>> seek-free
>> as in your setup.
>>
>> Since ext3 inode placement is table driven (with the table in a magic
>> inode),
>> there is probably a simple patch to mke2fs to create only one inode tabl=
e
>> at
>> the beginning of a drive.  In fact, I wonder if there is already an
>> option...
>> looks like -g blocks_per_group might do the trick - assuming inodes are
>> at the beginning of a block group, rather than the middle.  If not,
>> a patch to mke2fs is needed to do what you want.
>>
>> --
>>              Stuart D. Gathman <stuart@bmsi.com>
>>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-61=
54
>> "Confutatis maledictis, flammis acribus addictis" - background song for
>> a Microsoft sponsored "Where do you want to go from here?" commercial.
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>

------=_Part_13951_16260047.1211211698915
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Rereading your question more precisely, the performances were (write s=
peeds, as percentage of long sequential writes to raw device, 64GB timed, w=
ith pre-filling of buffers in all tests):</div>
<div>&nbsp;</div>
<div>97%&nbsp;&nbsp;&nbsp; ramdisk-assisted FAT32</div>
<div>79%&nbsp;&nbsp;&nbsp; ext2 (fastest non-ramdisk-assisted FS)</div>
<div>59%&nbsp;&nbsp;&nbsp; FAT32</div>
<div>58%&nbsp;&nbsp;&nbsp; xfs</div>
<div>&nbsp;</div>
<div>So, in respect of performance loss, the ramdisk results in at least a =
tenfold improvement. In the test, not only the FAT but the directory was on=
 ramdisk - and this is realistic.<br>&nbsp;</div>
<div>Larry<br>&nbsp;</div>
<div><span class=3D"gmail_quote">On 5/19/08, <b class=3D"gmail_sendername">=
Larry Dickson</b> &lt;<a href=3D"mailto:ldickson@cuttedge.com">ldickson@cut=
tedge.com</a>&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<div>The purpose was to move seeking operations onto the ramdisk (ultimatel=
y NVRAM or battery-backed), and use a file system that allocates disk secto=
rs in sequential order for scientific (no-delete) data streaming writes. It=
 allows near full speed writing to the main (big RAID)&nbsp;storage, and ye=
t a standard file system structure appears on the recorded data at little c=
ost. Log-structured file systems serve a similar purpose, but the structure=
 of the data and metadata is quite complex, and an additional step of &quot=
;capping&quot; is needed if random-access reads are to be reasonably fast.<=
/div>

<div>&nbsp;</div><span class=3D"sg">
<div>Larry<br>&nbsp;</div></span>
<div><span class=3D"q" id=3D"q_11a01c6c47d0ba1f_2">
<div><span class=3D"gmail_quote">On 5/19/08, <b class=3D"gmail_sendername">=
Gerrard Geldenhuis</b> &lt;<a onclick=3D"return top.js.OpenExtLink(window,e=
vent,this)" href=3D"mailto:Gerrard.Geldenhuis@datacash.com" target=3D"_blan=
k">Gerrard.Geldenhuis@datacash.com</a>&gt; wrote:</span>=20
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<div lang=3D"EN-US" vlink=3D"blue" link=3D"blue">
<div>
<p><font face=3D"Arial" color=3D"navy" size=3D"2"><span style=3D"FONT-SIZE:=
 10pt; COLOR: navy; FONT-FAMILY: Arial">Thanks for the update. I have not f=
ollowed the thread closely=85 did you see any significant measured peforman=
ce increase in using lvm on a ramdisk?</span></font></p>

<p><font face=3D"Arial" color=3D"navy" size=3D"2"><span style=3D"FONT-SIZE:=
 10pt; COLOR: navy; FONT-FAMILY: Arial">&nbsp;</span></font></p>
<p><font face=3D"Arial" color=3D"navy" size=3D"2"><span style=3D"FONT-SIZE:=
 10pt; COLOR: navy; FONT-FAMILY: Arial">Regards</span></font></p>
<p><font face=3D"Arial" color=3D"navy" size=3D"2"><span style=3D"FONT-SIZE:=
 10pt; COLOR: navy; FONT-FAMILY: Arial">&nbsp;</span></font></p>
<div style=3D"BORDER-RIGHT: medium none; PADDING-RIGHT: 0cm; BORDER-TOP: me=
dium none; PADDING-LEFT: 4pt; PADDING-BOTTOM: 0cm; BORDER-LEFT: blue 1.5pt =
solid; PADDING-TOP: 0cm; BORDER-BOTTOM: medium none">
<div>
<div style=3D"TEXT-ALIGN: center" align=3D"center"><font face=3D"Times New =
Roman" size=3D"3"><span style=3D"FONT-SIZE: 12pt">
<hr align=3D"center" width=3D"100%" size=3D"2">
</span></font></div>
<p><b><font face=3D"Tahoma" size=3D"2"><span style=3D"FONT-WEIGHT: bold; FO=
NT-SIZE: 10pt; FONT-FAMILY: Tahoma">From:</span></font></b><font face=3D"Ta=
homa" size=3D"2"><span style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Tahoma"> <a o=
nclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"mailto:linu=
x-lvm-bounces@redhat.com" target=3D"_blank">linux-lvm-bounces@redhat.com</a=
> [mailto:<a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=
=3D"mailto:linux-lvm-bounces@redhat.com" target=3D"_blank">linux-lvm-bounce=
s@redhat.com</a>] <b><span style=3D"FONT-WEIGHT: bold">On Behalf Of </span>=
</b>Larry Dickson<br>
<b><span style=3D"FONT-WEIGHT: bold">Sent:</span></b> 19 May 2008 15:37<spa=
n><br><b><span style=3D"FONT-WEIGHT: bold">To:</span></b> LVM general discu=
ssion and development<br><b><span style=3D"FONT-WEIGHT: bold">Subject:</spa=
n></b> Re: [linux-lvm] lvm partition on ramdisk</span></span></font></p>
</div>
<p><font face=3D"Times New Roman" size=3D"3"><span style=3D"FONT-SIZE: 12pt=
">&nbsp;</span></font></p>
<div>
<p><font face=3D"Times New Roman" size=3D"3"><span style=3D"FONT-SIZE: 12pt=
">Final results FYI&nbsp;in this investigation: A recent Ubuntu release get=
s past the 1TB limit. I found binaries for dosfstools_2.11-2.1ubuntu3 at=20
<div><span><br>&nbsp;<br><a onclick=3D"return top.js.OpenExtLink(window,eve=
nt,this)" href=3D"http://packages.ubuntu.com/feisty/otherosfs/dosfstools" t=
arget=3D"_blank">http://packages.ubuntu.com/feisty/otherosfs/dosfstools</a>=
 <br>&nbsp;<br>
and unpacked them with ar -x. The source is in<br>&nbsp;<br><a onclick=3D"r=
eturn top.js.OpenExtLink(window,event,this)" href=3D"https://launchpad.net/=
ubuntu/+source/dosfstools/2.11-2.1ubuntu3" target=3D"_blank">https://launch=
pad.net/ubuntu/+source/dosfstools/2.11-2.1ubuntu3</a><br>
&nbsp;</span></div></span></font>
<p></p>
<p></p>
<p></p></p></div>
<div><span>
<div>
<p><font face=3D"Times New Roman" size=3D"3"><span style=3D"FONT-SIZE: 12pt=
">With 4KB sectors, it defaults to 128KB clusters and reaches over 97% writ=
e speed on an 8TB volume. The ramdisk area needed is a little over 512MB, s=
o if you use 768MB&nbsp;you get quite a bit of room for directories also on=
 ramdisk, and with a little finesse you can even make the subdirectories la=
y themselves down on ramdisk. To be &quot;Windows-legal&quot; you could use=
 32KB clusters and a little over 2GB ramdisk (or a little over 1GB with one=
 FAT). Linux is happy with the big clusters, and according to the design sh=
ould actually be willing to go to 16TB.<br>
<br>Larry</span></font></p></div>
<div>
<p><font face=3D"Times New Roman" size=3D"3"><span style=3D"FONT-SIZE: 12pt=
">&nbsp;</span></font></p></div>
<div>
<p><span><font face=3D"Times New Roman" size=3D"3"><span style=3D"FONT-SIZE=
: 12pt">On 5/13/08, <b><span style=3D"FONT-WEIGHT: bold">Stuart D. Gathman<=
/span></b> &lt;<a onclick=3D"return top.js.OpenExtLink(window,event,this)" =
href=3D"mailto:stuart@bmsi.com" target=3D"_blank">stuart@bmsi.com</a>&gt; w=
rote:</span></font></span> </p>

<p><font face=3D"Times New Roman" size=3D"3"><span style=3D"FONT-SIZE: 12pt=
">On Tue, 13 May 2008, Larry Dickson wrote:<br><br>&gt; on the full, unpart=
itioned lv. Then it mounted, with the entire FAT on<br>&gt; ramdisk, and wr=
ote very fast because FAT32 (like DOS) lays down data in<br>
&gt; order from the start of a disk and does not skip around (I&#39;d be in=
terested<br>&gt; if anyone knows any other file systems with that property)=
.<br><br>The SysV filesystem put a fixed size inode table at the beginning =
of a<br>
partition.&nbsp;&nbsp;More modern filesystems from ext to reiser try to dis=
tribute<br>the meta-data to keep it closer to the data.&nbsp;&nbsp;This is,=
 of course, counter<br>productive when the beginning of a disk is significa=
ntly faster and seek-free<br>
as in your setup.<br><br>Since ext3 inode placement is table driven (with t=
he table in a magic inode),<br>there is probably a simple patch to mke2fs t=
o create only one inode table at<br>the beginning of a drive.&nbsp;&nbsp;In=
 fact, I wonder if there is already an option...<br>
looks like -g blocks_per_group might do the trick - assuming inodes are<br>=
at the beginning of a block group, rather than the middle.&nbsp;&nbsp;If no=
t,<br>a patch to mke2fs is needed to do what you want.<br><br>--<br>&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stuart D.=
 Gathman &lt;<a onclick=3D"return top.js.OpenExtLink(window,event,this)" hr=
ef=3D"mailto:stuart@bmsi.com" target=3D"_blank">stuart@bmsi.com</a>&gt;<br>
&nbsp;&nbsp; Business Management Systems Inc.&nbsp;&nbsp;Phone: 703 591-091=
1 Fax: 703 591-6154<br>&quot;Confutatis maledictis, flammis acribus addicti=
s&quot; - background song for<br>a Microsoft sponsored &quot;Where do you w=
ant to go from here?&quot; commercial.<br>
<br>_______________________________________________<br>linux-lvm mailing li=
st<br><a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"m=
ailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.com</a><br><=
a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"https://=
www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.re=
dhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a onclick=3D"return top.js.OpenExtLink(window,event=
,this)" href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://=
tldp.org/HOWTO/LVM-HOWTO/</a></span></font></p></div>
<p><font face=3D"Times New Roman" size=3D"3"><span style=3D"FONT-SIZE: 12pt=
">&nbsp;</span></font></p></span></div></div></div></div><br>______________=
_________________________________<br>linux-lvm mailing list<br><a onclick=
=3D"return top.js.OpenExtLink(window,event,this)" href=3D"mailto:linux-lvm@=
redhat.com" target=3D"_blank">linux-lvm@redhat.com</a><br>
<a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"https:/=
/www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.r=
edhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a oncli=
ck=3D"return top.js.OpenExtLink(window,event,this)" href=3D"http://tldp.org=
/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><b=
r>
</blockquote></div><br></span></div></blockquote></div><br>

------=_Part_13951_16260047.1211211698915--
