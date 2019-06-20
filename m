References: <5D09FFC9020000F90006D3D6@prv1-mh.provo.novell.com>
	<5D0B1C6C020000F90006D7B9@prv1-mh.provo.novell.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c1af6879-5101-4e8e-bcff-0dc140505c5f@redhat.com>
Date: Thu, 20 Jun 2019 13:01:50 +0200
MIME-Version: 1.0
In-Reply-To: <5D0B1C6C020000F90006D7B9@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm snapshot cannot be removed with the error
 "Failed to refresh without snapshot"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <ghe@suse.com>

Dne 20. 06. 19 v 7:41 Gang He napsal(a):
> Hello Guys,
> 
> Any ideas? or what information do I need to provide to help this problem?
> 


Hi

It does look like  dmtable had different type of device in place and lvm2
was not able to remove device type.

So was this state a result of some 'regular' workflow you can reproduce?

Or is this some state after some 'vgcfgrestore' usage while some live
LVs were present in table?

Or maybe some incorrectly working error path in code after some failure?

You would probably need to tar /etc/lvm/archive - eventually
open upstream lvm2 community bugzilla:

https://bugzilla.redhat.com/enter_bug.cgi?product=LVM%20and%20device-mapper

and provide steps for reproduction and 'lvmdump -a -m'

Final note - if this bug is happening with some old version of lvm2 - check
first if the newer version isn't already fixed.

Regards

Zdenek
