Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n25Fw785004641
	for <linux-lvm@redhat.com>; Thu, 5 Mar 2009 10:58:08 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n25Fw5A0010328
	for <linux-lvm@redhat.com>; Thu, 5 Mar 2009 10:58:05 -0500
Message-ID: <49AFF6C6.1040508@redhat.com>
Date: Thu, 05 Mar 2009 15:59:02 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM partition type
References: <ffa0f8300903050753q6dc7c47bx6302d31d174a3dec@mail.gmail.com>
In-Reply-To: <ffa0f8300903050753q6dc7c47bx6302d31d174a3dec@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Tejas Sumant wrote:
> Hi there,
> 
> I created a physical volume using pvcreate command on /dev/sda. When I
> checked the partition entries in MBR for /dev/sda using fdisk observed
> that no partitions were displayed.

The pvcreate command only creates LVM2 labels, it does not update the 
MBR or other disk label at all.

> Why pvcreate doesnt make partition entry with type 8e in MBR? Which

That's your job ;)

If you chose to use partitions for PVs then you need to create those 
partitions and set their type codes appropriately (although LVM2 
doesn't actually check/use those type codes anywhere - it's really 
more of a "documentation" step these days).

> partition entry gets used in case whole disk is made PV?

None of them. If you use the whole disk as a PV it should not have any 
MBR at all.

Regards,
Bryn.
