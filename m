From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] "umount" LVM stuff
Message-ID: <20030224021555.Y14285@zealot.blacknet.de>
References: <3E58E03E.3020401@machturtle.com> <20030223181304.V14285@zealot.blacknet.de> <3E5919A3.2010404@machturtle.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E5919A3.2010404@machturtle.com>; from dcorbin@machturtle.com on Sun, Feb 23, 2003 at 01:57:39PM -0500
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
Date: Sun Feb 23 19:16:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Feb 23 '03 at 13:57, David Corbin wrote:
> Well, that appears to have solved the immediate probelm.  Now, help me 
> get through the next one....
> 
> Attempts to access the logical volume I used to fail. 
You have disabled it, it's gone. 

> piano:/etc# ls -ltar /dev/vg0
> total 28
> crw-r-----    1 root     disk     109,   0 Feb 23 13:35 group
> drwxr-xr-x   10 root     root        24576 Feb 23 13:35 ..
> dr-xr-xr-x    2 root     root         4096 Feb 23 13:35 .
> piano:/etc# ls -ltar /dev/vg0/group
> crw-r-----    1 root     disk     109,   0 Feb 23 13:35 /dev/vg0/group
> piano:/etc#
> 
> I'm concerted that "group" is /dev/vg0, instead of "data".
> 
> Ideas on how I can recover this?
Well, read the LVM faq/howto somewhere at sistina.com, than
read

http://www.tuxedo.org/~esr/faqs/smart-questions.html

and finaly tell us what you attemp to do? you can not unmound an lvm and
the group file is a very essential file for LVM.
-- 
Goetz Bock       (c) 2003 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
