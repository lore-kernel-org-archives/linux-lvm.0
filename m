Date: Wed, 19 Oct 2011 13:56:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20111019125654.GQ24527@agk-dp.fab.redhat.com>
References: <1319028502.1827.24.camel@deela.quest-ce.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1319028502.1827.24.camel@deela.quest-ce.net>
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
Cc: linux-lvm@redhat.com

On Wed, Oct 19, 2011 at 02:48:20PM +0200, Yann Droneaud wrote:
> Is there any tool for LVM like fstrim(8) (which would likely be called
> "lvmtrim") ?
 
vgtrim

> This tool would discard currently unused PE of an active VG like
> fstrim(8) is doing on ext4,btrfs,xfs blocks (depending on filesystem
> support).

Sounds a reasonable idea to me, although I question how the PEs that
would benefit from it would have got into that state in the first place,
given that lvreduce already has trim support if you had
devices/issue_discards = 1 in your lvm.conf.
 
Alasdair
