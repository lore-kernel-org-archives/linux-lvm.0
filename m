Subject: Re: [linux-lvm] LVM Snapshots for remote archiving.
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <4016EE45.1050300@gene.concordia.ca>
References: <4016EE45.1050300@gene.concordia.ca>
Message-Id: <1075246162.25365.16.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Jan 27 18:46:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tue, 2004-01-27 at 18:03, Chris Beck wrote:
> Hi!  I've been looking through the archives and I can't see anything 
> addressing my issue.  Probably because I didn't look hard enough.
> 
> I want to use 24-hour snap shots as an archival tool.
> I have 2 identical file servers, one primary and one as an off-site 
> mirror.  I'd like the primary system to generate a transaction log that 
> rolls over every 24-hours and gets transmitted to the remote site.  
> After 7 days on the remote site, the log gets triggered so the remote is 
> always 7 days out of sync but with the last 6 days logs ready to go.   I 
> could have it auto update on arrival, but I was thinking that allowing a 
> week for someone to realize that they deleted something vital would be a 
> good thing(TM) - standard archiving stuff I guess.
> 
> Do you think that lvm snapshot volumes are a simple and convenient way 
> of doing this?  Does this make sense at all?
> 
> Thanks,
> Chris

The above transaction log is new to me.  I have seen that done with
databases, but not with generic fileservers.

If I was trying to accomplish what I think are your goals, I would use
rdiff-backup.

I don't know the syntax offhand, but the process would be:

Create snapshot
mount snapshot as /snap
rdiff-backup /snap //backup_server/snap 
rdiff-backup --delete_older_than 7-days //backup_server

rdiff-backup uses technology similar to rsync to ensure only the deltas
are sent between the servers.  (ie. first check datestamps etc. to see
if file changed.  If so, use md5sums to isolate what parts of the file
changed and send them between the servers.)

It maintains a current copy of the source files, and a series of diffs
to go backwards to older versions of the files.  In the above it would
keep a max of 7 diffs per file.  If you wanted to restore from 7 days
prior, rdiff-backup would internally have to apply all 7 diffs, one
after another.

rdiff-backup has lots of other features/capabilities.

Also, it uses ssh to encrypt all data between the servers, so it is also
fairly secure.

The only problems I have with rdiff-backup are:

1) ACL and EA support is only in the Unstable release, but they seem to
be working fine

2) rdiff-backup is written in python and when an unhandled error occurs,
it dumps out a stack trace.  To see what the problem is you have to go
thru the stack trace and the code.  Not to bad if you have some
programming skills.  If not, the mailing list is fairly responsive.

There is a wiki at
http://rdiff-backup.solutionsfirst.com.au/index.php?RdiffBackupWiki

Greg
-- 
Greg Freemyer
