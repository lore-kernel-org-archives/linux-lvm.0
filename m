Return-Path: <jan@moria.gondor.com>
Date: Fri, 5 Jan 2001 12:38:20 +0100
From: Jan Niehusmann <list064@gondor.com>
Subject: Re: [lvm-devel] Re: [linux-lvm] LVM 0.9 vgscan problem
Message-ID: <20010105123820.A1886@gondor.com>
References: <Pine.LNX.4.21.0101041545590.1281-300000@duckman.distro.conectiva> <Pine.LNX.4.21.0101041959040.1295-100000@duckman.distro.conectiva>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0101041959040.1295-100000@duckman.distro.conectiva>; from riel@conectiva.com.br on Thu, Jan 04, 2001 at 08:01:10PM -0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com, Rik van Riel <riel@conectiva.com.br>

On Thu, Jan 04, 2001 at 08:01:10PM -0200, Rik van Riel wrote:
> But when I type (with the IOP10 tools) the following
> all hell breaks loose:
> 
> # vgextend vg0 /dev/hda5    (the previously removed PV)
> 
> The oops is below.

This is already known, a fix is in cvs. (But I didn't try it, I just remembered
that somebody mentioned it on the mailinglist).

I think the following patch will do the job:

Index: lvm.c
===================================================================
RCS file: /data/cvs/LVM/kernel/lvm.c,v
retrieving revision 1.7.2.1
retrieving revision 1.7.2.2
diff -u -1 -b -p -r1.7.2.1 -r1.7.2.2
--- lvm.c	2000/11/26 12:21:37	1.7.2.1
+++ lvm.c	2000/11/27 23:48:01	1.7.2.2
@@ -143,2 +143,3 @@
  *    26/11/2000 - corrected #ifdef locations for PROC_FS
+ *    28/11/2000 - fixed lvm_do_vg_extend() NULL pointer BUG
  *
@@ -2089,4 +2090,5 @@ static int lvm_do_vg_extend(vg_t *vg_ptr
 				ret = lvm_do_pv_create(arg, vg_ptr, p);
-				lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);
 				if ( ret != 0) return ret;
+				pv_ptr = vg_ptr->pv[p];
+				lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);
 	
