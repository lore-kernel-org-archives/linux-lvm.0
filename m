Message-ID: <B45465FD9C23D21193E90000F8D0F3DF6835E8@mailsrv.linkvest.ch>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Subject: [linux-lvm] RE: LVM 2.2.16
Date: Thu, 10 Aug 2000 10:05:37 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C002A1.C4CA1D3B"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: 'Daniel Mehrmann' <daniel@mehrmann.ping-net.de>
Cc: linux-lvm@msede.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C002A1.C4CA1D3B
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Yes, I modified ll_rw_block.c to make it compile (not too difficult =
tought
I'm not a kernel specialist.
Then everything works except that I have strange locks when doing LVM + =
raid
hot-swap!

Here is the ll_rw_block.c file. Hope it will work for you.
If it works, could you please make and distribute a raid+LVM for 2.2.16
patch?

Thanks
-jec

> -----Original Message-----
> From: Daniel Mehrmann [mailto:daniel@mehrmann.ping-net.de]
> Sent: mercredi, 9. ao=FBt 2000 21:16
> To: Jean-Eric Cuendet
> Subject: Re: LVM 2.2.16
>=20
>=20
>=20
> -----Urspr=FCngliche Nachricht-----
> Von: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
> An: 'daniel@mehrmann.ping-net.de' <daniel@mehrmann.ping-net.de>
> Datum: Dienstag, 8. August 2000 07:50
> Betreff: LVM 2.2.16
>=20
>=20
> >
> >Hi,
> >I need LVM + Raid 0.90 on 2.2.16
> >Is it possible to use your patch? You say that we shouldn't=20
> use it! Is it a
> >stability problem or a patching problem?
> >I patched 2.2.16 with RAID + LVM : 2 files were not patched=20
> (rejected) but
> >it was easy to make it by hand
> >So, What's the problem with RAID + LVM?
>=20
>=20
> A patch and vars problem. The patch is stable ! Do you really=20
> patch and
> compiled it ?  Does it run??
> If it true can you send me your=20
> .../linux/drivers/block/ll_rw_block.c ?
> There should be a vars problem. (If it work of course there=20
> are no problems
> :-))
> Thanks
>=20
> Daniel
>=20
>=20
>=20


------_=_NextPart_000_01C002A1.C4CA1D3B
Content-Type: application/octet-stream;
	name="ll_rw_blk.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="ll_rw_blk.c"

/*=0A=
 *  linux/drivers/block/ll_rw_blk.c=0A=
 *=0A=
 * Copyright (C) 1991, 1992 Linus Torvalds=0A=
 * Copyright (C) 1994,      Karl Keyte: Added support for disk =
statistics=0A=
 * Elevator latency, (C) 2000  Andrea Arcangeli <andrea@suse.de> =
SuSE=0A=
 */=0A=
=0A=
/*=0A=
 * This handles all read/write requests to block devices=0A=
 */=0A=
#include <linux/sched.h>=0A=
#include <linux/kernel.h>=0A=
#include <linux/kernel_stat.h>=0A=
#include <linux/errno.h>=0A=
#include <linux/string.h>=0A=
#include <linux/config.h>=0A=
#include <linux/locks.h>=0A=
#include <linux/mm.h>=0A=
#include <linux/init.h>=0A=
=0A=
#include <asm/system.h>=0A=
#include <asm/io.h>=0A=
#include <asm/uaccess.h>=0A=
#include <linux/blk.h>=0A=
#include <linux/raid/md.h>=0A=
=0A=
#include <linux/module.h>=0A=
=0A=
#if defined CONFIG_BLK_DEV_LVM || defined CONFIG_BLK_DEV_LVM_MODULE=0A=
#include <linux/lvm.h>=0A=
   int ( *lvm_map_ptr) ( int, kdev_t *, unsigned long *,=0A=
                         unsigned long, int) =3D NULL;=0A=
#endif=0A=
=0A=
/*=0A=
 * The request-struct contains all necessary data=0A=
 * to load a nr of sectors into memory=0A=
 */=0A=
static struct request all_requests[NR_REQUEST];=0A=
=0A=
/*=0A=
 * The "disk" task queue is used to start the actual requests=0A=
 * after a plug=0A=
 */=0A=
DECLARE_TASK_QUEUE(tq_disk);=0A=
=0A=
/*=0A=
 * Protect the request list against multiple users..=0A=
 *=0A=
 * With this spinlock the Linux block IO subsystem is 100% SMP =
threaded=0A=
 * from the IRQ event side, and almost 100% SMP threaded from the =
syscall=0A=
 * side (we still have protect against block device array operations, =
and=0A=
 * the do_request() side is casually still unsafe. The kernel lock =
protects=0A=
 * this part currently.).=0A=
 *=0A=
 * there is a fair chance that things will work just OK if these =
functions=0A=
 * are called with no global kernel lock held ...=0A=
 */=0A=
spinlock_t io_request_lock =3D SPIN_LOCK_UNLOCKED;=0A=
=0A=
/*=0A=
 * per-major idle-IO detection=0A=
 */=0A=
unsigned long io_events[MAX_BLKDEV] =3D {0, };=0A=
=0A=
/*=0A=
 * used to wait on when there are no free requests=0A=
 */=0A=
struct wait_queue * wait_for_request;=0A=
=0A=
/* This specifies how many sectors to read ahead on the disk.  */=0A=
=0A=
int read_ahead[MAX_BLKDEV];=0A=
=0A=
/* blk_dev_struct is:=0A=
 *	*request_fn=0A=
 *	*current_request=0A=
 */=0A=
struct blk_dev_struct blk_dev[MAX_BLKDEV]; /* initialized by =
blk_dev_init() */=0A=
=0A=
/*=0A=
 * blk_size contains the size of all block-devices in units of 1024 =
byte=0A=
 * sectors:=0A=
 *=0A=
 * blk_size[MAJOR][MINOR]=0A=
 *=0A=
 * if (!blk_size[MAJOR]) then no minor size checking is done.=0A=
 */=0A=
int * blk_size[MAX_BLKDEV];=0A=
=0A=
/*=0A=
 * blksize_size contains the size of all block-devices:=0A=
 *=0A=
 * blksize_size[MAJOR][MINOR]=0A=
 *=0A=
 * if (!blksize_size[MAJOR]) then 1024 bytes is assumed.=0A=
 */=0A=
int * blksize_size[MAX_BLKDEV];=0A=
=0A=
/*=0A=
 * hardsect_size contains the size of the hardware sector of a =
device.=0A=
 *=0A=
 * hardsect_size[MAJOR][MINOR]=0A=
 *=0A=
 * if (!hardsect_size[MAJOR])=0A=
 *		then 512 bytes is assumed.=0A=
 * else=0A=
 *		sector_size is hardsect_size[MAJOR][MINOR]=0A=
 * This is currently set by some scsi devices and read by the msdos fs =
driver.=0A=
 * Other uses may appear later.=0A=
 */=0A=
