Message-Id: <200206221618.g5MGIGLX018755@hawkeye.luckynet.adm>
Content-Transfer-Encoding: quoted-printable
From: Lightweight Patch Manager <patch@luckynet.dynu.com>
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
Date: Sat Jun 22 11:18:01 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Multiple devices aren't on new list macros either=2E=2E=2E

Two times list_move, and it's done

diff -Nur thunder-2=2E5/drivers/md/lvm-snap=2Ec thunder-2=2E5/drivers/md/lvm-snap=2Ec
--- thunder-2=2E5/drivers/md/lvm-snap=2Ec 22 Jun 2002 10:56:13 -0000 +0000
+++ thunder-2=2E5/drivers/md/lvm-snap=2Ec 22 Jun 2002 10:56:13 -0000 +0000 thunder (thunder-2=2E5/drivers/md/lvm-snap=2Ec 1=2E1 0644)
@@ -109,11 +109,9 @@ lvm_find_exception_table(kdev_t org_dev,
 =09=09    kdev_same(exception->rdev_org, org_dev))
 =09=09{
 =09=09=09if (i)
-=09=09=09{
 =09=09=09=09/* fun, isn't it? :) */
-=09=09=09=09list_del(next);
-=09=09=09=09list_add(next, hash_table);
-=09=09=09}
+=09=09=09=09list_move(next, hash_table);
+
 =09=09=09ret =3D exception;
 =09=09=09break;
 =09=09}
diff -Nur thunder-2=2E5/drivers/md/md=2Ec thunder-2=2E5/drivers/md/md=2Ec
--- thunder-2=2E5/drivers/md/md=2Ec 22 Jun 2002 10:56:14 -0000 +0000
+++ thunder-2=2E5/drivers/md/md=2Ec 22 Jun 2002 10:56:14 -0000 +0000 thunder (thunder-2=2E5/drivers/md/md=2Ec 1=2E1 0644)
@@ -1872,8 +1872,7 @@ static void autorun_devices(void)
 =09=09=09=09=09continue;
 =09=09=09=09}
 =09=09=09=09printk(KERN_INFO "md:  adding %s =2E=2E=2E\n", partition_name(rdev->dev));
-=09=09=09=09list_del(&rdev->pending);
-=09=09=09=09list_add(&rdev->pending, &candidates);
+=09=09=09=09list_move(&rdev->pending, &candidates);
 =09=09=09}
 =09=09}
 =09=09/*
