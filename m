From: Christophe Saout <christophe@saout.de>
Content-Transfer-Encoding: 7bit
Message-Id: <1040913663.15167.4.camel@chtephan>
Mime-Version: 1.0
Subject: [linux-lvm] device-mapper patch for lilo (/ and/or /boot on LVM2)
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
Date: Thu Dec 26 08:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi!

Perhaps you might be interested: I've written a small patch agains
lilo-21.7 so that it recognizes boot files on a /dev/mapper/* volume.

I attached the patch below, but you can also find it at
http://www.saout.de/misc/. I also uploaded my initrd, to boot from a
root volume on LVM2 for newer 2.5 kernels, there if someone is
interested. (the libc is optimized for athlon and it needs a 8 MB ram
disk - see kernel configuration).

diff -Nur lilo-21.7.5/Makefile lilo-21.7.5-devmapper/Makefile
--- lilo-21.7.5/Makefile	Thu Mar  8 20:00:12 2001
+++ lilo-21.7.5-devmapper/Makefile	Wed Dec 25 22:01:12 2002
@@ -57,9 +57,11 @@
 LD86=ld86 -0
 
 AFLAGS=`cat mylilo.h`
-CFLAGS=-Wall -g $(PCONFIG) $(AFLAGS)
+CFLAGS=-Wall -O6 -fomit-frame-pointer -pipe $(PCONFIG) $(AFLAGS)
 LDFLAGS=#-Xlinker -qmagic
 
+DEVMAPPER=-ldevmapper
+
 OBJS=lilo.o map.o geometry.o boot.o device.o common.o bsect.o cfg.o temp.o \
   partition.o identify.o probe.o lrmi.o
 
@@ -121,7 +123,7 @@
 		cp -p dparam.S dparam.s
 
 lilo:		mylilo.h $(OBJS)
-		$(CC) -o lilo $(LDFLAGS) $(OBJS)
+		$(CC) -o lilo $(LDFLAGS) $(DEVMAPPER) $(OBJS)
 
 boot-text.b:	first.b second.b
 		(dd if=first.b bs=512 conv=sync; dd if=second.b) >boot-text.b
diff -Nur lilo-21.7.5/geometry.c lilo-21.7.5-devmapper/geometry.c
--- lilo-21.7.5/geometry.c	Tue Apr 17 22:38:21 2001
+++ lilo-21.7.5-devmapper/geometry.c	Wed Dec 25 22:01:22 2002
@@ -6,6 +6,7 @@
 #include <unistd.h>
 #include <sys/types.h>
 #include <sys/statfs.h>
+#include <stdlib.h>
 #include <stdio.h>
 #include <fcntl.h>
 #include <errno.h>
@@ -19,6 +20,8 @@
 #include <linux/fd.h>
 #include <string.h>
 
+#include <libdevmapper.h>
+
 #include "config.h"
 #include "lilo.h"
 #include "common.h"
@@ -54,19 +57,36 @@
 int old_disktab = 0;
 

+typedef struct _dm_target {
+    struct _dm_target *next;
+    uint64_t start,length,offset;
+    int device;
+} DM_TARGET;
+
+typedef struct _dm_table {
+    struct _dm_table *next;
+    int device;
+    struct _dm_target *target;
+} DM_TABLE;
+
+int dm_major_list[16];
+int dm_major_nr = 0;
+DM_TABLE *dmtab = NULL;
+
 void geo_init(char *name)
 {
     FILE *file;
     char line[MAX_LINE+1];
+    char major_name[32];
     char *here;
     DT_ENTRY *entry;
-    int disk_section,items;
+    int disk_section,items,major;
 
     if (name) {
 	if ((file = fopen(name,"r")) == NULL)
 	    die("open %s: %s",name,strerror(errno));
     }
-    else if ((file = fopen(DFL_DISKTAB,"r")) == NULL) return;
+    else if ((file = fopen(DFL_DISKTAB,"r")) == NULL) goto no_disktab;
     disk_section = !!disktab;
     while (fgets(line,MAX_LINE,file)) {
 	here = strchr(line,'\n');
@@ -89,6 +109,28 @@
 	}
     }
     (void) fclose(file);
+
+  no_disktab:
+    dm_major_nr = 0;
+    file = fopen("/proc/devices", "r");
+    if (!file) return;
+
+    do {
+	if (!fgets(line, (sizeof line)-1, file)) {
+	    (void) fclose(file);
+	    return;
+	}
+	line[(sizeof line)-1] = 0;
+    } while(strncmp(line, "Block", 5) != 0);
+
+    while(fgets(line, (sizeof line)-1, file)) {
+	if (sscanf(line, "%d %31s\n", &major, major_name) != 2) continue;
+	if (strcmp(major_name, "device-mapper") != 0) continue;
+	dm_major_list[dm_major_nr] = major;
+	if (++dm_major_nr > (sizeof dm_major_list)/(sizeof dm_major_list[0])) break;
+    }
+
+    (void) fclose(file);
 }
 

@@ -466,7 +508,82 @@
 void geo_get(GEOMETRY *geo,int device,int user_device,int all)
 {
     DT_ENTRY *walk;
-    int inherited,keep_cyls;
+    int inherited,keep_cyls,i;
+
+    for(i = 0; i < dm_major_nr; i++)
+	if (MAJOR(device) == dm_major_list[i])
+	    break;
+    if (i < dm_major_nr) {
+	DM_TABLE *dm_table;
+
+	for(dm_table = dmtab; dm_table; dm_table = dm_table->next)
+	    if (dm_table->device == device)
+		break;
+
+	if (dm_table) {
+	    DM_TARGET *target;
+
+            device = 0;
+	    for(target = dm_table->target; target; target = target->next)
+	        device = target->device;
+	} else {
+	    DEVICE dev;
+	    struct dm_task *dmt;
+	    void *next = NULL;
+
+	    dev_open(&dev, device, -1);
+	    if (!(dmt = dm_task_create(DM_DEVICE_TABLE)))
+		die("device-mapper: dm_task_create(DM_DEVICE_TABLE) failed");
+	    if (!dm_task_set_name(dmt, dev.name))
+		die("device-mapper: dm_task_set_name(\"%s\") failed",dev.name);
+	    if (!dm_task_run(dmt))
+		die("device-mapper: dm_task_run(DM_DEVICE_TABLE) failed");
+
+	    dm_table = alloc_t(DM_TABLE);
+	    dm_table->device = device;
+	    dm_table->target = NULL;
+	    dm_table->next = dmtab;
+	    dmtab = dm_table;
+
+	    device = 0;
+
+	    do {
+		DM_TARGET *target;
+		uint64_t start,length;
+		int major,minor;
+		char *target_type,*params;
+		char *p;
+
+		next = dm_get_next_target(dmt, next, &start, &length,
+		  &target_type, &params);
+
+		if (!target_type) continue;
+
+		if (strcmp(target_type, "linear") != 0)
+		    die("device-mapper: only linear boot device supported");
+
+		target = alloc_t(DM_TARGET);
+		target->start = start;
+		target->length = length;
+		p = strchr(params, '(');
+		if (!p || sscanf(p, "(%d, %d) %"PRIu64, &major, &minor, &target->offset) != 3)
+		    die("device-mapper: parse error in linear params (\"%s\")", params);
+		target->device = (major << 8) | minor;
+		if (!device)
+		    device = target->device;
+		target->next = dm_table->target;
+		dm_table->target = target;
+	    } while(next);
+
+	    dm_task_destroy(dmt);
+
+	    dev_close(&dev);
+	}
+
+	if (!device)
+	    die("device-mapper: Error finding real device");
+	geo->base_dev = device;
+    }
 
     if (MAJOR(device) == MD_MAJOR) {
         char mdxxx[16];
@@ -574,7 +691,8 @@
     if (fstat(geo->fd,&st) < 0) die("fstat %s: %s",name,strerror(errno));
     if (!S_ISREG(st.st_mode) && !S_ISBLK(st.st_mode))
 	die("%s: neither a reg. file nor a block dev.",name);
-    geo_get(geo,S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev,user_dev,1);
+    geo->dev = S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev;
+    geo_get(geo, geo->dev, user_dev, 1);
     geo->file = S_ISREG(st.st_mode);
     geo->boot = 0;
 #ifndef FIGETBSZ
@@ -600,16 +718,15 @@
 int geo_open_boot(GEOMETRY *geo,char *name)
 {
     struct stat st;
-    dev_t dev;
 
     if (stat(name,&st) < 0) die("stat %s: %s",name,strerror(errno));
     if (!S_ISREG(st.st_mode) && !S_ISBLK(st.st_mode))
 	die("%s: neither a reg. file nor a block dev.",name);
-    dev = S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev;
-    if (MAJOR(dev) == MAJOR_FD) geo->fd = 0;
+    geo->dev = S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev;
+    if (MAJOR(geo->dev) == MAJOR_FD) geo->fd = 0;
     else if ((geo->fd = open(name,O_NOACCESS)) < 0)
 	    die("open %s: %s",name,strerror(errno));
-    geo_get(geo,dev,-1,0);
+    geo_get(geo,geo->dev,-1,0);
     geo->file = S_ISREG(st.st_mode);
     geo->boot = 1;
     geo->spb = 1;
@@ -631,6 +748,7 @@
 int geo_comp_addr(GEOMETRY *geo,int offset,SECTOR_ADDR *addr)
 {
     int block,sector;
+    int i;
 
     if (linear && lba32)
        die("'linear' and 'lba32' (-l and -L) are mutually exclusive.");
@@ -653,7 +771,34 @@
 	    return 0;
 	}
     }
+
     sector = block*geo->spb+((offset/SECTOR_SIZE) % geo->spb);
+
+    for(i = 0; i < dm_major_nr; i++)
+	if (MAJOR(geo->dev) == dm_major_list[i])
+	    break;
+    if (i < dm_major_nr) {
+	DM_TABLE *dm_table;
+	DM_TARGET *dm_target;
+
+	for(dm_table = dmtab; dm_table; dm_table = dm_table->next)
+	    if (dm_table->device == geo->dev)
+		break;
+	if (!dm_table)
+	    die("device-mapper: Mapped device suddenly lost? (%d)", geo->dev);
+
+	for(dm_target = dm_table->target; dm_target; dm_target = dm_target->next)
+	    if (dm_target->start <= sector && sector < (dm_target->start+dm_target->length))
+		break;
+	if (!dm_target)
+	    die("device-mapper: Sector outside mapped device? (%d: %u/%"PRIu64")", geo->base_dev, sector, (uint64_t)(dm_table->target ? (dm_table->target->start+dm_table->target->length) : 0));
+
+	if (dm_target->device != geo->base_dev)
+	    die("device-mapper: mapped boot device cannot be on multiple real devices\n");
+
+	sector = dm_target->offset+(sector-dm_target->start);
+    }
+
     sector += geo->start;
  /*   Always use CHS addressing on floppies:     JRC   */
     if ((geo->device & 0x80) && (linear || lba32)) {