int * hardsect_size[MAX_BLKDEV];=0A=
=0A=
/*=0A=
 * The following tunes the read-ahead algorithm in mm/filemap.c=0A=
 */=0A=
int * max_readahead[MAX_BLKDEV];=0A=
=0A=
/*=0A=
 * Max number of sectors per request=0A=
 */=0A=
int * max_sectors[MAX_BLKDEV];=0A=
=0A=
/*=0A=
 * Max number of segments per request=0A=
 */=0A=
int * max_segments[MAX_BLKDEV];=0A=
=0A=
static inline int get_max_sectors(kdev_t dev)=0A=
{=0A=
	if (!max_sectors[MAJOR(dev)])=0A=
		return MAX_SECTORS;=0A=
	return max_sectors[MAJOR(dev)][MINOR(dev)];=0A=
}=0A=
=0A=
static inline int get_max_segments(kdev_t dev)=0A=
{=0A=
	if (!max_segments[MAJOR(dev)])=0A=
		return MAX_SEGMENTS;=0A=
	return max_segments[MAJOR(dev)][MINOR(dev)];=0A=
}=0A=
=0A=
/*=0A=
 * Is called with the request spinlock aquired.=0A=
 * NOTE: the device-specific queue() functions=0A=
 * have to be atomic!=0A=
 */=0A=
static inline struct request **get_queue(kdev_t dev)=0A=
{=0A=
	int major =3D MAJOR(dev);=0A=
	struct blk_dev_struct *bdev =3D blk_dev + major;=0A=
=0A=
	if (bdev->queue)=0A=
		return bdev->queue(dev);=0A=
	return &blk_dev[major].current_request;=0A=
}=0A=
=0A=
static inline int get_request_latency(elevator_t * elevator, int rw)=0A=
{=0A=
	int latency;=0A=
=0A=
	latency =3D elevator->read_latency;=0A=
	if (rw !=3D READ)=0A=
		latency =3D elevator->write_latency;=0A=
=0A=
	return latency;=0A=
}=0A=
=0A=
/*=0A=
 * remove the plug and let it rip..=0A=
 */=0A=
void unplug_device(void * data)=0A=
{=0A=
	struct blk_dev_struct * dev =3D (struct blk_dev_struct *) data;=0A=
	int queue_new_request=3D0;=0A=
	unsigned long flags;=0A=
=0A=
	spin_lock_irqsave(&io_request_lock,flags);=0A=
	if (dev->current_request =3D=3D &dev->plug) {=0A=
		struct request * next =3D dev->plug.next;=0A=
		dev->current_request =3D next;=0A=
		if (next || dev->queue) {=0A=
			dev->plug.next =3D NULL;=0A=
			queue_new_request =3D 1;=0A=
		}=0A=
	}=0A=
	if (queue_new_request)=0A=
		(dev->request_fn)();=0A=
=0A=
	spin_unlock_irqrestore(&io_request_lock,flags);=0A=
}=0A=
=0A=
/*=0A=
 * "plug" the device if there are no outstanding requests: this will=0A=
 * force the transfer to start only after we have put all the =
requests=0A=
 * on the list.=0A=
 *=0A=
 * This is called with interrupts off and no requests on the queue.=0A=
 * (and with the request spinlock aquired)=0A=
 */=0A=
static inline void plug_device(struct blk_dev_struct * dev)=0A=
{=0A=
	if (dev->current_request)=0A=
		return;=0A=
	dev->current_request =3D &dev->plug;=0A=
	queue_task(&dev->plug_tq, &tq_disk);=0A=
}=0A=
=0A=
/*=0A=
 * look for a free request in the first N entries.=0A=
 * NOTE: interrupts must be disabled on the way in (on SMP the request =
queue=0A=
 * spinlock has to be aquired), and will still be disabled on the way =
out.=0A=
 */=0A=
static inline struct request * get_request(int n, kdev_t dev)=0A=
{=0A=
	static struct request *prev_found =3D NULL, *prev_limit =3D NULL;=0A=
	register struct request *req, *limit;=0A=
=0A=
	if (n <=3D 0)=0A=
		panic("get_request(%d): impossible!\n", n);=0A=
=0A=
	limit =3D all_requests + n;=0A=
	if (limit !=3D prev_limit) {=0A=
		prev_limit =3D limit;=0A=
		prev_found =3D all_requests;=0A=
	}=0A=
	req =3D prev_found;=0A=
	for (;;) {=0A=
		req =3D ((req > all_requests) ? req : limit) - 1;=0A=
		if (req->rq_status =3D=3D RQ_INACTIVE)=0A=
			break;=0A=
		if (req =3D=3D prev_found)=0A=
			return NULL;=0A=
	}=0A=
	prev_found =3D req;=0A=
	req->rq_status =3D RQ_ACTIVE;=0A=
	req->rq_dev =3D dev;=0A=
	return req;=0A=
}=0A=
=0A=
/*=0A=
 * wait until a free request in the first N entries is available.=0A=
 */=0A=
