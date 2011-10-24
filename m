Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9ODTGcV027768
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 09:29:16 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9ODTFAQ014223
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 09:29:15 -0400
Received: by wyg36 with SMTP id 36so8357678wyg.33
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 06:29:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <02292FBD45CF4C40AA7104EA7B291B7002A1DBA130@mxb-zv04.LVRINTERN.LVR.DE>
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
	<CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
	<CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
	<CAJJYPdk2KXkYRTA5cQTAhkv=7fZoQKdopTySBA+mQ+Jp7K8QBg@mail.gmail.com>
	<02292FBD45CF4C40AA7104EA7B291B7002A1DBA130@mxb-zv04.LVRINTERN.LVR.DE>
Date: Mon, 24 Oct 2011 09:29:14 -0400
Message-ID: <CAHkvJJLvkmBZCLzFBG2CrYejwPzje6AFRqRgKy_0CwGhEynRCw@mail.gmail.com>
From: Hal Martin <hal.martin@gmail.com>
Subject: Re: [linux-lvm] Remove a LUN from a LVM mirror cause logical volume
 not response
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I don't have experience doing exactly what you're doing, but have you
checked that multipath is failing over correctly when your SAN is
missing a LUN?

Can you post the output of that command with '-vvvv' added?

-Hal

On Mon, Oct 24, 2011 at 8:48 AM, Matecki, Lukas <Lukas.Matecki@lvr.de> wrote:
> Second try this time with the right subject, sry Monday -.-
>
> Hallo List,
>
> We are using LVM with SAN and multipathd. I try to setup mirroring with LVM. So I do pv create on a mpath device. vgcreate, add the pv to the vg, create a lv and setup a mirror with this:
>
> lvconvert -m1 vg<name>/lv<name> /dev/mapper/mpath0 --mirrorlog core
>
> My intention is to create a logical volume which can handle SAN Disk failure.
>
> But in this shown setup i get a error (unavailable logical volume) when one of the san LUNS is missing.
>
> Can this system work or did i need to setup a mdadm device before pvcreate ?
>
> Hope you can help me because Redhat can't... them sitting two weeks on this error / miss configuration without any solution...
>
> Greetings
>
> Luke
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
