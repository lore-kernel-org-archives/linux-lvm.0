From: Alexander Lazarevich <alazarev@itg.uiuc.edu>
Subject: Re: [linux-lvm] resize LV
In-Reply-To: <00bd01c2c710$52576aa0$0a42a8c0@darkstar>
Message-ID: <Pine.LNX.4.44.0301281505150.5767-100000@zeus.itg.uiuc.edu>
MIME-Version: 1.0
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
Date: Tue Jan 28 15:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

JFS can totally do it. I've been using AIX before we moved to Linux, and I 
did it all the time.

There must be a way to do it on linux systems using ext3. Anyone?

Alex
---                                                        ---
   Alex Lazarevich | Systems | Imaging Technology Group
   alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
---                                                        ---


On Tue, 28 Jan 2003, Thomas Kleffel wrote:

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
