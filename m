Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u18I3fMY021406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 8 Feb 2016 13:03:41 -0500
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mx1.redhat.com (Postfix) with ESMTPS id DB6EA2C9DA7
	for <linux-lvm@redhat.com>; Mon,  8 Feb 2016 18:03:39 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id b35so122477599qge.0
	for <linux-lvm@redhat.com>; Mon, 08 Feb 2016 10:03:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160208085601.GA1498@rh-vpn>
References: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
	<CAAYit8T1Wh+zQT_fsEk88D=1hv2A=kLVGWQAcdccjzx5xPuh5g@mail.gmail.com>
	<20160208085601.GA1498@rh-vpn>
Date: Tue, 9 Feb 2016 02:03:39 +0800
Message-ID: <CAAYit8RBpYh-99ZkBU6UF5KA2eot19LbvzivVUnDOeaFSJ621g@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Content-Type: multipart/alternative; boundary=001a11373a583d57ed052b46055e
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--001a11373a583d57ed052b46055e
Content-Type: text/plain; charset=UTF-8

2016-02-08 16:56 GMT+08:00 Joe Thornber <thornber@redhat.com>:
> On Fri, Feb 05, 2016 at 07:44:46PM +0800, M.H. Tsai wrote:
>> I also wrote some extension to thin-provisioning-tools (not yet
>> published. the code still need some refinement...), maybe it could
>> help.
>
> I'd definitely like to see what you changed please.
>
> - Joe

I wrote some tools to do "semi-auto" repair, called thin_ll_dump and
thin_ll_restore (low-level dump & restore), that can find orphan nodes
and reconstruct the metadata using orphan nodes. It could cope the cases
that the top-level data mapping tree or some higher-level nodes were
broken, to complement the repairing feature of thin_repair.

Although that users are required to have knowledge about dm-thin metadata
before using these tools (you need to specify which orphan node to use), I
think that these tools are useful for system administrators. Most thin-pool
corruption cases I experienced (caused by power lost, broken disks, RAID
corruption, etc.) cannot be handled by the current thin-provisioning-tools
--  thin_repair is fully automatic, but it just skips broken nodes.
However, those missing mappings could be found in orphan nodes.

Also, I wrote another tool called thin_scan, to show the entire metadata
layout and scan broken nodes. (which is an enhanced version of
thin_show_block in branch low_level_examine_metadata -- I didn't notice
that before... maybe the name thin_show_block sounds more clear?)

What do you think about these features? Are they worth to be merged to the
upstream?


Thanks,
Ming-Hung Tsai

--001a11373a583d57ed052b46055e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">2016-02-08 16:56 GMT+08:00 Joe Thornber &lt;<a href=3D"mai=
lto:thornber@redhat.com" target=3D"_blank">thornber@redhat.com</a>&gt;:<br>=
&gt; On Fri, Feb 05, 2016 at 07:44:46PM +0800, M.H. Tsai wrote:<br>&gt;&gt;=
 I also wrote some extension to thin-provisioning-tools (not yet<br>&gt;&gt=
; published. the code still need some refinement...), maybe it could<br>&gt=
;&gt; help.<br>&gt;<br>&gt; I&#39;d definitely like to see what you changed=
 please.<br>&gt;<br>&gt; - Joe<br><br>I wrote some tools to do &quot;semi-a=
uto&quot; repair,=C2=A0called thin_ll_dump and thin_ll_restore (low-level d=
ump &amp; restore),=C2=A0that can find orphan nodes and=C2=A0reconstruct th=
e metadata using orphan nodes. It could cope the cases that the top-level d=
ata mapping tree or some higher-level nodes were broken, to complement the =
repairing feature of thin_repair.<br><br>Although that users are required t=
o have knowledge about dm-thin metadata before using these tools (you need =
to specify which orphan node to use), I think that these tools are useful f=
or system administrators. Most thin-pool corruption cases I experienced (ca=
used by power lost, broken disks, RAID corruption, etc.) cannot be handled =
by the current thin-provisioning-tools -- =C2=A0thin_repair is fully automa=
tic, but it just skips broken nodes. However, those missing mappings could =
be found in orphan nodes.<br><br>Also, I wrote another tool called thin_sca=
n, to show the entire metadata layout and scan broken nodes. (which is an e=
nhanced version of thin_show_block in branch low_level_examine_metadata -- =
I didn&#39;t notice that before... maybe the name thin_show_block sounds mo=
re clear?)<br><br>What do you think about these features? Are they worth to=
 be merged to the upstream?<div><div><div><br><br>Thanks,<br>Ming-Hung Tsai=
<br></div></div></div></div>

--001a11373a583d57ed052b46055e--
