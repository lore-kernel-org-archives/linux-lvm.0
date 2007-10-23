Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l9N18KvM022003
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 21:08:20 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Ik8Fo-0004zI-Ex
	for linux-lvm@redhat.com; Tue, 23 Oct 2007 02:08:20 +0100
Date: Tue, 23 Oct 2007 02:08:20 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvreduce
Message-ID: <20071023010820.GU10006@agk.fab.redhat.com>
References: <471C29F2.5090408@redhat.com>
	<Pine.LNX.4.44.0710222032460.11239-100000@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0710222032460.11239-100000@bmsred.bmsi.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Oct 22, 2007 at 08:36:26PM -0400, Stuart D. Gathman wrote:
> On Mon, 22 Oct 2007, Humble Chirammal wrote:
> >   One of the customer ran  "lvreduce" command without reducing the 
> > filesystem (resize2fs ).  After the system was rebooted got this error.
> > <<snip>>
> > The filesystem size (according to the superblock) is 19922944 blocks
> > The physical size of the device is 13369344 blocks
> > Either the superblock or the partition table is likely to be corrupt!
> >  <<snip>>
> > Is there any way for data recovery???
> Stop them from doing anymore LVM operations until recovery.
> If nothing else has been done, undo the lvreduce with vgrestore.
> LVM keeps backup versions of the metadata (/etc/lvm/archive on my
> system).  I'll let the experts provide the exact syntax.  I haven't
> had to do it yet :-)
> If they have used the freed extents (lvextend or lvcreate or ...),
> then they are hosed.
 
Indeed - as long as they made no other changes, 'vgcfgrestore' will undo the
lvreduce operation.  You can use '-ll' to check.

If they're using X, suggest trying the GUI (packages system-config-lvm)
interface to carry out resizing.

Alasdair
-- 
agk@redhat.com
