Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5N4xfuL022827
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 00:59:41 -0400
Received: from einhorn.in-berlin.de (root@einhorn.in-berlin.de [192.109.42.8])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5N4xdGp028040
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 00:59:39 -0400
Received: from jarada.farpoint.de (p54BF6DF1.dip.t-dialin.net [84.191.109.241])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	k5N4xaOC014035
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 06:59:37 +0200
From: Stefan Lucke <stefan@lucke.in-berlin.de>
Subject: Re: [linux-lvm] lvm1.0.8: vgcfgrestore does not seem to work
Date: Fri, 23 Jun 2006 06:59:35 +0200
References: <200606222200.26702.stefan@lucke.in-berlin.de>
In-Reply-To: <200606222200.26702.stefan@lucke.in-berlin.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606230659.35849.stefan@lucke.in-berlin.de>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Donnerstag 22 Juni 2006 22:00, Stefan Lucke wrote:
> Hi, I know I'm running an old system, but yesterday I got some troubles.
> It started with a simple read I/O error on an lvm disk. There are 2 x 300GB
> disks in that VG. Next step was that first 8 sectors were zeroed on the first
> disk in that VG. pvscan showed only the 2nd of this VG and disks of other
> VGs. Doing a: 
> ./vgcfgrestore -ll -n vg01 -v -f /etc/lvmconf/vg01.conf  /dev/sde

Ah, grr. option -l is somthing like a test option in addition to -t. 
Dropped those -l or -ll and vgcfgrestore did what it was expected to do.
My volume group is back online :-)))  .


-- 
Stefan Lucke
