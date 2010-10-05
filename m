Received: from dhcp209-236.gsslab.pnq.redhat.com
	(dhcp209-236.gsslab.pnq.redhat.com [10.65.209.236])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o95Bv2No019092
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 07:57:03 -0400
Message-ID: <4CAB14C9.7040707@redhat.com>
Date: Tue, 05 Oct 2010 17:36:33 +0530
From: Sunil Gupta <sugupta@redhat.com>
MIME-Version: 1.0
References: <AANLkTikNhZrMa91CCBC9MSLfyaWdO+1O=TGt_1bowwvf@mail.gmail.com>
In-Reply-To: <AANLkTikNhZrMa91CCBC9MSLfyaWdO+1O=TGt_1bowwvf@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] moving an LVM as an ISO can be moved
Reply-To: sugupta@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Use vgexport or snapshots. but if you are using the removable media then 
use any backup  device disk tape etc.

--Sunil

Tapas Mishra wrote:
> Can an LVM be copied or transferred to some remote server in a similar
> fashion as I can do with ISO.
> I copy the ISO at one one place to some other location and on the
> second location I can mount this ISO
> as a loopback device and do what ever I want.
> Is similar thing possible with an LVM.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
