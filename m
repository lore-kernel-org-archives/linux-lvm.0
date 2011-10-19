Date: Wed, 19 Oct 2011 14:29:24 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20111019132924.GT24527@agk-dp.fab.redhat.com>
References: <1319028502.1827.24.camel@deela.quest-ce.net>
	<20111019125654.GQ24527@agk-dp.fab.redhat.com>
	<1319030776.1827.31.camel@deela.quest-ce.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1319030776.1827.31.camel@deela.quest-ce.net>
Subject: Re: [linux-lvm] lvmtrim
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
To: Yann Droneaud <yann@droneaud.fr>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Oct 19, 2011 at 03:26:15PM +0200, Yann Droneaud wrote:
> Perhaps when you forgot to discard/TRIM the whole SSD before re-using it
> in an active VG.
> Perhaps in the case you're migrating from an older version of the LVM2
> tools ?
> Or issue_discards was set to 0.
 
Indeed.

It's a simple tool to write, so I'm throwing it open to see if anyone wants
to write and contribute it

Alasdair
