From: "Jason A. Lixfeld" <jlixfeld@fastvibe.com>
Message-ID: <001101c15b68$5adbb880$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011022153819.A2744@thunk.org>
Subject: [linux-lvm] RE: What really works?
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
Date: Mon Oct 22 21:13:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'Theodore Tso' <tytso@mit.edu>
Cc: ext3-users@redhat.com, linux-lvm@sistina.com

> If you see physical disk errors or LVM errors, it's likely 
> that the filesystem may have been corrupted.  Sometimes the 
> filesystem corruption may not be noticeable until much later, 
> and the longer you wait, the worse your data may get 
> scrambled.  So if you were seeing all sorts of disk or LVM 
> errors, don't just assume that the problems all went away 
> when you moved to a "stable" kernel.  

Good advice.

> So after seeing this kind of disk problems, *always* run fsck 
> -f to make sure the filesystem is in a sane state before you 
> continue.  Any journaling filesystem, like ext3, will protect 
> you against needing to run fsck after an unclean shutdown, 
> but they all won't save you if you have low-level disk/LVM 
> errors.  In those cases, you still need to have a filesystem 
> checker to try to pick up the pieces caused by hardware 
> problems, kernel bugs, etc.

More good advice.  I ran one on the ATARAID and one of the LVMs.  I'll
run one on the other LVMs.  Actually, I'll run one on ALL the
filesystems to see if they are still clean or of something is scattering
data all over the place.

> >  One of the lost+founds is stuck on my LVM and I can't delete it. 
> > Every time I try, it gives me permission denied errors. Chattr -I 
> > doesn't work either (that's another problem, how the hell 
> do I get rid 
> > of all that stuff in there now).
> 
> It's "chattr -i" (case matters).  

Uhm, it was "chattr -i" that I tried.  The latest version of Outlook for
Windows (shoot me, I know!) thinks it's so smart so it capitalizes the
first letter of every new sentence.

> Also, what version of e2fsprogs are you using?  Recent 
> versions should have offered to get rid of corrupted files for you.  

If tune2fs -v is any indication, I'm running v1.25.

This is still a very annoying problem.  chattr -i <-- I corrected it
this time :)  Doesn't make the files or directories deletable.  Any
other ideas?
