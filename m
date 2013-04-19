Message-ID: <51712D11.4070400@redhat.com>
Date: Fri, 19 Apr 2013 13:40:01 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAMY7n8ig1kyWnuzMSw0KNyC=4C7DCWMEhJYJ-TRCkh_H+wJ+ow@mail.gmail.com>
In-Reply-To: <CAMY7n8ig1kyWnuzMSw0KNyC=4C7DCWMEhJYJ-TRCkh_H+wJ+ow@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] fdisk can't recognize partition tables
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
Cc: Amandeep Kapila <kapila.amandeep@gmail.com>

On 04/18/2013 01:39 PM, Amandeep Kapila wrote:
> Hello,
>
>             I have a little lvm related issue with Debian Squeeze
> installation. I install debian squeeze with lvm partitioning. The
> installation completes and every thing is working fine for last many days.
> But I notice a message when I use the fdisk tool to list my partitions. The
> message is,
>
>              Disk /dev/dm-4 doesn't contain a valid partition table
>
>             Why I am getting this and what can be the implications? Can
> fdisk read the lvm partition tables or it can't and just giving this
> message? Any workaround? Again I assert everything is working great.

/dev/dm-4 is the LVM logical volume. Partitions are one floor lower.
NOTE: you should not use /dev/dm-*! Use /dev/VG/LV instead or by UUID.

See output of `pvs` to see partition(s) behind the LVM.

Then drop last number - that's the disk containing partitions.

Or give `lsblk` a try.

-- Marian


>
>             Thanks in advance....
>
> Regards,
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