static struct request * __get_request_wait(int n, kdev_t dev)=0A=
{=0A=
	register struct request *req;=0A=
	struct wait_queue wait =3D { current, NULL };=0A=
	unsigned long flags;=0A=
=0A=
	add_wait_queue(&wait_for_request, &wait);=0A=
	for (;;) {=0A=
		current->state =3D TASK_UNINTERRUPTIBLE;=0A=
		spin_lock_irqsave(&io_request_lock,flags);=0A=
		req =3D get_request(n, dev);=0A=
		spin_unlock_irqrestore(&io_request_lock,flags);=0A=
		if (req)=0A=
			break;=0A=
		run_task_queue(&tq_disk);=0A=
		schedule();=0A=
	}=0A=
	remove_wait_queue(&wait_for_request, &wait);=0A=
	current->state =3D TASK_RUNNING;=0A=
	return req;=0A=
}=0A=
=0A=
static inline struct request * get_request_wait(int n, kdev_t dev)=0A=
{=0A=
	register struct request *req;=0A=
	unsigned long flags;=0A=
=0A=
	spin_lock_irqsave(&io_request_lock,flags);=0A=
	req =3D get_request(n, dev);=0A=
	spin_unlock_irqrestore(&io_request_lock,flags);=0A=
	if (req)=0A=
		return req;=0A=
	return __get_request_wait(n, dev);=0A=
}=0A=
=0A=
/* RO fail safe mechanism */=0A=
=0A=
static long ro_bits[MAX_BLKDEV][8];=0A=
=0A=
int is_read_only(kdev_t dev)=0A=
{=0A=
	int minor,major;=0A=
=0A=
	major =3D MAJOR(dev);=0A=
	minor =3D MINOR(dev);=0A=
	if (major < 0 || major >=3D MAX_BLKDEV) return 0;=0A=
	return ro_bits[major][minor >> 5] & (1 << (minor & 31));=0A=
}=0A=
=0A=
void set_device_ro(kdev_t dev,int flag)=0A=
{=0A=
	int minor,major;=0A=
=0A=
	major =3D MAJOR(dev);=0A=
	minor =3D MINOR(dev);=0A=
	if (major < 0 || major >=3D MAX_BLKDEV) return;=0A=
	if (flag) ro_bits[major][minor >> 5] |=3D 1 << (minor & 31);=0A=
	else ro_bits[major][minor >> 5] &=3D ~(1 << (minor & 31));=0A=
}=0A=
=0A=
static inline void drive_stat_acct(int cmd, unsigned long =
nr_sectors,=0A=
				   short disk_index)=0A=
{=0A=
	kstat.dk_drive[disk_index]++;=0A=
	if (cmd =3D=3D READ) {=0A=
		kstat.dk_drive_rio[disk_index]++;=0A=
		kstat.dk_drive_rblk[disk_index] +=3D nr_sectors;=0A=
	} else if (cmd =3D=3D WRITE) {=0A=
		kstat.dk_drive_wio[disk_index]++;=0A=
		kstat.dk_drive_wblk[disk_index] +=3D nr_sectors;=0A=
	} else=0A=
		printk(KERN_ERR "drive_stat_acct: cmd not R/W?\n");=0A=
}=0A=
=0A=
static int blkelvget_ioctl(elevator_t * elevator, blkelv_ioctl_arg_t * =
arg)=0A=
{=0A=
	int ret;=0A=
	blkelv_ioctl_arg_t output;=0A=
=0A=
	output.queue_ID			=3D elevator->queue_ID;=0A=
	output.read_latency		=3D elevator->read_latency;=0A=
	output.write_latency		=3D elevator->write_latency;=0A=
	output.max_bomb_segments	=3D elevator->max_bomb_segments;=0A=
=0A=
	ret =3D -EFAULT;=0A=
	if (copy_to_user(arg, &output, sizeof(blkelv_ioctl_arg_t)))=0A=
		goto out;=0A=
	ret =3D 0;=0A=
 out:=0A=
	return ret;=0A=
}=0A=
=0A=
static int blkelvset_ioctl(elevator_t * elevator, const =
blkelv_ioctl_arg_t * arg)=0A=
{=0A=
	blkelv_ioctl_arg_t input;=0A=
	int ret;=0A=
=0A=
	ret =3D -EFAULT;=0A=
	if (copy_from_user(&input, arg, sizeof(blkelv_ioctl_arg_t)))=0A=
		goto out;=0A=
=0A=
	ret =3D -EINVAL;=0A=
	if (input.read_latency < 0)=0A=
		goto out;=0A=
	if (input.write_latency < 0)=0A=
		goto out;=0A=
	if (input.max_bomb_segments <=3D 0)=0A=
		goto out;=0A=
=0A=
	elevator->read_latency		=3D input.read_latency;=0A=
	elevator->write_latency		=3D input.write_latency;=0A=
	elevator->max_bomb_segments	=3D input.max_bomb_segments;=0A=
=0A=
	ret =3D 0;=0A=
 out:=0A=
	return ret;=0A=
}=0A=
=0A=
int blkelv_ioctl(kdev_t dev, unsigned long cmd, unsigned long arg)=0A=
{=0A=
	elevator_t * elevator =3D &blk_dev[MAJOR(dev)].elevator;=0A=
	blkelv_ioctl_arg_t * __arg =3D (blkelv_ioctl_arg_t *) arg;=0A=
=0A=
	switch (cmd) {=0A=
	case BLKELVGET:=0A=
		return blkelvget_ioctl(elevator, __arg);=0A=
	case BLKELVSET:=0A=
		return blkelvset_ioctl(elevator, __arg);=0A=
	}=0A=
	return -EINVAL;=0A=
}=0A=
=0A=
static inline int seek_to_not_starving_chunk(struct request ** req, int =
* lat)=0A=
{=0A=
	struct request * tmp =3D *req;=0A=
	int found =3D 0, pos =3D 0;=0A=
	int last_pos =3D 0, __lat =3D *lat;=0A=
=0A=
	do {=0A=
		if (tmp->elevator_latency <=3D 0)=0A=
		{=0A=
			*req =3D tmp;=0A=
			found =3D 1;=0A=
			last_pos =3D pos;=0A=
			if (last_pos >=3D __lat)=0A=
				break;=0A=
		}=0A=
		pos +=3D tmp->nr_segments;=0A=
	} while ((tmp =3D tmp->next));=0A=
	*lat -=3D last_pos;=0A=
=0A=
	return found;=0A=
}=0A=
=0A=
#define CASE_COALESCE_BUT_FIRST_REQUEST_MAYBE_BUSY	\=0A=
	     case IDE0_MAJOR:	/* same as HD_MAJOR */	\=0A=
	     case IDE1_MAJOR:				\=0A=
	     case FLOPPY_MAJOR:				\=0A=
	     case IDE2_MAJOR:				\=0A=
	     case IDE3_MAJOR:				\=0A=
	     case IDE4_MAJOR:				\=0A=
	     case IDE5_MAJOR:				\=0A=
	     case ACSI_MAJOR:				\=0A=
	     case MFM_ACORN_MAJOR:			\=0A=
             case MDISK_MAJOR:				\=0A=
             case DASD_MAJOR:=0A=
#define CASE_COALESCE_ALSO_FIRST_REQUEST	\=0A=
	     case SCSI_DISK0_MAJOR:		\=0A=
	     case SCSI_DISK1_MAJOR:		\=0A=
	     case SCSI_DISK2_MAJOR:		\=0A=
	     case SCSI_DISK3_MAJOR:		\=0A=
	     case SCSI_DISK4_MAJOR:		\=0A=
	     case SCSI_DISK5_MAJOR:		\=0A=
	     case SCSI_DISK6_MAJOR:		\=0A=
	     case SCSI_DISK7_MAJOR:		\=0A=
	     case SCSI_CDROM_MAJOR:		\=0A=
	     case DAC960_MAJOR+0:		\=0A=
	     case DAC960_MAJOR+1:		\=0A=
	     case DAC960_MAJOR+2:		\=0A=
	     case DAC960_MAJOR+3:		\=0A=
	     case DAC960_MAJOR+4:		\=0A=
	     case DAC960_MAJOR+5:		\=0A=
	     case DAC960_MAJOR+6:		\=0A=
	     case DAC960_MAJOR+7:		\=0A=
	     case COMPAQ_SMART2_MAJOR+0:	\=0A=
	     case COMPAQ_SMART2_MAJOR+1:	\=0A=
	     case COMPAQ_SMART2_MAJOR+2:	\=0A=
	     case COMPAQ_SMART2_MAJOR+3:	\=0A=
	     case COMPAQ_SMART2_MAJOR+4:	\=0A=
	     case COMPAQ_SMART2_MAJOR+5:	\=0A=
	     case COMPAQ_SMART2_MAJOR+6:	\=0A=
	     case COMPAQ_SMART2_MAJOR+7:=0A=
