Subject: Re: [linux-lvm] lilo wrote to an lvm disk
From: Justin Bauer <jbauer@engr.smu.edu>
In-Reply-To: <20030402072605.GC27228@percy.comedia.it>
References: <1049253225.1486.7.camel@jb>
	 <20030402072605.GC27228@percy.comedia.it>
Message-Id: <1049301157.1479.15.camel@jb>
Mime-Version: 1.0
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
Date: Wed Apr  2 10:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Luca,

> >I was having trouble earlier with lilo, and while configuring it, I
> >wrote it to the mbr on a disk I had lvm on.  The only place I found that
> >mentioned this problem was in an email to this list in march 2001, over
> >two years ago.  It basically said that the lvm disk would be hosed.  Is
> >there anyway to get the data off the disk? or repair it?
> 
> if you have a recent metadata backup you can try using vgcfgrestore to
> put the metadata back on the disk.

I didn't back anything up, but doesn't it do that by default?  It writes
something to /etc/lvmconf right?

> 
> other options depend on what was the disk layout:
> was it the only disk you had in the volume group?
> are there lv sharing more than one pv?
> do you recall the LV layout?

The bad disk happens to be the first disk in the group.  I didn't do
striping.  The first disk is completely full, well except for the 512
bytes at the beginning :)  There are two other disks as well, the second
disk is mostly full, and the third is empty.

Thanks,

Justin
