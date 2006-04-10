Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3AGaBRr016536
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 12:36:11 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3AGa5nr017301
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 12:36:05 -0400
Subject: Re: [linux-lvm] LVM over IP network
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <200604072216.14803.krakrjak@volumehost.net>
References: <1144412972.44365b2c36361@mail.sify.com>
	<200604072216.14803.krakrjak@volumehost.net>
Date: Mon, 10 Apr 2006 12:35:51 -0400
Message-Id: <1144686951.8591.103.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Fri, 2006-04-07 at 22:16 -0500, Zac Slade wrote:
> On Friday 07 April 2006 07:59, rarulselvan@sify.com wrote:
> > I do understand that LVM and EVMS are quite useful for managing the disk
> > space in given work station. So I am wondering if there is such thing as
> > LVM over IP network ? so that I can maximize my disk usage. If not, what is
> > my other choice ?
> Why not?  Using iSCSI or ATAoE you can export the extra space from each of the 
> system as devices that will appear to be block devices.  From there you can 
> add them to a vg anytime you want.  Just be careful how you do it because if 
> one of the systems goes off the network you will not have access to the data 
> from that drive.  Also I'm not so sure how well LVM deals with having a drive 
> dissappear out from underneath it.

if one PV lose. u can active a partial VG and do read only LV on good
PVs.

ps, i do not understand why LV only allow read only access. anybody know
why?

ming
