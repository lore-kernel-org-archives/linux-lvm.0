From: pll+lvm@lanminds.com
Subject: Re: [linux-lvm] How to best use LVM? 
References: <BDEMIPDEGABMNEFIHCPDCEMGDNAA.bill+f.9sfuw6uo@tao-group.com>
In-reply-to: Your message of "Thu, 15 Aug 2002 11:14:59 BST."
             <BDEMIPDEGABMNEFIHCPDCEMGDNAA.bill+f.9sfuw6uo@tao-group.com> 
Message-Id: <20020815144750.8CD80F90D@tater>
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
Date: Thu Aug 15 09:49:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thank you very much for you insightful answers to my questions!
(I've responded to a few comments/questions of yours below).

In a message dated: Thu, 15 Aug 2002 11:14:59 BST
"William Blunn" said:


>A lot of people seem to want LVM to do magic on their existing systems
>which are full of data, which is something it doesn't do. You are going to
>need to backup-and-restore, or set up LVM on new disks.

Well, I'm not looking for magic, just neat things to play with, new 
ways of doing things, and easier methods of managing disk space 
:)

>The real trick is to put in LVM on day one even if you're not sure you need it.

Well, that's sort of what I'm doing.  I'm currently in an environment 
where there is nothing, and everything important is being managed by
"Someone Else".  Therefore, I'm free to play for now.  Hopefully, if I can 
come up with a good solution, I can replace the "Someone Else" in the 
future, since the groups I work with doesn't really like them :)

>Although you would need to give some more information about your situation.
> You are using Debian unstable which suggests you want to live on the bleed
>ing edge, but you are also using RAID5 which suggests you want to make a stable
>reliable system. AFAICT these two goals are incompatible.

Yes I'm currently using Sid, and yes I realize that it's "bleeding edge",
and yes, I mention RAID5 which indicates I'd like a stable/reliable 
system.  However, I'm "playing" right now, and since I run Sid on all 
my other systems, I just grabbed it out of reflex.  Since Woody is 
recently released, when/if I go into production mode, I'll probably 
switch to that.

Here's what I'm thinking of doing.  I have a bunch of 1u rack-mount
systems which each have 4 80GB drives in them.  In the near future, 
I'm likely to have identical systems with 160GB drives in them 
instead.  Out of all that disk space, I'm using less than 2GB on the 
primary IDE master drive.

What I was thinking, was to combine LVM with NBD (Network Block Device).
This would allow me to set up one or two nodes as the "file server" 
using LVM.  When I created add a new node to my environment for some 
reason, I'll set it up with the nbd-server to serve out it's drives.
The "file server" node could then exploit the unused disk space on 
this new node in the environment. 

For "reliability of data" I was thinking of using either ext3 or 
reiserfs across a RAID set.  Though, because I wasn't completely sure 
of how LVM worked wrt RAID, I was unsure where to do the RAID, at the 
back-end on the system where the disks physically reside, or on the 
front-end, where I'm using LVM.  

What I'm thinking of now is to not use RAID at all, rather just use 
LVM, and maybe use RAID to mirror VGs.

I'm well aware that this is probably insane and won't work as I'd 
ideally like it to.  But as I said, I have a lot of free time, and I 
like to learn new things.  NBD and LVM *seem* to be made for each 
other.  They both may be a little too experimental at this point in 
time, which is okay, I can afford that risk, and maybe, by doing 
this, I may find better ways of doing what I want.

So, that's the scoop on what I'm trying to do.  Comments, questions, 
concerns? :)

Thanks again!
-- 

Seeya,
Paul
--
	It may look like I'm just sitting here doing nothing,
   but I'm really actively waiting for all my problems to go away.

	 If you're not having fun, you're not doing it right!
