From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] [Q] LVM snapshot volume extendable?
Message-ID: <20030112130943.GA12078@gw.silicide.dk>
References: <010901c2ba33$d3e5daf0$0f00a8c0@COMPAQ>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <010901c2ba33$d3e5daf0$0f00a8c0@COMPAQ>
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
Date: Sun Jan 12 07:09:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jan 12, 2003 at 09:12:07PM +0900, Sean Oh wrote:
> Hi
> 
> I am using LVM 1.0.6, kernel 2.4.20 and XFS (from linux-2.4-xfs CVS).
> 
> My question is that is the snapshot volume extendable?

yes, just use lvextend.


> My environment is as follows:
> 
> /dev/vg01/lv01 ---> XFS, 2G
> /dev/vg01/lv01_snap --> 256M, snapshot for /dev/vg01/lv01, mounted under
> /snap with ro,nouuid,usrquota,grpquota,noatime
> 
> Now I have wrote a small shell scripts that if lv01_snap is more than 50%
> full, automatically increase the lv01_snap. But it seems to me that it does
> not work well..

I wrote one too, but rather than 50% used, i used XX MB free space.

 
> What I did in the shell scripts are 'lvextend -L+256M /dev/vg01/lv01_snap'
> with/without 'xfs_growfs /snap'.

you dont need to grow the filesystem on the snapshot.

 
> After umounting the /snap and trying to remount /snap, it complaints as
> below

you dont need to unmount it



A LVM snapshot works by allocating a new "PE table". This means.
(# is allocated, - is not, and | is the end)

LV: |-#################--##---#####-|
snapshot: |---|

so, you change something in the LV

LV: |-#############+###--##---#####-|
snapshot: |#--|

Only the block that is actualy changed is moved to the snapshot.
If you need alot of changes your snapshot should be big, if you dont
change alot, you can use a much smaller snapshot.





JonB
