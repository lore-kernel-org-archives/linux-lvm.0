Return-Path: <soohoon.lee@api-networks.com>
Message-ID: <051DFF3BBA73D3119A5800A0C95BD021C03C2A@barracuda.alpha-processor.com>
From: Soohoon Lee <soohoon.lee@api-networks.com>
Date: Tue, 14 Aug 2001 23:55:13 -0400
MIME-Version: 1.0
Subject: [linux-lvm] lvreduce & lvextend problem fix
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi,
I'm trying to use LVM because of its snapshot and extend/reduce feature.
But I found that they have some problem so I started debugging and found
something.
Please verify that and do further debugging.

lvreduce calls pv_release_pe() to mark unnecessary PEs.
while doing that it does following calculation.

pv_release_pe()
{
...............
	pe_index = ( vg->lv[i]->lv_current_pe[p].pe -
		LVM_VGDA_SIZE ( vg->pv[pv_num]) / SECTOR_SIZE) /
		vg->pe_size;
...............
}

I don't know why you don't just use p instead of long calculation but 
problem is vg->lv[i]->lv_current_pe[p].pe is not 8192 bytes aligned and
first pe value is bigger than 8192.
In my case it was 8352. And it frees worng PE.

If I subtract 1 from pe_index or just use p then it works fine.
So questions
Why lv_current_pe[x].pe is not 8192 aligned, Is it intended? does it mean
PEs are not aligned in physical disk?
Why does the long calculation is needed only to get the same value with p? 
     when is the case that pe_index is different from p? scattered PEs in
one VG?

Thanks,
Soohoon.
