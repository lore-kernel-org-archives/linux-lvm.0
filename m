From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] LVM/RAID again
Message-Id: <20020306181319.C12548@connectlive.com>
References: <20020306203532.GA622@human.galaxy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020306203532.GA622@human.galaxy>; from
    frank.lenaerts@advalvas.be on Wed, Mar 06, 2002 at 09:35:32PM +0100
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
Date: Wed Mar  6 17:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Having used and despised VxVM on Solaris before, and finding out about
Heartbeat since then, I'd look into attached enclosures shared
physically on a SCSI bus (there is an article in SysAdmin magazine that
I used for my starting point) and serial heartbeats across the nodes, if
the cluster is simple enough...  if not post to the linux-HA list :-)


Quoth Frank Lenaerts:
> I've been reading several LVM/RAID postings on this mailinglist to
> find out if someone else is also having the same question as I have,
> but this does not seem to be the case; I hope this is the right place
> to ask this.
> 
> As LVM does not provide RAID1 (etc.) as VXVM does with its plexes, I
> wanted to use LVM on top of the standard Linux metadevices
> (RAID1). However, I wanted to do this for a cluster system using a
> shared SCSI bus. I am aware of the fact that ownership of disks is
> important, while something like LVM actually tries to abstract this
> away, but I want to use LVM to be able to extend the filesystem, to
> take snapshot backups etc.. The problem I currently face however, is
> the fact that both nodes autodetect the metadevices and start syncing
> the mirrors, independently of each other (I do not have the LVM and
> cluster software installed on these machines yet). The synchronization
> however, is initiated by the raidstart command, that is true (it is
> not the detection itself which does this), but I wonder how I should
> solve this problem. Below, some ideas that come to my mind:
> 
> - do not use LVM at all, just use the physical disks instead
> 
> - have two separate raidtab files where each of them is only "owned"
>   by a single node (to prevent syncing problems) and only start the
>   raid for a certain metadevice when a logical volume is imported on a
>   node
> 
> What do you think about this?
> 
> -- 
> frank.lenaerts@advalvas.be



-- 
     "To be suspended from the legal profession is the moral equivalent of 
      being ostracized by child molesters."
                                                           --Ian Rowan
