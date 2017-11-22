Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 365775C552
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2017 05:50:22 +0000 (UTC)
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15A51C04AC53
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2017 05:50:20 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id p23so7103573oie.9
	for <linux-lvm@redhat.com>; Tue, 21 Nov 2017 21:50:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3adc61ab-b979-2072-5b35-b6fb29588faf@suse.com>
References: <CALuPYL3fiHTGbxBFCeQw+HMEAwZBKs2HBMBuThnDFAHDCsDAsQ@mail.gmail.com>
	<CALuPYL0ohSNtaC4N97WWUHbW3J8DfnzhT1Pd=iTe_pFvhN2tjw@mail.gmail.com>
	<CALuPYL3EY2EjGER-Fhz0QW8Mu+LBE-L8oOAYo8=Eu9WwawCbgg@mail.gmail.com>
	<CALuPYL1KRtc5e-ZQOqCKE4fyNt9WAgKzBNDdn-6N52yEEQxvEA@mail.gmail.com>
	<CALuPYL26eMycV=h5ZLHTejWNSh-kwYdMKrNnfR7EfKNM83VBLQ@mail.gmail.com>
	<CALuPYL1uwtmaCS8PoVd6F4Y9u4qqhqtyST0yZi77H7fNdi2XUQ@mail.gmail.com>
	<CALuPYL1=MUfFawNOdSpSO-9az3m1vvWF3Y3jCrertFr5M3NewA@mail.gmail.com>
	<CALuPYL2=kUoNv=VhvKqzqEM9E0QOe5vjeopGAC4oZ8_=0TUhDg@mail.gmail.com>
	<CALuPYL2sLeTe8M7KgBGPbMkZWBQAGaOkkj0SS6ovHTg_0SCmuQ@mail.gmail.com>
	<CALuPYL1UVWO1013K7zna4xcBLQYx2zB1beJXVYpOyXWd=209Sw@mail.gmail.com>
	<611a15f8-dd20-ac38-8be4-afd050a82293@suse.com>
	<CALuPYL3nMUm6of__zqAsadKoHkPpBYprH_QEpYmYv20vLhM18g@mail.gmail.com>
	<ca355575-a7c7-1a03-b042-3f87bec1306e@suse.com>
	<CALuPYL2nhMGC8PZ0GLhF95o5VjLnxYgjEEYQRF08FrBLs3eSug@mail.gmail.com>
	<3adc61ab-b979-2072-5b35-b6fb29588faf@suse.com>
From: Indivar Nair <indivar.nair@techterra.in>
Date: Wed, 22 Nov 2017 11:19:48 +0530
Message-ID: <CALuPYL3cuccWb98iKT_toDAP+oYYwoUFtiXs4qgNTMgL5LGwmQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a113adaa403ab3d055e8be58b"
Subject: Re: [linux-lvm] Shared VG, Separate LVs
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
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--001a113adaa403ab3d055e8be58b
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

Answering your queries -


*"Did you check if your active-passive model HA stack can always work
correctly and stably byputting one node into offline state?"*

           Yes, it works perfectly while failing over and failing back.



*"I noticed you didn't configure LVM resource agent to manage your VG's
(de)activation task,not sure if it can always work as expect, so have more
exceptional checking :)"*

             Strangely the Pacemaker active-passive configuration example
shows VG controlled by Pacemaker, while the active-active one does not. I
have taken the active-active configuration for Pacemaker and created 2 LVs,
then instead of formatting it using the GFS2 clustered filesystem, I used
normal XFS and made sure that it is mounted only on one node at a time.
(lv01 on node 2, lv02 on node2)


https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/global_file_system_2/ch-clustsetup-gfs2

             I can see the clustered VG and LVs as soon ocf:heartbeat:clvm
is started.

Is there anything I am missing here?

Regards,


Indivar Nair

On Tue, Nov 14, 2017 at 10:22 AM, Eric Ren <zren@suse.com> wrote:

