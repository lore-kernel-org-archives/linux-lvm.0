Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBC0twsf003540
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 19:55:58 -0500
Received: from e1.ny.us.ibm.com (e1.ny.us.ibm.com [32.97.182.141])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBC0tgeQ029204
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 19:55:42 -0500
Received: from d01relay05.pok.ibm.com (d01relay05.pok.ibm.com [9.56.227.237])
	by e1.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id nBC0rC2C027242
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 19:53:12 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	nBC0tfxm138802
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 19:55:41 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	nBC0tfM8016180
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 19:55:41 -0500
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av01.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	nBC0tfDW016166
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 19:55:41 -0500
Date: Fri, 11 Dec 2009 16:55:40 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Re: Re: Re: Problems with dissapearing PV when
	mounting (Stuart D. Gathman)
Message-ID: <20091212005540.GA2562@us.ibm.com>
References: <691e2b620912111510u5655f5cfn329895332ba681f4@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <691e2b620912111510u5655f5cfn329895332ba681f4@mail.gmail.com>
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

Johan Gardell [gardin@gmail.com] wrote:
> Ok, but why is that? I haven't changed anything on the LV. The output of
> lvdisplay -m shows that i have physical volumes extents right? (but
> /dev/gardin does not exist at all)

"lvdisplay -m" shows what is in LVM metadata. The LVs just fail to
activate in your case (root and swap_1). Since the LVM commands
(lvdisplay) are able to read the metadata without any errors, I would
assume that *some other software* on your machine openede the needed PVs
before LVM did, so LVM is unable to activate the LVs (aka unable to load
the mapping tables).

Thanks, Malahal.
