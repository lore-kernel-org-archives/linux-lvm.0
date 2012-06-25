Date: Mon, 25 Jun 2012 17:27:03 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120625162703.GC17857@agk-dp.fab.redhat.com>
References: <4FE8770C.7090502@shiftmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4FE8770C.7090502@shiftmail.org>
Subject: Re: [linux-lvm] Still missing for supporting dm-thin
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
To: Spelic <spelic@shiftmail.org>
Cc: linux-lvm@redhat.com

On Mon, Jun 25, 2012 at 04:34:52PM +0200, Spelic wrote:
> 1) It is not possible to backup and restore a VG config (vgcfgrestore in  
> particular refuses to work) if there is a dm-thin volume. This is a very  
> serious problem that does not allow to recover even non-thin volumes if  
> there is a thin volume around. Even automatic backups from  
> /etc/lvm/archive cannot be restored/used. This puts data at risk, please  
> fix this.

We do want to find a way to do this for non-thin volumes - the current 
restrictions are indeed tighter than they need to be.

For thin volumes though it's a complex problem to work out what can
be restored safely and what can't.  (The metadata saying where a volume is is
now split between the LVM metadata and the thin metadata.)

> 2) less important: it is apparently not possible to change the --zero  
> flag for a thin pool once created. 

That should be just another lvchange parameter.

Alasdair
