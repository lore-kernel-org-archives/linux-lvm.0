Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1H2mPKo021609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 16 Feb 2016 21:48:25 -0500
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mx1.redhat.com (Postfix) with ESMTPS id 83BC9C0AAB3C
	for <linux-lvm@redhat.com>; Wed, 17 Feb 2016 02:48:24 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id of3so1725734lbc.1
	for <linux-lvm@redhat.com>; Tue, 16 Feb 2016 18:48:24 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 17 Feb 2016 10:48:23 +0800
Message-ID: <CAGU4k=1-U1Z3mhPEt-YW96XaFFjcyO0AE0fUDw6FN4wfV2gB+g@mail.gmail.com>
From: Mars <kirapangzi@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c32f288eb737052bee48b0
Subject: Re: [linux-lvm] Repair thin pool
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
To: linux-lvm@redhat.com

--001a11c32f288eb737052bee48b0
Content-Type: text/plain; charset=UTF-8

2016-02-10 18:32 GMT+08:00 Joe Thornber <thornber redhat com>:

> Yep, I definitely want these for upstream.  Send me what you've got,

> whatever state it's in; I'll happily spend a couple of weeks tidying

> this.

>

> - Joe

The feature was completed & workable, but the code is based on v0.4.1.

I need some days to clean up & rebase. Please wait.

syntax:

thin_ll_dump /dev/mapper/corrupted_tmeta [-o thin_ll_dump.xml]

thin_ll_restore -i edited_thin_ll_dump.xml -E

/dev/mapper/corrupted_tmeta -o /dev/mapper/fixed_tmeta

Ming-Hung Tsai

-------------

Hi,

Thank you very much for giving us so many advices.


Here are some progresses based on you guys mail conversations:

1,check metadata device:

[root@stor14 home]# thin_check /dev/mapper/vgg145155121036c-pool_nas_tmeta0
examining superblock
examining devices tree
examining mapping tree

2,dump metadata info:

[root@stor14 home]# thin_dump
/dev/mapper/vgg145155121036c-pool_nas_tmeta0 -o nas_thin_dump.xml -r
[root@stor14 home]# cat nas_thin_dump.xml
<superblock uuid="" time="1787" transaction="3545"
data_block_size="128" nr_data_blocks="249980672">
</superblock>

Compared with other normal pools, it seems like all device nodes and
mapping info in the metadata lv have lost.

Is there happened to be 'orphan nodes'? and could you give us your
semi-auto repair tools so we can repair it?


Thank you very much!

Mars

--001a11c32f288eb737052bee48b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;border:none;p=
adding:0px"><pre style=3D"color:rgb(0,0,0)"><pre><br></pre></pre><pre style=
=3D"color:rgb(0,0,0)">2016-02-10 18:32 GMT+08:00 Joe Thornber &lt;thornber =
redhat com&gt;:</pre><pre style=3D"color:rgb(0,0,0)">&gt; Yep, I definitely=
 want these for upstream.  Send me what you&#39;ve got,</pre><pre style=3D"=
color:rgb(0,0,0)">&gt; whatever state it&#39;s in; I&#39;ll happily spend a=
 couple of weeks tidying</pre><pre style=3D"color:rgb(0,0,0)">&gt; this.</p=
re><pre style=3D"color:rgb(0,0,0)">&gt;</pre><pre style=3D"color:rgb(0,0,0)=
">&gt; - Joe</pre><pre style=3D"color:rgb(0,0,0)"></pre><pre style=3D"color=
:rgb(0,0,0)">The feature was completed &amp; workable, but the code is base=
d on v0.4.1.</pre><pre style=3D"color:rgb(0,0,0)">I need some days to clean=
 up &amp; rebase. Please wait.</pre><pre style=3D"color:rgb(0,0,0)"></pre><=
pre style=3D"color:rgb(0,0,0)">syntax:</pre><pre style=3D"color:rgb(0,0,0)"=
>thin_ll_dump /dev/mapper/corrupted_tmeta [-o thin_ll_dump.xml]</pre><pre s=
tyle=3D"color:rgb(0,0,0)">thin_ll_restore -i edited_thin_ll_dump.xml -E</pr=
e><pre style=3D"color:rgb(0,0,0)">/dev/mapper/corrupted_tmeta -o /dev/mappe=
r/fixed_tmeta</pre><pre style=3D"color:rgb(0,0,0)"></pre><pre style=3D"colo=
r:rgb(0,0,0)">Ming-Hung Tsai</pre></blockquote><pre style=3D"color:rgb(0,0,=
0)">-------------</pre><pre style=3D"color:rgb(0,0,0)">Hi,</pre><pre style=
=3D"color:rgb(0,0,0)">Thank you very much for giving us so many advices.</p=
re><pre style=3D"color:rgb(0,0,0)"><br></pre><pre style=3D"color:rgb(0,0,0)=
">Here are some progresses based on you guys mail conversations:</pre><pre =
style=3D"color:rgb(0,0,0)">1,check metadata device:</pre><pre style=3D""><f=
ont color=3D"#000000">[root@stor14 home]# thin_check /dev/mapper/vgg1451551=
21036c-pool_nas_tmeta0
examining superblock
examining devices tree
examining mapping tree</font><span style=3D"color:rgb(0,0,0)">
</span></pre><div><pre style=3D""><font color=3D"#000000">2,dump metadata i=
nfo:</font></pre><pre style=3D""><font color=3D"#000000">[root@stor14 home]=
# thin_dump /dev/mapper/vgg145155121036c-pool_nas_tmeta0 -o nas_thin_dump.x=
ml -r
[root@stor14 home]# cat nas_thin_dump.xml=20
&lt;superblock uuid=3D&quot;&quot; time=3D&quot;1787&quot; transaction=3D&q=
uot;3545&quot; data_block_size=3D&quot;128&quot; nr_data_blocks=3D&quot;249=
980672&quot;&gt;
&lt;/superblock&gt;</font></pre></div><div><pre>Compared with other normal =
pools, it seems like all device nodes and mapping info in the metadata lv h=
ave lost.</pre><pre>Is there happened to be &#39;orphan nodes&#39;? and cou=
ld you give us your semi-auto repair tools so we can repair it?</pre><pre><=
br></pre><pre>Thank you very much!</pre><pre>Mars</pre></div><pre style=3D"=
color:rgb(0,0,0)"><br></pre><pre style=3D"color:rgb(0,0,0)"><br></pre></div=
>

--001a11c32f288eb737052bee48b0--
