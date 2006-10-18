Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9IEYma6023263
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 15:34:48 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GaCVM-0000S0-I3
	for linux-lvm@redhat.com; Wed, 18 Oct 2006 15:34:48 +0100
Date: Wed, 18 Oct 2006 15:34:48 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvcreate succeeds but vgcreate cannot read label
Message-ID: <20061018143448.GQ17654@agk.surrey.redhat.com>
References: <Pine.LNX.4.64.0610181348420.15257@saturn.retrosnub.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0610181348420.15257@saturn.retrosnub.co.uk>
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

On Wed, Oct 18, 2006 at 01:49:05PM +0100, Malcolm Scott wrote:
> When I run pvcreate on a partition, it seems the PV label is successfully 
> written to the partition, but vgcreate cannot then read this label in order 
> to incorporate this new PV into a new VG.
 
> mas90@neptune ~ $ sudo lvm version
>    LVM version:     2.02.06 (2006-05-12)

Sounds similar to a bug that got fixed in 2.02.07.

Alasdair
-- 
agk@redhat.com
