From: lembark@wrkhors.com
Subject: Re: [linux-lvm] extending a logical volume
Message-Id: <12230000.1011638456@duke.wrkhors.com>
In-Reply-To: <E16Sist-000136-00@arwen.dev33.cvf>
References: <E16Sist-000136-00@arwen.dev33.cvf>
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
Date: Mon Jan 21 12:43:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


-- Pierrick PONS <ppons@cvf.fr> on 01/21/02 19:09:31 +0100

> I've read the extending logical volume section and I can't believe this.
> According to the doc, it would be impossible to extend a logical volume 
> without unmounting it first.
> I'm using a ext3 (with a 2.4.17 kernel) filesystem and I'd like to extend my 
> logical volume without unmounting it first. This would be used on a
> production  server, so I can't unmount any logical volume.
> 
> I've seen that a ext2online patch does exist, maybe this fonctionnality is 
> still implemented in a newer kernel ?
> 
> Could you give me, if it exists, a method to extend the size without unmount 
> the logical volume ?
> 
> Thank's a lot.

Put it another way: You can lvextend a mounted volume. 
There isn't any good way to extend the file system while
it's mounted. Adding the cyl groups to a mounted file 
system would blow up several parts of the VFS layer.
Since extending the LVM takes O(ms) to finish there 
isn't much gain in doing it mounted anyway. 

The simplest way to handle it is unmounting, fsck-ing
and re-mounting the thing immediately after your weekly
backup, when users have to be off the system anyway
[if you want to tell me that the system is too important
to offline for a backup I'd strongly suggest finding a 
9-story window near the console, it'll be easier to 
handle it yourself than have the users do it for you 
after a crash looses all of the data].

If the sytsem is used for real-time processing then
simply switch to the backup server for 10 minutes, 
extend and validate the system then switch back.

Total time for, say, 100GB file system doubling in 
size would be 60 seconds on any reasonably fast I/O
system, nearly all of which is spent extending the 
filesystem.

Even HP's LVM -- probably the most forgiving of all -- 
has to be dismounted for extendfs; lvextend can be run
any time you like.

--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
