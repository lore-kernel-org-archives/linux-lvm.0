From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM snap size weirdness...
Message-ID: <20030321175040.E13822@uk.sistina.com>
References: <08628CA53C6CBA4ABAFB9E808A5214CB0142B582@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB0142B582@mercury.infiniconsys.com>; from cbarry@infiniconsys.com on Fri, Mar 21, 2003 at 12:19:34PM -0500
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Mar 21 11:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Mar 21, 2003 at 12:19:34PM -0500, Barry, Christopher wrote:
> So, by quiesce, would you suggest then, that I stop samba, nfs, apache - 
> take a snapshot and immediately restart them? Then, fire off my backups? 

The answer is going to be different for each application!

In general for an application that modifies files, yes, stop it, 
take the snapshot, then restart it.  

But, for example, if the application only reads the data, or only 
appends to files, or has its own internal checkpointing you shouldn't
need to.

It's not really NFS that needs stopping: it's any applications 
on your remote machines that are writing to the NFS-mounted volumes.

It's good that you're thinking about this: many people don't, and 
subsequently discover when they restore data from their backups
that their applications think it's corrupt.

Alasdair