=0A=
#define elevator_starve_rest_of_queue(req)			\=0A=
do {								\=0A=
	struct request * tmp =3D (req);				\=0A=
	for ((tmp) =3D (tmp)->next; (tmp); (tmp) =3D (tmp)->next)	\=0A=
		(tmp)->elevator_latency--;			\=0A=
} while (0)=0A=
=0A=
static inline void elevator_queue(struct request * req,=0A=
				  struct request * tmp,=0A=
				  int latency,=0A=
				  struct blk_dev_struct * dev,=0A=
				  struct request ** queue_head)=0A=
{=0A=
	struct request * __tmp;=0A=
	int starving, __latency;=0A=
=0A=
	starving =3D seek_to_not_starving_chunk(&tmp, &latency);=0A=
	__tmp =3D tmp;=0A=
	__latency =3D latency;=0A=
=0A=
	for (;; tmp =3D tmp->next)=0A=
	{=0A=
		if ((latency -=3D tmp->nr_segments) <=3D 0)=0A=
		{=0A=
			tmp =3D __tmp;=0A=
			latency =3D __latency - tmp->nr_segments;=0A=
=0A=
			if (starving)=0A=
				break;=0A=
=0A=
			switch (MAJOR(req->rq_dev))=0A=
			{=0A=
			CASE_COALESCE_BUT_FIRST_REQUEST_MAYBE_BUSY=0A=
				if (tmp =3D=3D dev->current_request)=0A=
			default:=0A=
					goto link;=0A=
			CASE_COALESCE_ALSO_FIRST_REQUEST=0A=
			}=0A=
=0A=
			latency +=3D tmp->nr_segments;=0A=
			req->next =3D tmp;=0A=
			*queue_head =3D req;=0A=
			goto after_link;=0A=
		}=0A=
=0A=
		if (!tmp->next)=0A=
			break;=0A=
=0A=
		{=0A=
			const int after_current =3D IN_ORDER(tmp,req);=0A=
			const int before_next =3D IN_ORDER(req,tmp->next);=0A=
=0A=
			if (!IN_ORDER(tmp,tmp->next)) {=0A=
				if (after_current || before_next)=0A=
					break;=0A=
			} else {=0A=
				if (after_current && before_next)=0A=
					break;=0A=
			}=0A=
		}=0A=
	}=0A=
=0A=
 link:=0A=
	req->next =3D tmp->next;=0A=
	tmp->next =3D req;=0A=
=0A=
 after_link:=0A=
	req->elevator_latency =3D latency;=0A=
=0A=
	elevator_starve_rest_of_queue(req);=0A=
}=0A=
=0A=
/*=0A=
 * add-request adds a request to the linked list.=0A=
 * It disables interrupts (aquires the request spinlock) so that it can =
muck=0A=
 * with the request-lists in peace. Thus it should be called with no =
spinlocks=0A=
 * held.=0A=
 *=0A=
 * By this point, req->cmd is always either READ/WRITE, never =
READA/WRITEA,=0A=
 * which is important for drive_stat_acct() above.=0A=
 */=0A=
=0A=
void add_request(struct blk_dev_struct * dev, struct request * req)=0A=
{=0A=
	int major =3D MAJOR(req->rq_dev);=0A=
	int minor =3D MINOR(req->rq_dev);=0A=
	struct request * tmp, **current_request;=0A=
	short		 disk_index;=0A=
	unsigned long flags;=0A=
	int queue_new_request =3D 0;=0A=
	int latency;=0A=
=0A=
	switch (major) {=0A=
		case DAC960_MAJOR+0:=0A=
			disk_index =3D (minor & 0x00f8) >> 3;=0A=
			break;=0A=
		case SCSI_DISK0_MAJOR:=0A=
		case COMPAQ_SMART2_MAJOR+0:=0A=
		case COMPAQ_SMART2_MAJOR+1:=0A=
		case COMPAQ_SMART2_MAJOR+2:=0A=
		case COMPAQ_SMART2_MAJOR+3:=0A=
		case COMPAQ_SMART2_MAJOR+4:=0A=
		case COMPAQ_SMART2_MAJOR+5:=0A=
		case COMPAQ_SMART2_MAJOR+6:=0A=
		case COMPAQ_SMART2_MAJOR+7:=0A=
			disk_index =3D (minor & 0x00f0) >> 4;=0A=
			break;=0A=
		case IDE0_MAJOR:	/* same as HD_MAJOR */=0A=
		case XT_DISK_MAJOR:=0A=
			disk_index =3D (minor & 0x0040) >> 6;=0A=
			break;=0A=
		case IDE1_MAJOR:=0A=
			disk_index =3D ((minor & 0x0040) >> 6) + 2;=0A=
			break;=0A=
		default:=0A=
			disk_index =3D -1;=0A=
			break;=0A=
	}=0A=
	if (disk_index >=3D 0 && disk_index < 4)=0A=
		drive_stat_acct(req->cmd, req->nr_sectors, disk_index);=0A=
=0A=
	latency =3D get_request_latency(&dev->elevator, req->cmd);=0A=
=0A=
	/*=0A=
	 * We use the goto to reduce locking complexity=0A=
	 */=0A=
	spin_lock_irqsave(&io_request_lock,flags);=0A=
	current_request =3D get_queue(req->rq_dev);=0A=
=0A=
	if (req->bh)=0A=
		mark_buffer_clean(req->bh);=0A=
	if (!(tmp =3D *current_request)) {=0A=
		req->next =3D NULL;=0A=
		req->elevator_latency =3D latency;=0A=
		*current_request =3D req;=0A=
		if (dev->current_request !=3D &dev->plug)=0A=
			queue_new_request =3D 1;=0A=
		goto out;=0A=
	}=0A=
	elevator_queue(req, tmp, latency, dev, current_request);=0A=
=0A=
/* for SCSI devices, call request_fn unconditionally */=0A=
	if (scsi_blk_major(major) ||=0A=
            (major >=3D DAC960_MAJOR+0 && major <=3D DAC960_MAJOR+7) =
||=0A=
            (major >=3D COMPAQ_SMART2_MAJOR+0 &&=0A=
             major <=3D COMPAQ_SMART2_MAJOR+7))=0A=
		queue_new_request =3D 1;=0A=
=0A=
out:=0A=
	if (queue_new_request)=0A=
		(dev->request_fn)();=0A=
	spin_unlock_irqrestore(&io_request_lock,flags);=0A=
}=0A=
=0A=
/*=0A=
 * Has to be called with the request spinlock aquired=0A=
 */=0A=
