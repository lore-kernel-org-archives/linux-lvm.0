Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4SExZAw018944
	for <linux-lvm@redhat.com>; Wed, 28 May 2008 10:59:35 -0400
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4SEwPud032631
	for <linux-lvm@redhat.com>; Wed, 28 May 2008 10:59:20 -0400
Received: by ti-out-0910.google.com with SMTP id 24so2183739tim.7
	for <linux-lvm@redhat.com>; Wed, 28 May 2008 07:59:19 -0700 (PDT)
Message-ID: <1cafab770805280759k60b9ca04w73457f8b5a4cf301@mail.gmail.com>
Date: Wed, 28 May 2008 16:59:19 +0200
From: "Xinwei Hu" <hxinwei@gmail.com>
Subject: Re: [linux-lvm] Fwd: Removing PVs from Volume Groups which have
	allocated LVs
In-Reply-To: <483D4F0D.D5D9.0001.0@novell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4835BC14.D5D9.0001.0@novell.com> <483D4F0D.D5D9.0001.0@novell.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

lvdisplay --maps

also, pvmove can move the data to other PVs before vgreduce.

2008/5/28 R Ramkumar <rramkumar@novell.com>:
> Hi,
>
> Does any one have any update on this issue? In brief, is it possible to know the PV's which are free (which are not being used by the LVs created) inside a VG so that they can be removed from the VG..
>
>>>> R Ramkumar 05/22/08 6:36 PM >>>
>
> Hi,
>
> I have a LVM setup where I have a VG with 3 PVs.. I have created 2 LVs from the VG which eventually has taken physical storage space from one or two of the PVs.. Now, when I want to shrink the VG, I need to know the unallocated PV so that I can remove from the VG..
>
> Is there anyway that I can find out which PV is unallocated and which PV to remove from the VG.. Please let me know your views..
>
> Thanks,
> Ram
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
