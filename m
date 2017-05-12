Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4315F17AB3
	for <linux-lvm@redhat.com>; Fri, 12 May 2017 09:25:14 +0000 (UTC)
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 772D28049D
	for <linux-lvm@redhat.com>; Fri, 12 May 2017 09:25:12 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id u28so27730796pgn.1
	for <linux-lvm@redhat.com>; Fri, 12 May 2017 02:25:12 -0700 (PDT)
From: Bernd Eckenfels <ecki@zusammenkunft.net>
Date: Fri, 12 May 2017 09:25:06 +0000
Message-ID: <HE1PR08MB27955073A670877C0CA50348FFE20@HE1PR08MB2795.eurprd08.prod.outlook.com>
References: <CABOR3+xoAwjiE2G_OWS=z7t=GVGSR_=QtpJ8gdP+2e95-kCB1w@mail.gmail.com>,
	<20170510165840.GB27800@redhat.com>
In-Reply-To: <20170510165840.GB27800@redhat.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_HE1PR08MB27955073A670877C0CA50348FFE20HE1PR08MB2795eurp_"
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm/openstack: stripe all volumes and distribute
 them round robin on PVs
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
To: David Teigland <teigland@redhat.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_000_HE1PR08MB27955073A670877C0CA50348FFE20HE1PR08MB2795eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello David,

Yes I can specify most of the details in the lvcreate, however it is sad th=
at I have to. There are multiple abstraction layers in lvm and I cannot set=
 up a volume group which uses a allocation policy to distribute the volumes=
 over all PV and stripe by default. And it would be even harder when stripi=
ng to a subset of volumes.

I have to make changes to the client code (in my case Nova's lvm driver) to=
 get a better result. And if I would want to distribute the start segment o=
ver physical volumes I would have to add code to actually enumerate them an=
d pick one at random. I had hoped to avoid this. (The next step would be to=
 write DM tables myself...)

In the Nova case the modules are very dynamically created and destroyed, so=
 hand tuning is not an option here.

Gruss
Bernd
--
http://bernd.eckenfels.net
________________________________
From: David Teigland <teigland@redhat.com>
Sent: Wednesday, May 10, 2017 6:58:40 PM
To: Bernd
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] lvm/openstack: stripe all volumes and distribute t=
hem round robin on PVs

On Wed, May 10, 2017 at 01:13:37PM +0200, Bernd wrote:
> Hello,
>
> when using local lvm2 logical volumes for OpenStack Nova ephemeral pool
> then the created logical volumes are linear (not striped) and what is wor=
se
> than that, all volumes are allocated on the same first physical volume
> (until it is filled up).
>
> I made a ServerFault question about that:
>
> https://serverfault.com/questions/849088/automatically-distribute-lvm-str=
ipes-for-specific-lvm2-vg-on-linux/849255#849255
>
> It was suggested that raid_stripe_all_devices should help (to turn on
> striping by default), but it did not. So I went ahead and patched the
> lvm.py of nova to turn the striping on. However I still wonder if there i=
s
> a lvm option (allocation policy for that).
>
> Besides that, it looks like it is still creating the first stripe on the
> first device. It would make more sense to have it (even in the linear cas=
e)
> to round robin the LVs. Because first of all it might be the most busy pa=
rt
> of the volume and secondly it helps for keeping room for expanding volume=
s.
>
> Is there anything planned in this direction?

If you're concerned with placement of LVs on PVs, I'd probably skip
striping and add some logic specifying different PVs directly:

lvcreate -n name -L size VG PV ...

means the LV will be created using only the specified PVs.


--_000_HE1PR08MB27955073A670877C0CA50348FFE20HE1PR08MB2795eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div id=3D"x_compose-container" itemscope=3D"" itemtype=3D"https://schema.o=
rg/EmailMessage" style=3D"direction:ltr">
<span itemprop=3D"creator" itemscope=3D"" itemtype=3D"https://schema.org/Or=
ganization"><span itemprop=3D"name"></span></span>
<div>
<div style=3D"direction:ltr">Hello David,</div>
<div><br>
</div>
<div style=3D"direction:ltr">Yes I can specify most of the details in the l=
vcreate, however it is sad that I have to. There are multiple abstraction l=
ayers in lvm and I cannot set up a volume group which uses a allocation pol=
icy to distribute the volumes over
 all PV and stripe by default. And it would be even harder when striping to=
 a subset of volumes.</div>
<div><br>
</div>
<div style=3D"direction:ltr">I have to make changes to the client code (in =
my case Nova's lvm driver) to get a better result. And if I would want to d=
istribute the start segment over physical volumes I would have to add code =
to actually enumerate them and pick
 one at random. I had hoped to avoid this. (The next step would be to write=
 DM tables myself...)</div>
<div><br>
</div>
<div style=3D"direction:ltr">In the Nova case the modules are very dynamica=
lly created and destroyed, so hand tuning is not an option here.</div>
<div><br>
</div>
<div class=3D"x_acompli_signature">Gruss<br>
Bernd<br>
-- <br>
<a dir=3D"ltr" href=3D"http://bernd.eckenfels.net">http://bernd.eckenfels.n=
et</a></div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> David Teigland &lt;=
teigland@redhat.com&gt;<br>
<b>Sent:</b> Wednesday, May 10, 2017 6:58:40 PM<br>
<b>To:</b> Bernd<br>
<b>Cc:</b> linux-lvm@redhat.com<br>
<b>Subject:</b> Re: [linux-lvm] lvm/openstack: stripe all volumes and distr=
ibute them round robin on PVs</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Wed, May 10, 2017 at 01:13:37PM &#43;0200, Bern=
d wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; when using local lvm2 logical volumes for OpenStack Nova ephemeral poo=
l<br>
&gt; then the created logical volumes are linear (not striped) and what is =
worse<br>
&gt; than that, all volumes are allocated on the same first physical volume=
<br>
&gt; (until it is filled up).<br>
&gt; <br>
&gt; I made a ServerFault question about that:<br>
&gt; <br>
&gt; <a href=3D"https://serverfault.com/questions/849088/automatically-dist=
ribute-lvm-stripes-for-specific-lvm2-vg-on-linux/849255#849255">
https://serverfault.com/questions/849088/automatically-distribute-lvm-strip=
es-for-specific-lvm2-vg-on-linux/849255#849255</a><br>
&gt; <br>
&gt; It was suggested that raid_stripe_all_devices should help (to turn on<=
br>
&gt; striping by default), but it did not. So I went ahead and patched the<=
br>
&gt; lvm.py of nova to turn the striping on. However I still wonder if ther=
e is<br>
&gt; a lvm option (allocation policy for that).<br>
&gt; <br>
&gt; Besides that, it looks like it is still creating the first stripe on t=
he<br>
&gt; first device. It would make more sense to have it (even in the linear =
case)<br>
&gt; to round robin the LVs. Because first of all it might be the most busy=
 part<br>
&gt; of the volume and secondly it helps for keeping room for expanding vol=
umes.<br>
&gt; <br>
&gt; Is there anything planned in this direction?<br>
<br>
If you're concerned with placement of LVs on PVs, I'd probably skip<br>
striping and add some logic specifying different PVs directly:<br>
<br>
lvcreate -n name -L size VG PV ...<br>
<br>
means the LV will be created using only the specified PVs.<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_HE1PR08MB27955073A670877C0CA50348FFE20HE1PR08MB2795eurp_--
