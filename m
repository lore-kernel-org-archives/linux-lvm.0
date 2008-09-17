Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8H1MoMV006587
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 21:22:50 -0400
Received: from e1.ny.us.ibm.com (e1.ny.us.ibm.com [32.97.182.141])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8H1MVdB008622
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 21:22:31 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m8H1MSAP024683
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 21:22:28 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m8H1MRUF241836
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 21:22:27 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m8H1MRar025703
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 21:22:27 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m8H1MR7o025251
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 21:22:27 -0400
Date: Tue, 16 Sep 2008 18:22:04 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Mirrored LV
Message-ID: <20080917012204.GA15318@us.ibm.com>
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com>
	<1221599565.6037.82.camel@localhost>
	<1c748a490809161601q6e1040a3i90861648c1d7fc92@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c748a490809161601q6e1040a3i90861648c1d7fc92@mail.gmail.com>
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

Larry Dickson [ldickson@cuttedge.com] wrote:
>    How often does the log get written in normal use, and how big does it get,
>    how fast? If it's a low-bandwidth sort of thing, could it go to some kind
>    of solid-state storage?

There is a fixed size header and then a bit for each region. So it
really depends on your LV size and the region size. Typically a low
bandwidth sort of thing.

--Malahal.
