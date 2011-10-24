Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9OCn1ZN024828
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 08:49:01 -0400
Received: from mail3.lvr.de (mail3.lvr.de [194.8.211.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9OCmxcR013532
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 08:48:59 -0400
From: "Matecki, Lukas" <Lukas.Matecki@lvr.de>
Date: Mon, 24 Oct 2011 14:48:58 +0200
Message-ID: <02292FBD45CF4C40AA7104EA7B291B7002A1DBA130@mxb-zv04.LVRINTERN.LVR.DE>
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
	<CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
	<CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
	<CAJJYPdk2KXkYRTA5cQTAhkv=7fZoQKdopTySBA+mQ+Jp7K8QBg@mail.gmail.com>
In-Reply-To: <CAJJYPdk2KXkYRTA5cQTAhkv=7fZoQKdopTySBA+mQ+Jp7K8QBg@mail.gmail.com>
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Remove a LUN from a LVM mirror cause logical volume not
	response
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Alexander Lyakas <alex.bolshoy@gmail.com>

Second try this time with the right subject, sry Monday -.-

Hallo List,

We are using LVM with SAN and multipathd. I try to setup mirroring with LVM. So I do pv create on a mpath device. vgcreate, add the pv to the vg, create a lv and setup a mirror with this:

lvconvert -m1 vg<name>/lv<name> /dev/mapper/mpath0 --mirrorlog core

My intention is to create a logical volume which can handle SAN Disk failure.

But in this shown setup i get a error (unavailable logical volume) when one of the san LUNS is missing.

Can this system work or did i need to setup a mdadm device before pvcreate ?

Hope you can help me because Redhat can't... them sitting two weeks on this error / miss configuration without any solution...

Greetings

Luke
