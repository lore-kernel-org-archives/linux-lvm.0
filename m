Date: Fri, 26 Mar 2010 14:16:13 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20100326181613.GA1645@redhat.com>
References: <4BACC1D0.9090402@davidcoulson.net>
	<20100326161851.GB15016@redhat.com>
	<4BACE0FB.5010703@davidcoulson.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BACE0FB.5010703@davidcoulson.net>
Subject: Re: [linux-lvm] Auto PV scan w/ LVM
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
To: David Coulson <david@davidcoulson.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Mar 26 2010 at 12:29pm -0400,
David Coulson <david@davidcoulson.net> wrote:

> On 3/26/2010 12:18 PM, Mike Snitzer wrote:
> >I'm not crystal clear on your use-case (e.g. the mechanics and
> >constraints of when the clone is presented to the backup, etc).
> 
> The process is basically this:
> 
> * Clone in 'sync' state so it is replicating block changes from the
> source. The clone LUN is still visible to the backup server, however
> both paths are 'failed' to multipathd
> * We fracture/break the clone which makes the clone LUN available to
> the backup server for IO
> * We mount LVs from the clone LUN on the backup server, run our
> backup job, unmount it
> * vgexport the clone LUN VG and remove it from our multipath list
> with 'multipath -f'
> * Tell the SAN to start syncing the clone to source again until we
> need to break it for another backup.
> 
> I basically need to find a nice way to make LVM ignore the clone
> disk on the backup system until I am ready to make use of it for a
> backup. multipathd sees it as failed during this time, but
> vgscan/pvscan, etc all hang. Maybe that is normal.

Are you using multipath's 'queue_if_no_path' (assuming RHEL4 has it)?
Could be LVM's IO to the mpath devices will queue (block) until the
point when you "break the clone" (which makes the paths(s) available).

You could get very specific with the multipath configuration for these
clone LUNs to fail IO immediately (in theory).  But in practice this is
a delicate task that would require special EMC LUN understanding of how
to differentiate between a clone LUN that is actively sync'ing and just
some other LUN.  It also would be challenging to manage these changes at
runtime (might require multipathd being restarted with updated config
based on WWID, etc).
 
> I basically need to find a nice way to make LVM ignore the clone
> disk on the backup system until I am ready to make use of it for a
> backup. multipathd sees it as failed during this time, but
> vgscan/pvscan, etc all hang. Maybe that is normal.

Are you aware of LVM_SYSTEM_DIR environment variable?  It could be that
you have a default lvm.conf that rejects (via filters) the clone LUNs.
But when you want to be able to access the clone LUNs for backup you
could have a custom lvm.conf that allows (via filters) these clone
LUNs.  So each shell you'd be doing your backup work in would point to
this custom lvm.conf that lives in $LVM_SYSTEM_DIR.

<write custom filters allowing clone LUNs to /etc/backup_lvm/lvm.conf>

export LVM_SYSTEM_DIR=/etc/backup_lvm/
<do backup commands>
unset LVM_SYSTEM_DIR

> >But the 'vgimportclone' command will enable you to make the cloned LUNs
> >distinct from the originals.  Does this help you?
> The clone gets mounted on a different box to the source, so it's not
> important to me. I don't have a vgimportclone command on RHEL4,
> unless I need to install some additional packages.

vgimportclone is not packaged in RHEL4's lvm2.  But vgimportclone
wouldn't help you anyway; thanks for clarifying.

Mike
