From: Justin Bauer <jbauer@engr.smu.edu>
Message-Id: <1049253225.1486.7.camel@jb>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lilo wrote to an lvm disk
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
Date: Tue Apr  1 21:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I was having trouble earlier with lilo, and while configuring it, I
wrote it to the mbr on a disk I had lvm on.  The only place I found that
mentioned this problem was in an email to this list in march 2001, over
two years ago.  It basically said that the lvm disk would be hosed.  Is
there anyway to get the data off the disk? or repair it?

Also, in the future, could I use the mbr if the pv was a partition
rather than the whole disk?

thanks,

Justin
