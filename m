From: "Charles Martin" <martinc@ucar.edu>
Message-ID: <000701c3c8b7$3190a800$c3507580@atdsputnik>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to build LVM2 tools for 2.6?
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
Date: Mon Dec 22 12:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm running Linux 2.6.0 on a system that
started life as Red Hat 9. I want to install
the LVM2 tools (v2.0.8) so that I can resurrect
my LVM disks.

When I attempt to build the tools (./configure; make install),
device/dev-io.c fails to compile, due to a missing definition
of BLKGETSIZE64. Clearly, the compile needs to be looking
at the headers in the 2.6.0 tree.

I've seen plenty of mention of people running LVM2 successfully
with the 2.6 test kernels. Can anyone tell me how to build the
tools?

Thanks,
Charlie
