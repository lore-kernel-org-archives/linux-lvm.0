Date: Sat, 12 Nov 2005 22:03:21 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Sorry, dm:1.02, lvm2:2.02 did not work for me
Message-ID: <20051112220320.GO26394@agk.surrey.redhat.com>
References: <20051111163525.18AE1734B1@hormel.redhat.com>
	<1131758026.4975.77.camel@jgs4.ino.pvt>
	<20051112020710.GN26394@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051112020710.GN26394@agk.surrey.redhat.com>
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

On Sat, Nov 12, 2005 at 02:07:10AM +0000, Alasdair G Kergon wrote:
> Is the original LV activated with the old or new code?
 
I've reproduced this if the LV is activated with an old release but
the snapshot is created with the new code.  Should be easy to fix.

Meanwhile, try lvchange -an before using the new code to activate
the LV again and create the snapshot.

Alasdair
-- 
agk@redhat.com
