Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i46CG7v03197
	for <linux-lvm@redhat.com>; Thu, 6 May 2004 08:16:07 -0400
Received: from seasonfive.com ([212.43.248.242])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i46CG58c004860
	for <linux-lvm@redhat.com>; Thu, 6 May 2004 08:16:06 -0400
Subject: Re: [linux-lvm] LVM limits on 64 bits
From: Yannick Lecaillez <yl@seasonfive.com>
In-Reply-To: <20040506110138.GA1719@redhat.com>
References: <1083834092.1999.15.camel@yannick.vivaxe.lan>
	<20040506110138.GA1719@redhat.com>
Message-Id: <1083845308.1999.31.camel@yannick.vivaxe.lan>
Mime-Version: 1.0
Date: 06 May 2004 14:08:28 +0200
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
Content-Type: text/plain; charset="us-ascii"
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>


> > 
> > 	Numbers i found on the net found are old (2001/2002) and i
> > need to deploy solution with several tera byte.
> 
> If you need more than 2TB/LV, the LVM1 compatible device-mapper/LVM2
> in Linux 2.6 is your friend, because 2.6 supports large block devices
> beyond 2TB.

For this project i think i will use Redhat AS 3. I see this version
backport some feature of the 2.6 kernel. Do you know is this include the
large block devices support ?

In fact, the main question is : Is RHEL3 + LVM + GFS + Oracle is usable
in production with a database which could grow up to more than 100 Tb of
data ?