> Had a look at your setup, I have one question:
>
> Did you check if your active-passive model HA stack can always work
> correctly and stably by
> putting one node into offline state?
>
> I noticed you didn't configure LVM resource agent to manage your VG's
> (de)activation task,
> not sure if it can always work as expect, so have more exceptional
> checking :)
>
> Eric
>
> On 11/03/2017 02:38 PM, Indivar Nair wrote:
>
> Hi Eric, All,
>
> Thanks for the input. I have got it working.
>
> Here is what I did -
> ------------------------------------------------------------
> ------------------------------------------------------------
> -------------------------------
> Cluster Setup:
> 2 Nodes with CentOS 7.x: clstr01-nd01, clstr01-nd02
> Common storage array between both nodes (8 shared volumes, presented as
> /dev/mapper/mpatha to /dev/mapper/mpathh)
> 2 Port NICs, bonded (bond0) in each node
>
> Resource group grp_xxx (nd01 preferred) -
> Mount Point: /clstr01-xxx
> Cluster IP: 172.16.0.101/24
>
> Resource group grp_yyy (nd02 preferred) -
> Mount Point: /clstr01-yyy
> Cluster IP: 172.16.0.102/24
>
>
> On both nodes:
> --------------
> Edit /etc/lvm/lvm.conf, and configure 'filter' and 'global_filter'
> parameters to scan only the required (local and shared) devices.
>
> Then run -
> # /sbin/lvmconf --enable-cluster
> Rebuild initramfs -
> # mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r).img-orig
> # dracut -H -f /boot/initramfs-$(uname -r).img $(uname -r)
>
> Reboot both nodes.
> --------------
>
>
>
> After rebooting both nodes, run the following commands on any one node:
> --------------
> # pcs cluster start --all
> # pcs resource create dlm ocf:pacemaker:controld op monitor interval=30s
> on-fail=fence clone interleave=true ordered=true
> # pcs resource create clvmd ocf:heartbeat:clvm op monitor interval=30s
> on-fail=fence clone interleave=true ordered=true
> # pcs constraint order start dlm-clone then clvmd-clone
> # pcs constraint colocation add clvmd-clone with dlm-clone
>
>
> # pvcreate /dev/mapper/mpath{a,b,c,d,e,f,g,h}
> # vgcreate -Ay -cy clstr_vg01 /dev/mapper/mpath{a,b,c,d,e,f,g,h}
> # lvcreate -L 100T -n lv01 clstr_vg01
> # mkfs.xfs /dev/clstr_vg01/lv01
> # lvcreate -L 100T -n lv02 clstr_vg01
> # mkfs.xfs /dev/clstr_vg01/lv02
>
>
> # pcs resource create xxx_mount ocf:heartbeat:Filesystem
> device=/dev/clstr_vg01/lv01 directory=/clstr01-xxx fstype=xfs --group
> xxx_grp --disabled
>
> # pcs resource create xxx_ip_01 ocf:heartbeat:IPaddr2 ip=172.16.0.101
> cidr_netmask=24 nic=bond0:0 op monitor interval=30s --group xxx_grp
> --disabled
>
> # pcs constraint location xxx_grp prefers clstr01-nd01=50
> # pcs constraint order start clvmd-clone then xxx_grp
>
> # pcs resource enable xxx_mount
> # pcs resource enable xxx_ip_01
>
>
> # pcs resource create yyy_mount ocf:heartbeat:Filesystem
> device=/dev/clstr_vg01/lv02 directory=/clstr01-yyy fstype=xfs --group
> yyy_grp --disabled
>
> # pcs resource create yyy_ip_01 ocf:heartbeat:IPaddr2 ip=172.16.0.102
> cidr_netmask=24 nic=bond0:1 op monitor interval=30s --group yyy_grp
> --disabled
>
> # pcs constraint location yyy_grp prefers clstr01-nd02=50
> # pcs constraint order start clvmd-clone then yyy_grp
>
> # pcs resource enable yyy_mount
> # pcs resource enable yyy_ip_01
> --------------
>
>
> # pcs resource show
> --------------
> ------------------------------------------------------------
> ------------------------------------------------------------
> -------------------------------
>
>
> Regards,
>
>
> Indivar Nair
>
> On Mon, Oct 16, 2017 at 8:36 AM, Eric Ren <zren@suse.com> wrote:
>
>> Hi,
>> On 10/13/2017 06:40 PM, Indivar Nair wrote:
>>
>> Thanks Eric,
>>
>> I want to keep a single VG so that I can get the bandwidth (LVM Striping)
>> of all the disks (PVs)
>>   PLUS
>> the flexibility to adjust the space allocation between both LVs. Each LV
>> will be used by  different departments. With 1 LV on different hosts, I can
>> distribute the Network Bandwidth too.
>> I would also like to take snapshots of each LV before backing up.
>>
>> I have been reading more about CLVM+Pacemaker options.
>> I can see that it is possible to have the same VG activated on multiple
>> hosts for a GFSv2 filesystem.
>> In which case, it is the same PVs, VG and LV getting activated on all
>> hosts.
>>
>>
>> OK! It sounds reasonable.
>>
>>
>> In my case, we will have the same PVs and VG activated on both hosts, but
>> LV1 on Host01 and LV2 on Host02. I paln to use ext4 or XFS filesystems.
>>
>> Is there some possibility that it would work?
>>
>>
>> As said in the last mail, the new resource agent [4] will probably work
>> for you, but I didn't test this case yet. It's easy to have a try - the RA
>> is just shell
>> script, you can just copy LVM-activate to /usr/lib/ocf/resource.d/heartbeat/
>> (assume you've installed resource-agents package), and then configure
>> "clvm + LVM-activate" for pacemaker [5]. Please report back if it doesn't
>> work for you.
>>
>> The LVM-activate RA is WIP. We are thinking if we should merge it into
>> the old LVM RA. So it may changes at any time.
>>
>> [5] https://www.suse.com/documentation/sle-ha-12/book_sleha/
>> data/sec_ha_clvm_config.html
>>
>>
>>
>>
>>> [1] https://github.com/ClusterLabs/resource-agents/blob/master/h
>>> eartbeat/clvm
>>> [2] https://github.com/ClusterLabs/resource-agents/blob/master/h
>>> eartbeat/LVM
>>> [3] https://www.redhat.com/archives/linux-lvm/2017-January/msg00025.html
>>> [4] https://github.com/ClusterLabs/resource-agents/pull/1040\
>>>
>>
>> Eric
>>
>>
>
>
> _______________________________________________
> linux-lvm mailing listlinux-lvm@redhat.comhttps://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>

--001a113adaa403ab3d055e8be58b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Eric,<div><br></div><div>Answering your queries -</div>=
<div><br></div><div><i><span style=3D"font-size:12.8px">&quot;Did you check=
 if your active-passive model HA stack can always work correctly and stably=
 by</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">p=
utting one node into offline state?&quot;</span></i><br></div><div><br></di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Yes, it works perfectly whi=
le failing over and failing back.</div><div><br></div><div><i><span style=
=3D"font-size:12.8px">&quot;I noticed you didn&#39;t configure LVM resource=
 agent to manage your VG&#39;s (de)activation task,</span><br style=3D"font=
-size:12.8px"><span style=3D"font-size:12.8px">not sure if it can always wo=
rk as expect, so have more exceptional checking :)&quot;</span><br></i></di=
v><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Stran=
gely the Pacemaker active-passive configuration example shows VG controlled=
 by Pacemaker, while the active-active one does not. I have taken the activ=
