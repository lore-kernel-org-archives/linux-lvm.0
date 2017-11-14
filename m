Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 463036BF90
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2017 04:52:42 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 661AFC0587E3
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2017 04:52:40 +0000 (UTC)
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
From: Eric Ren <zren@suse.com>
Message-ID: <3adc61ab-b979-2072-5b35-b6fb29588faf@suse.com>
Date: Tue, 14 Nov 2017 12:52:25 +0800
MIME-Version: 1.0
In-Reply-To: <CALuPYL2nhMGC8PZ0GLhF95o5VjLnxYgjEEYQRF08FrBLs3eSug@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------5FD0685B4E1B42CD9448F579"
Content-Language: en-US
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Indivar Nair <indivar.nair@techterra.in>

This is a multi-part message in MIME format.
--------------5FD0685B4E1B42CD9448F579
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Had a look at your setup, I have one question:

Did you check if your active-passive model HA stack can always work 
correctly and stably by
putting one node into offline state?

I noticed you didn't configure LVM resource agent to manage your VG's 
(de)activation task,
not sure if it can always work as expect, so have more exceptional 
checking :)

Eric


On 11/03/2017 02:38 PM, Indivar Nair wrote:
> Hi Eric, All,
>
> Thanks for the input. I have got it working.
>
> Here is what I did -
> -------------------------------------------------------------------------------------------------------------------------------------------------------
> Cluster Setup:
> 2 Nodes with CentOS 7.x: clstr01-nd01, clstr01-nd02
> Common storage array between both nodes (8 shared volumes, presented 
> as /dev/mapper/mpatha to /dev/mapper/mpathh)
> 2 Port NICs, bonded (bond0) in each node
>
> Resource group grp_xxx (nd01 preferred) -
> Mount Point: /clstr01-xxx
> Cluster IP: 172.16.0.101/24 <http://172.16.0.101/24>
>
> Resource group grp_yyy (nd02 preferred) -
> Mount Point: /clstr01-yyy
> Cluster IP: 172.16.0.102/24 <http://172.16.0.102/24>
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
> # pcs resource create dlm ocf:pacemaker:controld op monitor 
> interval=30s on-fail=fence clone interleave=true ordered=true
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
> -------------------------------------------------------------------------------------------------------------------------------------------------------
>
>
> Regards,
>
>
> Indivar Nair
>
> On Mon, Oct 16, 2017 at 8:36 AM, Eric Ren <zren@suse.com 
> <mailto:zren@suse.com>> wrote:
>
>     Hi,
>
>     On 10/13/2017 06:40 PM, Indivar Nair wrote:
>>     Thanks Eric,
>>
>>     I want to keep a single VG so that I can get the bandwidth (LVM
>>     Striping) of all the disks (PVs)
>>       PLUS
>>     the flexibility to adjust the space allocation between both LVs.
>>     Each LV will be used by  different departments. With 1 LV on
>>     different hosts, I can distribute the Network Bandwidth too.
>>     I would also like to take snapshots of each LV before backing up.
>>
>>     I have been reading more about CLVM+Pacemaker options.
>>     I can see that it is possible to have the same VG activated on
>>     multiple hosts for a GFSv2 filesystem.
>>     In which case, it is the same PVs, VG and LV getting activated on
>>     all hosts.
>
>     OK! It sounds reasonable.
>
>>
>>     In my case, we will have the same PVs and VG activated on both
>>     hosts, but LV1 on Host01 and LV2 on Host02. I paln to use ext4 or
>>     XFS filesystems.
>>
>>     Is there some possibility that it would work?
>
>     As said in the last mail, the new resource agent [4] will probably
>     work for you, but I didn't test this case yet. It's easy to have a
>     try - the RA is just shell
>     script, you can just copy LVM-activate to
>     /usr/lib/ocf/resource.d/heartbeat/ (assume you've installed
>     resource-agents package), and then configure
>     "clvm + LVM-activate" for pacemaker [5]. Please report back if it
>     doesn't work for you.
>
>     The LVM-activate RA is WIP. We are thinking if we should merge it
>     into the old LVM RA. So it may changes at any time.
>
>     [5]
>     https://www.suse.com/documentation/sle-ha-12/book_sleha/data/sec_ha_clvm_config.html
>     <https://www.suse.com/documentation/sle-ha-12/book_sleha/data/sec_ha_clvm_config.html>
>
>>
>>
>>
>>         [1]
>>         https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/clvm
>>         <https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/clvm>
>>         [2]
>>         https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM
>>         <https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM>
>>         [3]
>>         https://www.redhat.com/archives/linux-lvm/2017-January/msg00025.html
>>         <https://www.redhat.com/archives/linux-lvm/2017-January/msg00025.html>
>>         [4] https://github.com/ClusterLabs/resource-agents/pull/1040
>>         <https://github.com/ClusterLabs/resource-agents/pull/1040>\
>>
>
>     Eric
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------5FD0685B4E1B42CD9448F579
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Had a look at your setup, I have one question:</p>
    <p>Did you check if your active-passive model HA stack can always
      work correctly and stably by<br>
      putting one node into offline state?</p>
    <p>I noticed you didn't configure LVM resource agent to manage your
      VG's (de)activation task,<br>
      not sure if it can always work as expect, so have more exceptional
      checking :)</p>
    <p>Eric<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/03/2017 02:38 PM, Indivar Nair
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CALuPYL2nhMGC8PZ0GLhF95o5VjLnxYgjEEYQRF08FrBLs3eSug@mail.gmail.com">
      <div dir="ltr">Hi Eric, All,
        <div><br>
        </div>
        <div>Thanks for the input. I have got it working. </div>
        <div><br>
        </div>
        <div>Here is what I did -</div>
        <div>-------------------------------------------------------------------------------------------------------------------------------------------------------<br>
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
            <div>Resource group grp_xxx (nd01 preferred) - </div>
            <div>Mount Point: /clstr01-xxx </div>
            <div>Cluster IP: <a href="http://172.16.0.101/24"
                moz-do-not-send="true">172.16.0.101/24</a></div>
            <div><br>
            </div>
            <div>Resource group grp_yyy (nd02 preferred) - </div>
            <div>Mount Point: /clstr01-yyy</div>
            <div>Cluster IP: <a href="http://172.16.0.102/24"
                moz-do-not-send="true">172.16.0.102/24</a></div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>On both nodes:</div>
            <div>--------------</div>
            <div>Edit /etc/lvm/lvm.conf, and configure 'filter' and
              'global_filter' parameters to scan only the required
              (local and shared) devices.</div>
            <div><br>
            </div>
            <div>Then run - </div>
            <div># /sbin/lvmconf --enable-cluster</div>
            <div>Rebuild initramfs - </div>
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
              monitor interval=30s on-fail=fence clone interleave=true
              ordered=true</div>
            <div># pcs resource create clvmd ocf:heartbeat:clvm op
              monitor interval=30s on-fail=fence clone interleave=true
              ordered=true</div>
            <div># pcs constraint order start dlm-clone then clvmd-clone</div>
            <div># pcs constraint colocation add clvmd-clone with
              dlm-clone</div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div># pvcreate /dev/mapper/mpath{a,b,c,d,e,f,g,h}</div>
            <div># vgcreate -Ay -cy clstr_vg01
              /dev/mapper/mpath{a,b,c,d,e,f,g,h}</div>
            <div># lvcreate -L 100T -n lv01 clstr_vg01</div>
            <div># mkfs.xfs /dev/clstr_vg01/lv01</div>
            <div># lvcreate -L 100T -n lv02 clstr_vg01</div>
            <div># mkfs.xfs /dev/clstr_vg01/lv02</div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div># pcs resource create xxx_mount
              ocf:heartbeat:Filesystem device=/dev/clstr_vg01/lv01
              directory=/clstr01-xxx fstype=xfs --group xxx_grp
              --disabled</div>
            <div><br>
            </div>
            <div># pcs resource create xxx_ip_01 ocf:heartbeat:IPaddr2
              ip=172.16.0.101 cidr_netmask=24 nic=bond0:0 op monitor
              interval=30s --group xxx_grp --disabled</div>
            <div><br>
            </div>
            <div># pcs constraint location xxx_grp prefers
              clstr01-nd01=50</div>
            <div># pcs constraint order start clvmd-clone then xxx_grp</div>
            <div><br>
            </div>
            <div># pcs resource enable xxx_mount</div>
            <div># pcs resource enable xxx_ip_01</div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div># pcs resource create yyy_mount
              ocf:heartbeat:Filesystem device=/dev/clstr_vg01/lv02
              directory=/clstr01-yyy fstype=xfs --group yyy_grp
              --disabled</div>
            <div><br>
            </div>
            <div># pcs resource create yyy_ip_01 ocf:heartbeat:IPaddr2
              ip=172.16.0.102 cidr_netmask=24 nic=bond0:1 op monitor
              interval=30s --group yyy_grp --disabled</div>
            <div><br>
            </div>
            <div># pcs constraint location yyy_grp prefers
              clstr01-nd02=50</div>
            <div># pcs constraint order start clvmd-clone then yyy_grp</div>
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
          <div>-------------------------------------------------------------------------------------------------------------------------------------------------------<br>
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
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Mon, Oct 16, 2017 at 8:36 AM, Eric
          Ren <span dir="ltr">&lt;<a href="mailto:zren@suse.com"
              target="_blank" moz-do-not-send="true">zren@suse.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div text="#000000" bgcolor="#FFFFFF">
              <p>Hi,<br>
              </p>
              <span class="">
                <div class="m_-1693594712510700916moz-cite-prefix">On
                  10/13/2017 06:40 PM, Indivar Nair wrote:<br>
                </div>
                <blockquote type="cite">
                  <div dir="ltr">Thanks Eric,
                    <div><br>
                    </div>
                    <div>I want to keep a single VG so that I can get
                      the bandwidth (LVM Striping) of all the disks
                      (PVs)  </div>
                    <div>  PLUS </div>
                    <div>the flexibility to adjust the space allocation
                      between both LVs. Each LV will be used by
                       different departments. With 1 LV on different
                      hosts, I can distribute the Network Bandwidth too.</div>
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
              </span> OK! It sounds reasonable.<span class=""><br>
                <br>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div><br>
                    </div>
                    <div>In my case, we will have the same PVs and VG
                      activated on both hosts, but LV1 on Host01 and LV2
                      on Host02. I paln to use ext4 or XFS filesystems.</div>
                    <div><br>
                    </div>
                    <div>Is there some possibility that it would work?</div>
                  </div>
                </blockquote>
                <br>
              </span> As said in the last mail, the new resource agent
              [4] will probably work for you, but I didn't test this
              case yet. It's easy to have a try - the RA is just shell<br>
              script, you can just copy LVM-activate to
              /usr/lib/ocf/resource.d/<wbr>heartbeat/ (assume you've
              installed resource-agents package), and then configure<br>
              "clvm + LVM-activate" for pacemaker [5]. Please report
              back if it doesn't work for you.<br>
              <br>
              The LVM-activate RA is WIP. We are thinking if we should
              merge it into the old LVM RA. So it may changes at any
              time.<br>
              <br>
              [5]
              <a class="m_-1693594712510700916moz-txt-link-freetext"
