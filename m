From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] VFS-Patch
Message-ID: <20011029084748.E4182@tykepenguin.com>
References: <20011026140658.57325.qmail@web14401.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011026140658.57325.qmail@web14401.mail.yahoo.com>; from shahi_aman@yahoo.com on Fri, Oct 26, 2001 at 07:06:58AM -0700
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
Date: Mon Oct 29 02:59:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 26, 2001 at 07:06:58AM -0700, Aman Shahi wrote:
> 
> Hi Patrick,
> I tried with both 2.4.12-ac5 and 2.4.12-ac6 yesterday.
> Kernel compilation was giving error on alloc_kiovec
> and free_kiovec in lvm-snap.c. I replaced them with
> alloc_kiovec_sz and free_kiovec_sz and added one more
> int pointer in the calls. I am not sure whether that
> was proper, but I was able to compile the kernel. I
> was using 2.4.11 VFS-lock patch as u said.
> 
> But when using snapshot my Machine got hung. I tried
> 2-3 times with both ac5 and ac6. But all the time the
> machine got hund and FS got corrupted.
> 
> What might have I done wrong ?

That last parameter to alloc/free_kiovec_sz is the size of the
vector - it should be a pointer to an int that has the value
KIO_MAX_SECTORS

eg:


        int ret, max_sectors;
        int nbhs = KIO_MAX_SECTORS;

        /* allocate kiovec to do chunk io */
        ret = alloc_kiovec_sz(1, &lv_snap->lv_iobuf, &nbhs);
        if (ret) goto out;

        max_sectors = KIO_MAX_SECTORS << (PAGE_SHIFT-9);

        ret = lvm_snapshot_alloc_iobuf_pages(lv_snap->lv_iobuf, max_sectors);
        if (ret) goto out_free_kiovec;

        /* allocate kiovec to do exception table io */
        ret = alloc_kiovec_sz(1, &lv_snap->lv_COW_table_iobuf, &nbhs);
        if (ret) goto out_free_kiovec;


Unfortunatley there's no sensible way in the patch builder to detect an ac
kernel that has this API change so it can;t be done automatically at present.




patrick
