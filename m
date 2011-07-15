Date: Fri, 15 Jul 2011 12:39:01 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110715113901.GE15253@agk-dp.fab.redhat.com>
References: <201107141946.12747.benscott@nwlink.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201107141946.12747.benscott@nwlink.com>
Subject: Re: [linux-lvm] merging snapshots and lvs bug
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ben <benscott@nwlink.com>
Cc: linux-lvm@redhat.com

On Thu, Jul 14, 2011 at 07:46:12PM -0700, ben wrote:
> Currently the first field of the attribute bits are set to 's' for a snapshot 
> and 'S' for a merging snap. Unfortunatly 'S' was used for an invalid snapshot 
> and lvs still uses it both ways. 
 
Invalid snapshot is meant to be shown by I (for invalid) in the 5th position.

              The lv_attr bits are:

              1  Volume  type:  (m)irrored,  (M)irrored  without initial sync,
                 (o)rigin, (O)rigin with merging snapshot, (s)napshot, merging
                 (S)napshot,   (p)vmove,  (v)irtual,  mirror  (i)mage,  mirror
                 (I)mage out-of-sync, under (c)onversion

              5  State:  (a)ctive,  (s)uspended,  (I)nvalid  snapshot, invalid
                 (S)uspended snapshot, mapped (d)evice present without tables,
                 mapped device present with (i)nactive table

If some particular case is giving the wrong output, please show us exactly which
case that is, and how the output looks, together with 'dmsetup info -c',
'dmsetup table' and 'dmsetup status'.

Alasdair
