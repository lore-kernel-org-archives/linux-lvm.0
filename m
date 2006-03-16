Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k2GFYfVJ006876
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 15:34:41 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FJuUr-0005ql-4k
	for linux-lvm@redhat.com; Thu, 16 Mar 2006 15:34:41 +0000
Date: Thu, 16 Mar 2006 15:34:41 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] How to use hardware snapshots [was (no subject)]
Message-ID: <20060316153441.GU25317@agk.surrey.redhat.com>
References: <H000007200bf1fff.1142521692.fsu50.nll.se@MHS>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <H000007200bf1fff.1142521692.fsu50.nll.se@MHS>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Mar 16, 2006 at 04:08:12PM +0100, fredrik.backman@nll.se wrote:
> Im doing a snapshot (hardware-based in EVA5000) of a LV (lvm2) and i 
> wonder what is the correct way to use this snapshot? Problem is that 
> this snapshot has the same ID as the original one. In HP-UX a would do a 
> vgchgid on this snapshot-LV. Any help would be aprreciated.

Firstly your snapshot will be at the PV level not the LV level.
You must take a hardware snapshot of a complete VG i.e. every PV
within that VG.   [If that's too much data, use pvmove and vgsplit first.]

Current lvm tools can't handle two cloned VGs on the same machine,
so you have to hide the old one before you can manipulate the new one.

Make a temporary copy of /etc/lvm/ somewhere.
Edit lvm.conf there so it filters out everything except your cloned PVs.
Set the environment variable LVM_SYSTEM_DIR to point to your temporary
copy of /etc/lvm.  

Run pvchange --uuid on each of the new PVs.
Run vgchange --uuid on the VG.  Run vgrename to give it a unique name.
Then remove the LVM_SYSTEM_DIR environment variable and run vgscan
and you should be able to use both old and new VGs.

[I'm hoping to enhance the tools to simplify this process late next month.]

Alasdair
-- 
agk@redhat.com
