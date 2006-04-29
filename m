Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3TMOreD012807
	for <linux-lvm@redhat.com>; Sat, 29 Apr 2006 23:24:53 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FZxrx-0005LN-Pw
	for linux-lvm@redhat.com; Sat, 29 Apr 2006 23:24:53 +0100
Date: Sat, 29 Apr 2006 23:24:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgchange -ay Killed
Message-ID: <20060429222453.GC16180@agk.surrey.redhat.com>
References: <1146240603.23548.106.camel@localhost.localdomain>
	<01309aa0302de7b36b75ce2612b38706@redhat.com>
	<1146262242.23548.207.camel@localhost.localdomain>
	<445394B9.6040104@volved.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <445394B9.6040104@volved.com>
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

The code has not been optimised for large numbers of LVs.

Use the latest dm/lvm2 versions for a start as there's a memory
leak in your libdevmapper.

Each device device uses up a fixed amount of (unswappable) kernel 
memory, and when all your memory is used out you can't have any 
more devices.

Use standard diagnostic tools to work out which limit you're hitting.
(top; ps; slabtop; sysreq; strace etc.)

Alasdair
