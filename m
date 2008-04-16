Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3GL4swG021474
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 17:04:54 -0400
Received: from pretender.frop.net (pretender.frop.net [70.85.16.90])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3GL4epl030926
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 17:04:40 -0400
Date: Wed, 16 Apr 2008 17:04:39 -0400
From: dave@frop.net
Subject: Re: [linux-lvm] LVM snapshot - "dd" file size
Message-ID: <20080416210439.GA31820@pretender.frop.net>
References: <48061439.6040001@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48061439.6040001@gmail.com>
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

this has nothing to do with LVM.  

dd knows nothing about files, it just copies the entire device (or file or whatever). 

tar will work, if you use the right command line switches. Search around on the web for pointers on how to use it.

Another intermediate way would be to compress the image you get with dd.

On Wed, Apr 16, 2008 at 04:59:05PM +0200, Thomas Bellembois wrote:
> Hi!
> 
> I am using LVM partitions on a Debian Xen system.
> I use LVM snapshots to clone and backup my virtual machines.
> 
> I have noticed that the ISO file created with the "dd" command it much
> bigger that the partition used space (actually 4.7GB for the ISO - 500MB
> used space). No problem if I mount the LVM snapshot and "tar" all of the
> data.
> 
> I have googled the question and read that "dd" also copy "not used space".
> Why is the ISO file so big ? Is the "tar" method less safe ?
> Is there a better solution ?
> 
> Thanks for your answers.
> 
> Regards,
> 
> Thomas
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
