Received: from agrover.com (ovpn-113-45.phx2.redhat.com [10.3.113.45])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8EHsmCK028837
	for <linux-lvm@redhat.com>; Fri, 14 Sep 2012 13:54:50 -0400
From: Andy Grover <agrover@redhat.com>
Date: Fri, 14 Sep 2012 10:54:41 -0700
Message-Id: <1347645284-13738-4-git-send-email-agrover@redhat.com>
In-Reply-To: <1347645284-13738-1-git-send-email-agrover@redhat.com>
References: <1347645284-13738-1-git-send-email-agrover@redhat.com>
Subject: [linux-lvm] [PATCH 3/6] python-lvm: setup.py
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

python-lvm uses distutils for build/install. This is the configuration
file distutils uses to build the library. It includes metadata about the
module as well.

Signed-off-by: Andy Grover <agrover@redhat.com>
---
 liblvm/python/setup.py |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 liblvm/python/setup.py

diff --git a/liblvm/python/setup.py b/liblvm/python/setup.py
new file mode 100644
index 0000000..a54ebef
--- /dev/null
+++ b/liblvm/python/setup.py
@@ -0,0 +1,17 @@
+from distutils.core import setup, Extension
+import os
+
+liblvm = Extension('lvm',
+                    sources = ['liblvm.c'],
+                    libraries= ['lvm2app'],
+                    library_dirs= ['../'])
+
+setup (name='lvm',
+       version=os.environ['LVM_VERSION'],
+       description='Python bindings for liblvm2',
+       license="LGPLv2+",
+       maintainer='LVM2 maintainers',
+       maintainer_email='linux-lvm@redhat.com',
+       url='http://sourceware.org/lvm2/',
+       ext_modules=[liblvm],
+)
-- 
1.7.1
