Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1BISRSj014815
	for <linux-lvm@redhat.com>; Mon, 11 Feb 2008 13:28:27 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m1BIRtiV012556
	for <linux-lvm@redhat.com>; Mon, 11 Feb 2008 13:27:56 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m1BIRolN001109
	for <linux-lvm@redhat.com>; Mon, 11 Feb 2008 13:27:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m1BIRopk017739
	for <linux-lvm@redhat.com>; Mon, 11 Feb 2008 13:27:50 -0500
Date: Mon, 11 Feb 2008 13:27:50 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Disk dying and LVM2
In-Reply-To: <4078129D-6D0E-4879-B909-2BE67695EC85@redhat.com>
Message-ID: <Pine.LNX.4.44.0802111323130.17717-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 11 Feb 2008, Jonathan Brassow wrote:

> pvmove will ignore the errors it encounters and "do the best it can"  
> to transfer all data.  If it can't read a certain sector, that will be  
> missing from the move.

Having done logic like that for my own filesystem, it is not trivial to
do efficiently.  You have to read a large buffer, but when there
is an IO error, the OS doesn't always report the bad sector correctly,
so you have to then narrow down the bad parts in that buffer.
Reading the buffer 1 sector at a time works, using binary search 
(read each half, read each half of failing half, etc) is faster but
more complex.  Without some such logic, more data is lost in the buffer
containing bad blocks that is necessary.

pvmove source is available, and I'll take a look when I get to it, but in the
meantime maybe someone knows, does pvmove incorporate such logic?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
