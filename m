From: Max Kalika <max+lists.lvm-dev@lsit.ucsb.edu>
Subject: Re: [linux-lvm] LVM2 strangeness.
Message-ID: <5610000.1054251328@valkyrie.lsit.ucsb.edu>
In-Reply-To: <17160000.1054244981@valkyrie.lsit.ucsb.edu>
References: <17160000.1054244981@valkyrie.lsit.ucsb.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Thu May 29 18:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quick followup...

I blew away the snapshots and tried again.  The performance was much better
(not surprisingly), but I still have lots of "busy buffer" messages in the
kernel log.  Would anyone know what this is all about, and whether or not I
should worry about it?  I'm considering putting LVM2 on a production mail
server, primarily for the simple resize capabilities, but also to use
snapshots during the rsync process (so as not to get many "file doesn't
exist" errors).

Quoting Max Kalika <max+lists.lvm-dev@lsit.ucsb.edu>:

> Hello LVM devs and others,
> 
> I've been trying to use LVM2 on a backup server for the past few days and
> I'm seeing some very strange things.
> 
> My configuration:
>   Dell PowerEdge 1300 (800Mhz)
>   512 MB RAM (2GB swap)
>   4 120GB IDE (8mb cache) disks in a RAID-5 configuration (on a 3ware
> card)   Custom built vanilla kernel (2.4.20) with DM patches (0.96.08)
> applied   LVM2 utilities version 1.95.15
> 
> I have a 300GB VG with a 150GB LV on it.  I also have a 50GB snapshot and
> a 10GB snapshot.  I first rsync all remote server data (8 other machines)
> to this "holding area" -- where I also hope to have 7 days of snapshot
> information available on disk.  From here, the latest "current" data gets
> pushed to tape.
> 
> Right now during an rsync of a huge mailstore (lots of small files) from
> the mail server, the performance on the backup server degrades severly (up
> to 12 1min load ave. and higher) and I'm seeing lots of the following in
> the kernel log:
> 
>   May 29 14:14:15 butters invalidate: busy buffer
>   May 29 14:14:15 butters invalidate: busy buffer
>   May 29 14:14:15 butters invalidate: busy buffer
>   May 29 14:14:15 butters invalidate: busy buffer
>   ... on and on and on ...
> 
> I'm guessing that most of the cpu is busy copying stuff from the original
> LV to the snapshots.  Is this a valid assumption?  What can one do to help
> the situation?  Or do I have a different misconfiguration?  Any light you
> can shed on this is greatly appreciated.  TIA.
> 
> --
> ---max kalika
> --max@lsit.ucsb.edu
> -lsit systems administrator
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



---max kalika
--max@lsit.ucsb.edu
-lsit systems administrator
