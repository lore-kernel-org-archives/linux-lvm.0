Date: Tue, 15 Nov 2005 22:33:58 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Sorry, dm:1.02, lvm2:2.02 did not work for me
Message-ID: <20051115223358.GY26394@agk.surrey.redhat.com>
References: <20051111163525.18AE1734B1@hormel.redhat.com>
	<1131758026.4975.77.camel@jgs4.ino.pvt>
	<20051112020710.GN26394@agk.surrey.redhat.com>
	<20051112220320.GO26394@agk.surrey.redhat.com>
	<20051112224941.GP26394@agk.surrey.redhat.com>
	<1132073680.4968.3.camel@jgs4.ino.pvt>
	<1132093397.4968.41.camel@jgs4.ino.pvt>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1132093397.4968.41.camel@jgs4.ino.pvt>
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
To: "James G. Sack (jim)" <jsack@tandbergdatacorp.com>
Cc: "LVM LIST linux-lvm@redhat.com" <linux-lvm@redhat.com>

> > The kcopyd.c BUG at line 145 is triggered by the first lvremove
> > following start of the i/o (copy loop).

Try some kernel patches.

  http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/

in particular these four:

  dm-snapshot-bio_list-fix.patch
  dm-snapshot-metadata-reading-separation.patch
  dm-snapshot-load-metadata-on-creation.patch
  dm-ioctl-reduce-pf-memalloc-usage.patch

Alasdair
-- 
agk@redhat.com
