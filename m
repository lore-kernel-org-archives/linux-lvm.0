Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBE9d7r16628
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2004 04:39:07 -0500
Received: from Cantor.suse.de (news.suse.de [195.135.220.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBE9cul7028390
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2004 04:39:01 -0500
Received: from hermes.suse.de (hermes-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by Cantor.suse.de (Postfix) with ESMTP id 0E5111214880
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2004 10:38:51 +0100 (CET)
Date: Tue, 14 Dec 2004 10:38:50 +0100
From: Arvin Schnell <arvin@suse.de>
Message-ID: <20041214093850.GA16922@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
Subject: [linux-lvm] patch for separator option
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
To: Linux LVM <linux-lvm@redhat.com>


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

I realized that the -s/--short option for vgdisplay doesn't work
in lvm 2.2.00.31 (but also older versions).  That's because the
option --separator also gets the short option 's' in args.h.

Attached is a patch.

ciao Arvin

-- 
Dipl.-Phys. Arvin Schnell
SUSE LINUX Products GmbH
Research & Development
email: arvin@suse.de

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm2-args.diff"

? lvm
Index: args.h
===================================================================
RCS file: /cvs/lvm2/LVM2/tools/args.h,v
retrieving revision 1.36
diff -u -w -r1.36 args.h
--- args.h	15 Jun 2004 17:23:49 -0000	1.36
+++ args.h	14 Dec 2004 09:28:52 -0000
@@ -43,6 +43,7 @@
 arg(minor_ARG, '\0', "minor", minor_arg)
 arg(type_ARG, '\0', "type", segtype_arg)
 arg(alloc_ARG, '\0', "alloc", alloc_arg)
+arg(separator_ARG, '\0', "separator", string_arg)
 
 /* Allow some variations */
 arg(resizable_ARG, '\0', "resizable", yes_no_arg)
@@ -99,7 +100,6 @@
 arg(resizefs_ARG, 'r', "resizefs", NULL)
 arg(reset_ARG, 'R', "reset", NULL)
 arg(physicalextentsize_ARG, 's', "physicalextentsize", size_mb_arg)
-arg(separator_ARG, 's', "separator", string_arg)
 arg(stdin_ARG, 's', "stdin", NULL)
 arg(snapshot_ARG, 's', "snapshot", NULL)
 arg(short_ARG, 's', "short", NULL)

--+QahgC5+KEYLbs62--
