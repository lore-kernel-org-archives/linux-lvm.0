Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i9FD2KuA024501
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 14:02:20 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CIRiu-0007rE-Kw
	for linux-lvm@redhat.com; Fri, 15 Oct 2004 14:02:20 +0100
Date: Fri, 15 Oct 2004 14:02:20 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] access to hhardware copy: conflicting uuids
Message-ID: <20041015130220.GG24242@agk.surrey.redhat.com>
References: <OFAE4BBAD4.BB974E50-ONC1256F2E.002AAEE7-C1256F2E.002BA651@restena.lu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFAE4BBAD4.BB974E50-ONC1256F2E.002AAEE7-C1256F2E.002BA651@restena.lu>
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

On Fri, Oct 15, 2004 at 09:56:45AM +0200, gilles.massen@restena.lu wrote:
> Is there a way to access such an hardware-copy LVMed drive on the same 
> host where the original drive is already in use? 

You can only access one copy at once.
Set filters in lvm.conf to switch between them. [Remember always to run
vgscan after changing filters.]

Then use the XXchange --uuid commands to change one set of UUIDs and
vgrename the VG.

Alasdair
-- 
agk@redhat.com
