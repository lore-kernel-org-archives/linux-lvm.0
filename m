From: Lightweight patch manager <patch@hawkeye.luckynet.adm>
Message-Id: <200206221217.g5MCHwFO000992@hawkeye.luckynet.adm>
Subject: [linux-lvm] [PATCH][2.5] List macros update for md (10/19)
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
Date: Sat Jun 22 07:18:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: mingo@elte.hu, linux-raid@vger.kernel.org, linux-lvm@sistina.com

Multiple devices aren't on new list macros either...

Two times list_move, and it's done

diff -Nur thunder-2.5/drivers/md/lvm-snap.c thunder-2.5/drivers/md/lvm-snap.c
--- thunder-2.5/drivers/md/lvm-snap.c 22 Jun 2002 10:56:13 -0000 +0000
+++ thunder-2.5/drivers/md/lvm-snap.c 22 Jun 2002 10:56:13 -0000 +0000 thunder (thunder-2.5/drivers/md/lvm-snap.c 1.1 0644)
@@ -109,11 +109,9 @@ lvm_find_exception_table(kdev_t org_dev,
 		    kdev_same(exception->rdev_org, org_dev))
 		{
 			if (i)
-			{
 				/* fun, isn't it? :) */
-				list_del(next);
-				list_add(next, hash_table);
-			}
+				list_move(next, hash_table);
+
 			ret = exception;
 			break;
 		}
diff -Nur thunder-2.5/drivers/md/md.c thunder-2.5/drivers/md/md.c
--- thunder-2.5/drivers/md/md.c 22 Jun 2002 10:56:14 -0000 +0000
+++ thunder-2.5/drivers/md/md.c 22 Jun 2002 10:56:14 -0000 +0000 thunder (thunder-2.5/drivers/md/md.c 1.1 0644)
@@ -1872,8 +1872,7 @@ static void autorun_devices(void)
 					continue;
 				}
 				printk(KERN_INFO "md:  adding %s ...\n", partition_name(rdev->dev));
-				list_del(&rdev->pending);
-				list_add(&rdev->pending, &candidates);
+				list_move(&rdev->pending, &candidates);
 			}
 		}
 		/*
