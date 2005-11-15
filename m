Date: Tue, 15 Nov 2005 23:50:16 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Sorry, dm:1.02, lvm2:2.02 did not work for me
Message-ID: <20051115235016.GD26394@agk.surrey.redhat.com>
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

Note also that a data corruption bug has been reported if you create *two*
(or more) snapshots of the same devices.  [I think this can be fixed
in userspace but I may not get time to do this for a few days.]

Alasdair
-- 
agk@redhat.com
