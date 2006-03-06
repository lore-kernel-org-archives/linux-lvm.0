Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k26HZFf2024943
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2006 17:35:15 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FGJc2-0000im-V1
	for linux-lvm@redhat.com; Mon, 06 Mar 2006 17:35:14 +0000
Date: Mon, 6 Mar 2006 17:35:14 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] How to reset the vg uuid before doing a vgimport?
Message-ID: <20060306173514.GC25317@agk.surrey.redhat.com>
References: <abe3dd8f0602202117r13749f4bu578cc61613b5ee10@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abe3dd8f0602202117r13749f4bu578cc61613b5ee10@mail.gmail.com>
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

On Tue, Feb 21, 2006 at 10:47:45AM +0530, Gaurab Paul wrote:
> Is there a way that before we do vgimport, on the exported volume we
> can reset the vg uuid? If so what is the process?
 
No need to export, but no LVs in the VG can be active.

vgchange --uuid.

Alasdair
-- 
agk@redhat.com
