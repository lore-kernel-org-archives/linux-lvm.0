Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3U4kATQ009143
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 30 Apr 2016 00:46:10 -0400
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A957C05683F
	for <linux-lvm@redhat.com>; Sat, 30 Apr 2016 04:46:09 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id s8so36439245ign.0
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 21:46:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c7c656a28e0598e1632641ade569f692@dds.nl>
References: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
	<1009262601.20160429104420@marki-online.net>
	<5723322A.3060702@assyoma.it>
	<ba7cee20dbf40157dcff5746cbef9158@dds.nl>
	<c7c656a28e0598e1632641ade569f692@dds.nl>
Date: Sat, 30 Apr 2016 00:46:08 -0400
Message-ID: <CALm7yL2T1Hg3A8nPz41eS1yOs7Ge6LHr1F7zAXQuXPea+OWWuQ@mail.gmail.com>
From: Mark Mielke <mark.mielke@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b10c75d1d1c680531ac70d3
Subject: Re: [linux-lvm] about the lying nature of thin
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

--047d7b10c75d1d1c680531ac70d3
Content-Type: text/plain; charset=UTF-8

Lots of interesting ideas in this thread.

But the practical of things is that there is a need for thin volumes that
are over provisioned. Call it a lie if you must, but I want to have
multiple snapshots, and not be forced to have 10X the storage, just so that
I can *guarantee* that I will have the technical capability to fully
allocate every snapshot without running out of space. This is for my
requirements, where I am not being naive or irresponsible. I'm not
representing the situation to myself. I know exactly what to expect, and I
know that it isn't only important to monitor, but it is also important to
understand the usage patterns. For example, in some of our use cases, files
will only normally be extended or created as new, at which point the
overhead of a snapshot is close to zero.

If people find this model unacceptable, then I think they should not use
thin volumes. It's a technology choice.

We have many systems like this beyond LVM... For example, the NetApp FAS
devices we have are set up with this type of model, and IT normally
allocates 10% or more for "snapshots", and when we get this wrong, it does
hurt in various ways, usually requiring that the snapshots get dumped, and
that we figure out why the monitoring failed. Normally, IT adds to the
aggregate as it passes a threshold. In the particular case that is
important for me - we have a fixed size local SSD for maximum performance,
and we still want to take frequent snapshots (and prune them behind),
similar to what we do on NetApp, but all in the context of local storage. I
don't use the word "lie" to IT in these cases. It's a partnership, and
attempt to make the most use of the storage and the technology.

There was some discussion about how data is presented to the higher layers.
I didn't follow the suggestion exactly (communicating layout information?),
but I did have these thoughts:

   1. When the storage runs out, it clearly communicates layout information
   to the caller in the form of a boolean "does it work or not?"
   2. There are other ways that information does get communicated, such as
   if a device becomes read only. For example, an iSCSI LUN.

I didn't follow communication of specific layout information as this didn't
really make sense to me when it comes to dynamic allocation. But, if the
intent is to provide early warning of the likelihood of failure, compared
to waiting to the very last minute where it has already failed, it seems
like early warning would be useful. I did have a question about the
performance of this type of communication, however, as I wouldn't want the
host to be constantly polling the storage to recalculate the up-to-date
storage space available.

--047d7b10c75d1d1c680531ac70d3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Lots of interesting ideas in this thread.<div><br></div><d=
iv>But the practical of things is that there is a need for thin volumes tha=
t are over provisioned. Call it a lie if you must, but I want to have multi=
ple snapshots, and not be forced to have 10X the storage, just so that I ca=
n *guarantee* that I will have the technical capability to fully allocate e=
very snapshot without running out of space. This is for my requirements, wh=
ere I am not being naive or irresponsible. I&#39;m not representing the sit=
uation to myself. I know exactly what to expect, and I know that it isn&#39=
;t only important to monitor, but it is also important to understand the us=
age patterns. For example, in some of our use cases, files will only normal=
ly be extended or created as new, at which point the overhead of a snapshot=
 is close to zero.</div><div><br></div><div>If people find this model unacc=
eptable, then I think they should not use thin volumes. It&#39;s a technolo=
gy choice.</div><div><br></div><div>We have many systems like this beyond L=
VM... For example, the NetApp FAS devices we have are set up with this type=
 of model, and IT normally allocates 10% or more for &quot;snapshots&quot;,=
 and when we get this wrong, it does hurt in various ways, usually requirin=
g that the snapshots get dumped, and that we figure out why the monitoring =
failed. Normally, IT adds to the aggregate as it passes a threshold. In the=
 particular case that is important for me - we have a fixed size local SSD =
for maximum performance, and we still want to take frequent snapshots (and =
prune them behind), similar to what we do on NetApp, but all in the context=
 of local storage. I don&#39;t use the word &quot;lie&quot; to IT in these =
cases. It&#39;s a partnership, and attempt to make the most use of the stor=
age and the technology.</div><div><br></div><div>There was some discussion =
about how data is presented to the higher layers. I didn&#39;t follow the s=
uggestion exactly (communicating layout information?), but I did have these=
 thoughts:</div><div><ol><li>When the storage runs out, it clearly communic=
ates layout information to the caller in the form of a boolean &quot;does i=
t work or not?&quot;<br></li><li>There are other ways that information does=
 get communicated, such as if a device becomes read only. For example, an i=
SCSI LUN.</li></ol>I didn&#39;t follow communication of specific layout inf=
ormation as this didn&#39;t really make sense to me when it comes to dynami=
c allocation. But, if the intent is to provide early warning of the likelih=
ood of failure, compared to waiting to the very last minute where it has al=
ready failed, it seems like early warning would be useful. I did have a que=
stion about the performance of this type of communication, however, as I wo=
uldn&#39;t want the host to be constantly polling the storage to recalculat=
e the up-to-date storage space available.</div><div><br></div></div>

--047d7b10c75d1d1c680531ac70d3--
