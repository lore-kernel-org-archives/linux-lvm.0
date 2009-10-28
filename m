Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9S1TwZH023998
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 21:29:58 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9S1TjZZ029907
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 21:29:45 -0400
Received: from d03relay05.boulder.ibm.com (d03relay05.boulder.ibm.com
	[9.17.195.107])
	by e38.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9S1PJ05025307
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 19:25:19 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay05.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n9S1TWFo106212
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 19:29:35 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id n9S1S4HJ009718
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 19:28:04 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av02.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	n9S1S4PF009696
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 19:28:04 -0600
Date: Tue, 27 Oct 2009 18:29:31 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Removing a very old physical drive - revisited
Message-ID: <20091028012931.GA27808@us.ibm.com>
References: <1256664432.6383.15.camel@elm.bottlehall.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1256664432.6383.15.camel@elm.bottlehall.co.uk>
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
To: linux-lvm@redhat.com

Nicholas Robinson [npr@bottlehall.co.uk] wrote:
> 
> Nick
> 
> # pvmove -vv /dev/sdb2 /dev/sda2

You can just specify 'pvmove -vv /dev/sdb2' to allow it to allocate on
your new disk as well or you can do
'pvmove -vv /dev/sdb2 /dev/sda2 /dev/<yourNewPVname>' to allow it to
allocate on the new PV as well.  What distro and what version of LVM and
device package are you using.  Someone may help if you post it to
dm-devel mailing list.

Thanks, Malahal.
