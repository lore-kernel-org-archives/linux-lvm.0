Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j43FLwO20004
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 11:21:58 -0400
Received: from basie.internet2.edu (basie.internet2.edu [207.75.164.22])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j43FLqOH030826
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 11:21:52 -0400
Date: Tue, 3 May 2005 11:21:49 -0400
From: Dan Pritts <danno@internet2.edu>
Subject: Re: [linux-lvm] large logical volumes
Message-ID: <20050503152149.GB25616@internet2.edu>
References: <424B4459.5050207@utoronto.ca>
	<3b24531c0504291300587dd539@mail.gmail.com>
	<42729A76.6050204@atmosp.physics.utoronto.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42729A76.6050204@atmosp.physics.utoronto.ca>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Apr 29, 2005 at 04:35:02PM -0400, Guido Vettoretti wrote:
> 32-bit machines:
> ext3 : 2Tb (I managed to create a 4TB fs for some reason)

I'm not sure this is true - i think that this limit was there but was
removed in newer versions of ext2/3

> ext3: 2Tb (? not sure about this one)

I have created larger filesystems on 64-bit.

> One of the hardware support people said there was a 2Tb limit on the 
> SCSI protocol (not sure about this), 

More or less true, but some newer hardware and device drivers 
have fixed this.  The keyword you need to look for is "64-bit LBA".

I've had success with an Atto celerity fibre channel adapter and
an infortrend-based RAID on x86_64.  However, each one needed a
firmware/driver update from what was shipped to me in December of
last year to work.

tnx
danno
