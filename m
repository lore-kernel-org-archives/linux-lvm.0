Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l08BP6Gk011732
	for <linux-lvm@redhat.com>; Mon, 8 Jan 2007 06:25:06 -0500
Received: from mrz.swissptt.ch (outmail30.swisscom.com [138.190.3.150])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l08BP4VD024984
	for <linux-lvm@redhat.com>; Mon, 8 Jan 2007 06:25:05 -0500
Date: Mon, 8 Jan 2007 12:24:21 +0100
From: Chris Osicki <osk@admin.swisscom-mobile.ch>
Subject: Re: [linux-lvm] Persistent minor number problem in lvm2
Message-ID: <20070108122421.334a1933@slopi>
In-Reply-To: <200701050801.49807.krienke@uni-koblenz.de>
References: <200701041524.50995.krienke@uni-koblenz.de>
	<20070104203734.GB12275@IUPUI.Edu>
	<200701050801.49807.krienke@uni-koblenz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 5 Jan 2007 08:01:46 +0100

Hi Paul

Don't let OS generate filesystem handles from major/minor numbers.
Have a look at fsid option for exportfs (man 5 exports). It works. 
It's how I implemented it on my failover NFS clusters.
BTW, persistent minors works as well, I found fsid easier to manage, though.

Hope it helps.

Regards
Chris

Rainer Krienke <krienke@uni-koblenz.de> wrote:

> Am Donnerstag, 4. Januar 2007 21:37 schrieb Mark H. Wood:
> > Mount by LABEL= or UUID=?
> >
> > Device node numbers are good for physical things like serial lines,
> > but not so good for logical things like storage volumes.  If you can
> > label it, do, and always identify it by your label.
> 
> I doubt that this would solve the problem since in the scenario I had, the 
> client already had mounted a directory from a server. Then on the server the 
> minor ids of exported NFS volumes changed and then the client did see 
> the "wrong" contents in the "right" NFS share mounted from the server. The 
> problem is that NFS relies on major, minor numbers in its protocol, I think. 
> So UUIDs could only help  in an initial mount but not later.
> 
> Have a nice day
> Rainer
> -- 
> ---------------------------------------------------------------------------
> Rainer Krienke, Universitaet Koblenz, Rechenzentrum, Raum A022
> Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
> Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
> Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
> ---------------------------------------------------------------------------
