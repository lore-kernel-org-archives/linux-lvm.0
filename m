Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBCHOTH6023639
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 17:24:29 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CdXSP-0002Dt-Nz
	for linux-lvm@redhat.com; Sun, 12 Dec 2004 17:24:29 +0000
Date: Sun, 12 Dec 2004 17:24:29 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] shrink pv without pvresize (FC3 LVM)
Message-ID: <20041212172429.GM11338@agk.surrey.redhat.com>
References: <41BA294D.5090605@pitt.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41BA294D.5090605@pitt.edu>
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

On Fri, Dec 10, 2004 at 05:55:09PM -0500, Ilya Goldin wrote:
> # pvresize
 
> Is there a workaround (short of writing pvresize)?
 
Yes - vgcfgbackup, edit backup file, vgcfgrestore.

The field you need to edit to change the size is pe_count
according to:

  pe_start + pe_count * extent_size <= dev_size

i.e.
  pe_count <= (dev_size - pe_start) / extent_size

You can find out the current device size with:
  pvs -o +dev_size --units s

[The units used in the file are sectors of 512 bytes]

Only change pe_count for the PV you're resizing and nothing else!

Alasdair
-- 
agk@redhat.com
