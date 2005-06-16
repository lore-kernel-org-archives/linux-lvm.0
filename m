Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j5GFSAo7031727
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2005 16:28:10 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DiwHq-0000wG-01
	for linux-lvm@redhat.com; Thu, 16 Jun 2005 16:28:10 +0100
Date: Thu, 16 Jun 2005 16:28:09 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] snapshot cow volume location?
Message-ID: <20050616152809.GD4195@agk.surrey.redhat.com>
References: <42B18A7E.9090809@hp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42B18A7E.9090809@hp.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Jun 16, 2005 at 03:19:42PM +0100, Alistair Coles wrote:
> As far as I can tell (using 2.2.01.09) , using lvcreate to create a 
> snapshot results in the snapshot being in the same VG as the source. If 
> that is correct, is there any way to force the snapshot to use different 
> PV's than the source?
 
Specify the PVs at the end of the 'lvcreate -s' command line.

Alasdair
-- 
agk@redhat.com
