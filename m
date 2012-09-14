Received: from agrover.com (ovpn-113-45.phx2.redhat.com [10.3.113.45])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8EHsmCJ028837
	for <linux-lvm@redhat.com>; Fri, 14 Sep 2012 13:54:49 -0400
From: Andy Grover <agrover@redhat.com>
Date: Fri, 14 Sep 2012 10:54:40 -0700
Message-Id: <1347645284-13738-3-git-send-email-agrover@redhat.com>
In-Reply-To: <1347645284-13738-1-git-send-email-agrover@redhat.com>
References: <1347645284-13738-1-git-send-email-agrover@redhat.com>
Subject: [linux-lvm] [PATCH 2/6] python-lvm: A start at a python-lvm test
	framework
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

Needs a lot of work, but it's a start.

Signed-off-by: Andy Grover <agrover@redhat.com>
---
 liblvm/python/test.py |   42 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 liblvm/python/test.py

diff --git a/liblvm/python/test.py b/liblvm/python/test.py
new file mode 100644
index 0000000..62ab74e
--- /dev/null
+++ b/liblvm/python/test.py
@@ -0,0 +1,42 @@
+#-----------------------------
+#Python example code:
+#-----------------------------
+
+import liblvm
+
+# create a new LVM instance
+lvm = liblvm.Liblvm()
+
+# open a VG handle in write mode for 'myvg'
+vg = lvm.vgOpen('myvg','w')
+
+# remove a new LV (lv_foobar)
+lv = vg.createLvLinear('lv_foobar',100000)
+
+# print the uuid for the newly created LV
+print lv.getUuid()
+
+#print the size.
+print lv.getSize()
+
+# Add a tag to it.
+lv.addTag("my_fance_tag")
+
+# Print all tags.
+print lv.getTags()
+
+# Try to deactivate
+try:
+	lv.deactivate()
+except liblvm.LibLVMError:
+	print "lets retry.."
+	lv.deactivate()
+
+# remove
+lv.remove()
+
+# close VG handle
+vg.close()
+
+# close LVM handle
+lvm.close()
-- 
1.7.1