static inline void attempt_merge (struct request *req,=0A=
				  int max_sectors,=0A=
				  int max_segments)=0A=
{=0A=
	struct request *next =3D req->next;=0A=
	int total_segments;=0A=
=0A=
	if (!next)=0A=
		return;=0A=
	if (req->sector + req->nr_sectors !=3D next->sector)=0A=
		return;=0A=
	if (next->sem || req->cmd !=3D next->cmd || req->rq_dev !=3D =
next->rq_dev ||=0A=
	    req->nr_sectors + next->nr_sectors > max_sectors)=0A=
		return;=0A=
	total_segments =3D req->nr_segments + next->nr_segments;=0A=
	if (req->bhtail->b_data + req->bhtail->b_size =3D=3D =
next->bh->b_data)=0A=
		total_segments--;=0A=
	if (total_segments > max_segments)=0A=
		return;=0A=
	if (next->elevator_latency < req->elevator_latency)=0A=
		req->elevator_latency =3D next->elevator_latency;=0A=
	req->bhtail->b_reqnext =3D next->bh;=0A=
	req->bhtail =3D next->bhtail;=0A=
	req->nr_sectors +=3D next->nr_sectors;=0A=
	req->nr_segments =3D total_segments;=0A=
	next->rq_status =3D RQ_INACTIVE;=0A=
	req->next =3D next->next;=0A=
	wake_up (&wait_for_request);=0A=
}=0A=
=0A=
#define read_pendings(req)			\=0A=
({						\=0A=
	int __ret =3D 0;				\=0A=
	struct request * tmp =3D (req);		\=0A=
	do {					\=0A=
		if (tmp->cmd =3D=3D READ)		\=0A=
		{				\=0A=
			__ret =3D 1;		\=0A=
			break;			\=0A=
		}				\=0A=
		tmp =3D tmp->next;		\=0A=
	} while (tmp);				\=0A=
	__ret;					\=0A=
})=0A=
=0A=
void make_request(int major, int rw, struct buffer_head * bh)=0A=
{=0A=
	unsigned int sector, count;=0A=
	struct request * req, * prev;=0A=
	int rw_ahead, max_req, max_sectors, max_segments;=0A=
	unsigned long flags;=0A=
	int latency, starving;=0A=
=0A=
	count =3D bh->b_size >> 9;=0A=
	sector =3D bh->b_rsector;=0A=
=0A=
	/* Uhhuh.. Nasty dead-lock possible here.. */=0A=
	if (buffer_locked(bh))=0A=
		return;=0A=
	/* Maybe the above fixes it, and maybe it doesn't boot. Life is =
interesting */=0A=
	lock_buffer(bh);=0A=
	if (!buffer_lowprio(bh))=0A=
		io_events[major]++;=0A=
=0A=
	if (blk_size[major]) {=0A=
		unsigned long maxsector =3D (blk_size[major][MINOR(bh->b_rdev)] << 1) =
+ 1;=0A=
=0A=
		if (maxsector < count || maxsector - count < sector) {=0A=
			bh->b_state &=3D (1 << BH_Lock);=0A=
			/* This may well happen - the kernel calls bread()=0A=
			   without checking the size of the device, e.g.,=0A=
			   when mounting a device. */=0A=
			printk(KERN_INFO=0A=
			       "attempt to access beyond end of device\n");=0A=
			printk(KERN_INFO "%s: rw=3D%d, want=3D%d, limit=3D%d\n",=0A=
			       kdevname(bh->b_rdev), rw,=0A=
			       (sector + count)>>1,=0A=
			       blk_size[major][MINOR(bh->b_rdev)]);=0A=
			printk(KERN_INFO "dev %s blksize=3D%d blocknr=3D%ld sector=3D%ld =
size=3D%ld count=3D%d\n",=0A=
				kdevname(bh->b_dev),=0A=
				blksize_size[major][MINOR(bh->b_dev)],=0A=
				bh->b_blocknr, bh->b_rsector, bh->b_size, bh->b_count);=0A=
							=0A=
			goto end_io;=0A=
		}=0A=
	}=0A=
=0A=
	rw_ahead =3D 0;	/* normal case; gets changed below for READA/WRITEA =
*/=0A=
	switch (rw) {=0A=
		case READA:=0A=
			rw_ahead =3D 1;=0A=
			rw =3D READ;	/* drop into READ */=0A=
		case READ:=0A=
			if (buffer_uptodate(bh)) /* Hmmph! Already have it */=0A=
				goto end_io;=0A=
			kstat.pgpgin++;=0A=
			max_req =3D NR_REQUEST;	/* reads take precedence */=0A=
			break;=0A=
		case WRITEA:=0A=
			rw_ahead =3D 1;=0A=
			rw =3D WRITE;	/* drop into WRITE */=0A=
		case WRITE:=0A=
			if (!buffer_dirty(bh))   /* Hmmph! Nothing to write */=0A=
				goto end_io;=0A=
			/* We don't allow the write-requests to fill up the=0A=
			 * queue completely:  we want some room for reads,=0A=
			 * as they take precedence. The last third of the=0A=
			 * requests are only for reads.=0A=
			 */=0A=
			kstat.pgpgout++;=0A=
			max_req =3D (NR_REQUEST * 2) / 3;=0A=
			break;=0A=
		default:=0A=
			printk(KERN_ERR "make_request: bad block dev cmd,"=0A=
			       " must be R/W/RA/WA\n");=0A=
			goto end_io;=0A=
	}=0A=
=0A=
/* look for a free request. */=0A=
       /* Loop uses two requests, 1 for loop and 1 for the real =
device.=0A=
	* Cut max_req in half to avoid running out and deadlocking. */=0A=
	 if ((major =3D=3D LOOP_MAJOR) || (major =3D=3D NBD_MAJOR))=0A=
	     max_req >>=3D 1;=0A=
=0A=
	/*=0A=
	 * Try to coalesce the new request with old requests=0A=
	 */=0A=
	max_sectors =3D get_max_sectors(bh->b_rdev);=0A=
	max_segments =3D get_max_segments(bh->b_rdev);=0A=
=0A=
	latency =3D get_request_latency(&blk_dev[major].elevator, rw);=0A=
=0A=
	/*=0A=
	 * Now we acquire the request spinlock, we have to be mega careful=0A=
	 * not to schedule or do something nonatomic=0A=
	 */=0A=
	spin_lock_irqsave(&io_request_lock,flags);=0A=
	req =3D *get_queue(bh->b_rdev);=0A=
	if (!req) {=0A=
		/* MD and loop can't handle plugging without deadlocking */=0A=
		if (major !=3D MD_MAJOR && major !=3D LOOP_MAJOR &&=0A=
		#if defined CONFIG_BLK_DEV_LVM || defined =
CONFIG_BLK_DEV_LVM_MODULE=0A=
		         major !=3D DDV_MAJOR && major !=3D NBD_MAJOR &&=0A=
	                 major !=3D LVM_BLK_MAJOR)=0A=
		#else=0A=
		         major !=3D DDV_MAJOR && major !=3D NBD_MAJOR)=0A=
		#endif=0A=
		=0A=
	        plug_device(blk_dev + major); /* is atomic */=0A=
	} else switch (major) {=0A=
	     CASE_COALESCE_BUT_FIRST_REQUEST_MAYBE_BUSY=0A=
		/*=0A=
		 * The scsi disk and cdrom drivers completely remove the request=0A=
		 * from the queue when they start processing an entry.  For this=0A=
		 * reason it is safe to continue to add links to the top entry for=0A=
		 * those devices.=0A=
		 *=0A=
		 * All other drivers need to jump over the first entry, as that=0A=
		 * entry may be busy being processed and we thus can't change it.=0A=
		 */=0A=
		if (req =3D=3D blk_dev[major].current_request)=0A=
		{=0A=
	        	if (!(req =3D req->next))=0A=
				break;=0A=
			latency -=3D req->nr_segments;=0A=
		}=0A=
		/* fall through */=0A=
	     CASE_COALESCE_ALSO_FIRST_REQUEST=0A=
=0A=
		/* avoid write-bombs to not hurt iteractiveness of reads */=0A=
		if (rw !=3D READ && read_pendings(req))=0A=
			max_segments =3D blk_dev[major].elevator.max_bomb_segments;=0A=
=0A=
		starving =3D seek_to_not_starving_chunk(&req, &latency);=0A=
		prev =3D NULL;=0A=
		do {=0A=
			if (req->sem)=0A=
				continue;=0A=
			if (req->cmd !=3D rw)=0A=
				continue;=0A=
			if (req->nr_sectors + count > max_sectors)=0A=
				continue;=0A=
			if (req->rq_dev !=3D bh->b_rdev)=0A=
				continue;=0A=
			/* Can we add it to the end of this request? */=0A=
			if (req->sector + req->nr_sectors =3D=3D sector) {=0A=
				if (latency - req->nr_segments < 0)=0A=
					break;=0A=
				if (req->bhtail->b_data + req->bhtail->b_size=0A=
				    !=3D bh->b_data) {=0A=
					if (req->nr_segments < max_segments)=0A=
						req->nr_segments++;=0A=
					else break;=0A=
				}=0A=
				req->bhtail->b_reqnext =3D bh;=0A=
				req->bhtail =3D bh;=0A=
			    	req->nr_sectors +=3D count;=0A=
=0A=
				/* latency stuff */=0A=
				if ((latency -=3D req->nr_segments) < req->elevator_latency)=0A=
					req->elevator_latency =3D latency;=0A=
				elevator_starve_rest_of_queue(req);=0A=
=0A=
				/* Can we now merge this req with the next? */=0A=
				attempt_merge(req, max_sectors, max_segments);=0A=
			/* or to the beginning? */=0A=
			} else if (req->sector - count =3D=3D sector) {=0A=
				if (!prev && starving)=0A=
					break;=0A=
				if (bh->b_data + bh->b_size=0A=
				    !=3D req->bh->b_data) {=0A=
					if (req->nr_segments < max_segments)=0A=
						req->nr_segments++;=0A=
					else break;=0A=
				}=0A=
			    	bh->b_reqnext =3D req->bh;=0A=
			    	req->bh =3D bh;=0A=
			    	req->buffer =3D bh->b_data;=0A=
			    	req->current_nr_sectors =3D count;=0A=
			    	req->sector =3D sector;=0A=
			    	req->nr_sectors +=3D count;=0A=
=0A=
				/* latency stuff */=0A=
				if (latency < --req->elevator_latency)=0A=
					req->elevator_latency =3D latency;=0A=
				elevator_starve_rest_of_queue(req);=0A=
=0A=
				if (prev)=0A=
					attempt_merge(prev, max_sectors, max_segments);=0A=
			} else=0A=
				continue;=0A=
=0A=
			mark_buffer_clean(bh);=0A=
			spin_unlock_irqrestore(&io_request_lock,flags);=0A=
		    	return;=0A=
=0A=
		} while (prev =3D req,=0A=
			 (latency -=3D req->nr_segments) >=3D 0 && (req =3D req->next) !=3D =
NULL);=0A=
	}=0A=
