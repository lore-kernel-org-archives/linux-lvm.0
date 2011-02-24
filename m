Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1OJu6Gd000541
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:56:06 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1OJtugZ024070
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:55:56 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p1OJttLp028279
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:55:55 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p1OJts0T023602
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:55:54 -0500
Date: Thu, 24 Feb 2011 14:55:54 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D66AE68.6030406@rjl.com>
Message-ID: <Pine.LNX.4.64.1102241446160.22996@bmsred.bmsi.com>
References: <4D64FF3C.6080602@abpni.co.uk>
	<20110223101259.77143753@bettercgi.com>
	<4D653BEF.5010600@abpni.co.uk>
	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>
	<4D654FBD.8030504@abpni.co.uk> <4D655459.6050806@gmail.com>
	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>
	<4D656817.6060900@gmail.com>
	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>
	<4D6572C0.6070008@abpni.co.uk>
	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>
	<4D65A1A9.1040205@abpni.co.uk>
	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>
	<4D65A839.50107@abpni.co.uk> <4D65A8F5.8040606@abpni.co.uk>
	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>
	<4D6609E4.10800@abpni.co.uk>
	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>
	<4D6671D7.7020301@abpni.co.uk>
	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>
	<4D667743.3010102@abpni.co.uk>
	<4D668A57.3000306@abpni.co.uk> <4D66AE68.6030406@rjl.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 24 Feb 2011, Nataraj wrote:

> One other thing that wasn't mentioned here.... As far as I understand,
> if these are lvms on the host and the snapshots are being taken on the
> host, there is no guaranteed integrity of the filesystems unless you
> shutdown the guest while the snapshot is taken.
> 
> It's too bad they don't implement a system call that could do something
> like sync filesystem and sleep until I tell you to continue.  This would
> be perfect for snapshot backups of virtual hosts.

The hosting service backup script can attempt to send a message to 
the VM on a network port before taking the snapshot.  If the VM
accepts the connection and implements the handshake API, it will respond with
a "WAIT A SEC", tell databases to sync and suspend writes, then
tell the host to "GO AHEAD".  The host then takes the snapshot and
tells the VM, "ALL DONE, CARRY ON".

This network API ought to be standardized.  In fact, I am just about
to write this API for a client to reduce their backup window from
6 minutes to a few seconds.  If I am reinventing the wheel here,
please let me know!  If not, I'll share here.  Code will likely be python.

For many applications, filesystem journalling is sufficient for snapshots
to be useful without further involvement.  But when database are involved,
you often need the handshake.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
