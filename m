Message-ID: <3C1D1B23.2080805@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Keep snapshots active for 24 hours?
References: <20011214113804.I940@lynx.no> <NBBBKLKHMJHIJLHOGAOJKELIJCAA.steve.wray@the.net.nz> <20011216202511.D26924@tiger.bigcats.invalid>
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
Date: Sun Dec 16 16:08:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Wolfgang,

	While the concept of a writeable LVM is cool, I believe LVM operates a 
low enough level that the migrations you speak of is impossible at the 
LVM level (in the kernel).  There could be filesystem level utilities, 
but the LVM is really nothing more then a blank harddisk partition. 
Harddisks shouldn't know a thing about files, directories, or 
filesystems in general.  It would be cool to have an filesystem diff, 
but on a live filesystem that could be quite tricky.  Essentially, that 
would be a differential backup utility.

	A writeable LVM would solve the problem of taking a snapshot of a 
journalling filesystem.  Somebody recently wrote in with a problem with 
ReiserFS that when he mounted the snapshot it kept giving him an error 
that the journal couldn't be rolled forward as it was mounted read only. 
  I am not sure if ReiserFS works okay with this or not, but the error 
is because there is uncommitted changes in the journal, no commits 
allowed because its read-only.

	It would be nice to essentially get a chance to install software in a 
controlled manner and once your sure it is working then roll it forward. 
  About the only issue I can see with that is having something that you 
install on /usr (which you took a snapshot of), that has to write to 
/etc which might take some trickery to get to be written to a 
snapshotted version of /etc.  The only thing I can think of off hand is 
to snapshot / and all the other filesystems, then mount the snap shot of 
/ on /myChrootJail then chroot to that and mount all of the various 
snapshots under that system.  All of this would work, but when you got 
done with the install you would have to do it all on the live device 
system.  The only usefulness I can imagine for that is if you are a 
scripting god and script it all up in the play environment and then do 
the real deal using the scripts you developed or as a dry practice run 
of an install.  Would be handy in a very controlled environment where 
repeatability is of the utmost importance.

	Okay so for the highly far fetched, it would be fun to tinker with this 
where you chroot jailed everybody in that environment that ssh'ed in, so 
some foolish hacker could break into the box, screw up a snapshot and 
then you just refresh the snapshot.  It would be fun to use in a 
honeypot situation.

		Kirby


Wolfgang Weisselberg wrote:

> Hi, Steve!
> 
> Steve Wray (steve.wray@the.net.nz) wrote 70 lines:
> 
> 
>>- take a snapshot, install something or try something out
>>that might break something, then restore *directly* from
>>the snapshot if anything goes wrong; without having to actually
>>back it up to media and restore it.
>>
> 
> Even better would be writable snapshots for that: 
> - make a snapshot of (everything where the install writes to
> - install the program
> - test it on the snapshot
> - junk the snapshot if the install is bad
> 
> and, of course, you might want to migrate changes from the
> snapshot to the original FS (or vice versa).  That however
> is a second feature.  Until then you'd have to do the install
> all over again -- once we actually get writable shnapshots.
> 
> -Wolfgang
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 


-- 
Real Programmers view electronic multimedia files with a hex editor.
