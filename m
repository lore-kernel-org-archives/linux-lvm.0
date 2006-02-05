Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k15I1dXG024553
	for <linux-lvm@redhat.com>; Sun, 5 Feb 2006 18:01:39 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1F5oCh-0005rn-Ah
	for linux-lvm@redhat.com; Sun, 05 Feb 2006 18:01:39 +0000
Date: Sun, 5 Feb 2006 18:01:39 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Defragmenting a VG
Message-ID: <20060205180139.GB22481@agk.surrey.redhat.com>
References: <43E624B1.30805@mid.email-server.info>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43E624B1.30805@mid.email-server.info>
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

On Sun, Feb 05, 2006 at 05:15:45PM +0100, Alexander Skwar wrote:
> Does anyone know of a tool for LVM2 which defragments a VG, so
> that the PEs of the LVs are consecutive?
 
man pvmove
and move them around manually.
(Needs --alloc anywhere to move within the same disk.)

Perhaps someone has already written a script that uses pvmove to 
defragment LVs?

Alasdair
-- 
agk@redhat.com
