Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58668103F263
	for <linux-lvm@redhat.com>; Mon,  6 Jan 2020 13:04:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CEA1802FE1
	for <linux-lvm@redhat.com>; Mon,  6 Jan 2020 13:04:44 +0000 (UTC)
From: Christian Hesse <list@eworm.de>
Date: Mon,  6 Jan 2020 13:54:37 +0100
Message-Id: <20200106125437.192844-1-list@eworm.de>
In-Reply-To: <ab1f9091-3711-5e6c-e989-17f4fa144d25@redhat.com>
References: <ab1f9091-3711-5e6c-e989-17f4fa144d25@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [PATCH 1/1] build: force to use bash (was: Re: bashism
	in tools/Makefile.in)
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Christian Hesse <mail@eworm.de>, Zdenek Kabelac <zkabelac@redhat.com>

From: Christian Hesse <mail@eworm.de>

> Unfortunately whole lvm2 project is mostly 'bash' based and all developers
> mostly use bash - so we would welcome patches if they would provide
> equivalently working code without bashism...
>
> Fixing couple things while the whole rest of project is still requiring bash
> doesn't make it any better - ATM  all scripts/tests/Makefiles mostly expect
> presence of bash.

Fine with me. So how about forcing the build system to use bash?

-- >8 --
From: Christian Hesse <mail@eworm.de>
Subject: build: force to use bash

The build system expects bash, so force to use it. This mitigates issues
where other shells are fed with bashism.

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 configure    | 15 +++++++++++++++
 configure.ac | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/configure b/configure
index 6dd7edac3..190d13c77 100755
--- a/configure
+++ b/configure
@@ -2960,6 +2960,21 @@ ac_configure="$SHELL $ac_aux_dir/configure"  # Please don't use this var.
 
 
 
+################################################################################
+if test -z "$BASH_VERSION$CONFIG_SHELL"
+then
+    CONFIG_SHELL=bash
+    export CONFIG_SHELL
+    if $CONFIG_SHELL -c "exit 0"
+    then
+        exec $CONFIG_SHELL $0 "$@"
+    else
+        { $as_echo "$as_me:${as_lineno-$LINENO}: The 'bash' shell is needed to build lvm2" >&5
+$as_echo "$as_me: The 'bash' shell is needed to build lvm2" >&6;}
+        as_fn_error $? "'bash' not found" "$LINENO" 5
+    fi
+fi
+
 ################################################################################
 # Make sure we can run config.sub.
 $SHELL "$ac_aux_dir/config.sub" sun4 >/dev/null 2>&1 ||
diff --git a/configure.ac b/configure.ac
index 74ca20191..f8d0abdfb 100644
--- a/configure.ac
+++ b/configure.ac
@@ -23,6 +23,21 @@ AC_CONFIG_HEADERS([include/configure.h])
 dnl -- Setup the directory where autoconf has auxilary files
 AC_CONFIG_AUX_DIR(autoconf)
 
+################################################################################
+dnl -- We need to run the build system with bash.
+if test -z "$BASH_VERSION$CONFIG_SHELL"
+then
+    CONFIG_SHELL=bash
+    export CONFIG_SHELL
+    if $CONFIG_SHELL -c "exit 0"
+    then
+        exec $CONFIG_SHELL $0 "$@"
+    else
+        AC_MSG_NOTICE([The 'bash' shell is needed to build lvm2])
+        AC_MSG_ERROR(['bash' not found])
+    fi
+fi
+
 ################################################################################
 dnl -- Get system type
 AC_CANONICAL_TARGET([])
