From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM sharing questions
Message-ID: <20031202140900.GD2219@tykepenguin.com>
References: <03c901c3b84b$84dadde0$8d7ba8c0@ecrosstrade.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03c901c3b84b$84dadde0$8d7ba8c0@ecrosstrade.com>
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
Date: Tue Dec  2 08:10:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 01, 2003 at 12:41:38PM -0800, John S. Hoch wrote:
>    I have two questions regarding the sharing of LVM volumes in Linux.  I
>    have read the text in the LVM Howto.
>     
>    Suppose I have two sets of volume groups.  One set belongs to node A.  The
>    other set belongs to node B.  I plan to use "vgchange -ay vgname" to bring
>    up the volume groups during boot.  Each node only brings up the volume
>    groups that belong to it.  That is why I specify the volume-group name to
>    vgchange.
>     
>    My questions concern vgscan. 
>     
>    1.  Suppose I only plan to run vgscan during boot.  Later, if I make
>    changes to the LVM metadata for volume groups that belong to node A, I do
>    not plan to inform node B (I do not run vgscan on node B after the changes
>    are made).  So, node B will not have uptodate information on the volume
>    groups that belong to node A, but those groups are not available to node B
>    anyway (they have never been made available to node B by running vgchange
>    on node B).  In this way, I do not need to shutdown node B for changes
>    that only affect node A.  Will this work?
>    2.  Suppose I do run vgscan on node B after changes to the LVM metdata are
>    made on node A.  Can I do this without following the sequence in the LVM
>    Howto (first issue "vgchange -an" on node B, then make the changes on node
>    A, then run vgscan on node B)?  I am hoping that I do not need to issue
>    "vgchange -an" on node B because I am not making changes to volume groups
>    that are available to node B.

That should be fine. As the volume groups are, of course, on different physical
volumes you don't need to run vgscan (or if you do it won't affect the VG you 
are using).

One thing you wil have to be careful of is that the metadata backups on the two
machines could end up being out of step, so make sure you do only use VG "A" on
node "A" and VG "B" on node "B". Always do a vgscan if you need to change this.

-- 

patrick
