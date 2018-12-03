Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D3295D738
	for <linux-lvm@redhat.com>; Mon,  3 Dec 2018 06:17:23 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
	[209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D64953154847
	for <linux-lvm@redhat.com>; Mon,  3 Dec 2018 06:17:22 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id m6so9897951oig.11
	for <linux-lvm@redhat.com>; Sun, 02 Dec 2018 22:17:22 -0800 (PST)
MIME-Version: 1.0
From: Far Had <farhadk.it@gmail.com>
Date: Mon, 3 Dec 2018 09:47:42 +0330
Message-ID: <CAB5m+-G1P9HJThW=hckE0yvBN-0VRCbQs4wEom1iO4NcF2U_7w@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000112fee057c181a4d"
Subject: [linux-lvm] CoW under the hood
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

--000000000000112fee057c181a4d
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm trying to understand how LVM thick snapshots work under the hood. I can
see that when new write requests are comming to the original volume that
has a snapshot, the current contents of storage blocks copy to the snapshot
space then the new data overwrites on the volume. No problem so far.
the question is when I delete a file on a volume that has snapshot, the
content is gone on the volume so the pointer which points from volume
object to that certain blocks on the volume should now point to empty
blocks. On the other hand I can see that the contents of deleted parts from
the original volume did not copy to the snapshot space, meaning that the
snapshot pointers that were pointing to that blocks on the original volume,
still point that direction.
In other words the pointers from both snapshot and original volume are
pointing to the same blocks on the storage media but they don't show the
same contents when you mount them on the filesystem.
Please enlighten me about this situation

--000000000000112fee057c181a4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I&#39;m trying to understand how LVM thick snapsho=
ts work under the hood. I can see that when new write requests are comming =
to the original volume that has a snapshot, the current contents of storage=
 blocks copy to the snapshot space then the new data overwrites on the volu=
me. No problem so far.</div><div>the question is when I delete a file on a =
volume that has snapshot, the content is gone on the volume so the pointer =
which points from volume object to that certain blocks on the volume should=
 now point to empty blocks. On the other hand I can see that the contents o=
f deleted parts from the original volume did not copy to the snapshot space=
, meaning that the snapshot pointers that were pointing to that blocks on t=
he original volume, still point that direction.</div><div>In other words th=
e pointers from both snapshot and original volume are pointing to the same =
blocks on the storage media but they don&#39;t show the same contents when =
you mount them on the filesystem.</div><div>Please enlighten me about this =
situation</div></div>

--000000000000112fee057c181a4d--
