Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC87A60F85
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2017 03:06:44 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECFCC7E423
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2017 03:06:42 +0000 (UTC)
References: <CALuPYL3fiHTGbxBFCeQw+HMEAwZBKs2HBMBuThnDFAHDCsDAsQ@mail.gmail.com>
	<CALuPYL3NMm7xrfemcbQ7Kt511rL=VrS7cKi0J0HBKjq8z7QDyg@mail.gmail.com>
	<CALuPYL2R1vLb5TY6CHEcC_m653oSyRHF2UBOU3if5fg2R8bCPg@mail.gmail.com>
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
From: Eric Ren <zren@suse.com>
Message-ID: <ca355575-a7c7-1a03-b042-3f87bec1306e@suse.com>
Date: Mon, 16 Oct 2017 11:06:30 +0800
MIME-Version: 1.0
In-Reply-To: <CALuPYL3nMUm6of__zqAsadKoHkPpBYprH_QEpYmYv20vLhM18g@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------CEED46E583E638CD382A7800"
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
To: Indivar Nair <indivar.nair@techterra.in>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------CEED46E583E638CD382A7800
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi,

On 10/13/2017 06:40 PM, Indivar Nair wrote:
> Thanks Eric,
>
> I want to keep a single VG so that I can get the bandwidth (LVM 
> Striping) of all the disks (PVs)
>   PLUS
> the flexibility to adjust the space allocation between both LVs. Each 
> LV will be used by  different departments. With 1 LV on different 
> hosts, I can distribute the Network Bandwidth too.
> I would also like to take snapshots of each LV before backing up.
>
> I have been reading more about CLVM+Pacemaker options.
> I can see that it is possible to have the same VG activated on 
> multiple hosts for a GFSv2 filesystem.
> In which case, it is the same PVs, VG and LV getting activated on all 
> hosts.

OK! It sounds reasonable.

>
> In my case, we will have the same PVs and VG activated on both hosts, 
> but LV1 on Host01 and LV2 on Host02. I paln to use ext4 or XFS 
> filesystems.
>
> Is there some possibility that it would work?

As said in the last mail, the new resource agent [4] will probably work 
for you, but I didn't test this case yet. It's easy to have a try - the 
RA is just shell
script, you can just copy LVM-activate to 
/usr/lib/ocf/resource.d/heartbeat/ (assume you've installed 
resource-agents package), and then configure
"clvm + LVM-activate" for pacemaker [5]. Please report back if it 
doesn't work for you.

The LVM-activate RA is WIP. We are thinking if we should merge it into 
the old LVM RA. So it may changes at any time.

[5] 
https://www.suse.com/documentation/sle-ha-12/book_sleha/data/sec_ha_clvm_config.html

>
>
>
>     [1]
>     https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/clvm
>     <https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/clvm>
>     [2]
>     https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM
>     <https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM>
>     [3]
>     https://www.redhat.com/archives/linux-lvm/2017-January/msg00025.html
>     <https://www.redhat.com/archives/linux-lvm/2017-January/msg00025.html>
>     [4] https://github.com/ClusterLabs/resource-agents/pull/1040
>     <https://github.com/ClusterLabs/resource-agents/pull/1040>\
>

Eric


--------------CEED46E583E638CD382A7800
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 10/13/2017 06:40 PM, Indivar Nair
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CALuPYL3nMUm6of__zqAsadKoHkPpBYprH_QEpYmYv20vLhM18g@mail.gmail.com">
      <div dir="ltr">Thanks Eric,
        <div><br>
        </div>
        <div>I want to keep a single VG so that I can get the bandwidth
          (LVM Striping) of all the disks (PVs)  </div>
        <div>  PLUS </div>
        <div>the flexibility to adjust the space allocation between both
          LVs. Each LV will be used by  different departments. With 1 LV
          on different hosts, I can distribute the Network Bandwidth
          too.</div>
        <div>I would also like to take snapshots of each LV before
          backing up.</div>
        <div><br>
        </div>
        <div>I have been reading more about CLVM+Pacemaker options.</div>
        <div>I can see that it is possible to have the same VG activated
          on multiple hosts for a GFSv2 filesystem.<br>
        </div>
        <div>In which case, it is the same PVs, VG and LV getting
          activated on all hosts.</div>
      </div>
    </blockquote>
    <br>
    OK! It sounds reasonable.<br>
    <br>
    <blockquote type="cite"
cite="mid:CALuPYL3nMUm6of__zqAsadKoHkPpBYprH_QEpYmYv20vLhM18g@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>In my case, we will have the same PVs and VG activated on
          both hosts, but LV1 on Host01 and LV2 on Host02. I paln to use
          ext4 or XFS filesystems.</div>
        <div><br>
        </div>
        <div>Is there some possibility that it would work?</div>
      </div>
    </blockquote>
    <br>
    As said in the last mail, the new resource agent [4] will probably
    work for you, but I didn't test this case yet. It's easy to have a
    try - the RA is just shell<br>
    script, you can just copy LVM-activate to
    /usr/lib/ocf/resource.d/heartbeat/ (assume you've installed
    resource-agents package), and then configure<br>
    "clvm + LVM-activate" for pacemaker [5]. Please report back if it
    doesn't work for you.<br>
    <br>
    The LVM-activate RA is WIP. We are thinking if we should merge it
    into the old LVM RA. So it may changes at any time.<br>
    <br>
    [5]
<a class="moz-txt-link-freetext" href="https://www.suse.com/documentation/sle-ha-12/book_sleha/data/sec_ha_clvm_config.html">https://www.suse.com/documentation/sle-ha-12/book_sleha/data/sec_ha_clvm_config.html</a><br>
    <br>
    <blockquote type="cite"
cite="mid:CALuPYL3nMUm6of__zqAsadKoHkPpBYprH_QEpYmYv20vLhM18g@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <br>
      </div>
      <div class="gmail_extra">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <br>
            [1] <a
href="https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/clvm"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/ClusterLabs<wbr>/resource-agents/blob/master/<wbr>heartbeat/clvm</a><br>
            [2] <a
href="https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/ClusterLabs<wbr>/resource-agents/blob/master/<wbr>heartbeat/LVM</a><br>
            [3] <a
href="https://www.redhat.com/archives/linux-lvm/2017-January/msg00025.html"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://www.redhat.com/archive<wbr>s/linux-lvm/2017-January/<wbr>msg00025.html</a><br>
            [4] <a
              href="https://github.com/ClusterLabs/resource-agents/pull/1040"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/ClusterLabs<wbr>/resource-agents/pull/1040</a><span
              class="HOEnZb"><font color="#888888">\<br>
              </font></span></blockquote>
        </div>
      </div>
    </blockquote>
    <br>
    Eric<br>
    <br>
  </body>
</html>

--------------CEED46E583E638CD382A7800--
