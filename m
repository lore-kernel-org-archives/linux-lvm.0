Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9HMdo4E024104
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2006 23:39:50 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GZxbC-0008Dn-7z
	for linux-lvm@redhat.com; Tue, 17 Oct 2006 23:39:50 +0100
Date: Tue, 17 Oct 2006 23:39:50 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Using lvm1 vg's in lvm2 systems (RHEL4)
Message-ID: <20061017223949.GP17654@agk.surrey.redhat.com>
References: <806e72ee0610171500i26f4fa8ek469fa7d02031ae1@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <806e72ee0610171500i26f4fa8ek469fa7d02031ae1@mail.gmail.com>
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

On Tue, Oct 17, 2006 at 07:00:52PM -0300, Fabricio Candido wrote:
> Is it possible to my RHEL4 system use these lvm1 vgs without converting it ?
> What is necessary ?
 
Yes, provided you can manage without snapshots and pvmove.
[Alternatively, you can run vgconvert to update your metadata in-situ to the
new lvm2 format.]

Alasdair
-- 
agk@redhat.com
