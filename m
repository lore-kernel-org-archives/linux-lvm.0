Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6SDDlxn023586
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 09:13:47 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6SDDZWS001446
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 09:13:36 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id B0EC21F41B1
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 15:13:26 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14971-09 for <linux-lvm@redhat.com>;
	Fri, 28 Jul 2006 15:13:12 +0200 (CEST)
Message-ID: <44CA0D67.5000008@conterra.de>
Date: Fri, 28 Jul 2006 15:13:11 +0200
From: =?ISO-8859-15?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange pvmove problem
References: <44C9E4BD.9070204@forouher.de>
In-Reply-To: <44C9E4BD.9070204@forouher.de>
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

Dariush Forouher wrote:
> I'm trying to move PEs away from two PVs (because I want to remove the
> disks from the system), but pvmove always fails:

I had some problems with pvmove some time ago, if the PV to empty
contained parts from several different LVs. But this was due to some 
old bug with a 2.6.12 or 13 kernel. May be it's interesting to have
a look into /etc/lvm/backup/LVM and the associated backups,
to understand whats going on.

To overcome the problem of hanging LVM I shut down my server and
performed a "pvmove --abort" in single user mode while the LVM was
not activated. This restored it to the state before.

Dieter.
