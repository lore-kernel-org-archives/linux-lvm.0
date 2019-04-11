MIME-Version: 1.0
References: <CAKM4AewbcVR1x0cK8hWLCRxb1BzDd-F+WeK6ObUmB35N1HTqOA@mail.gmail.com>
In-Reply-To: <CAKM4AewbcVR1x0cK8hWLCRxb1BzDd-F+WeK6ObUmB35N1HTqOA@mail.gmail.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Thu, 11 Apr 2019 18:01:30 +0800
Message-ID: <CAKM4Aex11MbzzGrWE=aYF+KM+_o3cOrs6N2n_T5+tSpuu7J=5Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000db99ad05863e451a"
Subject: Re: [linux-lvm] Aborting. LV mythinpool_tmeta is now incomplete
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

--000000000000db99ad05863e451a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Another error message is:

" Failed to suspend thin snapshot origin ..."

which is in _lv_create_an_lv():

```
7829         } else if (lv_is_thin_volume(lv)) {
7830                 /* For snapshot, suspend active thin origin first */
7831                 if (origin_lv && lv_is_active(origin_lv) &&
lv_is_thin_volume(origin_lv)) {
7832                         if (!suspend_lv_origin(cmd, origin_lv)) {
7833                                 log_error("Failed to suspend thin
snapshot origin %s/%s.",
7834                                           origin_lv->vg->name,
origin_lv->name);
7835                                 goto revert_new_lv;
7836                         }
7837                         if (!resume_lv_origin(cmd, origin_lv)) { /*
deptree updates thin-pool */
7838                                 log_error("Failed to resume thin
snapshot origin %s/%s.",
7839                                           origin_lv->vg->name,
origin_lv->name);
7840                                 goto revert_new_lv;
7841                         }
7842                         /* At this point remove pool messages,
snapshot is active */
7843                         if (!update_pool_lv(pool_lv, 0)) {
7844                                 stack;
7845                                 goto revert_new_lv;
7846                         }
```

I don't understand why we need to suspend_lv_origin()
and resume_lv_origin() in line?

And, what reasons might cause this errors?

Regards,
Eric




On Thu, 11 Apr 2019 at 08:27, Eric Ren <renzhengeek@gmail.com> wrote:

> Hello list,
>
> Recently, we're exercising our container environment which uses lvm to
> manage thin LVs, meanwhile we found a very strange error to activate the
> thin LV:
>
> =E2=80=9CAborting.  LV mythinpool_tmeta is now incomplete and '--activati=
onmode
> partial' was not specified.\n: exit status 5: unknown"
>
> centos 7.6
> # lvm version
>   LVM version:     2.02.180(2)-RHEL7 (2018-07-20)
>   Library version: 1.02.149-RHEL7 (2018-07-20)
>   Driver version:  4.35.0
>
> It has appeared several times, but can not be reproduced easily by simple
> steps, and it only errors at that moment, after it happens everything see=
ms
> OK but only that activation failed.
>
> Looking at the code a bit. At first, I suspect the PV may disappear for
> some reason, but the VG sits on only one PV, the setup is simple, the
> environment is only for testing purposes, it seems unlikely the PV has
> problem at that moment and I don't see any problem message with the disk.
>
> ```
>
> 2513         /* FIXME Avoid repeating identical stat in dm_tree_node_add_=
target_area */
> 2514         for (s =3D start_area; s < areas; s++) {
> 2515                 if ((seg_type(seg, s) =3D=3D AREA_PV &&
> 2516                      (!seg_pvseg(seg, s) || !seg_pv(seg, s) || !seg_=
dev(seg, s) ||
> 2517                        !(name =3D dev_name(seg_dev(seg, s))) || !*na=
me ||
> 2518                        stat(name, &info) < 0 || !S_ISBLK(info.st_mod=
e))) ||
> 2519                     (seg_type(seg, s) =3D=3D AREA_LV && !seg_lv(seg,=
 s))) {
> 2520                         if (!seg->lv->vg->cmd->partial_activation) {
> 2521                                 if (!seg->lv->vg->cmd->degraded_acti=
vation ||
> 2522                                     !lv_is_raid_type(seg->lv)) {
> 2523                                         log_error("Aborting.  LV %s =
is now incomplete "
> 2524                                                   "and '--activation=
mode partial' was not specified.",
> 2525                                                   display_lvname(seg=
->lv));
> 2526                                         return 0;
>
> ```
> So, does anyone see the same problem? Or any hints to hunt the root cause=
?
> Any suggestion would be welcome!
>
> Regards,
> Eric
>


--=20
- Eric Ren

--000000000000db99ad05863e451a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>Another error message is:=
</div><div><br></div><div>&quot;<span class=3D"gmail-Apple-converted-space"=
 style=3D"font-family:&quot;Helvetica Neue&quot;;font-size:12px">=C2=A0</sp=
