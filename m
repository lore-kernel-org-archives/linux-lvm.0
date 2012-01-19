Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0J5hhFM028292
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2012 00:43:43 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0J5hgXc007506
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2012 00:43:43 -0500
Received: from melissa.gathman.org (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q0J5h0hX021054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2012 00:43:01 -0500
Message-ID: <4F17AD8D.7040209@bmsi.com>
Date: Thu, 19 Jan 2012 00:43:41 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <CALe_PVkxi2oTuvqkSQz6KHi-G0Nxk7mXMOA8o3XFf3cwo7eG1Q@mail.gmail.com>
	<0A03EDA0F33C5C428BFFF019C40D609EA7E3CCDDBF@SCMBXC01.bcbad.state.sc.us>
	<CALe_PVk8jzZnpb5HRKfuXj7KAXqERw7BEahLMND3A1tkT-Ts_A@mail.gmail.com>
In-Reply-To: <CALe_PVk8jzZnpb5HRKfuXj7KAXqERw7BEahLMND3A1tkT-Ts_A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Resizing a logical volume which is mounted (at
	/home)
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
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 01/18/2012 09:50 PM, Kiran Rao
would write:
> Thanks for the advice Jess.
>
> Actually I am to blame for this. I did not properly understand the LVM
> concept before doing this partitioning. I have lots of free space on
> disk but that is *outside* the VG. Only later did I realize that the
> whole point of having VGs is to have some free space *within* them!
It is easy to add free space outside the VG to the VG.  Just run
pvcreate on the partition, and vgextend to add it to the VG.  Should you
wish to subsequently remove the PV from the VG, use pvmove to move all
LVs off of the PV, then vgreduce to remove the PV from the VG.
