Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2HG1C2b023792
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 12:01:12 -0400
Received: from nazgul.esiway.net (Nazgul.ESIWAY.NET [193.194.16.154])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2HG0tb6007943
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 12:00:56 -0400
Received: from Megathlon.ESI (Ghost.esi.it [193.194.16.225])
	by nazgul.esiway.net (8.13.8/8.13.8) with ESMTPS id n2HG0tGM010691
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 17:00:55 +0100
Received: from frodo.esi (Frodo.ESI [10.10.10.13])
	by Megathlon.ESI (8.14.1/8.14.1) with ESMTP id n2HG0sTD031978
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 17:00:54 +0100
Message-ID: <49BFC936.8000508@esiway.net>
Date: Tue, 17 Mar 2009 17:00:54 +0100
From: Marco Colombo <linux-lvm@esiway.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>	<20090313203812.GK7445@agk.fab.redhat.com>	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>	<49BC511E.5040402@esiway.net>
	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
Content-Type: multipart/mixed; boundary="------------030800040903030605080703"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------030800040903030605080703
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Stuart D. Gathman wrote:
> That is clearly wrong - since fsync() isn't LVM's responsibility.
> I think they mean that fsync() can't garrantee that any writes are
> actually on the platter.

Even if the disk cache is in write-thru mode, that is.

>> that data doesn't even get to the controller, and it doesn't matter
>> if the disks have write caches enabled or not. Or if they have battery backed
>> caches. Please read the thread I linked. If what they say it's true,
> 
> That is clearly wrong.  If writes don't work, nothing works.

It's the flush (= write NOW) supposedly not working, not the write.
Writes happen, just later and potentially not in order. You seems to assume
that fsync() is the only way to have the data written. That's not clearly
the case, most userland processes just issue write(), never fsync(), and
data gets written anyway, sooner or later.

>> you can't use LVM for anything that needs fsync(), including mail queues
>> (sendmail), mail storage (imapd), as such. So I'd really like to know.
> 
> fsync() is a file system call that writes dirty buffers,

sure, but it's not the only way to have dirty pages flushed. There's
a kernel thread that flushes them every since and then, and there's
also memory pressure. So a broken fsync() can go unnoticed, you become
aware of it if and only if:

1) you run some application that needs it (most don't even use it);
2) the system crashes (power loss);
3) you are unlucky enough to hit the window of vulnerability.

If any of these conditions is not met, you won't be aware of a
mulfunctioning fsync().

But I think I understand what you mean: if the API to flush to physical
storage is the same (used by fsync(), by pdflush, by the VM system)
then you're right, everything is broken. But I've been using LVM
for years now, I'm assuming that's not the case. :)

> and then waits
> for the physical writes to complete.  It is only the waiting part that
> is broken.

Half-broken is broken. And the bigger issue here it's not even the delay.
The issue is ordering. For a database, loosing the last transactions is bad
enough, loosing transactions in the middle of the timeline is even worse.

For the mail subsystems, there's almost no ordering requirement, still
loosing messages is no good.

---------------

Ehm, I've decided to write a small test program. My system is a Fedora 7,
so nowhere recent. My setup:

/home is a LV, belonging to VG 'vg_data', whose only PV is /dev/md6.
/dev/md6 is a RAID1 md device, whose members are /dev/sda10 and /dev/sdb10.
/dev/sda and /dev/sdb are both Seagate ST3320620AS SATA disks.

The filesystem is EXT3, mounted with noatime,data=ordered.

The attached program writes the same block on a file N times (looping on
lseek/write. Depending on how it's compiled, it issues a fdatasync() after
each write.

Here are the results, for 32MB of data written:

$ time ./test_nosync

real    0m0.056s
user    0m0.004s
sys     0m0.052s

clearly, not disk activity here.

$ time ./test_sync

real    0m2.070s
user    0m0.002s
sys     0m0.152s

Now the same after hdparm -W0 /dev/sda; hdparm -W0 /dev/sdb:

$ time ./test_sync

real    1m16.431s
user    0m0.004s
sys     0m0.273s

These are 4096 "transactions" of size 8192, w/o the overhaed of
allocating new blocks (it writes to the same block over and over).
The first test is meaningless (they are never really committed).
The second test, it's about 2000 transactions per second. Too many.
In the third test, I got only about 50 transactions per second,
which makes a lot of sense.

It seems to me that in my setup, disabling the caches on the disks does
bring data to the platters, and that noone is "lying" about fsync.

Now I'm _really_ confused.


(the following isn't meaningful for the discussion)

For the curious of you (I was) I commented out the lseek(). For the _nosync
version it's the same (1/2 a second).

For the _sync version, with -W1 I get:

$ time ./test_sync

real    0m48.816s
user    0m0.002s
sys     0m0.483s

and with -W0:

$ time ./test_sync

real    3m6.674s
user    0m0.006s
sys     0m0.526s

Since all the test were done deleting the file each time, I think what
happens here is that the file is increasing in size, so fdatasync()
each time triggers a write of the inode. It's two writes per loop.
So I tried keeping the file around, having my test program write on
preallocated blocks.

With -W1:
$ time ./test_sync

real    0m11.253s
user    0m0.001s
sys     0m0.244s


with -W0:
$ time ./test_sync

real    0m46.353s
user    0m0.005s
sys     0m0.249s


.TM.

--------------030800040903030605080703
Content-Type: text/x-csrc;
 name="test.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="test.c"

/*
 * compile with -DDO_FSYNC=1 and then with -DDO_FSYNC=0
 */
#include <sys/types.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#if !defined(DO_FSYNC)
# error "You must define DO_FSYNC"
#endif

#define MYBUFSIZ BUFSIZ
#define BYTES_TO_WRITE (32*1024*1024) /* 32MB */

int main(int argc, char *argv[])
{
	int fd, rc, i;
	char buf[MYBUFSIZ] = { '\0', };

	fd = open("testfile", O_WRONLY|O_CREAT, 0600);
	if (fd < 0) {
		perror("open");
		exit(1);
	}

	for (i = 0; i < (BYTES_TO_WRITE/MYBUFSIZ); i++) {
		rc = lseek(fd, 0, SEEK_SET);
		if (rc < 0) {
			perror("lseek");
			exit(1);
		}
		rc = write(fd, buf, sizeof(buf));
		if (rc < 0) {
			perror("write");
			exit(1);
		}
#if DO_FSYNC
		fdatasync(fd);
		if (rc < 0) {
			perror("fdatasync");
			exit(1);
		}
#endif
	} 
}

--------------030800040903030605080703--
