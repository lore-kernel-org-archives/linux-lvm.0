Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t36H8UR3001238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 6 Apr 2015 13:08:30 -0400
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mx1.redhat.com (Postfix) with ESMTPS id 7C39E8EFF1
	for <linux-lvm@redhat.com>; Mon,  6 Apr 2015 17:08:29 +0000 (UTC)
Received: by obbec2 with SMTP id ec2so49668725obb.3
	for <linux-lvm@redhat.com>; Mon, 06 Apr 2015 10:08:29 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 6 Apr 2015 12:08:28 -0500
Message-ID: <CAKEq5nvhrnJ9Cir70jb8uqmcV42AT2sqGh_qNpo7-rCAu4Gd-A@mail.gmail.com>
From: Michael Schmidt <schmidmt@gmail.com>
Content-Type: multipart/alternative; boundary=089e01634bf8cf1058051311587d
Subject: [linux-lvm] Tagging LVs with Python Bindings
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
To: linux-lvm@redhat.com

--089e01634bf8cf1058051311587d
Content-Type: text/plain; charset=UTF-8

Hi all,

While working with the Python bindings and attempting to add tags to
logical volume lvm_vg_write seems not to be called. This means if add_tag
is called and the virtual group handle is closed the tags disappear. The
action in _liblvm_lvm_vg_add_tag solves this by calling lvm_vg_write on the
handle itself. Since the lv handle does not seem to have access to it's vg
handle I added a method to the vg just to trigger a write:

--- liblvm.c    2015-04-06 11:55:01.972332429 -0500
+++ liblvm_python.c     2015-04-06 11:47:27.989632725 -0500
@@ -1202,6 +1202,23 @@
        return pytuple;
 }

+static PyObject *_liblvm_lvm_vg_write(vgobject *self)
+{
+       VG_VALID(self);
+
+       if (lvm_vg_write(self->vg) == -1)
+               goto error;
+
+  return Py_None;
+
+error:
+       PyErr_SetObject(_LibLVMError, _liblvm_get_last_error());
+
+       Py_INCREF(Py_None);
+       return NULL;
+}
+
+
 typedef lv_t (*lv_fetch_by_N)(vg_t vg, const char *id);
 typedef pv_t (*pv_fetch_by_N)(vg_t vg, const char *id);

@@ -1854,6 +1871,7 @@
        { "createLvLinear",
(PyCFunction)_liblvm_lvm_vg_create_lv_linear, METH_VARARGS },
        { "createLvThinpool",
(PyCFunction)_liblvm_lvm_vg_create_lv_thinpool, METH_VARARGS },
        { "createLvThin",       (PyCFunction)_liblvm_lvm_vg_create_lv_thin,
METH_VARARGS },
+  { "write",   (PyCFunction)_liblvm_lvm_vg_write, METH_VARARGS },
        { NULL, NULL }          /* sentinel */
 };



My question is: is there a better way to accomplish this?

Thanks,

Mike


-- 
Michael T Schmidt | schmidmt.com | duality.io

--089e01634bf8cf1058051311587d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>While working with the Python b=
indings and attempting to add tags to logical volume=C2=A0lvm_vg_write seem=
s not to be called. This means if add_tag is called and the virtual group h=
andle is closed the tags disappear. The action in _liblvm_lvm_vg_add_tag so=
lves this by calling lvm_vg_write on the handle itself. Since the lv handle=
 does not seem to have access to it&#39;s vg handle I added a method to the=
 vg just to trigger a write:</div><div><br></div><div><div>--- liblvm.c =C2=
=A0 =C2=A02015-04-06 11:55:01.972332429 -0500</div><div>+++ liblvm_python.c=
 =C2=A0 =C2=A0 2015-04-06 11:47:27.989632725 -0500</div><div>@@ -1202,6 +12=
02,23 @@</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return pytuple;</div><div>=
=C2=A0}</div><div><br></div><div>+static PyObject *_liblvm_lvm_vg_write(vgo=
bject *self)</div><div>+{</div><div>+ =C2=A0 =C2=A0 =C2=A0 VG_VALID(self);<=
/div><div>+</div><div>+ =C2=A0 =C2=A0 =C2=A0 if (lvm_vg_write(self-&gt;vg) =
=3D=3D -1)</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 got=
o error;</div><div>+</div><div>+ =C2=A0return Py_None;</div><div>+</div><di=
v>+error:</div><div>+ =C2=A0 =C2=A0 =C2=A0 PyErr_SetObject(_LibLVMError, _l=
iblvm_get_last_error());</div><div>+</div><div>+ =C2=A0 =C2=A0 =C2=A0 Py_IN=
CREF(Py_None);</div><div>+ =C2=A0 =C2=A0 =C2=A0 return NULL;</div><div>+}</=
div><div>+</div><div>+</div><div>=C2=A0typedef lv_t (*lv_fetch_by_N)(vg_t v=
g, const char *id);</div><div>=C2=A0typedef pv_t (*pv_fetch_by_N)(vg_t vg, =
const char *id);</div><div><br></div><div>@@ -1854,6 +1871,7 @@</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;createLvLinear&quot;, =C2=A0 =C2=A0 (Py=
CFunction)_liblvm_lvm_vg_create_lv_linear, METH_VARARGS },</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 { &quot;createLvThinpool&quot;, =C2=A0 (PyCFunction)_=
liblvm_lvm_vg_create_lv_thinpool, METH_VARARGS },</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 { &quot;createLvThin&quot;, =C2=A0 =C2=A0 =C2=A0 (PyCFunction=
)_liblvm_lvm_vg_create_lv_thin, METH_VARARGS },</div><div>+ =C2=A0{ &quot;w=
rite&quot;, =C2=A0 (PyCFunction)_liblvm_lvm_vg_write, METH_VARARGS },</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 { NULL, NULL } =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* sentinel */</div><div>=C2=A0};</div><div><br></div></div><div><br=
></div><div><br></div><div>My question is: is there a better way to accompl=
ish this?</div><div><br></div><div>Thanks,</div><div><br></div><div>Mike</d=
iv><div><br clear=3D"all"><div><br></div>-- <br><div class=3D"gmail_signatu=
re"><div dir=3D"ltr">Michael T Schmidt | <a href=3D"http://schmidmt.com" ta=
rget=3D"_blank">schmidmt.com</a> | <a href=3D"http://duality.io" target=3D"=
_blank">duality.io</a></div></div>
</div></div>

--089e01634bf8cf1058051311587d--
