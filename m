Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2E3GLX4017688
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 23:16:21 -0400
Received: from nazgul.esiway.net (Nazgul.ESIWAY.NET [193.194.16.154])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2E3G6SA027894
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 23:16:07 -0400
Received: from Megathlon.ESI (Ghost.esi.it [193.194.16.225])
	by nazgul.esiway.net (8.13.8/8.13.8) with ESMTPS id n2E3G5do014686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 04:16:05 +0100
Received: from frodo.esi (Frodo.ESI [10.10.10.13])
	by Megathlon.ESI (8.14.1/8.14.1) with ESMTP id n2E3G4im028049
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 04:16:05 +0100
Message-ID: <49BB2174.7070301@esiway.net>
Date: Sat, 14 Mar 2009 04:16:04 +0100
From: Marco Colombo <linux-lvm@esiway.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net>	<Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
	<20090313203812.GK7445@agk.fab.redhat.com>
In-Reply-To: <20090313203812.GK7445@agk.fab.redhat.com>
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

Alasdair G Kergon wrote:
 > Several kernels releases ago, the implementation of the 'flush device'
> operation in the block layer was changed from a simple function call
> that dm supported to a mechanism involving barriers that is trickier for
> dm to support.  Previously 'flush' could not fail and so callers do not
> generally have strategies to handle such a situation.

The 'caller' here would be fsync() in the FS. What strategies are available
to handle a failing 'flush'? It there anything that can be done at
application level (userland)?

More than anything, does LVM (or device mapper) really reorder writes?
Is it safe with disk caches in write-thru mode? (hdparm -W0)

.TM.
