Subject: RE: [linux-lvm] resize LV
From: "Kirby C. Bohling" <kbohling@birddog.com>
In-Reply-To: <PLEIKKCJENNELKBAKJPMGEACCAAA.tren@eotnetworks.com>
References: <PLEIKKCJENNELKBAKJPMGEACCAAA.tren@eotnetworks.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1043793197.10876.18.camel@hawk.birddog.com>
Mime-Version: 1.0
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
Date: Tue Jan 28 16:34:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I haven't at ReiserFS in a year or so, but last I checked, you could
expand a filesystem online, but shrinking online one was not possible if
that is of importance to the original poster.  You can shrink it offline
however.

http://www.namesys.com/resize_reiserfs.html#EXAMPLES
According to the docs, that information is still current about reiserfs.

For JFS:
http://www10.software.ibm.com/developer/opensource/cvs/jfs/linux24/Documentation/filesystems/jfs.txt?rev=1.20&content-type=text
According to this, the current JFS only supports expanding, which I
(which is should do while online).  However, it doesn't appear to
support shrinking it at all.

Now about ext2:

There is a project on sourceforge for the ext2 resizing:
http://ext2resize.sourceforge.net/download.html

Here's a post by the author to in in the LVM mailing archive:
http://linux.msede.com/lvm_mlist/archive/1999/07/0055.html
(I've seen him post about it a lot more recently then that).

Here's a page that appears to have some explaination about it:
http://www-mddsp.enel.ucalgary.ca/People/adilger/online-ext2/

I have no idea how current they all are, I just googled for the ext2
resize online, plenty of links.

Last I knew they don't support ext3, but they wanted to do that.  It
used to take a kernel patch to use it.  I'm not sure if it still does.

	Thanks,
		Kirby



On Tue, 2003-01-28 at 16:13, Tren Blackburn wrote:
> Yes, you can resize a reiserfs filesystem while mounted.
> 
> Regards,
> 
> Tren
> 
> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Thomas Kleffel
> Sent: Tuesday, January 28, 2003 2:01 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] resize LV
> 
> 
> Hi!
> 
> > I know how to expand the LV while the LV is mounted, piece of cake
> > (lvextend -L+50GB /dev/homevg/userslv - expands userslv by 50GB). But how
> > do I expand the filesystem while it is mounted? I don't want to
> > umount the filesystem down to do this.
> >
> > The filesystem is an ext3 filesystem. Can I use resize2fs?
> 
> No, afaik neither ext2 nor ext3 support resizing while being mounted.
> And if I'm not wrong JFS and ReiserFS can't do this either but XFS can.
> 
> I'm using XFS for this reason and it works fine for me.
> 
> Bye,
> 
> Tommy
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
-- 
Real Programmers view electronic multimedia files with a hex editor.
