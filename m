Received: from [172.16.59.2] (dogpound.rdu.redhat.com [172.16.59.2])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id jAOMxPgB016688
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2005 17:59:25 -0500
Message-ID: <43864398.1040402@redhat.com>
Date: Thu, 24 Nov 2005 17:50:00 -0500
From: Josef Whiter <jwhiter@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Volume group not accessible
References: <200511242342.03081.Matthias.Meyer@gmx.li>
In-Reply-To: <200511242342.03081.Matthias.Meyer@gmx.li>
Content-Transfer-Encoding: 7bit
Reply-To: linux-lvm@redhat.com
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

Matthias Meyer wrote:

>And now I'm not sure how to gain access again.
>
>Should I try to restore metadata with vgcfgrestore?
>Is it possible that I lost my data if I try vgcfgrestore?
>
>Or should I create a new Volume group and include the device /dev/hdd1 to 
>this VG? If I do this, what the way to delete volume group LVM2?
>
>Thanks in advance
>Matthias
>  
>
Hello,

I'm not sure what the best way to go about fixing this problem is, but a 
vgcfgrestore shouldn't harm your data, it basically just writes over a 
section of your disk that was already being used by the LVM data 
anyway.  Hope that helps.

Josef

-- 
Josef Whiter, RHCE
Global Support Services
Red Hat, Inc.
919-754-3700 x44429