e-active configuration for Pacemaker and created 2 LVs, then instead of for=
matting it using the GFS2 clustered filesystem, I used normal XFS and made =
sure that it is mounted only on one node at a time. (lv01 on node 2, lv02 o=
n node2)</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0<a href=3D"https://access.redhat.com/documentation/en-us/red_hat_ent=
erprise_linux/7/html/global_file_system_2/ch-clustsetup-gfs2">https://acces=
s.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/global_fil=
e_system_2/ch-clustsetup-gfs2</a></div><div><br></div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I can see the clustered VG and LVs as soo=
n=C2=A0<span style=3D"font-size:12.8px">ocf:heartbeat:clvm is started.</spa=
n></div><div><br></div><div>Is there anything I am missing here?</div><div>=
<br></div><div>Regards,</div><div><br></div><div><br></div><div>Indivar Nai=
r</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On T=
ue, Nov 14, 2017 at 10:22 AM, Eric Ren <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:zren@suse.com" target=3D"_blank">zren@suse.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Had a look at your setup, I have one question:</p>
    <p>Did you check if your active-passive model HA stack can always
      work correctly and stably by<br>
      putting one node into offline state?</p>
    <p>I noticed you didn&#39;t configure LVM resource agent to manage your
      VG&#39;s (de)activation task,<br>
      not sure if it can always work as expect, so have more exceptional
      checking :)</p>
    <p>Eric<br>
    </p><div><div class=3D"h5">
    <br>
    <div class=3D"m_-8311155611117165567moz-cite-prefix">On 11/03/2017 02:3=
