Received: from o.ww.redhat.com (ovpn-116-119.ams2.redhat.com [10.36.116.119])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id t9UCxleR008654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2015 08:59:49 -0400
References: <CAE8gLh=cgQLwZeXZGSVw06dt2U0F0XyzmYfY8EaFcksjv2uUsA@mail.gmail.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <563369C3.9020506@redhat.com>
Date: Fri, 30 Oct 2015 13:59:47 +0100
MIME-Version: 1.0
In-Reply-To: <CAE8gLh=cgQLwZeXZGSVw06dt2U0F0XyzmYfY8EaFcksjv2uUsA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] md: personality for level 1 is not loaded
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


Hi,

this is likely caused by a missing raid1 module in the initramfs,
as now commented on the referenced bz as well.

Your Ubuntu kernel package needs fixing itr.

- lvmguy

On 10/25/2015 01:05 AM, MegaBrutal wrote:
> Hi all,
>
> I have an inconvenient boot-time phenomenon which prevents me from
> booting a RAID1 mirrored root volume.
>
> Reported it on Launchpad:
> https://bugs.launchpad.net/ubuntu/+source/initramfs-tools/+bug/1509717
>
> It's most probably distro-specific, but I wonder if you have some comments.
>
> Thanks if you check it out!
>
>
> Best regards,
> MegaBrutal
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