=0A=
/* find an unused request. */=0A=
	req =3D get_request(max_req, bh->b_rdev);=0A=
=0A=
	spin_unlock_irqrestore(&io_request_lock,flags);=0A=
=0A=
/* if no request available: if rw_ahead, forget it; otherwise try again =
blocking.. */=0A=
	if (!req) {=0A=
		if (rw_ahead)=0A=
			goto end_io;=0A=
		req =3D __get_request_wait(max_req, bh->b_rdev);=0A=
	}=0A=
=0A=
/* fill up the request-info, and add it to the queue */=0A=
	req->cmd =3D rw;=0A=
	req->errors =3D 0;=0A=
	req->sector =3D sector;=0A=
	req->nr_sectors =3D count;=0A=
	req->nr_segments =3D 1;=0A=
	req->current_nr_sectors =3D count;=0A=
	req->buffer =3D bh->b_data;=0A=
	req->sem =3D NULL;=0A=
	req->bh =3D bh;=0A=
	req->bhtail =3D bh;=0A=
	add_request(major+blk_dev,req);=0A=
	return;=0A=
=0A=
end_io:=0A=
	bh->b_end_io(bh, test_bit(BH_Uptodate, &bh->b_state));=0A=
}=0A=
=0A=
/* This function can be used to request a number of buffers from a =
block=0A=
   device. Currently the only restriction is that all buffers must =
belong to=0A=
   the same device */=0A=
