Received: from dhcp-1-162.brq.redhat.com (dhcp-1-162.brq.redhat.com
	[10.34.1.162])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oA5FiE4m029916
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2010 11:44:14 -0400
Message-ID: <4CD4264D.4040801@redhat.com>
Date: Fri, 05 Nov 2010 16:44:13 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <C1362206939D4CC7BD7FF33A6B29F896@cbmb2fec088ae0>
In-Reply-To: <C1362206939D4CC7BD7FF33A6B29F896@cbmb2fec088ae0>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to recover data from a second disk in LVM.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Dne 2.11.2010 23:00, Oreste napsal(a):
> Hi:
> 
>   I has a LVM with 2 disk, first: a small SCSI and a second one,
>   IDE and bigger; now the first disk, the SCSI, is not functioning ...  
> 
>   How can I recover all the data present in the second disk???


Usually depends on the layout of your LVs and filesystem used and proportion
of your lost filesystem fragments.

If shouldn't be a big problem to recover your lost PV - as your second disk
contains the whole description also of the first PV, the bigger problem is,
trying to recover filesystem -  fsck when first part of it is missing isn't
trivial - but you should be able to handle that via googling - lot's of
manuals out there.

If you don't any backup of your lost metadata - you will need to retrieve them
from the beginning of your second disk - where they are stored by default.
Read first MB (dd) - and try to find  text block with the largest 'version =
XXX' Save this recovered text block to file  mda.txt.

Get another disk as a replacement of your lost 1st drive - initialize it with
 lost PVID  (pv0 { id = "aaa..aaa" } in your recovered mda.txt file)
'pvcreate -u aaa..aaa /dev/yyy'

Good idea is to 'zero' this device  (dd if=/dev/zero of=/dev/yyy bs=1M) so you
will not confuse fsck repair more then necessary with unknown data.

Now just 'vgcfgrestore -f mda.txt' and active LVs 'vgchange -ay' - and you
should be able to see missing lost volumes.

Now hardest part - to recover filesystem -  obviously  LVs located only on
your lost pv0 are simply lost.   Those spread also over pv1 could be partially
recovered - of course with major damage on files physically located on pv0.

Zdenek
