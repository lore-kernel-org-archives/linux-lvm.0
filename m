From: Kai Weber <lists@glorybox.de>
Subject: Re: [linux-lvm] Are there problems with same VG on same hard disk?
Message-ID: <20030409123606.GA1752@glorybox>
References: <20030409112739.GA1244@glorybox> <1899663439.20030409133243@tnonline.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1899663439.20030409133243@tnonline.net>
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
Date: Wed Apr  9 07:36:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 09, 2003 at 01:32:43PM +0200, Anders Widman wrote:

> Why  would  you want to do that? One of the major benefits with LVM is
> that  you  do  not have to divide your physical disks into partitions,
> but  to  do  that through LVM. Also, performance-wise it is not a good
> idea to do what you suggested.

I have removed Windows from a partition. So it is now empty and could be
used an included in the VG. If it's possible to resize the partitions...

/dev/hda7          1923      2520   4803403+  8e  Linux LVM
/dev/hda8          2521      3198   5446003+  8e  Linux LVM
/dev/hda9          3199      9729  52460226   8e  Linux LVM

/dev/hda7 is VG system, /dev/hda9 is VG data and /dev/hda8 the new and
empty partition. I have no space to backup /dev/hda9 for merging hda8
and hda9. There seems to be no "pvresize" for LVM1.

Kai
