Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1NJXVLl015609
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:33:31 -0500
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NJXJsO019023
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:33:20 -0500
Message-ID: <4D6560FE.30301@cfl.rr.com>
Date: Wed, 23 Feb 2011 14:33:18 -0500
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>
	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>
	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>
	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 2/23/2011 12:54 PM, Stuart D. Gathman wrote:
> Or maybe you want to *revert* the origin back to the state saved
> in a snapshot.  A specific revert command is in the works, but
> to do it manually, unmount the origin, and copy the snapshot over

That is lvconvert --merge, and it has been around for a while now.  It
is quite handy for testing a dist-upgrade and then rolling back.
