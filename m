Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2OD8tIX024365
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 09:08:55 -0400
Received: from e2.ny.us.ibm.com (e2.ny.us.ibm.com [32.97.182.142])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2OD8Zo2013274
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 09:08:35 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n2OD5gu1007924
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 09:05:42 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n2OD8Z2i157666
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 09:08:35 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n2OD8ZNF002285
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 09:08:35 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n2OD8YvV002278
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 09:08:35 -0400
Date: Tue, 24 Mar 2009 06:08:34 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] lvm mirror read performance, no load balance with PV ?
Message-ID: <20090324130834.GA12309@us.ibm.com>
References: <af3e5b60903240440q671356f5xd4e8e8c92ace8a56@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af3e5b60903240440q671356f5xd4e8e8c92ace8a56@mail.gmail.com>
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

Sascha Thomas Spreitzer [sascha@spreitzer.name] wrote:
> Hello mailing list,
> 
> I currently sensed that LVM2 is not load balancing reads of mirrored
> LV's form their corresponding PV.

Yes, it just reads from the default_mirror (i.e. primary mirror leg).
There is a read-balancing patch. It is not upstream yet and most likely
not there in your kernel either.

Thanks, Malahal.