8 PM, Indivar Nair
      wrote:<br>
    </div>
    </div></div><blockquote type=3D"cite"><div><div class=3D"h5">
      <div dir=3D"ltr">Hi Eric, All,
        <div><br>
        </div>
        <div>Thanks for the input. I have got it working.=C2=A0</div>
        <div><br>
        </div>
        <div>Here is what I did -</div>
        <div>------------------------------<wbr>---------------------------=
---<wbr>------------------------------<wbr>------------------------------<w=
br>------------------------------<wbr>-<br>
        </div>
        <div>
          <div>
            <div>Cluster Setup:</div>
            <div>2 Nodes with CentOS 7.x: clstr01-nd01, clstr01-nd02</div>
            <div>Common storage array between both nodes (8 shared
              volumes, presented as /dev/mapper/mpatha to
              /dev/mapper/mpathh)</div>
            <div>2 Port NICs, bonded (bond0) in each node</div>
            <div><br>
            </div>
            <div>Resource group grp_xxx (nd01 preferred) -=C2=A0</div>
            <div>Mount Point: /clstr01-xxx=C2=A0</div>
            <div>Cluster IP: <a href=3D"http://172.16.0.101/24" target=3D"_=
blank">172.16.0.101/24</a></div>
            <div><br>
            </div>
            <div>Resource group grp_yyy (nd02 preferred) -=C2=A0</div>
            <div>Mount Point: /clstr01-yyy</div>
            <div>Cluster IP: <a href=3D"http://172.16.0.102/24" target=3D"_=
blank">172.16.0.102/24</a></div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>On both nodes:</div>
            <div>--------------</div>
            <div>Edit /etc/lvm/lvm.conf, and configure &#39;filter&#39; and
              &#39;global_filter&#39; parameters to scan only the required
              (local and shared) devices.</div>
            <div><br>
            </div>
            <div>Then run -=C2=A0</div>
            <div># /sbin/lvmconf --enable-cluster</div>
            <div>Rebuild initramfs -=C2=A0</div>
            <div># mv /boot/initramfs-$(uname -r).img
              /boot/initramfs-$(uname -r).img-orig</div>
            <div># dracut -H -f /boot/initramfs-$(uname -r).img $(uname
              -r)</div>
            <div><br>
            </div>
            <div>Reboot both nodes.</div>
            <div>--------------</div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>After rebooting both nodes, run the following commands
              on any one node:</div>
            <div>--------------</div>
            <div># pcs cluster start --all</div>
            <div># pcs resource create dlm ocf:pacemaker:controld op
              monitor interval=3D30s on-fail=3Dfence clone interleave=3Dtru=
e
              ordered=3Dtrue</div>
            <div># pcs resource create clvmd ocf:heartbeat:clvm op
              monitor interval=3D30s on-fail=3Dfence clone interleave=3Dtru=
e
              ordered=3Dtrue</div>
            <div># pcs constraint order start dlm-clone then clvmd-clone</d=
