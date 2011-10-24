Message-ID: <4EA569A2.2010106@redhat.com>
Date: Mon, 24 Oct 2011 14:35:30 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
	<CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
	<CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
	<CAJJYPdk2KXkYRTA5cQTAhkv=7fZoQKdopTySBA+mQ+Jp7K8QBg@mail.gmail.com>
	<02292FBD45CF4C40AA7104EA7B291B7002A1DBA130@mxb-zv04.LVRINTERN.LVR.DE>
In-Reply-To: <02292FBD45CF4C40AA7104EA7B291B7002A1DBA130@mxb-zv04.LVRINTERN.LVR.DE>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Matecki, Lukas" <Lukas.Matecki@lvr.de>, Alexander Lyakas <alex.bolshoy@gmail.com>

On 10/24/2011 01:48 PM, Matecki, Lukas wrote:
> Second try this time with the right subject, sry Monday -.-
>
> Hallo List,
>
> We are using LVM with SAN and multipathd. I try to setup mirroring with LVM. So I do pv create on a mpath device. vgcreate, add the pv to the vg, create a lv and setup a mirror with this:

Bear in mind that if you are using multipath underneath a mirror then 
you will need to configure multipath to not queue I/O when all paths to 
a device fail (or to only do so for a limited number of retries).

Otherwise the system will queue all I/O and block accessing the side of
the mirror on the failed SAN.

> lvconvert -m1 vg<name>/lv<name>  /dev/mapper/mpath0 --mirrorlog core

Using core may not be the best idea here since it will mean that you 
have to resynchronize the mirror every time it is activated.

> My intention is to create a logical volume which can handle SAN Disk failure.
>
> But in this shown setup i get a error (unavailable logical volume) when one of the san LUNS is missing.

Can you paste the exact error you are getting? This doesn't sound like 
any LVM2 error message that I'm familiar with.

Regards,
Bryn.
