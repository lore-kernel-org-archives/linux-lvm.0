Message-ID: <3FD4B28E.6030602@stercomm.com>
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
References: <E1ATOLU-0004dz-1c@server6.hostpoint.ch>
In-Reply-To: <E1ATOLU-0004dz-1c@server6.hostpoint.ch>
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
Date: Mon Dec  8 11:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Markus Baertschi wrote:
> On Mon, 08 Dec 2003 10:17:50 -0600, Chris Cox wrote:
> 
>>We love the ability to do resize_reiserfs while the filesystem is mounted.
>>Constantly amazes the "Unix" purists.
> 
> 
> This is the one feature I like most on my AIX boxes, where the stock
> LVM & JFS setup has done this for more than a decade.
> 
> That a broken reiser on RH is the source of the occasiona data loss reported
> is good possibility. But that means there were broken reiser implementations
> out there of which RH assumed they were stable and they weren't.


I have never experienced the data loss element, however, since
reiser3 does not do true data journaling, but only metadata, it is
well known fact that while reiser can bring the filesystem
integrity back to normal after a bad shutdown, some data loss
is possible.  This is usually true of any metadata only journaling
filesystem.  Reiser4 supposed fixes this and of course has that
whiz-bang plugins feature.  Could make reiser4 the best (feature wise).

I certainly have nothing against JFS or AIX.  I really like its ability
to dynamically grow without intervention (though that could give
some administrators a headache).

I can't say what's going on with reiserfs and RH... again, just
because of the "stories" I've heard and occasional "ewww's" I've
personally seen with RH, I just avoid it on RH.  They chose their
filesystem and that filesystem is ext3.  It would be foolish
to do anything else on RH.

I have seen problems with ext3 even under RH where we would lose
entire filesystems... but anytime I mention this, I'm always
trampled on... to tell you the truth, I suspect it is an error
in ext2 even... but that opinion really offends people.  I don't
use RH in general unless I have to (we're an ISV, so we support
everything).  But YMMV of course!
