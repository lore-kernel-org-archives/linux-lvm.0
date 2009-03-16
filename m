Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GLrjGh012615
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 17:53:45 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2GLrV81016306
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 17:53:31 -0400
Received: from ns1.futuresource.com ([10.207.192.126])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n2GLrUro015888
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 16:53:31 -0500
Received: from [10.207.193.131] (les-xp.futuresource.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n2GLrUr17447
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 16:53:30 -0500
Message-ID: <49BECA5A.3040407@gmail.com>
Date: Mon, 16 Mar 2009 16:53:30 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net>	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>	<49BC511E.5040402@esiway.net>	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>	<49BE9F73.8050109@gmail.com>	<87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com>	<49BEB683.7020209@gmail.com>	<87f94c370903161354v2e43f13ci914f45175ca6af6f@mail.gmail.com>	<49BEC1CC.5050900@gmail.com>
	<87f94c370903161436y40eddb3pe162bfa64a90e371@mail.gmail.com>
In-Reply-To: <87f94c370903161436y40eddb3pe162bfa64a90e371@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Greg Freemyer wrote:
>>> I haven't seen anyone claim yet that there is support for fsync(), which
>> must return the status of the completion of the operation to the
>> application.  If it does, then the discussion could turn to performance.
>> 
> Is your specific interest to ext3?

No, it is whether a useful fsync() is possible over LVM.

> If so, I suggest you post a
> question there along the lines of:
> 
> Device Mapper does not support barriers if more than one physical
> device is in use by the LV.  If I'm using ext3 on a LV and I call
> fsync() from user space, how is fsync() implemented.  Or is it not?

The point of fsync() is for an application to know that a write has been 
safely committed, as for example sendmail would do before acknowledging 
to the sender that a message has been accepted.  The question isn't 
whether an application can call fsync() but rather whether it's return 
status is lying, making the underlying storage unsuitable for anything 
that needs reliability.

-- 
   Les Mikesell
    lesmikesell@gmail.com
