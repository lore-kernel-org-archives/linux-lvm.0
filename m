From: James Pattinson <jamesp@foobarhouse.com>
Message-ID: <1000997517.3baa028d1105c@mail.foobarhouse.com>
Date: Thu, 20 Sep 2001 15:51:57 +0100 (BST)
References: <550C100A8350CE4BBD3DD2D7788FD0CA481FBD@fcmail1.FC.COM> <20010920083116.C551@tykepenguin.com>
In-Reply-To: <20010920083116.C551@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] 1.0.1-rc2 config & kernel question
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
To: linux-lvm@sistina.com

Hi!

I've just downloaded LVM 1.0.1-rc2 and tried to configure it ready for kernel
2.4.9. However I get this output:

[root@fuse 1.0.1-rc2]# ./configure 
.
. (omitted)
.
checking for st_rdev in struct stat... (cached) yes
checking whether time.h and sys/time.h may both be included... (cached) yes
./scripts/linuxver: [: ==: binary operator expected
./configure: [: ==: binary operator expected
checking whether gcc needs -traditional... (cached) no
checking return type of signal handlers... (cached) int
checking for vprintf... (cached) yes
checking for mkdir... (cached) yes
checking for rmdir... (cached) yes
checking for uname... (cached) yes
creating ./config.status
creating Makefile
creating make.tmpl
creating PATCHES/Makefile
creating tools/Makefile
creating tools/tools_and_lib.make.tmpl
creating tools/lib/Makefile
creating tools/man8/Makefile
./configure: ${srcdir/#\/*}: bad substitution

The patch seems to build OK however.

Another question - what kernel / lvm version do people recommend I use if I want
to avoid the MM problems in 2.4.9? I'd rather use a cutting edge version, but
what's the most stable? I couldn't seem to get 2.4.9-ac9 working, as it already
seems to have LVM beta7 parts in it and the patch doesn't work.

Has anyone had LVM 1.0.1-rc2 working with 2.4.10-pre12 ?

Regards,

James
