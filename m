Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i87IHmJ0029643
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2004 19:17:48 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C4kXM-000490-FI
	for linux-lvm@redhat.com; Tue, 07 Sep 2004 19:17:48 +0100
Date: Tue, 7 Sep 2004 19:17:48 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 snapshots on root fs
Message-ID: <20040907181748.GD6264@agk.surrey.redhat.com>
References: <20040907110330.GE2689@server.klaube.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040907110330.GE2689@server.klaube.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Sep 07, 2004 at 01:03:30PM +0200, Thomas Klaube wrote:
> Whenever I try to create a LVM (version 2) snapshot of the lvm
> containing the root fs my machine crashes. I am using SuSE 9.1 (kernel

We don't support pvmove or snapshots of volumes used by the tools themselves.

It is possible to snapshot the root volume, but the method is probably 
distribution-specific. Certain changes to the tools may make it easier
to support: a general parameterised script might be possible.

Alasdair
-- 
agk@redhat.com
