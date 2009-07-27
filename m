Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6RDumVA029060
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 09:56:48 -0400
Received: from e2.ny.us.ibm.com (e2.ny.us.ibm.com [32.97.182.142])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6RDuWLh023030
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 09:56:32 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6RDp0MK017029
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 09:51:00 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6RDuTDV249026
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 09:56:30 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6RDuTXH005880
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 09:56:29 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n6RDuTtE005869
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 09:56:29 -0400
Date: Mon, 27 Jul 2009 06:56:28 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Mirroring implementation
Message-ID: <20090727135628.GA3782@us.ibm.com>
References: <29ae894c0907260312m3b2ffb2ex5cbef456f3c49bee@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29ae894c0907260312m3b2ffb2ex5cbef456f3c49bee@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

brem belguebli [brem.belguebli@gmail.com] wrote:
>    Hi,
>    I have a few questions concerning LVM mirror implementation, and I
>    couldn't find any suitable design doc
>    I need to setup a dual site ( a few miles between the 2 sites, around 1 ms
>    RTD) mirror based cluster system.

You need asynchronous mirroring (remote replication module). This is not
in mainline (not sure if included in the latest RHEL release). The
following comments apply to dm-mirror module that is already in the
mainline.

>    - *what is the default behaviour of the mirroring, writing in parallel to
>    both mirror legs or serialized ? what about read requests ?

It writes in parallel. Reads from a single device (switches on a device
failure only).

>    - for write requests, is the ack returned to the application (thru VFS)
>    when the 2 legs are updated or only when the first is updated ?

When two are updated. (you need 'remote replication' module for the
latter behaviour)

>    - Is there a way to control it ?

     I don't think so.

>    - what happens if the log device is lost ?

The mirror stops and a daemon re-allocates the log and the mirror should
be back to business (this depends on your lvm configuration though).

>    I saw a post about LVM mirror vs mdadm where it is about the location of
>    the mirror log
>    ([1]https://www.redhat.com/archives/linux-lvm/2009-July/msg00012.html)
>    someone gave the answer that when creating the LV's with --alloc anywhere
>    it will auto locate the log on any of the PV's.
>    According to what I could read, the --alloc doesn't intend for that, am I
>    right ?

Replace your "auto locate" to "allocate the log on any of the PV's".

What is the intention of the "--alloc anywhere" from your reading?

--Malahal.
