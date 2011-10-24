Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9O8Aiju014494
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 04:10:44 -0400
Received: from mail3.lvr.de (mail3.lvr.de [194.8.211.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9O8AhqX006321
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 04:10:44 -0400
From: "Matecki, Lukas" <Lukas.Matecki@lvr.de>
Date: Mon, 24 Oct 2011 10:10:41 +0200
Message-ID: <02292FBD45CF4C40AA7104EA7B291B7002A1DBA128@mxb-zv04.LVRINTERN.LVR.DE>
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
	<CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
In-Reply-To: <CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Changing dev_t-devname mapping in lvmlib seems
	to	be problematic
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

Hallo List,

We are using LVM with SAN and multipathd. I try to setup mirroring with LVM. So I do pv create on a mpath device. vgcreate, add the pv to the vg, create a lv and setup a mirror with this:

lvconvert -m1 vg<name>/lv<name> /dev/mapper/mpath0 --mirrorlog core

My intention is to create a logical volume which can handle SAN Disk failure.

But in this shown setup i get a error (unavailable logical volume) when one of the san LUNS is missing.

Can this system work or did i need to setup a mdadm device before pvcreate ?

Hope you can help me because Redhat can't... them sitting two weeks on this error / miss configuration without any solution...

Greetings

Luke
