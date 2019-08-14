MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 14 Aug 2019 15:06:22 +0200
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
In-Reply-To: <110d7a9c-c075-65bc-cedd-eca0c9904d23@redhat.com>
References: <843935217a8de82c4cf47f02953489c6@cs.uni-dortmund.de>
	<7f6f03e1-dbb1-971c-7f1f-f6c380a16b77@redhat.com>
	<0f1ce51503d454e2068d9e0f65947273@cs.uni-dortmund.de>
	<110d7a9c-c075-65bc-cedd-eca0c9904d23@redhat.com>
Message-ID: <e0f1848ebaceb2a142753d05f29571ad@cs.uni-dortmund.de>
Subject: Re: [linux-lvm] dmsetup says "Device does not exist",
	though it exists
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

> and you can enable verification of udev rule
> processing with lvm.conf option:
> 
>         verify_udev_operations = 1

after setting this, I got the following message from lvremove:

Node /dev/mapper/vg-lv15-real was not removed by udev. Falling back to 
direct node removal.

Regards
   Christoph
