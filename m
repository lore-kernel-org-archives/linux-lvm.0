Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1DNYOi26799
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 18:34:24 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i1DNYN226868
	for linux-lvm@redhat.com; Fri, 13 Feb 2004 17:34:23 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm pvscan or vgscan very slow
Message-ID: <20040213173423.C14206@homer.msp.redhat.com>
References: <402C0D65.80905@caltech.edu> <20040212180824.O10533@homer.msp.redhat.com> <402D5D93.7040802@caltech.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <402D5D93.7040802@caltech.edu>; from ling@caltech.edu on Fri, Feb 13, 2004 at 03:28:19PM -0800
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 18:33:16 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Feb 13, 2004 at 03:28:19PM -0800, Ling Li wrote:
> I guess the number of devices to be scanned is just too large (and my 
> computer is also a very slow one). Is there some way to specify a 
> narrower range of devices to be scanned in LVM2?
 
The filter lines in lvm.conf.  See doc/example.conf and man lvm.conf.

> > We've a couple of speed-ups that might help (one uses sysfs to reduce
> > the number of devices to scan) - they're in the queue of things waiting
> > to be checked into CVS after the repository move.
> > I'll try to get them imported tomorrow.
> This kind of patch will definitely help!
 
Both changes are in CVS now.

Info on how to get code out of CVS:
  http://www.sistina.com/products_CVS.htm
BUT replace the 'cvs -d :pserver:' lines with those shown on:
  http://sources.redhat.com/lvm2/

Alasdair
-- 
agk@redhat.com
