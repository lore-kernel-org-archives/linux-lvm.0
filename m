From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] errors compiling on redhat 7.3
Message-ID: <20020528133742.A26572@uk.sistina.com>
References: <200205280843.AA111477202@mail.one.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200205280843.AA111477202@mail.one.it>; from pierluigi.godi@mail.one.it on Tue, May 28, 2002 at 08:43:55AM +0200
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
Date: Tue May 28 10:26:43 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, May 28, 2002 at 08:43:55AM +0200, Pierluigi Godi wrote:
> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header
> included in userspace

Try removing the line in tools/lib/liblvm.h that includes
<linux/autoconf.h>.

Alasdair
-- 
agk@uk.sistina.com


--- LVM-borken/tools/lib/liblvm.h	Wed May 22 23:00:43 2002
+++ LVM/tools/lib/liblvm.h	Tue May 28 13:28:19 2002
@@ -60,5 +60,4 @@
 
 #include <features.h>
-#include <linux/autoconf.h>
 
 #ifndef LINUX_VERSION_CODE