iv>
            <div># pcs constraint colocation add clvmd-clone with
              dlm-clone</div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div># pvcreate /dev/mapper/mpath{a,b,c,d,e,f,<wbr>g,h}</div>
            <div># vgcreate -Ay -cy clstr_vg01
              /dev/mapper/mpath{a,b,c,d,e,f,<wbr>g,h}</div>
            <div># lvcreate -L 100T -n lv01 clstr_vg01</div>
            <div># mkfs.xfs /dev/clstr_vg01/lv01</div>
            <div># lvcreate -L 100T -n lv02 clstr_vg01</div>
            <div># mkfs.xfs /dev/clstr_vg01/lv02</div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div># pcs resource create xxx_mount
              ocf:heartbeat:Filesystem device=3D/dev/clstr_vg01/lv01
              directory=3D/clstr01-xxx fstype=3Dxfs --group xxx_grp
              --disabled</div>
            <div><br>
            </div>
            <div># pcs resource create xxx_ip_01 ocf:heartbeat:IPaddr2
              ip=3D172.16.0.101 cidr_netmask=3D24 nic=3Dbond0:0 op monitor
              interval=3D30s --group xxx_grp --disabled</div>
            <div><br>
            </div>
            <div># pcs constraint location xxx_grp prefers
              clstr01-nd01=3D50</div>
            <div># pcs constraint order start clvmd-clone then xxx_grp</div=
>
            <div><br>
            </div>
            <div># pcs resource enable xxx_mount</div>
            <div># pcs resource enable xxx_ip_01</div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div># pcs resource create yyy_mount
              ocf:heartbeat:Filesystem device=3D/dev/clstr_vg01/lv02
              directory=3D/clstr01-yyy fstype=3Dxfs --group yyy_grp
              --disabled</div>
            <div><br>
            </div>
            <div># pcs resource create yyy_ip_01 ocf:heartbeat:IPaddr2
              ip=3D172.16.0.102 cidr_netmask=3D24 nic=3Dbond0:1 op monitor
              interval=3D30s --group yyy_grp --disabled</div>
            <div><br>
            </div>
            <div># pcs constraint location yyy_grp prefers
              clstr01-nd02=3D50</div>
            <div># pcs constraint order start clvmd-clone then yyy_grp</div=
>
            <div><br>
            </div>
            <div># pcs resource enable yyy_mount</div>
            <div># pcs resource enable yyy_ip_01</div>
            <div>--------------<br>
            </div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div># pcs resource show</div>
            <div>--------------</div>
          </div>
          <div>------------------------------<wbr>-------------------------=
-----<wbr>------------------------------<wbr>------------------------------=
<wbr>------------------------------<wbr>-<br>
          </div>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>Regards,</div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>Indivar Nair</div>
      </div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On Mon, Oct 16, 2017 at 8:36 AM, Eric
          Ren <span dir=3D"ltr">&lt;<a href=3D"mailto:zren@suse.com" target=
=3D"_blank">zren@suse.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            <div text=3D"#000000" bgcolor=3D"#FFFFFF">
              <p>Hi,<br>
              </p>
              <span>
                <div class=3D"m_-8311155611117165567m_-1693594712510700916m=
oz-cite-prefix">On
                  10/13/2017 06:40 PM, Indivar Nair wrote:<br>
                </div>
                <blockquote type=3D"cite">
                  <div dir=3D"ltr">Thanks Eric,
                    <div><br>
                    </div>
                    <div>I want to keep a single VG so that I can get
                      the bandwidth (LVM Striping) of all the disks
                      (PVs) =C2=A0</div>
                    <div>=C2=A0 PLUS=C2=A0</div>
                    <div>the flexibility to adjust the space allocation
                      between both LVs. Each LV will be used by
                      =C2=A0different departments. With 1 LV on different
                      hosts, I can distribute the Network Bandwidth too.</d=
