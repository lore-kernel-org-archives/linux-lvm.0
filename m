Message-Id: <3CBEA630.E186CE9C@mc-lindinger.de>
From: Markus Bartl <m.bartl@mc-lindinger.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mount reiserfs snapshot failed
References: <3CBE92EB.89FB2B07@mc-lindinger.de>
    <20020418094402.GA1233@fib011235813.fsnet.co.uk>
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
Date: Thu Apr 18 05:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Joe Thornber wrote:
> 
> On Thu, Apr 18, 2002 at 11:33:31AM +0200, Markus Bartl wrote:
> > Hi there.
> >
> > Im using the original kernel 2.4.18 with the locking patch and the
> > lvm-patch applied. I use the lvm in Version 1.1rc1.
> > I got one harddisk with 4 partitions on it, 1 partition is Linux LVM.
> > The volume to backup is mounted on /home and has reiserfs.
> >
> > I made a shell-script to perform a test using snapshots.
> > Here is what it does (looped):
> > 1) create snapshot
> > 2) mount snapshot --> fails sometimes (35 loops, 6 fails)
> > 3) backup snapshot
> > 4) create file on original volume while backup is still running
> > 5) unmount snapshot
> > 6) remove snapshot
> >
> > In some cases mounting the snapshot volume fails with error 32 (wrong fs
> > type or bad superblock).
> > Anybody got any idea???
> 
> Do version 1.0.3 tools fail in the same way ?
> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

Hi there.
I tried the 1.0.3 tools with the 1.1rc1 kernel module. The same problem
occured (not as much 
as with the 1.1rc1 tools though).
Im now going to build the 1.0.3 kernel module and try it that way.
Thanks.
-- 
MC-Lindinger GmbH
Markus Bartl
Wiesenweg 1
D-94099 Ruhstorf
