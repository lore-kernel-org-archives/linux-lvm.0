Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3NMNdZQ030360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 18:23:39 -0400
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 307E13D3
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 22:23:38 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id u185so19281998iod.2
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 15:23:38 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 23 Apr 2016 18:23:37 -0400
Message-ID: <CALm7yL33yCtUDA4g8_F0mrrbt5kJ6UqRbK_By2BUBVNii4+A-Q@mail.gmail.com>
From: Mark Mielke <mark.mielke@gmail.com>
Content-Type: multipart/alternative; boundary=001a113eba8c132f4405312e655e
Subject: [linux-lvm] No way to waive "WARNING: Sum of all thin volumes sizes
 ..." concern, causes need to script around this?
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

--001a113eba8c132f4405312e655e
Content-Type: text/plain; charset=UTF-8

The LVM thin pool feature started to raise warnings like this some time
last year:

  WARNING: Sum of all thin volume sizes (1.12 TiB) exceeds the size of thin
pools and the size of whole volume group (372.12 GiB)!
  Logical volume "mail.20160422.081124" created.

I understand the need for this warning on the surface. Some people may not
realize what over-provisioning means, and may have particularly invalid
expectations around being able to create thin pools that are much larger
than the storage they have, and become bewildered when this assumption
proves invalid.

In my case - the above warning is happening even when creating snapshots of
existing volumes. In these cases, I want to take many snapshots, to take
advantage of the thin pool volume snapshot feature. This definitely leads
to overprovisioning, even to the size of the volume group. I fully expect
the size of all thin volumes (including snapshots) to exceed the size of
the volume group, and I'm fully aware that if these snapshots were to be
written to, it would fail once the volume group is fully allocate and it
can no longer auto extend.

I do see that the code makes an exception if auto extend is configuration,
but this exception does not cover all of the cases such as frequent
snapshots with low expectation for churn.

We have automated scripts where we use thin pool snapshots as a means to
snapshot our production data on local flash drives, which we also use as a
source to run backups. It is fully expected that the volume group, which is
a fixed size on a fixed sized local flash drive, will be exceeded when
taking a simple sum of all the snapshots. (My above example is my local
"mail" folder at home, but at work it would include things like our
PostgreSQL storage or local application storage for applications such as
JIRA or Confluence).

All of these scripts are now seeing the above warning. We have been
training our scripts and eyes to ignore it - but this leads to a risky of
ignoring actually valid warning messages, and extra complexity. I don't
consider it a good model to have a mandatory warning that everybody learns
to treat as noise.

I'm not asking to remove this warning... What do people think of
introducing a new option such as:

lvcreate --waive-thinpool-size-concern --snapshot --thinpool .../thinpool
mail --name mail.20160422.081124

Such an option (doesn't have to be the above wording), would allow the
check and WARNING: message to be skipped. We would be accepting
responsibility to monitoring the thin pool capacity (as we should be
expected, and as we already do), and we would not be presented with this
newbie-style warning for our normal mode of operation.

Thoughts?

-- 
Mark Mielke <mark.mielke@gmail.com>

--001a113eba8c132f4405312e655e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The LVM thin pool feature started to raise warnings l=
ike this some time last year:</div><div><br></div><div><div>=C2=A0 WARNING:=
 Sum of all thin volume sizes (1.12 TiB) exceeds the size of thin pools and=
 the size of whole volume group (372.12 GiB)!</div><div>=C2=A0 Logical volu=
me &quot;mail.20160422.081124&quot; created.</div></div><div><br></div><div=
>I understand the need for this warning on the surface. Some people may not=
 realize what over-provisioning means, and may have particularly invalid ex=
pectations around being able to create thin pools that are much larger than=
 the storage they have, and become bewildered when this assumption proves i=
nvalid.</div><div><br></div><div>In my case - the above warning is happenin=
g even when creating snapshots of existing volumes. In these cases, I want =
to take many snapshots, to take advantage of the thin pool volume snapshot =
feature. This definitely leads to overprovisioning, even to the size of the=
 volume group. I fully expect the size of all thin volumes (including snaps=
hots) to exceed the size of the volume group, and I&#39;m fully aware that =
if these snapshots were to be written to, it would fail once the volume gro=
up is fully allocate and it can no longer auto extend.</div><div><br></div>=
<div>I do see that the code makes an exception if auto extend is configurat=
ion, but this exception does not cover all of the cases such as frequent sn=
apshots with low expectation for churn.</div><div><br></div><div>We have au=
tomated scripts where we use thin pool snapshots as a means to snapshot our=
 production data on local flash drives, which we also use as a source to ru=
n backups. It is fully expected that the volume group, which is a fixed siz=
e on a fixed sized local flash drive, will be exceeded when taking a simple=
 sum of all the snapshots. (My above example is my local &quot;mail&quot; f=
older at home, but at work it would include things like our PostgreSQL stor=
age or local application storage for applications such as JIRA or Confluenc=
e).</div><div><br></div><div>All of these scripts are now seeing the above =
warning. We have been training our scripts and eyes to ignore it - but this=
 leads to a risky of ignoring actually valid warning messages, and extra co=
mplexity. I don&#39;t consider it a good model to have a mandatory warning =
that everybody learns to treat as noise.</div><div><br></div><div>I&#39;m n=
ot asking to remove this warning... What do people think of introducing a n=
ew option such as:</div><div><br></div><div>lvcreate --waive-thinpool-size-=
concern --snapshot --thinpool .../thinpool mail --name mail.20160422.081124=
</div><div><br></div><div>Such an option (doesn&#39;t have to be the above =
wording), would allow the check and WARNING: message to be skipped. We woul=
d be accepting responsibility to monitoring the thin pool capacity (as we s=
hould be expected, and as we already do), and we would not be presented wit=
h this newbie-style warning for our normal mode of operation.</div><div><br=
></div><div>Thoughts?</div><div><br></div>-- <br><div class=3D"gmail_signat=
ure">Mark Mielke &lt;<a href=3D"mailto:mark.mielke@gmail.com" target=3D"_bl=
ank">mark.mielke@gmail.com</a>&gt;<br><br></div>
</div>

--001a113eba8c132f4405312e655e--
