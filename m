Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LIHmp09996
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 14:17:48 -0400
Received: from behemoth.sci.local (e2hst160.csg.stercomm.com [204.214.2.160])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3LIHmMc031999
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 14:17:48 -0400
Received: from stercomm.com (localhost [127.0.0.1])
	by behemoth.sci.local (Postfix) with ESMTP id 848B58C9
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 13:17:42 -0500 (CDT)
Message-ID: <4086BAC6.2080604@stercomm.com>
Date: Wed, 21 Apr 2004 13:17:42 -0500
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid
References: <200404211741.i3LHfNcJ001319@smtp.doruk.net.tr>
In-Reply-To: <200404211741.i3LHfNcJ001319@smtp.doruk.net.tr>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Vahric MUHTARYAN wrote:
> Hi Everybody ?! 
> 
> 	Maybe everybody know Raid5 can extend easily. I'm using hardware
> raid and I wonder What extend utulity I have to use for system . resize or
> LVM .. 
> Because with hardware raid system looks all disks like a one logical disk at
> this moment How can I intorduce extended array to system ... 

Uh... you don't generally extend RAID 5.  But if your hardware
raid solution has unutilized disks (or disks you can add), you can
create a new logical hw raid disk and easily add that disk into existing
volume groups.

If you have left over space on your existing logical disk, that
too can be added quite easily.  You need to provide more info.
