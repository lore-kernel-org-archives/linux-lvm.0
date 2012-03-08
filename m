Message-ID: <4F5908F4.50206@redhat.com>
Date: Thu, 08 Mar 2012 11:31:00 -0800
From: Andy Grover <agrover@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] python-liblvm
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
Cc: lars.sjostrom@redhat.com, Tony Asleson <tasleson@redhat.com>

Hi all,

I've taken Lars Sjostrom's code, tweaked it a little and stuck it on github:

Original:
http://www.redhat.com/archives/lvm-devel/2011-January/msg00138.html

repo:
https://github.com/agrover/liblvm

As the original thread mentioned, this may eventually be useful for
Anaconda. My own interest is combining it with the LIO kernel target to
make storage nodes remotely configurable via libstoragemgmt[1].

Regards -- Andy

[1] http://sourceforge.net/projects/libstoragemgmt/
