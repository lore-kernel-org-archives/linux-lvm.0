Subject: Re: [linux-lvm] Block-Level Backup
Message-ID: <10920-38778@sneakemail.com>
References: <1060247670.28307.37.camel@rocky> <20030807093631.GE381@fib011235813.fsnet.co.uk> <1060260466.4360.2.camel@chtephan.cs.pocnet.net> <20030807134451.GA30494@www.13thfloor.at> <20030807151127.GB5036@ti19> <20030807155421.GK381@fib011235813.fsnet.co.uk> <20030807163228.GC5036@ti19> <3F328E3A.6070203@conterra.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F328E3A.6070203@conterra.de>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
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
Date: Fri Aug  8 08:46:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dieter Stueken wrote 67 lines:

> But seriously: there is some other interesting possibility. After you
> made the snapshot, don't try do save it elsewhere. Instead just keep it!
> I use a similar system since a year now. It holds a full mirror of
> all my data, thus its some kind of full backup. Each night I
> synchronize all modified files, but keep the previous state, too.
> Its like a  snapshot. As all unchanged data is shared between the
> snapshots, the whole thing grows quite moderately compared to its
> total size (200Gb).

> Thus I have a snapshot of all my data for each day. I save them daily
> for about a week. Then I thin them out, keeping the Sundays only.
> After a few weeks I keep one snapshot per month etc. This is equivalent
> to dealing with a bundle of tapes, but much much easier.

Sounds interesting.  How does defend against:
- hard disk head crashes 
- a lightning striking your PC, roasting your HDs (and any tape
  drive, and all the rest)
- software errors (e.g. in LVM, in your scripts)
- operator errors (removing the wrong snapshot(s))
- cracker attacks
- corrupted main file system (even fdisk giving up), due to
  some software/hardware problem (e.g. cable came half off)

With a backup which migrates/copies the data to tapes, I can at
least:
- replace broken HDs/computers
- know the data was at least readable at the time of the
  backup, and any later accidents are recoverable
- it's much harder to nuke 2+ tapes/backup sets by operator
  error.

-Wolfgang
