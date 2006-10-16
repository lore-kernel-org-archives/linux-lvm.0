Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id k9GJNEnP004854
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 15:23:14 -0400
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <BAY122-F341CBA1207CBA2BCB8EB090160@phx.gbl>
References: <BAY122-F341CBA1207CBA2BCB8EB090160@phx.gbl>
Message-Id: <de5daf3c5831ceeb42cd3f8c701521f2@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Linux LVM Physical Layout Structure
Date: Mon, 16 Oct 2006 14:25:48 -0500
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

have you tried using 'lvs --all -o+devices'?

If you look at the "devices" column, you will see a number following=20
the device that indicates the start segment.   There are many=20
additional arguments to pvs, vgs, and lvs that can be displayed to show=20
you the allocation layout.  (I'm assuming you are talking about LVM2.)

Conversely, if you are using LVM2, you could also look at=20
/etc/lvm/backup/<vgname> to read the specifics of how lv's are mapped=20
on the pv's.

  brassow

On Oct 9, 2006, at 3:11 AM, Sundeep Saini wrote:

>
> HI,
> I have a query about the physical layout of the LVM. Using some=20
> hexeditor i tried to find out the VGDA structure. But i am not getting=20
> any specific structure at starting of PV.
> As The Volume Group Descriptor Area (VGDA) functions similar to the=20
> partition table for LVM. It is stored at the beginning at the=20
> beginning of each physical volume.=EF=BF=BD
>
> Earlier i worked on HP-UX LVM and i read that i impementation of LVM=20
> is similar in both.
>
> I want to get the information of the PE map and if i extend some LV=20
> and create 2-3 segments then how i will be able to know the PE chain.
>
> I got some structure on HDD that contain some ASCII values as the=20
> output of #lvdisplay ot vgdisplay
>
> Please give some guidance to find the internal layout of LVM on HDD.
>
> Thanks in Advance
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