an><span style=3D"font-family:&quot;Helvetica Neue&quot;;font-size:12px">Fa=
iled to suspend thin snapshot origin</span><span class=3D"gmail-Apple-conve=
rted-space" style=3D"font-family:&quot;Helvetica Neue&quot;;font-size:12px"=
>=C2=A0...</span>&quot;</div><div><br></div><div>which is in=C2=A0_lv_creat=
e_an_lv():</div><div><br></div><div>```</div><div><div>7829=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0} else if (lv_is_thin_volume(lv)) {</div><div>7830=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* For snapshot,=
 suspend active thin origin first */</div><div>7831=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (origin_lv &amp;&amp; lv_is_active=
(origin_lv) &amp;&amp; lv_is_thin_volume(origin_lv)) {</div><div>7832=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!suspend_lv_origin(cmd, origin_lv)) {</div><div>7833=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_error(&quot;Failed to suspend thi=
n snapshot origin %s/%s.&quot;,</div><div>7834=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0origin_lv-&gt;vg-&gt;na=
me, origin_lv-&gt;name);</div><div>7835=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto revert_new_lv;</div><div>7836=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</div></div><di=
v><div>7837=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!resume_lv_origin(cmd, origin_lv)) { /* dept=
ree updates thin-pool */</div><div>7838=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0log_error(&quot;Failed to resume thin snapshot origin %s/%s.&quot=
;,</div><div>7839=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0origin_lv-&gt;vg-&gt;name, origin_lv-&gt;name);</di=
v><div>7840=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto revert_new_lv;<=
/div><div>7841=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</div><div>7842=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* At this po=
int remove pool messages, snapshot is active */</div><div>7843=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (!update_pool_lv(pool_lv, 0)) {</div><div>7844=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0stack;</div><div>7845=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto revert_new_lv;</div><div>7846=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</div></=
div><div>```</div><div><br></div><div>I don&#39;t understand why we need to=
=C2=A0suspend_lv_origin() and=C2=A0resume_lv_origin() in line?</div><div><b=
r></div><div>And, what reasons might cause this errors?</div><div><br></div=
><div>Regards,</div><div>Eric</div><div><br></div><div><br></div><div><br><=
/div>





</div></div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 11 Apr 2019 at 08:27, Eric Ren &lt;<a=
 href=3D"mailto:renzhengeek@gmail.com" target=3D"_blank">renzhengeek@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello list,<div><br><=
/div><div>Recently, we&#39;re exercising our container environment which us=
es lvm to manage thin LVs, meanwhile we found a very strange error to activ=
ate the thin LV:</div><div><br></div><div>=E2=80=9CAborting.=C2=A0 LV mythi=
npool_tmeta is now incomplete and &#39;--activationmode partial&#39; was no=
t specified.\n: exit status 5: unknown&quot;</div><div><br></div><div>cento=
s 7.6</div><div><div># lvm version</div><div>=C2=A0 LVM version:=C2=A0 =C2=
=A0 =C2=A02.02.180(2)-RHEL7 (2018-07-20)</div><div>=C2=A0 Library version: =
1.02.149-RHEL7 (2018-07-20)</div><div>=C2=A0 Driver version:=C2=A0 4.35.0</=
div></div><div><br></div><div>It has appeared several times, but can not be=
 reproduced easily by simple steps, and it only errors at that moment, afte=
r it happens everything seems OK but only that activation failed.</div><div=
><br></div><div>Looking at the code a bit. At first, I suspect the PV may d=
isappear for some reason, but the VG sits on only one PV, the setup is simp=
le, the environment is only for testing purposes, it seems unlikely the PV =
has problem at that moment and I don&#39;t see any problem message with the=
 disk.</div><div><br></div><div>```</div><div><pre style=3D"box-sizing:bord=
er-box;overflow:auto;font-family:Menlo,Monaco,Consolas,&quot;Courier New&qu=
ot;,monospace;font-size:12px;padding:0px;margin-top:0px;margin-bottom:0px;l=
ine-height:1.42857;word-break:break-all;color:rgb(51,51,51);background:rgb(=
255,253,231);border:none;border-radius:2px;white-space:pre-wrap">2513      =
   /* FIXME Avoid repeating identical stat in dm_tree_node_add_target_area =
*/<br style=3D"box-sizing:border-box">2514         for (s =3D start_area; s=
 &lt; areas; s++) {<br style=3D"box-sizing:border-box">2515                =
 if ((seg_type(seg, s) =3D=3D AREA_PV &amp;&amp;<br style=3D"box-sizing:bor=
der-box">2516                      (!seg_pvseg(seg, s) || !seg_pv(seg, s) |=
| !seg_dev(seg, s) ||<br style=3D"box-sizing:border-box">2517              =
          !(name =3D dev_name(seg_dev(seg, s))) || !*name ||<br style=3D"bo=
x-sizing:border-box">2518                        stat(name, &amp;info) &lt;=
 0 || !S_ISBLK(info.st_mode))) ||<br style=3D"box-sizing:border-box">2519  =
                   (seg_type(seg, s) =3D=3D AREA_LV &amp;&amp; !seg_lv(seg,=
 s))) {<br style=3D"box-sizing:border-box">2520                         if =
(!seg-&gt;lv-&gt;vg-&gt;cmd-&gt;partial_activation) {<br style=3D"box-sizin=
g:border-box">2521                                 if (!seg-&gt;lv-&gt;vg-&=
gt;cmd-&gt;degraded_activation ||<br style=3D"box-sizing:border-box">2522  =
                                   !lv_is_raid_type(seg-&gt;lv)) {<br style=
=3D"box-sizing:border-box">2523                                         log=
_error(&quot;Aborting.  LV %s is now incomplete &quot;<br style=3D"box-sizi=
ng:border-box">2524                                                   &quot=
;and &#39;--activationmode partial&#39; was not specified.&quot;,<br style=
=3D"box-sizing:border-box">2525                                            =
       display_lvname(seg-&gt;lv));<br style=3D"box-sizing:border-box">2526=
                                         return 0;</pre></div><div>```</div=
><div>So, does anyone see the same problem? Or any hints to hunt the root c=
ause? Any suggestion would be welcome!</div><div><br></div><div>Regards,</d=
iv><div>Eric</div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail-m_7902349026975974332gmail_signature"><div dir=3D"ltr">- Er=
ic Ren<br></div></div>

--000000000000db99ad05863e451a--
