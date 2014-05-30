Date: Fri, 30 May 2014 12:38:59 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20140530113859.GB29705@agk-dp.fab.redhat.com>
References: <20140522101837.GB14236@redhat.com> <537E0D25.7010108@redhat.com>
	<20140522152232.GC14236@redhat.com>
	<20140522154946.GD14236@redhat.com>
	<20140522180405.GA6361@redhat.com>
	<20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140529204719.GD1302@redhat.com>
Subject: Re: [linux-lvm] Testing the new LVM cache feature
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
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, May 29, 2014 at 09:47:20PM +0100, Richard W.M. Jones wrote:
> Is there a reason why fast and slow devices need to be in the same VG?
> I've talked to two other people who found this very confusing.  No one
> knew that you could manually place LVs into different PVs, and it's
> something of a pain to have to remember to place LVs every time you
> create or resize one.  It seems it would be a lot simpler if you could
> have the slow PVs in one VG and the fast PVs in another VG.
 
We recommend you use tags.  Much more flexible/dynamic solution than forcing
the use of separate VGs.

  pvchange --addtag ssd
  pvs -o+tags

  lvcreate ... $vg @ssd

to restrict the allocation the command performs to the PVs with the 'ssd' tag.

Alasdair
