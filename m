Return-Path: <raheesom@navpoint.com>
Subject: Re: [linux-lvm] LVM questions & problems.
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <20010507102844.B25752@sistina.com>
References: <989197513.8109.6.camel@localhost> 
	<20010507102844.B25752@sistina.com>
Date: 07 May 2001 11:57:03 -0400
Message-Id: <989251023.1153.5.camel@localhost>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 07 May 2001 10:28:44 +0000, Heinz J. Mauelshagen wrote:
> On Sun, May 06, 2001 at 09:05:13PM -0400, Rupert Heesom wrote:
> > I'm practicing doing some LVM commands, and am coming up with some
> > problems -
> > 
> > Most disconcerting is that when I try to create a directory in the LV, I
> > get the following error - (this does not happen all the time, but almost
> > all the time 99%) -
> > 
> > [root@localhost Tmp]# mkdir test1
> > mkdir: cannot create directory `test1': Input/output error
> 
> You didn't metion, if the filesystem is still in a sane state.
> 
> Did you check your syslog for "accessess beyond the end of the device"
> which indicate fs related problems?

Well, looking at my syslog after mounting my lvol, I saw the following
msg -

"May  7 11:51:26 localhost kernel: EXT2-fs warning: mounting fs with
errors, running e2fsck is recommended"

I also saw previous errors which you asked about (lots of them) -

"itmap: Cannot read inode bitmap - block_group = 3, inode_bitmap = 98307
May  6 14:44:13 localhost kernel: attempt to access beyond end of
device...."

I have realised what my base problem is.... I have reduced the LV size,
but not reduced the Ext2 filesystem.  For some reason I thought that
resizing the LV was sufficient.  Looking further at the HOWTO, and other
web docs has enlightened me further.

It seems I will try to learn how to use teh e2fsadm util.  BTW one of
the utils seems to be commercial from Powerquest.  I have the v4 of
Partition Magic already.  I know it resizes ext2 filesystems, but as far
as I know needs to be run from within windows (it's been a long time
since I've used it last).  Are the utils such as e2fsadm sufficient /
good enough without the commercial PM util?



-- 
regs
rupert
