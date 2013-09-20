Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8KBUQrw018741
	for <linux-lvm@redhat.com>; Fri, 20 Sep 2013 07:30:26 -0400
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8KBUP6h011644
	for <linux-lvm@redhat.com>; Fri, 20 Sep 2013 07:30:25 -0400
Received: by mail-vb0-f44.google.com with SMTP id e13so174043vbg.17
	for <linux-lvm@redhat.com>; Fri, 20 Sep 2013 04:30:25 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 20 Sep 2013 13:30:24 +0200
Message-ID: <CAFrGbuXqastwqEG3J5Vc7LeuiK3_SGr3GDkoaeMAJEW3FUEO+A@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=089e013a132a2347e904e6ceff6b
Subject: [linux-lvm] Mirrored LVM volumes and UUID
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

--089e013a132a2347e904e6ceff6b
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I can't seem to find such answer on the net.

I use mirrored volumes and blkid returns the same UUID for the "raid"
volume and the underlying volumes

/dev/mapper/lvm01-root_mimage_0:
UUID="0b88ad6f-34ed-46d6-abe3-eca0d235b353" TYPE="ext4"
/dev/mapper/lvm01-root_mimage_1:
UUID="0b88ad6f-34ed-46d6-abe3-eca0d235b353" TYPE="ext4"
/dev/mapper/lvm01-root: UUID="0b88ad6f-34ed-46d6-abe3-eca0d235b353"
TYPE="ext4"

Then such ID is used in fstab to mount root based... on UUID.

I wonder how fstab knows that it must use /dev/mapper/lvm01-root and not
the others since the three of them share the same UUID, and if by accident
the others can be erroneusly used/mounted.

Has anyone thought of it? Or it's just me?

Alex

--089e013a132a2347e904e6ceff6b
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr">Hi all,<div><br></div><div>I can&#39;t seem to find such answer on the net.</div><div><br></div><div>I use mirrored volumes and blkid returns the same UUID for the &quot;raid&quot; volume and the underlying volumes<br>
<br><div><div>/dev/mapper/lvm01-root_mimage_0: UUID=&quot;0b88ad6f-34ed-46d6-abe3-eca0d235b353&quot; TYPE=&quot;ext4&quot;</div><div>/dev/mapper/lvm01-root_mimage_1: UUID=&quot;0b88ad6f-34ed-46d6-abe3-eca0d235b353&quot; TYPE=&quot;ext4&quot;</div>
<div>/dev/mapper/lvm01-root: UUID=&quot;0b88ad6f-34ed-46d6-abe3-eca0d235b353&quot; TYPE=&quot;ext4&quot;</div></div></div><div><br></div><div>Then such ID is used in fstab to mount root based... on UUID.</div><div><br></div>
<div>I wonder how fstab knows that it must use /dev/mapper/lvm01-root and not the others since the three of them share the same UUID, and if by accident the others can be erroneusly used/mounted.</div><div><br></div><div>
Has anyone thought of it? Or it&#39;s just me?</div><div><br></div><div>Alex</div></div>

--089e013a132a2347e904e6ceff6b--
