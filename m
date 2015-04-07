Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t37Ks5pJ011347
	for <linux-lvm@redhat.com>; Tue, 7 Apr 2015 16:54:05 -0400
Received: from mta11.charter.net (mta11.charter.net [216.33.127.80])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t37Ks2ms021465
	for <linux-lvm@redhat.com>; Tue, 7 Apr 2015 16:54:03 -0400
Received: from imp09 ([10.20.200.9]) by mta11.charter.net
	(InterMail vM.8.01.05.09 201-2260-151-124-20120717) with ESMTP
	id <20150407205402.EIM5815.mta11.charter.net@imp09>
	for <linux-lvm@redhat.com>; Tue, 7 Apr 2015 16:54:02 -0400
Received: from impout006 ([68.114.189.21]) by mtaout005.msg.strl.va.charter.net
	(InterMail vM.9.00.015.01 201-2473-143-101) with ESMTP id
	<20150407205402.JORI1172.mtaout005.msg.strl.va.charter.net@impout006>
	for <linux-lvm@redhat.com>; Tue, 7 Apr 2015 15:54:02 -0500
From: Tony Asleson <tasleson@redhat.com>
Date: Tue,  7 Apr 2015 15:54:01 -0500
Message-Id: <1428440042-13679-1-git-send-email-tasleson@redhat.com>
Subject: [linux-lvm] [PATCH 1/2] python: Make lv addTag/removeTag persistant
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

Michael Schmidt posted an email on linux-lvm about this bug.
Posting this patch for review which corrects the issue and
adds a unit test to verify functionality.

Signed-off-by: Tony Asleson <tasleson@redhat.com>
---
 python/liblvm.c             |   17 +++++++-
 test/api/pytest.sh          |    1 +
 test/api/python_lvm_unit.py |   94 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 1 deletions(-)

diff --git a/python/liblvm.c b/python/liblvm.c
index 3828f27..002174f 100644
--- a/python/liblvm.c
+++ b/python/liblvm.c
@@ -1449,8 +1449,16 @@ static PyObject *_liblvm_lvm_lv_add_tag(lvobject *self, PyObject *args)
 		return NULL;
 	}
 
+    if (lvm_vg_write(self->parent_vgobj->vg) == -1)
+		goto error;
+
 	Py_INCREF(Py_None);
 	return Py_None;
+
+error:
+	PyErr_SetObject(_LibLVMError, _liblvm_get_last_error());
+
+	return NULL;
 }
 
 static PyObject *_liblvm_lvm_lv_remove_tag(lvobject *self, PyObject *args)
@@ -1467,9 +1475,16 @@ static PyObject *_liblvm_lvm_lv_remove_tag(lvobject *self, PyObject *args)
 		return NULL;
 	}
 
-	Py_INCREF(Py_None);
+    if (lvm_vg_write(self->parent_vgobj->vg) == -1)
+        goto error;
 
+	Py_INCREF(Py_None);
 	return Py_None;
+
+error:
+	PyErr_SetObject(_LibLVMError, _liblvm_get_last_error());
+
+	return NULL;
 }
 
 static PyObject *_liblvm_lvm_lv_get_tags(lvobject *self)
diff --git a/test/api/pytest.sh b/test/api/pytest.sh
index 36f55fa..00ab051 100644
--- a/test/api/pytest.sh
+++ b/test/api/pytest.sh
@@ -45,6 +45,7 @@ export PY_UNIT_PVS=$(cat DEVICES)
 #python_lvm_unit.py -v -f
 
 # Run individual tests for shorter error trace
+python_lvm_unit.py -v TestLvm.test_lv_persistence
 python_lvm_unit.py -v TestLvm.test_config_find_bool
 python_lvm_unit.py -v TestLvm.test_config_override
 python_lvm_unit.py -v TestLvm.test_config_reload
diff --git a/test/api/python_lvm_unit.py b/test/api/python_lvm_unit.py
index 2f22fae..76f7f8a 100755
--- a/test/api/python_lvm_unit.py
+++ b/test/api/python_lvm_unit.py
@@ -368,6 +368,100 @@ class TestLvm(unittest.TestCase):
 		lv.rename(current_name)
 		vg.close()
 
+	def test_lv_persistence(self):
+		# Make changes to the lv, close the vg and re-open to make sure that
+		# the changes persist
+		lv_name = 'lv_test_persist'
+		TestLvm._create_thick_lv(TestLvm._get_pv_device_names(), lv_name)
+
+		# Test rename
+		lv, vg = TestLvm._get_lv(None, lv_name)
+		current_name = lv.getName()
+		new_name = rs()
+		lv.rename(new_name)
+
+		vg.close()
+		vg = None
+
+		lv, vg = TestLvm._get_lv(None, new_name)
+
+		self.assertTrue(lv is not None)
+		
+		if lv and vg:
+			lv.rename(lv_name)
+			vg.close()
+			vg = None
+
+		# Test lv tag add
+		tag = 'hello_world'
+
+		lv, vg = TestLvm._get_lv(None, lv_name)
+		lv.addTag(tag)
+		vg.close()
+		vg = None
+
+		lv, vg = TestLvm._get_lv(None, lv_name)
+		tags = lv.getTags()
+
+		self.assertTrue(tag in tags)
+		vg.close()
+		vg = None
+
+		# Test lv tag delete
+		lv, vg = TestLvm._get_lv(None, lv_name)
+		self.assertTrue(lv is not None and vg is not None)
+		
+		if lv and vg:
+			tags = lv.getTags()
+
+			for t in tags:
+				lv.removeTag(t)	
+
+			vg.close()
+			vg = None
+		
+		lv, vg = TestLvm._get_lv(None, lv_name)
+		self.assertTrue(lv is not None and vg is not None)
+
+		if lv and vg:
+			tags = lv.getTags()
+			
+			if tags:
+				self.assertEqual(len(tags), 0)		
+			vg.close()
+			vg = None
+
+		# Test lv deactivate
+		lv, vg = TestLvm._get_lv(None, lv_name)
+		self.assertTrue(lv is not None and vg is not None)		
+
+		if lv and vg:
+			lv.deactivate()
+			vg.close()
+			vg = None
+
+		lv, vg = TestLvm._get_lv(None, lv_name)
+		self.assertTrue(lv is not None and vg is not None)
+		if lv and vg:	
+			self.assertFalse(lv.isActive())		
+			vg.close()
+			vg = None
+
+		# Test lv activate
+		lv, vg = TestLvm._get_lv(None, lv_name)
+		self.assertTrue(lv is not None and vg is not None)
+		if lv and vg:
+			lv.activate()
+			vg.close()
+			vg = None
+
+		lv, vg = TestLvm._get_lv(None, lv_name)
+		self.assertTrue(lv is not None and vg is not None)
+		if lv and vg:
+			self.assertTrue(lv.isActive())
+			vg.close()
+			vg = None
+
 	def test_lv_snapshot(self):
 
 		thin_lv = 'thin_lv'
-- 
1.7.1
