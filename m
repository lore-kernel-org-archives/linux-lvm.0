Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4BHIB5u022546
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 13:18:11 -0400
Received: from mail-fx0-f214.google.com (mail-fx0-f214.google.com
	[209.85.220.214])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n4BHHwcB029650
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 13:17:58 -0400
Received: by fxm10 with SMTP id 10so2834453fxm.3
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 10:17:57 -0700 (PDT)
MIME-Version: 1.0
From: Eugene Vilensky <evilensky@gmail.com>
Date: Mon, 11 May 2009 12:17:37 -0500
Message-ID: <f4f537b50905111017p4edc87ccl1d0eb2d71c834a58@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001636499069d9f9880469a628c1
Subject: [linux-lvm] removing a missing vg
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

--001636499069d9f9880469a628c1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi folk,

I tried to remove some NetApp LUNs from a RHEL 4.6 system, and originally
stale mappings remained in multipath -ll which I was not able to flush.  In
production instance, I am unable to remove the multipath mappings because
the vg is missing.  How can I deactivate a missing vg?

My test instance, I had the opportunity to return the test LUNs to service
and was able to "vgchange -an" followed by a "multipath -f mpath1" which
removed the mapings.

However, the four paths remain in my /dev/ heirarchy, and vgscan returns
this for each of the devices that are no longer really there:

/dev/sdf: read failed after 0 of 4096 at 0: Input/output error

How may I remove these missing devices?

--001636499069d9f9880469a628c1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi folk,<br><br>I tried to remove some NetApp LUNs from a RHEL 4.6 system, =
and originally stale mappings remained in multipath -ll which I was not abl=
e to flush.=A0 In production instance, I am unable to remove the multipath =
mappings because the vg is missing.=A0 How can I deactivate a missing vg?<b=
r>

<br>My test instance, I had the opportunity to return the test LUNs to serv=
ice and was able to &quot;vgchange -an&quot; followed by a &quot;multipath =
-f mpath1&quot; which removed the mapings.<br><br>However, the four paths r=
emain in my /dev/ heirarchy, and vgscan returns this for each of the device=
s that are no longer really there:<br>

<div style=3D"margin-left: 40px;"><br>/dev/sdf: read failed after 0 of 4096=
 at 0: Input/output error<br></div><br>How may I remove these missing devic=
es?<br>

--001636499069d9f9880469a628c1--