href="https://www.suse.com/documentation/sle-ha-12/book_sleha/data/sec_ha_clvm_config.html"
                target="_blank" moz-do-not-send="true">https://www.suse.com/<wbr>documentation/sle-ha-12/book_<wbr>sleha/data/sec_ha_clvm_config.<wbr>html</a><span
                class=""><br>
                <br>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div><br>
                    </div>
                    <br>
                  </div>
                  <div class="gmail_extra">
                    <div class="gmail_quote">
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex"> <br>
                        [1] <a
href="https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/clvm"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">https://github.com/ClusterLabs<wbr>/resource-agents/blob/master/h<wbr>eartbeat/clvm</a><br>
                        [2] <a
href="https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">https://github.com/ClusterLabs<wbr>/resource-agents/blob/master/h<wbr>eartbeat/LVM</a><br>
                        [3] <a
href="https://www.redhat.com/archives/linux-lvm/2017-January/msg00025.html"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">https://www.redhat.com/archive<wbr>s/linux-lvm/2017-January/msg00<wbr>025.html</a><br>
                        [4] <a
                          href="https://github.com/ClusterLabs/resource-agents/pull/1040"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">https://github.com/ClusterLabs<wbr>/resource-agents/pull/1040</a><span
                          class="m_-1693594712510700916HOEnZb"><font
                            color="#888888">\<br>
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
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------5FD0685B4E1B42CD9448F579--
