From: yckim@linuxsecurity.co.kr
Message-Id: <200302050947.h159lPL04991@yclinux.linuxsecurity.co.kr>
Subject: Re: [linux-lvm] resize an ext3 on an LV
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
Date: Wed Feb  5 12:05:05 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

You can do ext3 expand with "e2fsadm -L +xxxG -n /dev/homevg/userslv".
But before using this command, must reduce LV volume to original size.
e2fsadm  may resize filesystem and logical volume BOTH.
-n  is nofsck.
You must check filesystem  before "e2fsadm"  by e2fsck.

wish your good Luck !!!
Yongchul Kim.


 ----- Original Message ----- 
 From: "Alexander Lazarevich" <alazarev@itg.uiuc.edu>
 To: "Linux LVM Sistina" <linux-lvm@sistina.com>
 Sent: Thursday, January 30, 2003 12:32 AM
 Subject: Re: [linux-lvm] resize an ext3 on an LV
 
 
 > The LV is already expanded. All I want to do is resize the ext3 filesystem 
 > to the new size of the LV, which is now 275GB.
 > 
 > But I need to know the commands. Or some hint of what the command is. Is 
 > it just "resize2fs /dev/homevg/userslv"? I've seen some posts saying that 
 > using resize2fs will destroy an ext3 filesystem, is that not true? Will 
 > the journal stay intact? What's the command that you use?
 > 
 > Thanks for the help!
 > 
 > Alex
 > 
 > On Wed, 29 Jan 2003, Jan-Benedict Glaw wrote:
 > 
 > > On Wed, 2003-01-29 09:16:15 -0600, Alexander Lazarevich <alazarev@itg.uiuc.edu>
 > > wrote in message <Pine.LNX.4.44.0301290900350.22463-100000@zeus.itg.uiuc.edu>:
 > > > A rehash of some questions I asked earlier, but I want to clarify:
 > > > 
 > > > Redhat 7.3, 2.4.18-19.7.xsmp kernel, using LVM 1.03.
 > > > 
 > > > I've got a 180GB LV (/dev/homevg/userslv) which contains an ext3 
 > > > filesystem (mount point /home/users).
 > > > 
 > > > Once I umount the /dev/homevg/userslv, can I use resize2fs to extend the 
 > > > ext3 filesystem? Or must I first remove the journal from ext3, then 
 > > > resize, then add the journal back to it, then remount?
 > > 
 > > You can directly enlarge the filesystem, but, of course, you've got to
 > > extend the logical volume before that... You don't need to remove the
 > > journal, at least, this worked numerous times for me:-)
 > > 
 > > However, backup is always a good idea, though.
 > > 
 > > MfG, JBG
