Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8GKgvJN031294
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 16:42:57 -0400
Received: from e2.ny.us.ibm.com (e2.ny.us.ibm.com [32.97.182.142])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id m8GKgtAn012102
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 16:42:55 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m8GKgteT018509
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 16:42:55 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m8GKgsEc287046
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 16:42:54 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m8GKgskf025449
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 16:42:54 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m8GKgslY024902
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 16:42:54 -0400
Date: Tue, 16 Sep 2008 13:42:41 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Mirrored LV
Message-ID: <20080916204241.GA9810@us.ibm.com>
References: <1221592827.6037.57.camel@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1221592827.6037.57.camel@localhost>
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

Koen Vermeer [koen@vermeer.tv] wrote:
> Hi,
> 
> I was thinking of using a mirrored LV as a easier to use alternative to
> a RAID1 PV (with matching VG and LV). I tried to find the information I
> need on how this works and how to set it up, but so far, I failed.
> 
> First, am I right in trying to use LVM in this way? I have two disks,
> and I just want to mirror some LVs.

You can by using corelog (aka, log in memory), but read on...

> Second, I am confused by the apparent need to have this log stored on
> another device. Actually, this doesn't seem true in two ways: There's
> the option of having the log in memory and then the documentation only
> says that the log is 'usually on a separate device'. Does that mean that
> using a mirrored LV makes no sense on a system with two disks? Or should
> I just keep the log in memory in this case? Or can I use another PV on
> one of the disks? Should this be mirrored as well? What happens if I
> loose that data?

The log records what regions of your master device are in sync with your
other mirror device. It is used to synchronize the failed regions from
the master to your other device when your 'other device' comes back to
life. This should work whether your log device is in memory or on a PV
by itself as long as you don't de-activate or restart your machine. The
log data on a PV can be useful for reboots.

-Malahal.
