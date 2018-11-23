References: <c04c4a5930e3a676d3a1f2a667385b16@cs.uni-dortmund.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <7c30599f-d484-7cb5-bcd9-5acbdb29ac26@redhat.com>
Date: Fri, 23 Nov 2018 11:29:46 +0100
MIME-Version: 1.0
In-Reply-To: <c04c4a5930e3a676d3a1f2a667385b16@cs.uni-dortmund.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm_vg_create_lv_linear() returns error though
	device was created
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>

Dne 22. 11. 18 v 19:05 Christoph Pleger napsal(a):
> Hello,
> 
> I am now trying to not call external LVM commands, but to use LVM library 
> calls instead. Now I have another problem:
> 

lvm library is DEAD, it's gone, it does not exists in upstream tree any more.
It's been marked as deprecated for many years.

Please forget it has ever existed.

Regards

Zdenek
