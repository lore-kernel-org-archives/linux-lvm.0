Subject: Re: [linux-lvm] Red Hat Advanced Server 2.1 - LVM 1.0.8
From: John DeFranco <defranco@cup.hp.com>
In-Reply-To: <20040203173119.17166.qmail@web9605.mail.yahoo.com>
References: <20040203173119.17166.qmail@web9605.mail.yahoo.com>
Message-Id: <1075831607.2811.1531.camel@airwolf.cup.hp.com>
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
Date: Tue Feb  3 13:08:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

These are known issues with lvm on rh as2.1. I've resolved these by
doing the following:

1.in drivers/md/lvm-snap.c

Add the line
int nbhs = KIO_MAX_SECTORS; right after the line 
int ret, max_sectors;

Then change the lines:
ret = alloc_kiovec(1, &lv_snap->lv_iobuf); to
ret = alloc_kiovec_sz(1, &lv_snap->lv_iobuf, &nbhs);

and

ret = alloc_kiovec(1, &lv_snap->lv_COW_table_iobuf); to
ret = alloc_kiovec_sz(1, &lv_snap->lv_COW_table_iobuf, &nbhs);

and

free_kiovec(1, &lv_snap->lv_COW_table_iobuf); to
free_kiovec_sz(1, &lv_snap->lv_COW_table_iobuf, &nbhs);

and

free_kiovec(1, &lv_snap->lv_iobuf); to
free_kiovec_sz(1, &lv_snap->lv_iobuf, &nbhs);

2. Then in drivers/block/genhd.c I added:

struct gendisk *gendisk_head;
EXPORT_SYMBOL(gendisk_head);

right after the static struct gendisk *gendisk_head;


Hope this helps.

On Tue, 2004-02-03 at 09:31, Mircea Stanescu wrote:
> Hello,
> i try upgrade the LVM to 1.0.8 version with Red Hat
> Advanced Server 2.1 and curent version of the kernel
> source kernel-source-2.4.9-e.35 .
> The hardware is an ibm x345 sserver with Serveraid 6
> chipset 
> I want to use the lvm as module .
> After Patching the kernel and compile i try to use 
> this new module lvm-mod .
> I encountered 3 error :
> lvm-mod.o: unresolved symbol alloc_kiovec
> lvm-mod.o: unresolved symbol gendisk_head
> lvm-mod.0: unresolved symbol free_kiovec
> Of course i resolv with alloc_kiove free_kiovec with
> the ouput of the compiler was clear and cannot solve
> the problem with "unresolved symbol gendisk_head "
> The ouput of the compiler was 
> lvm.c:439: warning: static declaration for
> `add_gendisk_Rsmp_8afbb461' follows non-static
> lvm.c:457: warning: static declaration for
> `del_gendisk_Rsmp_f58c61d8' follows non-static
> I know the Red Hat don't support LVm on this
> distribution but what are tthe cause of the error and 
> how to correct this .
> Thank to any suggestion ,
> Mircea 
> 
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free web site building tool. Try it!
> http://webhosting.yahoo.com/ps/sb/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
John DeFranco                   Hewlett-Packard Company
john.defranco@hp.com            Availability Clusters Solution Division
phone: 408-447-7543             19111 Pruneridge Ave, M/S 4101
fax: 408-447-0056               Cupertino, CA 95014
