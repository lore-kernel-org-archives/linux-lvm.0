Message-ID: <014d01c3b2f8$be15a930$100119ac@hydro>
From: "<hYdRo>" <hydro@blueyonder.co.uk>
Subject: Re: [linux-lvm] LVM2 on 2.4.22. (Fedora core 1 with nptl) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Nov 24 20:08:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

tugg <tugg@dial.pipex.com> writes:

> Trying to install LVM2 on 2.4.22. (Fedora core 1 with nptl)
>

Please post notes back to here if you managed to work out the patches that
are needed.  I'd like to stick with the fedora kernel instead of grabbing a
clean 2.4.22 as I need some of the other patching that Fedora have done.

>device/dev-io.c: In function `dev_get_size':
>device/dev-io.c:215: error: `BLKGETSIZE64' undeclared (first use in this
function)

The BLKGETSIZE64 error is due to it not being in the "userspace"
<linux/fs.h> for Fedora (glibc-kernel-headers package).
Just add the #define line from /usr/src/linux/include/linux/fs.h (or compile
against that fs.h as other parts of LVM2 seem to want to compile against
kernel private headers from the warnings thrown during compile).