=0A=
void ll_rw_block(int rw, int nr, struct buffer_head * bh[])=0A=
{=0A=
	unsigned int major;=0A=
	int correct_size;=0A=
	struct blk_dev_struct * dev;=0A=
	int i;=0A=
=0A=
	/* Make sure that the first block contains something reasonable */=0A=
	while (!*bh) {=0A=
		bh++;=0A=
		if (--nr <=3D 0)=0A=
			return;=0A=
	}=0A=
=0A=
	dev =3D NULL;=0A=
	if ((major =3D MAJOR(bh[0]->b_dev)) < MAX_BLKDEV)=0A=
		dev =3D blk_dev + major;=0A=
	if (!dev || !dev->request_fn) {=0A=
		printk(KERN_ERR=0A=
	"ll_rw_block: Trying to read nonexistent block-device %s (%ld)\n",=0A=
		kdevname(bh[0]->b_dev), bh[0]->b_blocknr);=0A=
		goto sorry;=0A=
	}=0A=
	/* Determine correct block size for this device.  */=0A=
	correct_size =3D BLOCK_SIZE;=0A=
	if (blksize_size[major]) {=0A=
		i =3D blksize_size[major][MINOR(bh[0]->b_dev)];=0A=
		if (i)=0A=
			correct_size =3D i;=0A=
	}=0A=
=0A=
	/* Verify requested block sizes.  */=0A=
	for (i =3D 0; i < nr; i++) {=0A=
		if (bh[i] && bh[i]->b_size !=3D correct_size) {=0A=
			printk(KERN_NOTICE "ll_rw_block: device %s: "=0A=
			       "only %d-char blocks implemented (%lu)\n",=0A=
			       kdevname(bh[0]->b_dev),=0A=
			       correct_size, bh[i]->b_size);=0A=
			goto sorry;=0A=
		}=0A=
=0A=
		/* Md remaps blocks now */=0A=
		bh[i]->b_rdev =3D bh[i]->b_dev;=0A=
		bh[i]->b_rsector=3Dbh[i]->b_blocknr*(bh[i]->b_size >> 9);=0A=
 		=0A=
 		#if defined CONFIG_BLK_DEV_LVM || defined =
CONFIG_BLK_DEV_LVM_MODULE=0A=
 		                major =3D MAJOR(bh[i]->b_dev);=0A=
 		                if ( major =3D=3D LVM_BLK_MAJOR) {=0A=
 		                   int ret;=0A=
 		=0A=
 		                   if ( lvm_map_ptr =3D=3D NULL) {=0A=
 		                              printk ( KERN_ERR=0A=
 		                               "Bad lvm_map_ptr in =
ll_rw_block\n");=0A=
 		                      goto sorry;=0A=
 		                   }=0A=
 		                   if ( ( ret =3D ( lvm_map_ptr) ( MINOR ( =
bh[i]->b_dev),=0A=
 		                                                 &bh[i]->b_rdev,=0A=
 		                                                 =
&bh[i]->b_rsector,=0A=
 		                                                 bh[i]->b_size >> =
9,=0A=
 		                                                 rw)) !=3D 0) {=0A=
 		                     printk ( KERN_ERR=0A=
 		                               "Bad lvm_map in ll_rw_block\n");=0A=
 		                      goto sorry;=0A=
 		                   }=0A=
 		                   /* remap major too ... */=0A=
 		                   major =3D MAJOR(bh[i]->b_rdev);=0A=
 		               }=0A=
 		#endif=0A=
 		=0A=
#ifdef CONFIG_BLK_DEV_MD=0A=
		if (major=3D=3DMD_MAJOR &&=0A=
 		      /* changed             v   to allow LVM to remap */=0A=
 		      md_map (bh[i]->b_rdev, &bh[i]->b_rdev,=0A=
 		        &bh[i]->b_rsector, bh[i]->b_size >> 9))=0A=
 		{=0A=
/* LVM remove			md_map (bh[i]->b_dev, &bh[i]->b_rdev, */=0A=
/* LVM remove			    &bh[i]->b_rsector, bh[i]->b_size >> 9)) { */=0A=
		        printk (KERN_ERR=0A=
				"Bad md_map in ll_rw_block\n");=0A=
		        goto sorry;=0A=
		}=0A=
#endif=0A=
	}=0A=
=0A=
	if ((rw =3D=3D WRITE || rw =3D=3D WRITEA) && =
is_read_only(bh[0]->b_dev)) {=0A=
		printk(KERN_NOTICE "Can't write to read-only device %s\n",=0A=
		       kdevname(bh[0]->b_dev));=0A=
		goto sorry;=0A=
	}=0A=
=0A=
	for (i =3D 0; i < nr; i++) {=0A=
		if (bh[i]) {=0A=
			set_bit(BH_Req, &bh[i]->b_state);=0A=
#ifdef CONFIG_BLK_DEV_MD=0A=
			if (MAJOR(bh[i]->b_dev) =3D=3D MD_MAJOR) {=0A=
				md_make_request(bh[i], rw);=0A=
				continue;=0A=
			}=0A=
#endif=0A=
			make_request(MAJOR(bh[i]->b_rdev), rw, bh[i]);=0A=
		}=0A=
	}=0A=
	return;=0A=
=0A=
      sorry:=0A=
	for (i =3D 0; i < nr; i++) {=0A=
		if (bh[i]) {=0A=
			clear_bit(BH_Dirty, &bh[i]->b_state);=0A=
			clear_bit(BH_Uptodate, &bh[i]->b_state);=0A=
			bh[i]->b_end_io(bh[i], 0);=0A=
		}=0A=
	}=0A=
	return;=0A=
}=0A=
=0A=
#ifdef CONFIG_STRAM_SWAP=0A=
extern int stram_device_init( void );=0A=
#endif=0A=
=0A=
/*=0A=
 * First step of what used to be end_request=0A=
 *=0A=
 * 0 means continue with end_that_request_last,=0A=
 * 1 means we are done=0A=
 */=0A=
=0A=
int =0A=
end_that_request_first( struct request *req, int uptodate, char *name ) =
=0A=
{=0A=
	struct buffer_head * bh;=0A=
	int nsect;=0A=
=0A=
	req->errors =3D 0;=0A=
	if (!uptodate) {=0A=
		printk("end_request: I/O error, dev %s (%s), sector %lu\n",=0A=
			kdevname(req->rq_dev), name, req->sector);=0A=
		if ((bh =3D req->bh) !=3D NULL) {=0A=
			nsect =3D bh->b_size >> 9;=0A=
			req->nr_sectors--;=0A=
			req->nr_sectors &=3D ~(nsect - 1);=0A=
			req->sector +=3D nsect;=0A=
			req->sector &=3D ~(nsect - 1);=0A=
		}=0A=
	}=0A=
=0A=
	if ((bh =3D req->bh) !=3D NULL) {=0A=
		req->bh =3D bh->b_reqnext;=0A=
		bh->b_reqnext =3D NULL;=0A=
		bh->b_end_io(bh, uptodate);=0A=
		if ((bh =3D req->bh) !=3D NULL) {=0A=
			req->current_nr_sectors =3D bh->b_size >> 9;=0A=
			if (req->nr_sectors < req->current_nr_sectors) {=0A=
				req->nr_sectors =3D req->current_nr_sectors;=0A=
				printk("end_request: buffer-list destroyed\n");=0A=
			}=0A=
			req->buffer =3D bh->b_data;=0A=
			return 1;=0A=
		}=0A=
	}=0A=
	return 0;=0A=
}=0A=
=0A=
void=0A=
end_that_request_last( struct request *req ) =0A=
{=0A=
	if (req->sem !=3D NULL)=0A=
		up(req->sem);=0A=
	req->rq_status =3D RQ_INACTIVE;=0A=
	wake_up(&wait_for_request);=0A=
}=0A=
=0A=
__initfunc(int blk_dev_init(void))=0A=
{=0A=
	struct request * req;=0A=
	struct blk_dev_struct *dev;=0A=
	static unsigned int queue_ID;=0A=
=0A=
	for (dev =3D blk_dev + MAX_BLKDEV; dev-- !=3D blk_dev;) {=0A=
		dev->request_fn      =3D NULL;=0A=
		dev->queue           =3D NULL;=0A=
		dev->current_request =3D NULL;=0A=
		dev->plug.rq_status  =3D RQ_INACTIVE;=0A=
		dev->plug.cmd        =3D -1;=0A=
		dev->plug.next       =3D NULL;=0A=
		dev->plug_tq.sync    =3D 0;=0A=
		dev->plug_tq.routine =3D &unplug_device;=0A=
		dev->plug_tq.data    =3D dev;=0A=
		dev->elevator =3D ELEVATOR_DEFAULTS;=0A=
		dev->elevator.queue_ID =3D queue_ID++;=0A=
	}=0A=
=0A=
	req =3D all_requests + NR_REQUEST;=0A=
	while (--req >=3D all_requests) {=0A=
		req->rq_status =3D RQ_INACTIVE;=0A=
	}=0A=
	memset(ro_bits,0,sizeof(ro_bits));=0A=
	memset(max_readahead, 0, sizeof(max_readahead));=0A=
	memset(max_sectors, 0, sizeof(max_sectors));=0A=
#ifdef CONFIG_AMIGA_Z2RAM=0A=
	z2_init();=0A=
#endif=0A=
#ifdef CONFIG_STRAM_SWAP=0A=
	stram_device_init();=0A=
#endif=0A=
#ifdef CONFIG_BLK_DEV_RAM=0A=
	rd_init();=0A=
#endif=0A=
#ifdef CONFIG_BLK_DEV_LOOP=0A=
	loop_init();=0A=
#endif=0A=
#ifdef CONFIG_ISP16_CDI=0A=
	isp16_init();=0A=
#endif CONFIG_ISP16_CDI=0A=
#ifdef CONFIG_BLK_DEV_IDE=0A=
	ide_init();		/* this MUST precede hd_init */=0A=
#endif=0A=
#ifdef CONFIG_BLK_DEV_HD=0A=
	hd_init();=0A=
#endif=0A=
#ifdef CONFIG_BLK_DEV_PS2=0A=
	ps2esdi_init();=0A=
#endif=0A=
#ifdef CONFIG_BLK_DEV_XD=0A=
	xd_init();=0A=
#endif=0A=
#ifdef CONFIG_BLK_DEV_MFM=0A=
	mfm_init();=0A=
#endif=0A=
#ifdef CONFIG_PARIDE=0A=
	{ extern void paride_init(void); paride_init(); };=0A=
#endif=0A=
#ifdef CONFIG_MAC_FLOPPY=0A=
	swim3_init();=0A=
#endif=0A=
#ifdef CONFIG_AMIGA_FLOPPY=0A=
	amiga_floppy_init();=0A=
#endif=0A=
#ifdef CONFIG_ATARI_FLOPPY=0A=
	atari_floppy_init();=0A=
#endif=0A=
#ifdef CONFIG_BLK_DEV_FD=0A=
	floppy_init();=0A=
#else=0A=
#if !defined (__mc68000__) && !defined(CONFIG_PPC) && =
!defined(__sparc__)=0A=
	outb_p(0xc, 0x3f2);=0A=
#endif=0A=
#endif=0A=
#ifdef CONFIG_CDU31A=0A=
	cdu31a_init();=0A=
#endif CONFIG_CDU31A=0A=
#ifdef CONFIG_ATARI_ACSI=0A=
	acsi_init();=0A=
#endif CONFIG_ATARI_ACSI=0A=
#ifdef CONFIG_MCD=0A=
	mcd_init();=0A=
#endif CONFIG_MCD=0A=
#ifdef CONFIG_MCDX=0A=
	mcdx_init();=0A=
#endif CONFIG_MCDX=0A=
#ifdef CONFIG_SBPCD=0A=
	sbpcd_init();=0A=
#endif CONFIG_SBPCD=0A=
#ifdef CONFIG_AZTCD=0A=
        aztcd_init();=0A=
#endif CONFIG_AZTCD=0A=
#ifdef CONFIG_CDU535=0A=
	sony535_init();=0A=
#endif CONFIG_CDU535=0A=
#ifdef CONFIG_GSCD=0A=
	gscd_init();=0A=
#endif CONFIG_GSCD=0A=
#ifdef CONFIG_CM206=0A=
	cm206_init();=0A=
#endif=0A=
#ifdef CONFIG_OPTCD=0A=
	optcd_init();=0A=
#endif CONFIG_OPTCD=0A=
#ifdef CONFIG_SJCD=0A=
	sjcd_init();=0A=
#endif CONFIG_SJCD=0A=
#ifdef CONFIG_BLK_DEV_LVM=0A=
       lvm_init();=0A=
#endif=0A=
#ifdef CONFIG_BLK_DEV_MD=0A=
	md_init();=0A=
#endif CONFIG_BLK_DEV_MD=0A=
#ifdef CONFIG_APBLOCK=0A=
	ap_init();=0A=
#endif=0A=
#ifdef CONFIG_DDV=0A=
	ddv_init();=0A=
#endif=0A=
#ifdef CONFIG_BLK_DEV_NBD=0A=
	nbd_init();=0A=
#endif=0A=
#ifdef CONFIG_MDISK=0A=
	mdisk_init();=0A=
#endif=0A=
#ifdef CONFIG_DASD=0A=
	dasd_init();=0A=
#endif=0A=
#ifdef CONFIG_BLK_DEV_XPRAM=0A=
	xpram_init();=0A=
#endif=0A=
	return 0;=0A=
};=0A=
=0A=
EXPORT_SYMBOL(io_request_lock);=0A=
EXPORT_SYMBOL(end_that_request_first);=0A=
EXPORT_SYMBOL(end_that_request_last);=0A=
EXPORT_SYMBOL(blkelv_ioctl);=0A=

------_=_NextPart_000_01C002A1.C4CA1D3B--
