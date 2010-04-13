Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3DEWIDQ001675
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 10:32:18 -0400
Received: from EXHUB016-4.exch016.msoutlookonline.net
	(exhub016-4.exch016.msoutlookonline.net [207.5.72.225])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3DEW5HJ024674
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 10:32:05 -0400
Message-ID: <4BC48062.6020009@cfl.rr.com>
Date: Tue, 13 Apr 2010 10:32:02 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <OF6877E65C.1B864A37-ON48257704.0036E072-48257704.003741D9@db.com>
In-Reply-To: <OF6877E65C.1B864A37-ON48257704.0036E072-48257704.003741D9@db.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How do I properly backup and restore / on LVM2
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alan Pek <alan.pek@db.com>

On 4/13/2010 6:03 AM, Alan Pek wrote:
> 
> Hi Folks,
> 
> Read through the doc and tried to create a snapshot lv for rootlv by
> doing, but failed.
> 
> singmrecfp1001:~ # lvcreate -L 2.5g -s -n rsnap rootvg
>   Path required for Logical Volume "rootvg"
>   The origin name should include the volume group.
>   lvcreate: Create a logical volume

You need to specify the name of the logical volume you are trying to
snapshot but you only gave the volume group name.  Try rootvg/rootlv,
assuming your root lv is named "rootlv".
