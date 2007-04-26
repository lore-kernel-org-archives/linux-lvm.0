Received: from devserv.devel.redhat.com (devserv.devel.redhat.com
	[172.16.58.1])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3QCFt2D004799
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 08:15:55 -0400
Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by devserv.devel.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3QCFsBn017280
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 08:15:55 -0400
From: Jim Meyering <jim@meyering.net>
Date: Thu, 26 Apr 2007 14:15:54 +0200
Message-ID: <87ejm749hh.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] avoid ptrdiff_t-related format-mismatch warnings on
	x86_64
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

Building from cvs, I saw about a dozen of these warnings:

    config/config.c:493: warning: format '%d' expects type 'int', but argument 5 has type 'long int'

This fixes them:

2007-04-26  Jim Meyering  <jim@meyering.net>

	* lib/config/config.c (match): Use %ld, not %d, to match argument
	of type ptrdiff_t.
	(_type): Likewise.

Index: lib/config/config.c
===================================================================
RCS file: /cvs/lvm2/LVM2/lib/config/config.c,v
retrieving revision 1.56
diff -u -p -r1.56 config.c
--- lib/config/config.c	25 Apr 2007 20:38:39 -0000	1.56
+++ lib/config/config.c	26 Apr 2007 12:14:39 -0000
@@ -83,7 +83,7 @@ static const int sep = '/';

 #define match(t) do {\
    if (!_match_aux(p, (t))) {\
-	log_error("Parse error at byte %d (line %d): unexpected token", p->tb - p->fb + 1, p->line); \
+	log_error("Parse error at byte %ld (line %d): unexpected token", p->tb - p->fb + 1, p->line); \
       return 0;\
    } \
 } while(0);
@@ -590,7 +590,7 @@ static struct config_value *_type(struct
 		break;

 	default:
-		log_error("Parse error at byte %d (line %d): expected a value", p->tb - p->fb + 1, p->line);
+		log_error("Parse error at byte %ld (line %d): expected a value", p->tb - p->fb + 1, p->line);
 		return 0;
 	}
 	return v;
