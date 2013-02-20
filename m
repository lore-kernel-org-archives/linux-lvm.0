Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r1KDIXR9003746
	for <linux-lvm@redhat.com>; Wed, 20 Feb 2013 08:18:33 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.10])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1KDIVmn010415
	for <linux-lvm@redhat.com>; Wed, 20 Feb 2013 08:18:31 -0500
Message-ID: <5124CD1F.1020506@pse-consulting.de>
Date: Wed, 20 Feb 2013 14:18:23 +0100
From: Andreas Pflug <pgadmin@pse-consulting.de>
MIME-Version: 1.0
References: <51238003.3050709@pse-consulting.de>
	<20130219145940.411cd271@jajo.eggsoft>
In-Reply-To: <20130219145940.411cd271@jajo.eggsoft>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] resize and snapshots with clvm
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jacek Konieczny <jajcus@jajcus.net>

Am 19.02.13 14:59, schrieb Jacek Konieczny:
> On Tue, 19 Feb 2013 14:37:07 +0100
> Andreas Pflug <pgadmin@pse-consulting.de> wrote:
>> What I'm missing is the possibility to resize a LV or taking a
>> snapshot of it while a volume is used on one node. I'd expect this to
>> work on the active node, if the volume is inactive on all other
>> nodes.
> I can confirm this works.
>
>> But when I try that, I get
>> cluster request failed: Invalid argument
>>     Failed to suspend <logvol>
> Are you sure you have the volume activated _exclusively_ on the single
> node.
> 'is used on one node' doesn't mean much when any other node is allowed
> to activate the volume at any time.

I would have expected lvm to take that exclusive lock implicitely when 
necessary?

>
> When the LV is exclusively activated (lvchange -aey) snapshots should
> work (and they do work for me).

The volume is "lvchange -aly" active on one node and in use there (e.g. 
mounted or attached to a VM). If I try to lvchange -aey on that node, I 
get "Error locking on node xxxx: Device or resource busy". Apparently 
the problem is propagating the activation to exclusive if the device is 
busy.
Actually, lock exclusive will even fail if the device is not in use, but 
only active locally.

A workaround would probably be to activate the lv exclusively _before_ 
using it, but then it would be impossible to migrate the vm to another 
host later on.

Regards
Andreas
