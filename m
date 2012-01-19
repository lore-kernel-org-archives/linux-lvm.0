Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0JA40jM017703
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2012 05:04:00 -0500
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0JA3wU5015538
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2012 05:03:59 -0500
Received: from gtw.srd.co.uk ([82.69.77.54] helo=agnew.srd.co.uk)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1RnoCW-0006N7-Rz
	for linux-lvm@redhat.com; Thu, 19 Jan 2012 09:22:32 +0000
Message-ID: <4F17EA88.5000508@ankh.org>
Date: Thu, 19 Jan 2012 10:03:52 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <CALe_PVkxi2oTuvqkSQz6KHi-G0Nxk7mXMOA8o3XFf3cwo7eG1Q@mail.gmail.com>	<0A03EDA0F33C5C428BFFF019C40D609EA7E3CCDDBF@SCMBXC01.bcbad.state.sc.us>
	<CALe_PVk8jzZnpb5HRKfuXj7KAXqERw7BEahLMND3A1tkT-Ts_A@mail.gmail.com>
In-Reply-To: <CALe_PVk8jzZnpb5HRKfuXj7KAXqERw7BEahLMND3A1tkT-Ts_A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Resizing a logical volume which is mounted
	(at	/home)
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

Kiran Rao wrote:
> Thanks for the advice Jess.
>
> Actually I am to blame for this. I did not properly understand the LVM
> concept before doing this partitioning. I have lots of free space on
> disk but that is *outside* the VG. Only later did I realize that the
> whole point of having VGs is to have some free space *within* them!
>
>   
Well that is easy then, if they free space is directly after your 
current PV, you can just extend the partition in the partition table 
then use PV resize to grow (cleaner but tricker),.

The Second thing "Easily" way you could do is create a new partition 
using the free space, then create a PV on that, then extend the volume 
group to also use that partition. Simplez

James
