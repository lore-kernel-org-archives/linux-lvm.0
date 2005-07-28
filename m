Received: from [10.15.80.209] (dhcp80-209.msp.redhat.com [10.15.80.209])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j6SExDaA030732
	for <linux-lvm@redhat.com>; Thu, 28 Jul 2005 10:59:14 -0400
Mime-Version: 1.0 (Apple Message framework v622)
In-Reply-To: <20050727172443.GC4954@null.msp.redhat.com>
References: <008001c59203$1553fc70$7e01a8c0@asuspc>
	<ef523605066ee0d0a6b20345a70677dd@redhat.com>
	<20050727172443.GC4954@null.msp.redhat.com>
Message-Id: <d80ca5b9b93015efc1c96978ccd99874@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] How to recover data corrupted by vgcreate
Date: Thu, 28 Jul 2005 10:00:02 -0500
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Jul 27, 2005, at 12:24 PM, AJ Lewis wrote:

> On Wed, Jul 27, 2005 at 11:33:05AM -0500, Jonathan E Brassow wrote:
>> I'm not familiar exactly with how the metadata gets laid on disk, but
>> I would think you could just 'vgcreate vg_name /dev/hdd2' (you did 
>> this
>> already) then 'lvcreate -n <lvname> -l <max size> vg_name'...  This of
>> course assumes that the previous lv resided wholly on /dev/hdd2.  Then
>> try mounting the new lv and see what happens.
>
> Before you do that, try vgcfgrestore.
>

AJ, when he did the initial 'vgcreate' was part of the process to 
create a backup copy of the metadata?  If so, vgcfgrestore could work.  
But otherwise, I'm not sure were the old metadata would be stored, 
since this disk is from a different machine...  Seems odd to me that 
vgcreate would blow over the old vg if it knew about it.  If it did not 
know (or detect the old vg), how would it know to backup the metadata?

  brassow
