Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9IBuEr28868
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2004 07:56:14 -0400
Received: from smtp.restena.lu (legolas.restena.lu [158.64.1.34])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9IBuBNm015502
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2004 07:56:12 -0400
Received: from smtp.restena.lu (localhost [127.0.0.1])
	by smtp.restena.lu (8.12.11/8.12.11) with ESMTP id i9IBuEgO006199
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2004 13:56:14 +0200
Received: from frodo.restena.lu (frodo.restena.lu [158.64.1.196])
	by smtp.restena.lu (8.13.1/8.13.1) with ESMTP id i9IBuDnw006192
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2004 13:56:13 +0200
In-Reply-To: <20041015130220.GG24242@agk.surrey.redhat.com>
Subject: Re: [linux-lvm] access to hhardware copy: conflicting uuids
MIME-Version: 1.0
Message-ID: <OF0D4025D0.FB3BB299-ONC1256F31.0040E0D2-C1256F31.0041910D@restena.lu>
From: gilles.massen@restena.lu
Date: Mon, 18 Oct 2004 13:56:09 +0200
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

Hi,

Hiding one copy via lvm.conf works fine. But unfortunately I have no luck 
with the pvchange --uuid . After issuing the command for one drive, LVM 
somehow "loses" the drive: it is still listed, but not really found. And 
the PV Name changes from /dev/sdb1 (e.g.) to "unknown device". I pastes 
the output of the pvdisplay below.

Making a vgchange --uuid before pvchange, or vice versa, does not change 
anything. The system still knows that the VG vg-test is there, but is 
unable to link it to the PV.

Any ideas?

Best,
Gilles

# pvdisplay
  Couldn't find device with uuid '1MGIR4-9aLJ-BuJL-HSZt-x6si-111E-gVRo0s'.
  --- Physical volume ---
  PV Name               unknown device
  VG Name               vg-test
  PV Size               1020.00 MB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              255
  Free PE               0
  Allocated PE          255
  PV UUID               1MGIR4-9aLJ-BuJL-HSZt-x6si-111E-gVRo0s

--
RESTENA - DNS-LU
6, rue Coudenhove-Kalergi
L-1359 Luxembourg
tel: (+352) 424409
fax: (+352) 422473


On Fri, Oct 15, 2004 at 09:56:45AM +0200, gilles.massen@restena.lu wrote:
> Is there a way to access such an hardware-copy LVMed drive on the same 
> host where the original drive is already in use? 

You can only access one copy at once.
Set filters in lvm.conf to switch between them. [Remember always to run
vgscan after changing filters.]

Then use the XXchange --uuid commands to change one set of UUIDs and
vgrename the VG.
