Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4H6PV5N012570
	for <linux-lvm@redhat.com>; Thu, 17 May 2012 02:25:31 -0400
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4H6PUiu029859
	for <linux-lvm@redhat.com>; Thu, 17 May 2012 02:25:31 -0400
Received: by vbbff1 with SMTP id ff1so2219558vbb.33
	for <linux-lvm@redhat.com>; Wed, 16 May 2012 23:25:30 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 17 May 2012 01:25:30 -0500
Message-ID: <CAMEceNT9Ka16UYC8PrsXq16kOLrb_CTkD_UVEO1Vg79tF3ghSw@mail.gmail.com>
From: Ruben Quinones <rq.sysadmin@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec50162d39d50ca04c0358092
Subject: [linux-lvm] Can't create logical volume using lvm2app library
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

--bcaec50162d39d50ca04c0358092
Content-Type: text/plain; charset=ISO-8859-1

Hi. I'm having a problem when trying to create a lv using lvm2app's
function lvm_vg_create_lv_linear... I have found that the output from the
function in lvm_lv.c:

extents = extents_from_size(vg->cmd, size / SECTOR_SIZE,
    vg->extent_size);

is 0. I am calling the function assuming it expects extent size, like this:

 lvm_vg_create_lv_linear(vg, "testname", 10);


Everything works ok when using lvcreate though, any thoughts?

--bcaec50162d39d50ca04c0358092
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi. I&#39;m having a problem when trying to create a lv using lvm2app&#39;s=
 function=A0lvm_vg_create_lv_linear... I have found that the output from th=
e function in lvm_lv.c:<div><br></div><div><div>extents =3D extents_from_si=
ze(vg-&gt;cmd, size / SECTOR_SIZE,</div>
<div><span class=3D"Apple-tab-span" style=3D"white-space:pre">				</span> =
=A0 =A0vg-&gt;extent_size);</div></div><div><br></div><div>is 0. I am calli=
ng the function assuming it expects extent size, like this:</div><div><br><=
/div>
<div>=A0lvm_vg_create_lv_linear(vg, &quot;testname&quot;, 10);</div><div><b=
r></div><div><br></div><div>Everything works ok when using lvcreate though,=
 any thoughts?</div><div><br></div>

--bcaec50162d39d50ca04c0358092--
