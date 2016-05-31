Received: from dhcp131-147.brq.redhat.com (dhcp131-215.brq.redhat.com
	[10.34.131.215])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4V7v1aI028910
	for <linux-lvm@redhat.com>; Tue, 31 May 2016 03:57:01 -0400
Resent-To: linux-lvm@redhat.com
Resent-Message-ID: <b37aa462-1749-4276-4884-0e30b820bc73@redhat.com>
References: <574CB690.5030401@partidopirata.com.ar>
From: Ondrej Kozina <okozina@redhat.com>
Message-ID: <dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
Date: Tue, 31 May 2016 09:53:17 +0200
MIME-Version: 1.0
In-Reply-To: <574CB690.5030401@partidopirata.com.ar>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [dm-crypt] LVM on LUKS: volumes missing
Reply-To: linux-lvm@redhat.com
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
To: fauno <fauno@partidopirata.com.ar>
Cc: dm-crypt@saout.de

Hi fauno,

provided the driver was unlocked successfully it seems unrelated to 
cryptsetup/LUKS to me. Could we move the discussion to lvm mail list?

On 05/30/2016 11:54 PM, fauno wrote:
> Hi, maybe I'm too shocked but I couldn't find anything on this issue :)
>
> I have a fully encrypted HD using the LVM on LUKS method from
> ArchWiki[^0], with the LUKS header and key file on an external device.
>
> Today I started having some disk failures (root remounted ro, xfs
> partition giving errors), and after I decided to reboot to run fsck, I
> can't find anything.

Could you paste here output of pvscan -vvvv --cache 
/dev/mapper/insert_the_unlocked_device_name? Together with your 
/etc/lvm/lvm.conf file? If it's a device with rootfs we're talking about 
you will most probably have to extract /etc/lvm/lvm.conf file from 
initramfs image.

Well, generally, if disk sectors accommodating PV header are damaged, 
lvm2 won't recognise the device...

>
> When the encrypted partition is opened, I don't see any errors, not even
> on dmesg, but LVM can't find any volume.  They're just missing.
>
> Is there anything I can do? Thanks!
>
> FWIW I had the same issue with another HD a few months back, though it
> didn't had physical errors.  It didn't had anything important so I
> wasn't worried.

Ok, try same approach as above for this drive.

Regards
Ondrej
