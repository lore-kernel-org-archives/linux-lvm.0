Message-ID: <012801c2c62d$d3b57df0$4b66699f@win.doc.state.vt.us>
From: "Joseph Kezar" <jkezar@doc.state.vt.us>
References: <005c01c2c624$2fff0680$4b66699f@win.doc.state.vt.us>
Subject: Re: [linux-lvm] reuses an existing LV number
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Jan 27 12:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Another thing to add:
Can I change how vgscan is called during bootup?  or is it locked in initrd?
It says to vgexport/vgimport or use -f
So if it boots with -f I should be able to then at least mount my root
partition?

How can I change the manner in which LVM starts so that I can get it to
vgscan with a -f?

Thanks,
A very desperate Joe Kezar

----- Original Message -----
From: "Joseph Kezar" <jkezar@doc.state.vt.us>
To: <linux-lvm@sistina.com>
Sent: Monday, January 27, 2003 11:50 AM
Subject: [linux-lvm] reuses an existing LV number


> I have a situation here where I have to Volume groups
>
> VolumeMailData
> and
> vg0
>
> I just created 2 more Logical Volumes(LV) on VolumeMailData to make a
total
> of 4.
> I then rebooted and got this error
>
> vgscan - found an inactive volume group "VolumeMailData"
> vgscan - found an inactive volume group "vg0"
> vgscan - volume group "vg0" reuses an existing logical volume number;
please
> vgexport/vgimport that VG or use option -f
>
> ....
>
> kernel panic: no init found; try passing init=
>
> VolumeMailData gets activated.  But my root (/) is on vg0 which doesnt get
> activated and I am dead in the water.
>
> I can detach my JBOD/RAID Array which makes up VolumeMailData so I can
boot.
> This way it doesnt find the inactive volume group VolumeMailData and vgo
is
> able to come up normaly
>
> How can I fix this problem, as it is I kinda need both volume groups
> functioning simantaniously :)
> Thanks,
> Joe Kezar
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
