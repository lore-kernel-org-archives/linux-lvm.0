Subject: Re: [linux-lvm] 2.4.17rc2
References: <20011221022542.GH15643@auctionwatch.com>
From: Urs Thuermann <urs@isnogud.escape.de>
In-Reply-To: <20011221022542.GH15643@auctionwatch.com>; from Petro on Thu,
    20 Dec 2001 18:25:42 -0800
Message-Id: <m2k7vfacfj.fsf@isnogud.escape.de>
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
Date: Sat Dec 22 02:28:01 2001
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Petro <petro@auctionwatch.com> writes:

> Did a bunch of stuff get updated in the 2.4.17rc2 kernel? I ask because
> I just applied that patch to 2.4.16, and at one point patch stated it
> looked like a patch had already been applied. 

Yes, you probably mean the patch from patch-2.4.17

    --- linux-2.4.16/drivers/md/lvm-snap.c  Mon Nov 12 17:34:20 2001
    +++ linux/drivers/md/lvm-snap.c Fri Dec 21 16:40:32 2001
    @@ -542,8 +542,6 @@
     
     void lvm_snapshot_release(lv_t * lv)
     {
    -       int     nbhs = KIO_MAX_SECTORS;
    -
    	    if (lv->lv_block_exception)
    	    {
    		    vfree(lv->lv_block_exception);

which seems already to be in LVM-1.0.1.  This patch in uncritical
anyway since it does nothing, except cosmetic cleanup (removal of
unused variable).


urs
