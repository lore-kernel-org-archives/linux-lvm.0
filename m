Message-ID: <3BBC550E.442F190C@ti.com>
Date: Thu, 04 Oct 2001 14:24:46 +0200
From: christian e <cej@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm 1.0 and kernel 2.2.19.Is rawio patch necessary ??
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
To: linux lvm <linux-lvm@sistina.com>

Hi,all

I downloaded lvm 1.0 and kernel 2.2.19.Couldn't find a rawio for 2.2.19
so I thought it wasn't necessary.Is it ? The rawio patch for 2.2.19 is
not here:

ftp://ftp.kernel.org/pub/linux/kernel/people/sct/raw-io/
or in the PATHCES dir..

I did a ./configure and then a make in the patches dir.Applied that
patch without problems.After compiling the kernel and booting up again I
did a make install in the lvm src dir and it worked fine..I can make
volumes and everything,but it troubles me if I missed something
here..What won't work if the rawio patch is not applied (if it even has
to)

Hope someone can help me out here.

best regards

Christian
