MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 14 Aug 2019 14:49:11 +0200
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
In-Reply-To: <110d7a9c-c075-65bc-cedd-eca0c9904d23@redhat.com>
References: <843935217a8de82c4cf47f02953489c6@cs.uni-dortmund.de>
	<7f6f03e1-dbb1-971c-7f1f-f6c380a16b77@redhat.com>
	<0f1ce51503d454e2068d9e0f65947273@cs.uni-dortmund.de>
	<110d7a9c-c075-65bc-cedd-eca0c9904d23@redhat.com>
Message-ID: <bb6246877842a3b0049f6b61b4a050e6@cs.uni-dortmund.de>
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

> So are you actually trying to access not a 'normal' LV - but an LV
> under snapshot ?

No, /dev/vg/lv20 is a normal logical volume. But /dev/vg/lv15 has been 
under snapshot before.

Now, I created a snapshot manually (before. it was created by an 
automatic backup mechanism) and saw what happened:

1. I created the snapshot with 'lvcreate -s -L 2G /dev/vg/lv15'
2. Afterwards,  a symbolic link /dev/vg/lvol0 existed and pointed to 
/dev/dm-21. Additionally, a link /dev/mapper/vg-lv15-real existed, 
pointing to /dev/dm-19
3. I deleted the snapshot with lvremove
4. Afterwards, /dev/vg/lvol0 had disappeared. /dev/mapper/vg-lv15-real 
was still present, and it did not point to /dev/dm-19 any more, but to 
/dev/dm-18, the same as /dev/vg/lv20

Regards
   Christoph
