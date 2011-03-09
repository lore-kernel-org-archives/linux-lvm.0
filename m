Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p293iKof026185
	for <linux-lvm@redhat.com>; Tue, 8 Mar 2011 22:44:20 -0500
Received: from account3.iohost.com (account3.iohost.com [72.44.90.34])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p293i5BU000594
	for <linux-lvm@redhat.com>; Tue, 8 Mar 2011 22:44:06 -0500
Message-ID: <4D76F77B.3030303@simplicityhosting.com>
Date: Tue, 08 Mar 2011 19:43:55 -0800
From: Randy Katz <rkatz@simplicityhosting.com>
MIME-Version: 1.0
References: <4D76ED00.1050305@simplicityhosting.com>
In-Reply-To: <4D76ED00.1050305@simplicityhosting.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] drive crash question
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
To: linux-lvm@redhat.com

nevermind, brought new os/drive up with drive1, ran lvscan and they are 
all there!
I love LVM! Wish everything else would work as well!

On 3/8/2011 6:59 PM, Randy Katz wrote:
> Hi,
>
> My main system drive crashed. The second drive (drive1) was pd0 with 
> vg1 and logical volumes
> in operation. If I replace the drive0 will a vgscan and lvdisplay 
> automatically "see" the volumes
> on the drive or is there something that must be done first?
>
> Thank you in advance,
> Randy
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
