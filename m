Message-ID: <4665F5FD.7070908@gmail.com>
Date: Wed, 06 Jun 2007 09:47:09 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SolvedLRE: CLVMD and Locking type 3 initialisation
	failed
References: <078001c7a7ab$6ae46e30$5dd810d1@e3demo>
In-Reply-To: <078001c7a7ab$6ae46e30$5dd810d1@e3demo>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jimm@simutronics.com, LVM general discussion and development <linux-lvm@redhat.com>

> For Debian lvm2 you have to set the locking_type=2.  It's in the lvm2 source
> debian/clvm.README.Debian 
> 
> However, now that I have ccsd, cman and clvmd happily running (I discovered
> I had clvmd running ok when I could run LVM commands).  On both computers in
> my cluster, I'm still not seeing the volume group of the other cluster
> member.  And the status of my Clustser seems fine.  
> 
> Is there anything I'm missing or doing wrong?  I'm not running a SAN or
> iSCSI.  The PVs for each server are partitions I've created from the HW
> Raid.

I think your understanding of CLVM may be wrong. CLVM will not make 
volume groups etc on local storage available to both nodes - its used to 
manage shared storage. Storage is presented to both nodes (ie, a SAN or 
iSCSI) and CLVM is used to manage the storage (ie, prevent metadata 
corruption by using locking, and making sure that both nodes have a 
consistent view of each VG etc).

http://sources.redhat.com/cluster/faq.html#shrdstor

Dave
