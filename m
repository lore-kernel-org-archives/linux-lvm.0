Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n2CEx3L7026259
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 10:59:04 -0400
Subject: Re: [linux-lvm] pvcreate and partition alignment
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <f4f537b50903120752s73e40288wbdfaaae814acbdd9@mail.gmail.com>
References: <f4f537b50903120752s73e40288wbdfaaae814acbdd9@mail.gmail.com>
Date: Thu, 12 Mar 2009 15:00:13 +0000
Message-Id: <1236870013.18005.96.camel@breeves.fab.redhat.com>
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

On Thu, 2009-03-12 at 09:52 -0500, Eugene Vilensky wrote:
> Greetings,
> 
> NetApp requires for best performance that all partitions be aligned to
> 4k boundaries to prevent "partial writes" and lost IOPS.  We are using
> LVM on un-partitioned devices.  The only response I can get out of
> NetApp is that, by not having a partition, the partition itself is not
> mis-aligned.  

You need to make sure that the extents on the PV have the correct
alignment.

> We are using a blocksize of 4096b for ext3.  
> 
> Is there another "allocation" setting that we need to select for LVM
> specifically, to ensure alignment to this 4k NetApp boundary?

See this thread on lvm-devel last month:

https://www.redhat.com/archives/lvm-devel/2009-January/msg00148.html

Regards,
Bryn.
