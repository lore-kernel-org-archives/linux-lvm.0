Received: from [10.34.130.159] (dhcp130-159.brq.redhat.com [10.34.130.159])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u22D35a0001853
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2016 08:03:07 -0500
References: <CAM2wQBu2SJigDa8xdaE+40cikUAMAEHaqNJ6pj3xOrY_Nhd8ow@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56D6E489.8010302@redhat.com>
Date: Wed, 2 Mar 2016 14:03:05 +0100
MIME-Version: 1.0
In-Reply-To: <CAM2wQBu2SJigDa8xdaE+40cikUAMAEHaqNJ6pj3xOrY_Nhd8ow@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] extract sparseness information from a lvmthin
	logical volume
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

Dne 2.3.2016 v 13:02 Thanos Makatos napsal(a):
> I'm trying to see if it's possible to extract sparseness information
> from a thinly-provisioned logical volume. Is it possible to reliably
> access this information from user space? Is there such a tool already?
> If not, can you point me to relevant source code so I can start
> looking into it?
>


Sure - https://github.com/jthornber/thin-provisioning-tools

Regards


Zdenek
