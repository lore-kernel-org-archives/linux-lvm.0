Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2OFMDbB026044
	for <linux-lvm@redhat.com>; Thu, 24 Mar 2011 11:22:13 -0400
Received: from mail-gy0-f174.google.com (mail-gy0-f174.google.com
	[209.85.160.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2OFM8gq013900
	for <linux-lvm@redhat.com>; Thu, 24 Mar 2011 11:22:08 -0400
Received: by gyf1 with SMTP id 1so29379gyf.33
	for <linux-lvm@redhat.com>; Thu, 24 Mar 2011 08:22:08 -0700 (PDT)
From: Mike Young <myoung@wildernessvoice.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-1-550377002
Date: Thu, 24 Mar 2011 09:22:04 -0600
Message-Id: <66707497-76A4-4BA2-835A-791E6D3F0924@wildernessvoice.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Subject: [linux-lvm] Derivative snapshots
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


--Apple-Mail-1-550377002
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

I'd like to say in advance that I really appreciate any guidance/help I =
can receive with this request.

I am looking for a way to perform a derivative snapshot (i.e., a =
snapshot of an existing snapshot volume). I understand that there can be =
issues with respect to restoring an Original volume from such a =
derivative, and I'd like to say that I have no intention of any such =
restoration.

Basically, I want to use lvm to quickly generate a 100% block replica of =
an existing LV.

For example:
To create first snapshot
 lvcreate -L[same size as original] -sn [snapshot_1] /dev/[path to =
original]

After some time, I make a number of changes to the snapshot volume and I =
wish to replicate off of that.
lvcreate -L[same size as snapshot_1] -sn [snapshot_2] /dev/[path to =
snapshot_1]

When I try to create the derivative snapshot, I get the message =
"Snapshots of snapshots are not supported yet."

I can see how lvcreate validates the various arguments, but I'm not =
immediately seeing how this particular check is performed where it looks =
at the "type" of the source volume.

Can someone help me with where this check is actually performed?

Thanks,

Mike=

--Apple-Mail-1-550377002
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">Hi,<div><br></div><div>I'd like to say in advance that I really =
appreciate any guidance/help I can receive with this =
request.</div><div><br></div><div>I am looking for a way to perform a =
derivative snapshot (i.e., a snapshot of an existing snapshot volume). I =
understand that there can be issues with respect to restoring an =
Original volume from such a derivative, and I'd like to say that I have =
no intention of any such =
restoration.</div><div><br></div><div>Basically, I want to use lvm to =
quickly generate a 100% block replica of an existing =
LV.</div><blockquote class=3D"webkit-indent-blockquote" style=3D"margin: =
0 0 0 40px; border: none; padding: 0px;"><div><br></div></blockquote>For =
example:<br><blockquote class=3D"webkit-indent-blockquote" =
style=3D"margin: 0 0 0 40px; border: none; padding: 0px;"><div><b>To =
create first snapshot</b></div><div>&nbsp;lvcreate -L[same size as =
original] -sn [snapshot_1] /dev/[path to =
original]</div><div><br></div><div>After some time, I make a number of =
changes to the snapshot volume and I wish to replicate off of =
that.</div><div>lvcreate -L[same size as snapshot_1] -sn [snapshot_2] =
/dev/[path to snapshot_1]</div><div><br></div><div>When I try to create =
the derivative snapshot, I get the message "Snapshots of snapshots are =
not supported yet."</div></blockquote><div><br></div><div>I can see how =
lvcreate validates the various arguments, but I'm not immediately seeing =
how this particular check is performed where it looks at the "type" of =
the source volume.</div><div><br></div><div>Can someone help me with =
where this check is actually =
performed?</div><div><br></div><div>Thanks,</div><div><br></div><div>Mike<=
/div></body></html>=

--Apple-Mail-1-550377002--
