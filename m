Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r22CurmZ022984
	for <linux-lvm@redhat.com>; Sat, 2 Mar 2013 07:56:53 -0500
Received: from rrba-ip-smtp-6-4.saix.net (rrba-ip-smtp-6-4.saix.net
	[196.25.240.200])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r22CunKx003496
	for <linux-lvm@redhat.com>; Sat, 2 Mar 2013 07:56:50 -0500
Received: from atlantis.dyndns.uls.co.za (dsl-144-201-220.telkomadsl.co.za
	[41.144.201.220])
	by rrba-ip-smtp-6-4.saix.net (Postfix) with ESMTP id 7AFAE4F2
	for <linux-lvm@redhat.com>; Sat,  2 Mar 2013 14:56:45 +0200 (SAST)
Received: from [192.168.40.204]
	by atlantis.dyndns.uls.co.za with esmtpa (Exim 4.76)
	(envelope-from <jaco@uls.co.za>) id 1UBlzY-0005Ng-S8
	for linux-lvm@redhat.com; Sat, 02 Mar 2013 14:56:45 +0200
Message-ID: <5131F75B.9090008@uls.co.za>
Date: Sat, 02 Mar 2013 14:58:03 +0200
From: Jaco Kroon <jaco@uls.co.za>
MIME-Version: 1.0
References: <5125315B.1060409@uls.co.za>
In-Reply-To: <5125315B.1060409@uls.co.za>
Content-Type: multipart/mixed; boundary="------------050309070907000400000201"
Subject: Re: [linux-lvm] potential locking issues
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------050309070907000400000201
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

I've applied the attached patch to my installation, and the lock files
are no longer unlinked.  Since then a number of problems have gone away:

1.  dmeventd (in spite of running a watch lvs in a terminal) no longer
ends up with an open
2.  I no longer seem to be getting lockups where I can't execute any lvm
commands until I killall -9 dmeventd.
3.  My snapshots no longer seem to go invalid because dmeventd doesn't
extend them (during testing it still happened but I managed to figure
out it's because my threshold for extending was set at 80%, and my
initial LV was 12M, with 1M writes every 2 seconds to the original
partition, and it would then go from <80% to 100% between checks, I
since updated the threshold to 50% and checking at 15s intervals, and
decreased the writes to every 5s which solved it - in production however
I start with 1G snapshots, threshold@80 % and increase of 20%).

The only effective change of the patch is that it removes the code that
unlinks the lockfile.  To the best of my knowledge no safe way exists to
unlink the lockfile without introducing lock race conditions, as such,
the empty lock file has to remain on disk.

For your consideration,

Kind Regards,
Jaco

On 20/02/2013 22:26, Jaco Kroon wrote:
> Hi All,
>
> LVM2 uses a locking scheme, relying on flock to maintain lock files for
> volume groups, by default /var/lock/lvm/V_${vgname} - these lock files
> are opened, then flock()ed, and eventually either unlocked and later
> locked again, or potentially just unlink()ed with the lock held.
>
> The unlink() can potentially cause the lock to desync and cause
> problems.  Consider the following scenario with three processes
> (ordering is as is, the numbers are process numbers):
>
> 1.  open()
> 2.  open()
> 1.  flock() <-- succeeds
> 2.  flock() <-- blocks.
> 1.  unlink()
> 1.  close() <--@this point process 2's flock succeeds.
> 3.  open() <-- note that this ends up being a *different* file.
> 3.  flock() <-- succeeds.
>
> At this point both 2 and 3 thinks they have the lock and that's wrong.
>
> I actually saw an instance today where dmeventd had a file descriptor
> open to a deletect V_vggroup lockfile, so this *does* happen in the
> field.  This also explains various lockups i've seen in the past, which
> I later figured out usually happened when dmeventd was running (So i put
> much effort into ensuring dmeventd never ever started up - which helped
> a lot).
>
> Permitting I'm right the fix would be to fix _undo_flock in
> lib/locking/file_locking.c to not unlink the lockfile - ever.  Or any
> other file that is used for locking purposes anywhere in the codebase
> for that matter.


--------------050309070907000400000201
Content-Type: text/x-patch;
 name="LVM2.2.02.98-no-flock-unlink.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="LVM2.2.02.98-no-flock-unlink.patch"

--- a/lib/locking/file_locking.c.o	2013-03-01 21:24:10.897699351 +0200
+++ b/lib/locking/file_locking.c	2013-03-01 21:24:25.097950374 +0200
@@ -46,16 +46,6 @@
 
 static void _undo_flock(const char *file, int fd)
 {
-	struct stat buf1, buf2;
-
-	log_debug("_undo_flock %s", file);
-	if (!flock(fd, LOCK_NB | LOCK_EX) &&
-	    !stat(file, &buf1) &&
-	    !fstat(fd, &buf2) &&
-	    is_same_inode(buf1, buf2))
-		if (unlink(file))
-			log_sys_error("unlink", file);
-
 	if (close(fd) < 0)
 		log_sys_error("close", file);
 }

--------------050309070907000400000201
Content-Type: text/x-vcard; charset=utf-8;
 name="jaco.vcf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="jaco.vcf"

YmVnaW46dmNhcmQNCmZuOkphY28gS3Jvb24NCm46S3Jvb247SmFjbw0Kb3JnOlVsdGltYXRl
IExpbnV4IFNvbHV0aW9ucyBDQw0KZW1haWw7aW50ZXJuZXQ6amFjb0B1bHMuY28uemENCnRp
dGxlOk1hbmFnaW5nIE1lbWJlcg0KdGVsO3dvcms6MDg3MzUxMzI5OA0KdGVsO2ZheDowODY2
NDg4NTYxDQp0ZWw7Y2VsbDowODQ1MTU4MjU1DQp1cmw6aHR0cDovL3d3dy51bHMuY28uemEv
DQp2ZXJzaW9uOjIuMQ0KZW5kOnZjYXJkDQoNCg==
--------------050309070907000400000201--
