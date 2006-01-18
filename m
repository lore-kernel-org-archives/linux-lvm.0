Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0ILqw125853
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 16:52:58 -0500
Received: from uproxy.gmail.com (uproxy.gmail.com [66.249.92.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0ILqpUa015413
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 16:52:52 -0500
Received: by uproxy.gmail.com with SMTP id k3so93884ugf
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 13:52:51 -0800 (PST)
Message-ID: <79af7a390601181346x5e569d60k3be1dde3f622433e@mail.gmail.com>
Date: Wed, 18 Jan 2006 21:46:10 +0000
From: Tiago Freitas <coolkcah@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_5982_918834.1137620770634"
Subject: [linux-lvm] pv resize problem
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
To: linux-lvm@redhat.com

------=_Part_5982_918834.1137620770634
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi.
I've seen a thread about the workaround for pvresize
(link<https://www.redhat.com/archives/linux-lvm/2005-February/msg00022.html=
>),
and managed to do it without problems. I reduced the PV and VG size from
18Gb to 11Gb, and everything works, but the "LVM partition" is still 18Gb
(when I see it with a partition manager it says it is a 18Gb 8e or unknown
partition).

quote:

> after that i can reduce hda6 with parted or similar utility.

and the new size is 384 sectors plus 224 extents of 65536 sectors each.


However, I can't resize it with parted, because it only supports resizing
partitions inside LV's.

CoolkcaH

------=_Part_5982_918834.1137620770634
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi. <br>I've seen a thread about the workaround for pvresize (l<a href=3D"h=
ttps://www.redhat.com/archives/linux-lvm/2005-February/msg00022.html" targe=
t=3D"_blank" onclick=3D"return top.js.OpenExtLink(window,event,this)">ink</=
a>),
and managed to do it without problems. I reduced the PV and VG size
from 18Gb to 11Gb, and everything works, but the &quot;LVM partition&quot; =
is
still 18Gb (when I see it with a partition manager it says it is a 18Gb 8e =
or unknown partition).<span class=3D"q" id=3D"q_108de3baaee0dd4d_1"><br>
<br>
quote:<br>
<pre>&gt; after that i can reduce hda6 with parted or similar utility.<br> =
<br>and the new size is 384 sectors plus 224 extents of 65536 sectors each.=
</pre>
<br>
However, I can't resize it with parted, because it only supports resizing p=
artitions inside LV's.<br><br>CoolkcaH<br><br><br></span>

------=_Part_5982_918834.1137620770634--
