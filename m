Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9BL4Iic004110
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 17:04:19 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9BL45YQ019108
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 17:04:06 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.14.4/8.13.1) with ESMTP id o9BKpSWA023802
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 14:51:28 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o9BL45fw158636
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 15:04:05 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id o9BL44hr007870
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 15:04:04 -0600
Received: from malahal (malahal-009047025235.beaverton.ibm.com [9.47.25.235])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP
	id o9BL44Z2007839
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 15:04:04 -0600
Date: Mon, 11 Oct 2010 14:04:03 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20101011210403.GA6334@us.ibm.com>
References: <4BD43A85686FC34D819098DB1C3999D9B0C5CE17@orsmsx502.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BD43A85686FC34D819098DB1C3999D9B0C5CE17@orsmsx502.amr.corp.intel.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] vgcreate fails with return value 5
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Riches Jr, RobertX M [robertx.m.riches.jr@intel.com] wrote:
>    An exit code of 5 appears to indicate excessive numbers of VGs.� However,
>    there are no other VGs on the system prior to this call to vgcreate.�
>    Search engine results indicate the PV might be corrupt.� However, the PV
>    was just created a few milliseconds before calling vgcreate.
> 
>    When calling vgcreate immediately after calling pvcreate, is there a need
>    to wait for some after-effects of the pvcreate to settle out?� Is there
>    some command to positively determine whether the PV is actually ready and
>    open for business?

I am not aware of any such issue, but you can run "pvs" and find out if
your newly created PV is listed in the output.

>    Any other suggestions?

If you can create a test script that creates two PV's out of two loop
mounted temporary files and re-create your bug, then someone in the
dm-devel forum would surely help.

Thanks, Malahal.
