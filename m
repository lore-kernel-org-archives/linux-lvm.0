Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1DB2jbD010007
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 06:02:45 -0500
Received: from g1t0029.austin.hp.com (g1t0029.austin.hp.com [15.216.28.36])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m1DB28Fx027296
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 06:02:08 -0500
Received: from g1t0029.austin.hp.com (localhost.localdomain [127.0.0.1])
	by receive-from-antispam-filter (Postfix) with SMTP id 62B0C38606
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 11:02:03 +0000 (UTC)
Received: from hppinf00.gbr.hp.com (unknown [16.25.249.33])
	by g1t0029.austin.hp.com (Postfix) with ESMTP id F00FE384D3
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 11:02:02 +0000 (UTC)
Received: from hppine99.gbr.hp.com (hppine99.gbr.hp.com [16.25.249.62])
	by hppinf00.gbr.hp.com (8.11.1 (PHNE_35951)/8.11.1 SMKit7.05) with
	ESMTP id m1DB21611439
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 11:02:02 GMT
From: Darren Lavender <dl1@hppine99.gbr.hp.com>
Date: Wed, 13 Feb 2008 11:02:00 +0000
Message-Id: <1202900520.4345.115.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 tools lvmcmdline.c major and minor number limits
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
To: linux-lvm@redhat.com


I was wondering whether there was any particular reason why the
limitations below are still present given that these were changed
between 2.4 and 2.6 linux kernels?

Eg:


LVM2/tools/lvmcmdline.c

int minor_arg(struct cmd_context *cmd __attribute((unused)), struct arg *a)
{
        char *ptr;

        if (!_get_int_arg(a, &ptr) || (*ptr) || (a->sign == SIGN_MINUS))
                return 0;

        if (a->i_value > 255) {
                log_error("Minor number outside range 0-255");
                return 0;
        }

        return 1;
}

int major_arg(struct cmd_context *cmd __attribute((unused)), struct arg *a)
{
        char *ptr;

        if (!_get_int_arg(a, &ptr) || (*ptr) || (a->sign == SIGN_MINUS))
                return 0;

        if (a->i_value > 255) {
                log_error("Major number outside range 0-255");
                return 0;
        }

        /* FIXME Also Check against /proc/devices */

        return 1;
}


Linux 2.4 kernel appears to have a major number of 8 bits, likewise for
the minor number.

By comparison, 2.6 appears to have 12 bits for the major and 20 bits for
the minor, significantly larger, eg:


  4 #define MINORBITS       20
  5 #define MINORMASK       ((1U << MINORBITS) - 1)
  6 
  7 #define MAJOR(dev)      ((unsigned int) ((dev) >> MINORBITS))
  8 #define MINOR(dev)      ((unsigned int) ((dev) & MINORMASK))
  9 #define MKDEV(ma,mi)    (((ma) << MINORBITS) | (mi))



Whilst these LVM2 hardcoded limits do not prevent device nodes being
created during normal operation they do prevent the user from specifying
specific major/minor numbers via the cmdline, eg:

 # lvcreate -n bigminor -l 5 -M y --major 253 --minor 270 vgtest
  Minor number outside range 0-255
  Invalid argument 270
  Error during parsing of command line.




Rebuilding without these limits (a quick hack/test) produces a device
node that seems to work just fine:

# ./lvm lvcreate -n highminor -l 5 -M y --major 253 --minor 260 vgtest
  Logical volume "highminor" created

# ll /dev/mapper/
total 128
drwxr-xr-x   2 root root     4096 Feb 12 16:29 .
drwxr-xr-x  35 root root   122880 Feb 12 16:29 ..
lrwxrwxrwx   1 root root       16 Feb 12 15:52 control -> ../device-mapper
brw-------   1 root root 253, 260 Feb 12 16:29 vgtest-highminor
brw-------   1 root root 253, 250 Feb 12 16:04 vgtest-lowminor
brw-------   1 root root 253,   0 Feb 12 16:04 vgtest-nominor



Can this limitation be either removed or updated to bring it in line
with more recent kernel functionality?  Or is there some reason that I
am missing for their continued existence/assigned values.....


Thanks & regards

-- 
Darren Lavender <dl1@hppine99.gbr.hp.com>
