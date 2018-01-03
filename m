Date: Wed, 3 Jan 2018 09:07:13 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20180103150713.GA16217@redhat.com>
References: <f1be22d0-6bf3-e282-9692-92452f67122d@suse.com>
	<20180102171034.GC26695@redhat.com>
	<be5b9aa6-d9fb-2e45-d250-9736d1ae49a5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be5b9aa6-d9fb-2e45-d250-9736d1ae49a5@suse.com>
Subject: Re: [linux-lvm] lvmlockd: about the limitation on lvresizing the LV
 active on multiple nodes
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
To: Eric Ren <zren@suse.com>, linux-lvm@redhat.com

On Wed, Jan 03, 2018 at 11:52:34AM +0800, Eric Ren wrote:
> > 1. one one node: lvextend --lockopt skip -L+1G VG/LV
> > 
> >     That option doesn't exist, but illustrates the point that some new
> >     option could be used to skip the incompatible LV locking in lvmlockd.
> 
> Hmm, is it safe to just skip the locking while the LV is active on other
> node?
> Is there somewhere in the code to avoid concurrent lvm command to execute
> at the same time?

The VG lock is still used to protect the VG metadata change.  The LV lock
doesn't protect anything per se, it just represents that lvchange has
activated the LV on this host.  (The LV lock does not represent the
suspended/resumed state of the dm device either, as you suggested above.)

I'll send a simple patch to skip the lv lock to try this.
Dave
