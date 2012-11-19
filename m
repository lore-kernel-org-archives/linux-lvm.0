Received: from dhcp-1-104.brq.redhat.com (dhcp-1-104.brq.redhat.com
	[10.34.1.104])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qAJElGbs010928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2012 09:47:19 -0500
Date: Mon, 19 Nov 2012 15:47:15 +0100 (CET)
From: =?ISO-8859-15?Q?Luk=E1=A8_Czerner?= <lczerner@redhat.com>
In-Reply-To: <F3A71DB3-D06B-4F92-959B-504D3A2BB25C@active.ee>
Message-ID: <alpine.LFD.2.00.1211191545280.23349@dhcp-1-104.brq.redhat.com>
References: <73698D91-B8D4-4F52-ABF3-54542ACB0690@active.ee>
	<5093A260.8000906@redhat.com>
	<71E4DE75-6510-4E4E-B31F-CAEF0CF36771@active.ee>
	<5093AC7B.6060902@redhat.com>
	<F3A71DB3-D06B-4F92-959B-504D3A2BB25C@active.ee>
MIME-Version: 1.0
Subject: Re: [linux-lvm] strange usage stats for thin LV
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 8 Nov 2012, Andres Toomsalu wrote:

> Date: Thu, 8 Nov 2012 00:03:15 +0200
> From: Andres Toomsalu <andres@active.ee>
> Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Subject: Re: [linux-lvm] strange usage stats for thin LV
> 
> Apparently that does not work - FITRIM ioctl not backported to RHEL6 kernel perhaps?
> 
> fstrim -v /backup
> fstrim: /backup: FITRIM ioctl failed: Operation not supported
> 
> df -h
> /dev/mapper/VolGroupL0-thin_backup 591G  104G  458G  19% /backup
> 
> mount (added discard option today)
> /dev/mapper/VolGroupL0-thin_backup on /backup type ext4 (rw,discard)
> 
> Cheers,

Hi,

can you please check if the device *really* support discard ? What
is the output of

grep . /sys/block/<device>/queue/discard_*


<device> is whatever /dev/mapper/VolGroupL0-thin_backup is pointing
to.

Thanks!
-Lukas
