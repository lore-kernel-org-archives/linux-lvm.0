Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l060nnAl011512
	for <linux-lvm@redhat.com>; Fri, 5 Jan 2007 19:49:49 -0500
Received: from bay0-omc3-s27.bay0.hotmail.com (bay0-omc3-s27.bay0.hotmail.com
	[65.54.246.227])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l060nnQR026213
	for <linux-lvm@redhat.com>; Fri, 5 Jan 2007 19:49:49 -0500
Message-ID: <BAY123-F22AC1D482784952B5317BBF9BE0@phx.gbl>
From: "Sergej Smirnov" <foma3@hotmail.com>
Date: Sat, 06 Jan 2007 00:49:40 +0000
Mime-Version: 1.0
Subject: [linux-lvm] Re: Reverting "bd_mount_mutex" to "bd_mount_sem"
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: srinivasa@in.ibm.com

Reply-To: foma3@hotmail.com

Hi.
You need comment? I have some for you:
----------------------------------------------------------------------
#if 0
/* old: */
#define MOUNT_SEMUTEX_IS_MUTEX yes
#undef MOUNT_SEMUTEX_IS_SEMAPHORE
#else
/* new: */
#undef MOUNT_SEMUTEX_IS_MUTEX
#define MOUNT_SEMUTEX_IS_SEMAPHORE yes
#endif
----------------------------------------------------------------------
#ifdef MOUNT_SEMUTEX_IS_MUTEX
#ifdef MOUNT_SEMUTEX_IS_SEMAPHORE
#error "both defined"
#else
#define INIT_MOUNT_SEMUTEX(x) mutex_init(&x->bd_mount_mutex)
#define LOCK_MOUNT_SEMUTEX(x) mutex_lock(&x->bd_mount_mutex)
#define UNLOCK_MOUNT_SEMUTEX(x) mutex_unlock(&x->bd_mount_mutex)
#endif
#else
#ifdef MOUNT_SEMUTEX_IS_SEMAPHORE
#define INIT_MOUNT_SEMUTEX(x) sema_init(&x->bd_mount_sem, 1)
#define LOCK_MOUNT_SEMUTEX(x) down(&x->bd_mount_sem)
#define UNLOCK_MOUNT_SEMUTEX(x) up(&x->bd_mount_sem)
#else
#error "none defined"
#endif
#endif
----------------------------------------------------------------------
   	{
   		memset(bdev, 0, sizeof(*bdev));
   		mutex_init(&bdev->bd_mutex);
--		mutex_init(&bdev->bd_mount_mutex);
-+		sema_init(&bdev->bd_mount_sem, 1);
++		INIT_MOUNT_SEMUTEX(bdev);
   		INIT_LIST_HEAD(&bdev->bd_inodes);
   		INIT_LIST_HEAD(&bdev->bd_list);
   #ifdef CONFIG_SYSFS
----------------------------------------------------------------------
   {
   	struct super_block *sb;

--	mutex_lock(&bdev->bd_mount_mutex);
-+	down(&bdev->bd_mount_sem);
++	LOCK_MOUNT_SEMUTEX(bdev);
   	sb = get_super(bdev);
   	if (sb && !(sb->s_flags & MS_RDONLY)) {
   		sb->s_frozen = SB_FREEZE_WRITE;
----------------------------------------------------------------------
   		drop_super(sb);
   	}

--	mutex_unlock(&bdev->bd_mount_mutex);
-+	up(&bdev->bd_mount_sem);
++	UNLOCK_MOUNT_SEMUTEX(bdev);
   }
   EXPORT_SYMBOL(thaw_bdev);

----------------------------------------------------------------------
   	 * will protect the lockfs code from trying to start a snapshot
   	 * while we are mounting
   	 */
--	mutex_lock(&bdev->bd_mount_mutex);
-+	down(&bdev->bd_mount_sem);
++	LOCK_MOUNT_SEMUTEX(bdev);
   	s = sget(fs_type, test_bdev_super, set_bdev_super, bdev);
--	mutex_unlock(&bdev->bd_mount_mutex);
-+	up(&bdev->bd_mount_sem);
++	UNLOCK_MOUNT_SEMUTEX(bdev);
   	if (IS_ERR(s))
   		goto error_s;

----------------------------------------------------------------------
   	struct inode *		bd_inode;	/* will die */
   	int			bd_openers;
   	struct mutex		bd_mutex;	/* open/close mutex */
--	struct mutex		bd_mount_mutex;	/* mount mutex */
-+	struct semaphore        bd_mount_sem;
++#ifdef MOUNT_SEMUTEX_IS_MUTEX
++	struct mutex		bd_mount_mutex;	/* mount mutex */
++#endif
++#ifdef MOUNT_SEMUTEX_IS_SEMAPHORE
++	struct semaphore        bd_mount_sem;
++#endif
   	struct list_head	bd_inodes;
   	void *			bd_holder;
   	int			bd_holders;
----------------------------------------------------------------------
The End.
2007-01-03T06:20:00+0000 foma@pc.somewhere.over.the.ru

_________________________________________________________________
FREE pop-up blocking with the new MSN Toolbar - get it now! 
http://toolbar.msn.click-url.com/go/onm00200415ave/direct/01/
