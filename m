Return-Path: <dick@britain.agilent.com>
Date: Mon, 28 May 2001 13:44:34 +0100 (BST)
From: Dick Middleton <dick@britain.agilent.com>
Message-Id: <200105281244.NAA14609@queeg.britain.agilent.com>
In-reply-to: "Heinz J. Mauelshagen"'s message of Mon, 28 May 2001 11:20:30 +0000 <20010528112030.H26710@sistina.com>
Subject: [linux-lvm] Root on LVM and vgscan
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks for your answers - as usual they provoke more questions...

>  On Fri, May 25, 2001 at 09:28:34AM +0100, Dick Middleton wrote:
>  > I have root running on lvm on sw raid partitions on linux 2.2.18.  It all
>  > works fine.  However I have had difficulty during booting after adding new
>  > LVs.  The symptom is that the initial mounts of LVs fails or the wrong
>  > partition is mounted.
>  > 
>  > What happens is that vgscan is run during the initrd phase and so the lvmtab
>  > is updated on the ram disk.  Once the root file system on the hard disk has
>  > been mounted the lvmtab on that comes into use.  That has not been updated by
>  > vgscan and so does not reflect the changes. 
>  > 
>  > Obviously it's possible to run vgscan again (between remounting root rw and
>  > checking the other discs) to update the lvmtab but it does beg a few
>  > questions.

>  Yes, that's the option (forcing some overhead).
>  The other would be to get the actual /etc/lvmtab* from the initial ram disk :-)

Ah yes, I discovered that it lives in /initrd! Can I assume from this that
it's safe to copy the lvmtab.  Is that a good solution?

>  > 
>  > 1) why does mount use the data in lvmtab and not in /proc to find out about
>  >    active VGs?

>  mount doesn't access /etc/lvmtab* at all.

Now you've got me.  Why/how does mount mount the wrong partition when lvmtab
is out of date if it doesn't access lvmtab? Are /dev/<vg>/<lv> updated by
vgscan as well? It looked to me as if they weren't. Do they need to be copied
from /initrd too?

What should I read to better understand how all this works?

Dick
