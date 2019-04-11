MIME-Version: 1.0
From: Eric Ren <renzhengeek@gmail.com>
Date: Thu, 11 Apr 2019 08:27:44 +0800
Message-ID: <CAKM4AewbcVR1x0cK8hWLCRxb1BzDd-F+WeK6ObUmB35N1HTqOA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e51a32058636412c"
Subject: [linux-lvm] Aborting. LV mythinpool_tmeta is now incomplete
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
To: LVM general discussion and development <linux-lvm@redhat.com>, lvm-devel@redhat.com, thornber@redhat.com

--000000000000e51a32058636412c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello list,

Recently, we're exercising our container environment which uses lvm to
manage thin LVs, meanwhile we found a very strange error to activate the
thin LV:

=E2=80=9CAborting.  LV mythinpool_tmeta is now incomplete and '--activation=
mode
partial' was not specified.\n: exit status 5: unknown"

centos 7.6
# lvm version
  LVM version:     2.02.180(2)-RHEL7 (2018-07-20)
  Library version: 1.02.149-RHEL7 (2018-07-20)
  Driver version:  4.35.0

It has appeared several times, but can not be reproduced easily by simple
steps, and it only errors at that moment, after it happens everything seems
OK but only that activation failed.

Looking at the code a bit. At first, I suspect the PV may disappear for
some reason, but the VG sits on only one PV, the setup is simple, the
environment is only for testing purposes, it seems unlikely the PV has
problem at that moment and I don't see any problem message with the disk.

```

2513         /* FIXME Avoid repeating identical stat in
dm_tree_node_add_target_area */
2514         for (s =3D start_area; s < areas; s++) {
2515                 if ((seg_type(seg, s) =3D=3D AREA_PV &&
2516                      (!seg_pvseg(seg, s) || !seg_pv(seg, s) ||
!seg_dev(seg, s) ||
2517                        !(name =3D dev_name(seg_dev(seg, s))) || !*name=
 ||
2518                        stat(name, &info) < 0 || !S_ISBLK(info.st_mode)=
)) ||
2519                     (seg_type(seg, s) =3D=3D AREA_LV && !seg_lv(seg, s=
))) {
2520                         if (!seg->lv->vg->cmd->partial_activation) {
2521                                 if
(!seg->lv->vg->cmd->degraded_activation ||
2522                                     !lv_is_raid_type(seg->lv)) {
2523                                         log_error("Aborting.  LV
%s is now incomplete "
2524                                                   "and
'--activationmode partial' was not specified.",
2525                                                   display_lvname(seg->=
lv));
2526                                         return 0;

```
So, does anyone see the same problem? Or any hints to hunt the root cause?
Any suggestion would be welcome!

Regards,
Eric

--000000000000e51a32058636412c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello list,<div><br></di=
v><div>Recently, we&#39;re exercising our container environment which uses =
lvm to manage thin LVs, meanwhile we found a very strange error to activate=
 the thin LV:</div><div><br></div><div>=E2=80=9CAborting.=C2=A0 LV mythinpo=
ol_tmeta is now incomplete and &#39;--activationmode partial&#39; was not s=
pecified.\n: exit status 5: unknown&quot;</div><div><br></div><div>centos 7=
.6</div><div><div># lvm version</div><div>=C2=A0 LVM version:=C2=A0 =C2=A0 =
=C2=A02.02.180(2)-RHEL7 (2018-07-20)</div><div>=C2=A0 Library version: 1.02=
.149-RHEL7 (2018-07-20)</div><div>=C2=A0 Driver version:=C2=A0 4.35.0</div>=
</div><div><br></div><div>It has appeared several times, but can not be rep=
roduced easily by simple steps, and it only errors at that moment, after it=
 happens everything seems OK but only that activation failed.</div><div><br=
></div><div>Looking at the code a bit. At first, I suspect the PV may disap=
pear for some reason, but the VG sits on only one PV, the setup is simple, =
the environment is only for testing purposes, it seems unlikely the PV has =
problem at that moment and I don&#39;t see any problem message with the dis=
k.</div><div><br></div><div>```</div><div><pre style=3D"box-sizing:border-b=
ox;overflow:auto;font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,=
monospace;font-size:12px;padding:0px;margin-top:0px;margin-bottom:0px;line-=
height:1.42857;word-break:break-all;color:rgb(51,51,51);background:rgb(255,=
253,231);border:none;border-radius:2px;white-space:pre-wrap">2513         /=
* FIXME Avoid repeating identical stat in dm_tree_node_add_target_area */<b=
r style=3D"box-sizing:border-box">2514         for (s =3D start_area; s &lt=
; areas; s++) {<br style=3D"box-sizing:border-box">2515                 if =
((seg_type(seg, s) =3D=3D AREA_PV &amp;&amp;<br style=3D"box-sizing:border-=
box">2516                      (!seg_pvseg(seg, s) || !seg_pv(seg, s) || !s=
eg_dev(seg, s) ||<br style=3D"box-sizing:border-box">2517                  =
      !(name =3D dev_name(seg_dev(seg, s))) || !*name ||<br style=3D"box-si=
zing:border-box">2518                        stat(name, &amp;info) &lt; 0 |=
| !S_ISBLK(info.st_mode))) ||<br style=3D"box-sizing:border-box">2519      =
               (seg_type(seg, s) =3D=3D AREA_LV &amp;&amp; !seg_lv(seg, s))=
) {<br style=3D"box-sizing:border-box">2520                         if (!se=
g-&gt;lv-&gt;vg-&gt;cmd-&gt;partial_activation) {<br style=3D"box-sizing:bo=
rder-box">2521                                 if (!seg-&gt;lv-&gt;vg-&gt;c=
md-&gt;degraded_activation ||<br style=3D"box-sizing:border-box">2522      =
                               !lv_is_raid_type(seg-&gt;lv)) {<br style=3D"=
box-sizing:border-box">2523                                         log_err=
or(&quot;Aborting.  LV %s is now incomplete &quot;<br style=3D"box-sizing:b=
order-box">2524                                                   &quot;and=
 &#39;--activationmode partial&#39; was not specified.&quot;,<br style=3D"b=
ox-sizing:border-box">2525                                                 =
  display_lvname(seg-&gt;lv));<br style=3D"box-sizing:border-box">2526     =
                                    return 0;</pre></div><div>```</div><div=
>So, does anyone see the same problem? Or any hints to hunt the root cause?=
 Any suggestion would be welcome!</div><div><br></div><div>Regards,</div><d=
iv>Eric</div></div></div></div>

--000000000000e51a32058636412c--
