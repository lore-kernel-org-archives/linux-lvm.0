Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k12IS0ED013131
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 18:28:00 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1F4jBY-0007Dv-OT
	for linux-lvm@redhat.com; Thu, 02 Feb 2006 18:28:00 +0000
Date: Thu, 2 Feb 2006 18:28:00 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgchange -an question with disconnected disks
Message-ID: <20060202182800.GS4280@agk.surrey.redhat.com>
References: <43E24A37.6010801@cup.hp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43E24A37.6010801@cup.hp.com>
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

On Thu, Feb 02, 2006 at 10:06:47AM -0800, John DeFranco wrote:
> My question is that is there a 
> way to force the deactivation to occur in this case?
 
Not from lvm2 unless you restore the metadata from a backup
first.

To remove the logical volumes from the kernel, use 'dmsetup'.
List what's there: dmsetup info -c
*After* ensuring the open count is 0, remove individually
with 'dmsetup remove' or all at once with 'dmsetup remove_all'.

Alasdair
-- 
agk@redhat.com
