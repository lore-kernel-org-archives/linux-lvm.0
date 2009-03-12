Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n2CFR8e8002287
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 11:27:08 -0400
Subject: Re: [linux-lvm] pvcreate and partition alignment
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <f4f537b50903120817v145966e7o55f24bf8f0b85513@mail.gmail.com>
References: <f4f537b50903120752s73e40288wbdfaaae814acbdd9@mail.gmail.com>
	<1236870013.18005.96.camel@breeves.fab.redhat.com>
	<f4f537b50903120817v145966e7o55f24bf8f0b85513@mail.gmail.com>
Date: Thu, 12 Mar 2009 15:28:17 +0000
Message-Id: <1236871698.18005.98.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2009-03-12 at 10:17 -0500, Eugene Vilensky wrote:
>         You need to make sure that the extents on the PV have the
>         correct
>         alignment.
>         
> 
> Thank you both.  So the default is 64k which is a multiple of 4k which
> means we are OK since we are not using partitions?

Yes - as you're not using partitions you should be fine.

Regards,
Bryn.