iv>
                    <div>I would also like to take snapshots of each LV
                      before backing up.</div>
                    <div><br>
                    </div>
                    <div>I have been reading more about CLVM+Pacemaker
                      options.</div>
                    <div>I can see that it is possible to have the same
                      VG activated on multiple hosts for a GFSv2
                      filesystem.<br>
                    </div>
                    <div>In which case, it is the same PVs, VG and LV
                      getting activated on all hosts.</div>
                  </div>
                </blockquote>
                <br>
              </span> OK! It sounds reasonable.<span><br>
                <br>
                <blockquote type=3D"cite">
                  <div dir=3D"ltr">
                    <div><br>
                    </div>
                    <div>In my case, we will have the same PVs and VG
                      activated on both hosts, but LV1 on Host01 and LV2
                      on Host02. I paln to use ext4 or XFS filesystems.</di=
v>
                    <div><br>
                    </div>
                    <div>Is there some possibility that it would work?</div=
>
                  </div>
                </blockquote>
                <br>
              </span> As said in the last mail, the new resource agent
              [4] will probably work for you, but I didn&#39;t test this
              case yet. It&#39;s easy to have a try - the RA is just shell<=
br>
              script, you can just copy LVM-activate to
              /usr/lib/ocf/resource.d/heartb<wbr>eat/ (assume you&#39;ve
              installed resource-agents package), and then configure<br>
              &quot;clvm + LVM-activate&quot; for pacemaker [5]. Please rep=
ort
              back if it doesn&#39;t work for you.<br>
              <br>
              The LVM-activate RA is WIP. We are thinking if we should
              merge it into the old LVM RA. So it may changes at any
              time.<br>
              <br>
              [5]
              <a class=3D"m_-8311155611117165567m_-1693594712510700916moz-t=
xt-link-freetext" href=3D"https://www.suse.com/documentation/sle-ha-12/book=
_sleha/data/sec_ha_clvm_config.html" target=3D"_blank">https://www.suse.com=
/documenta<wbr>tion/sle-ha-12/book_sleha/<wbr>data/sec_ha_clvm_config.html<=
/a><span><br>
                <br>
                <blockquote type=3D"cite">
                  <div dir=3D"ltr">
                    <div><br>
                    </div>
                    <br>
                  </div>
                  <div class=3D"gmail_extra">
                    <div class=3D"gmail_quote">
                      <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> <br>
                        [1] <a href=3D"https://github.com/ClusterLabs/resou=
rce-agents/blob/master/heartbeat/clvm" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/ClusterLabs<wbr>/resource-agents/blob/master/h<wbr>eart=
beat/clvm</a><br>
                        [2] <a href=3D"https://github.com/ClusterLabs/resou=
rce-agents/blob/master/heartbeat/LVM" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/ClusterLabs<wbr>/resource-agents/blob/master/h<wbr>eartb=
eat/LVM</a><br>
                        [3] <a href=3D"https://www.redhat.com/archives/linu=
x-lvm/2017-January/msg00025.html" rel=3D"noreferrer" target=3D"_blank">http=
s://www.redhat.com/archive<wbr>s/linux-lvm/2017-January/msg00<wbr>025.html<=
/a><br>
                        [4] <a href=3D"https://github.com/ClusterLabs/resou=
rce-agents/pull/1040" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/ClusterLabs<wbr>/resource-agents/pull/1040</a><span class=3D"m_-83111556=
11117165567m_-1693594712510700916HOEnZb"><font color=3D"#888888">\<br>
                          </font></span></blockquote>
                    </div>
                  </div>
                </blockquote>
                <br>
                Eric<br>
                <br>
              </span></div>
          </blockquote>
        </div>
        <br>
      </div>
      <br>
      <fieldset class=3D"m_-8311155611117165567mimeAttachmentHeader"></fiel=
dset>
      <br>
      </div></div><pre>______________________________<wbr>_________________
linux-lvm mailing list
<a class=3D"m_-8311155611117165567moz-txt-link-abbreviated" href=3D"mailto:=
linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.com</a>
<a class=3D"m_-8311155611117165567moz-txt-link-freetext" href=3D"https://ww=
w.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.redh=
at.com/<wbr>mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class=3D"m_-8311155611117165567moz-txt-link-freet=
ext" href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tld=
p.org/HOWTO/LVM-<wbr>HOWTO/</a></pre>
    </blockquote>
    <br>
  </div>

</blockquote></div><br></div>

--001a113adaa403ab3d055e8be58b--
