Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9FF4rr01215
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 11:04:53 -0400
Received: from smtp.restena.lu (legolas.restena.lu [158.64.1.34])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9FF4ptR018141
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 11:04:51 -0400
Received: from smtp.restena.lu (localhost [127.0.0.1])
	by smtp.restena.lu (8.12.11/8.12.11) with ESMTP id i9FF4rQJ007449
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 17:04:53 +0200
Received: from frodo.restena.lu (frodo.restena.lu [158.64.1.196])
	by smtp.restena.lu (8.13.1/8.13.1) with ESMTP id i9FF4q05007439
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 17:04:52 +0200
In-Reply-To: <20041015130220.GG24242@agk.surrey.redhat.com>
Subject: Re: [linux-lvm] access to hhardware copy: conflicting uuids
MIME-Version: 1.0
Message-ID: <OFBDC91ED7.88E9631E-ONC1256F2E.004B8463-C1256F2E.0052D6B7@restena.lu>
From: gilles.massen@restena.lu
Date: Fri, 15 Oct 2004 17:04:48 +0200
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks, that is precisely what I was looking for. Only that I did not find 
it in LVM version 2.00.07 and never thought of looking in something more 
recent :-\...

As to your other comment: at least currently I can very well temporarily 
unmount one VG while relabeling the copy. But I will test your 
recommendation anyway.

Best,
Gilles





On Fri, Oct 15, 2004 at 09:56:45AM +0200, gilles.massen@restena.lu wrote:
> Is there a way to access such an hardware-copy LVMed drive on the same 
> host where the original drive is already in use? 

You can only access one copy at once.
Set filters in lvm.conf to switch between them. [Remember always to run
vgscan after changing filters.]

Then use the XXchange --uuid commands to change one set of UUIDs and
vgrename the VG.

Alasdair
