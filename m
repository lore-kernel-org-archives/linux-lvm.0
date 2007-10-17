Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9HGlMl3029649
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 12:47:22 -0400
Received: from victor.provo.novell.com (victor.provo.novell.com
	[137.65.250.26])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9HGlGcG023835
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 12:47:16 -0400
Subject: Re: [linux-lvm] new LVM2 feature?
From: "Peter W. Morreale" <pmorreale@novell.com>
In-Reply-To: <Pine.LNX.4.44.0710171210050.30797-100000@bmsred.bmsi.com>
References: <Pine.LNX.4.44.0710171210050.30797-100000@bmsred.bmsi.com>
Date: Wed, 17 Oct 2007 10:44:16 -0600
Message-Id: <1192639456.4275.121.camel@hermosa.morrealenet>
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

On Wed, 2007-10-17 at 12:10 -0400, Stuart D. Gathman wrote:
> On Wed, 17 Oct 2007, Peter W. Morreale wrote:
> 
> > The idea is COW LV stacking below a primary LV.  The intent is to allow
> > a number of 'users' the ability to share a common dataset, and
> > independently save their changes to to a 'private' LV.    
> 
> How does this differ from rw snapshots?
> 

Perfect. I missed it the first time.

Thx,
-PWM
