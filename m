Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A481B1D@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] problems with gcc 3.0 & lvm tools
Date: Tue, 26 Jun 2001 16:03:56 -0500
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Is there some merit to using printf() as a macro?

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Gergely Tamas [mailto:dice@mfa.kfki.hu]
> Sent: Tuesday, June 26, 2001 3:28 PM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] problems with gcc 3.0 & lvm tools
> 
> 
> Hi!
> 
> GCC 3.0 implements ``printf'' as a macro.
> 
> So the following lines in the userspace utils are invalid.
> printf ("...
> #ifdef DEBUG
>                      "\t[-d/--debug]\n"
> #endif
> ...");
> 
> Hereby GCC 3.0 cannot compile the tools.
> 
> As a workaround you can use the following patch to 
> comment-out all such
> lines. So they can compile.
> 
> Thanks,
> Gergely
> 
> --- LVM-orig/tools/lvchange.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/lvchange.c	Tue Jun 26 21:51:17 2001
> @@ -168,9 +168,11 @@
>                       "\t[-A/--autobackup y/n]\n"
>                       "\t[-a/--available y/n]\n"
>                       "\t[-C/--contiguous y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-p/--permission r/rw]\n"
>                       "\t[-r/--readahead ReadAheadSectors]\n"
> --- LVM-orig/tools/lvcreate.c	Thu Jun 14 21:14:03 2001
> +++ LVM/tools/lvcreate.c	Tue Jun 26 21:52:47 2001
> @@ -250,9 +250,11 @@
>                       "%s\n"
>                       "\t[-A/--autobackup y/n]\n"
>                       "\t[-C/--contiguous y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-i/--stripes Stripes 
> [-I/--stripesize StripeSize]]\n"
>                       "\t{-l/--extents LogicalExtentsNumber |\n"
> --- LVM-orig/tools/lvdisplay.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/lvdisplay.c	Tue Jun 26 21:53:44 2001
> @@ -125,9 +125,11 @@
>                       "---------\n\n"
>                       "%s\n"
>                       "\t[-c/--colon]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-D/--disk]\n"
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v[v]/--verbose [--verbose]]\n"
> --- LVM-orig/tools/lvextend.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/lvextend.c	Tue Jun 26 21:55:00 2001
> @@ -140,9 +140,11 @@
>                       "---------\n\n"
>                       "%s\n"
>                       "\t[-A/--autobackup y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t{-l/--extents [+]LogicalExtentsNumber |\n"
>                       "\t -L/--size [+]LogicalVolumeSize[kKmMgGtT]}\n"
> --- LVM-orig/tools/lvmchange.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/lvmchange.c	Tue Jun 26 21:55:59 2001
> @@ -117,9 +117,11 @@
>                       "Synopsis:\n"
>                       "---------\n\n"
>                       "%s\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-f/--force]\n"
>                       "\t[-h/-?/--help]\n"
>                       "\t[-i/-?/--iop_version]\n"
> --- LVM-orig/tools/lvmdiskscan.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/lvmdiskscan.c	Tue Jun 26 21:56:55 2001
> @@ -119,9 +119,11 @@
>                       "Synopsis:\n"
>                       "---------\n\n"
>                       "%s\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-l/--lvmpartition]\n"
>                       "\t[-v/--verbose]\n\n",
> --- LVM-orig/tools/lvmsadc.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/lvmsadc.c	Tue Jun 26 21:57:56 2001
> @@ -95,9 +95,11 @@
>                       "Synopsis:\n"
>                       "---------\n\n"
>                       "%s\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v/--verbose]\n"
>                       "\t[LogFilePath]\n\n",
> --- LVM-orig/tools/lvmsar.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/lvmsar.c	Tue Jun 26 21:58:49 2001
> @@ -105,9 +105,11 @@
>                       "Synopsis:\n"
>                       "---------\n\n"
>                       "%s\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-f/--full]\n"
>                       "\t[-h/-?/--help]\n"
>                       "\t[-s/--stdin]\n"
> --- LVM-orig/tools/lvreduce.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/lvreduce.c	Tue Jun 26 21:59:30 2001
> @@ -142,9 +142,11 @@
>                       "---------\n\n"
>                       "%s\n"
>                       "\t[-A/--autobackup y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-f/--force]\n"
>                       "\t[-h/-?/--help]\n"
>                       "\t{-l/--extents [-]LogicalExtentsNumber |\n"
> --- LVM-orig/tools/lvremove.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/lvremove.c	Tue Jun 26 22:00:19 2001
> @@ -121,9 +121,11 @@
>                       "---------\n\n"
>                       "%s\n"
>                       "\t[-A/--autobackup y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-f/--force]\n"
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v/--verbose]\n"
> --- LVM-orig/tools/pvchange.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/pvchange.c	Tue Jun 26 22:01:12 2001
> @@ -134,9 +134,11 @@
>                       "---------\n\n"
>                       "%s\n"
>                       "\t[-A/--autobackup y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v/--verbose]\n"
>                       "\t[-a/--all]\n"
> --- LVM-orig/tools/pvdisplay.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/pvdisplay.c	Tue Jun 26 22:02:07 2001
> @@ -107,9 +107,11 @@
>                       "---------\n\n"
>                       "%s\n"
>                       "\t[-c/--colon]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-s/--short]\n"
>                       "\t[-v[v]/--verbose [--verbose]]\n"
> --- LVM-orig/tools/vgck.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/vgck.c	Tue Jun 26 22:02:58 2001
> @@ -92,9 +92,11 @@
>                       "Synopsis:\n"
>                       "---------\n\n"
>                       "%s\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v/--verbose]\n"
>                       "\t[VolumeGroupName...]\n\n",
> --- LVM-orig/tools/vgextend.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/vgextend.c	Tue Jun 26 22:03:52 2001
> @@ -127,9 +127,11 @@
>                       "---------\n\n"
>                       "%s\n"
>                       "\t[-A/--autobackup y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v/--verbose]\n"
>                       "\tVolumeGroupName\n"
> --- LVM-orig/tools/vgmerge.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/vgmerge.c	Tue Jun 26 22:04:37 2001
> @@ -122,9 +122,11 @@
>                       "---------\n\n"
>                       "%s\n"
>                       "\t[-A/--autobackup y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-l/--list]\n"
>                       "\t[-t/--test]\n"
> --- LVM-orig/tools/vgmknodes.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/vgmknodes.c	Tue Jun 26 22:05:20 2001
> @@ -91,9 +91,11 @@
>                       "Synopsis:\n"
>                       "---------\n\n"
>                       "%s\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v/--verbose]\n"
>                       "\t[VolumeGroupName...]\n\n",
> --- LVM-orig/tools/vgreduce.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/vgreduce.c	Tue Jun 26 22:06:07 2001
> @@ -129,9 +129,11 @@
>                       "%s\n"
>                       "\t[-a/--all]\n"
>                       "\t[-A/--autobackup y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v/--verbose]\n"
>                       "\tVolumeGroupName\n"
> --- LVM-orig/tools/vgremove.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/vgremove.c	Tue Jun 26 22:06:47 2001
> @@ -98,9 +98,11 @@
>                       "Synopsis:\n"
>                       "---------\n\n"
>                       "%s\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v/--verbose]\n"
>                       "\tVolumeGroupName [VolumeGroupName...]\n\n",
> --- LVM-orig/tools/vgrename.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/vgrename.c	Tue Jun 26 22:07:29 2001
> @@ -122,9 +122,11 @@
>                       "---------\n\n"
>                       "%s\n"
>                       "\t[-A/--autobackup y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v/--verbose]\n"
>                       "\tOldVolumeGroupPath NewVolumeGroupPath /\n"
> --- LVM-orig/tools/vgscan.c	Tue Apr 24 16:29:20 2001
> +++ LVM/tools/vgscan.c	Tue Jun 26 22:08:07 2001
> @@ -174,9 +174,11 @@
>                       "Synopsis:\n"
>                       "---------\n\n"
>                       "%s\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-v/--verbose]\n\n",
>                       lvm_version, LVM_LIB_IOP_VERSION,  cmd, cmd);
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
