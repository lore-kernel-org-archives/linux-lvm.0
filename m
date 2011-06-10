MIME-Version: 1.0
Date: Fri, 10 Jun 2011 11:22:59 +0800
Message-ID: <BANLkTikU4hKDG8h-5tBZAdtuwC+82b5FUw@mail.gmail.com>
From: niko <tongfw@gmail.com>
Content-Type: multipart/alternative; boundary=00163641725b239d7604a55316b8
Subject: [linux-lvm] memlock_inc increased device open count problem
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

--00163641725b239d7604a55316b8
Content-Type: text/plain; charset=ISO-8859-1

Hi,everyone
I'm using mpatocka's patches for shared snapshot on RHEL6.
Problem occurred when creating shared cow storage volume.
the same problem occurred when creating snapshot
I got error message:

  Unable to deactivate open vgtest-orig--shared (253:2)
  Aborting. Couldn't deactivate snapshot COW area. Manual intervention
required.
Then,I did some digging, in lv_deactivate

@@ -1117,6 +1121,9 @@
                stack;
        memlock_inc(cmd);
+       if (!lv_info(cmd, lv, 0, &info, 1, 0))
+               goto_out;
+       log_verbose("lv_deactivate: open_count %d", info.open_count);
        r = _lv_deactivate(lv);
        memlock_dec(cmd);
        fs_unlock();
it turns out :

 lv_deactivate: open_count 1
before memlock_inc, open_count is 0

I wonder how it changes to 1 ?

-- 
niko

--00163641725b239d7604a55316b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi,everyone</div><div>I&#39;m using mpatocka&#39;s patches for shared =
snapshot on RHEL6.</div><div>Problem occurred when creating shared cow stor=
age volume.</div><div>the same problem occurred when creating snapshot</div=
>
<div>I got error message:</div><div>=A0</div><div>=A0 Unable to deactivate =
open vgtest-orig--shared (253:2)<br>=A0 Aborting. Couldn&#39;t deactivate s=
napshot COW area. Manual intervention required.<br></div><div>Then,I did so=
me digging,=A0in lv_deactivate</div>
<div>=A0</div><div>@@ -1117,6 +1121,9 @@<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 stack;</div><div>=A0=A0=A0=A0=A0=A0=A0 memlock_inc(cmd);<br=
>+=A0=A0=A0=A0=A0=A0 if (!lv_info(cmd, lv, 0, &amp;info, 1, 0))<br>+=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto_out;<br>+=A0=A0=A0=A0=A0=A0 log_v=
erbose(&quot;lv_deactivate: open_count %d&quot;, info.open_count);<br>
=A0=A0=A0=A0=A0=A0=A0 r =3D _lv_deactivate(lv);<br>=A0=A0=A0=A0=A0=A0=A0 me=
mlock_dec(cmd);<br>=A0=A0=A0=A0=A0=A0=A0 fs_unlock();<br></div><div>it turn=
s out :</div><div>=A0</div><div>=A0lv_deactivate: open_count=A01<br></div><=
div>before memlock_inc, open_count is 0 </div>
<div>=A0</div><div>I wonder how it changes to 1 ?</div><div><br>-- <br>niko=
 </div>

--00163641725b239d7604a55316b8--
