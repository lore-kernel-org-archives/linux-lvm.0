Received: from devserv.devel.redhat.com (devserv.devel.redhat.com
	[172.16.58.1])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3QCBL6M003564
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 08:11:21 -0400
Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by devserv.devel.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3QCBL8x017149
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 08:11:21 -0400
From: Jim Meyering <jim@meyering.net>
Date: Thu, 26 Apr 2007 14:11:21 +0200
Message-ID: <87k5vz49p2.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] avoid format-mismatch warnings on x86_64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Building from cvs, with an added -Wformat-security option in CFLAGS,
I got two warnings:

    format_text/export.c:163: warning: format not a string literal and no format arguments
    format_text/export.c:179: warning: format not a string literal and no format arguments

The following patch fixes those and adds the option to make.tmpl.in.

2007-04-26  Jim Meyering  <jim@meyering.net>

	* lib/format_text/export.c (_out_with_comment_file): Avoid using
	a non-literal fprintf format string.  Instead, use fputs.

Index: lib/format_text/export.c
===================================================================
RCS file: /cvs/lvm2/LVM2/lib/format_text/export.c,v
retrieving revision 1.54
diff -u -p -r1.54 export.c
--- lib/format_text/export.c	10 Nov 2006 18:24:11 -0000	1.54
+++ lib/format_text/export.c	26 Apr 2007 12:03:59 -0000
@@ -160,7 +160,7 @@ static int _out_with_comment_file(struct
 	for (i = 0; i < f->indent; i++)
 		white_space[i] = '\t';
 	white_space[i] = '\0';
-	fprintf(f->data.fp, white_space);
+	fputs(white_space, f->data.fp);
 	i = vfprintf(f->data.fp, fmt, ap);

 	if (comment) {
@@ -176,7 +176,7 @@ static int _out_with_comment_file(struct

 		while (++i < COMMENT_TAB);

-		fprintf(f->data.fp, comment);
+		fputs(comment, f->data.fp);
 	}
 	fputc('\n', f->data.fp);


Index: make.tmpl.in
===================================================================
RCS file: /cvs/lvm2/LVM2/make.tmpl.in,v
retrieving revision 1.47
diff -u -p -r1.47 make.tmpl.in
--- make.tmpl.in	11 Jan 2007 17:12:26 -0000	1.47
+++ make.tmpl.in	26 Apr 2007 12:08:30 -0000
@@ -56,7 +56,7 @@ endif

 .SUFFIXES: .c .d .o .so .a .po .pot .mo .dylib

-CFLAGS += -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strings -Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline -Wmissing-noreturn
+CFLAGS += -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strings -Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline -Wmissing-noreturn -Wformat-security

 #CFLAGS += -W -Wconversion -Wpointer-arith -Wredundant-decls -Wbad-function-cast -Wcast-qual
 #CFLAGS += -pedantic -std=gnu99
