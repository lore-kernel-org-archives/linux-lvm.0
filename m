Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52F68620A2
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2017 13:52:04 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B03681222
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2017 13:52:03 +0000 (UTC)
References: <CALuPYL3fiHTGbxBFCeQw+HMEAwZBKs2HBMBuThnDFAHDCsDAsQ@mail.gmail.com>
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
	<CALuPYL3cuccWb98iKT_toDAP+oYYwoUFtiXs4qgNTMgL5LGwmQ@mail.gmail.com>
From: Eric Ren <zren@suse.com>
Message-ID: <52d46b9d-c4bd-65a9-639d-de68f47049d5@suse.com>
Date: Thu, 23 Nov 2017 21:46:31 +0800
MIME-Version: 1.0
In-Reply-To: <CALuPYL3cuccWb98iKT_toDAP+oYYwoUFtiXs4qgNTMgL5LGwmQ@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------CF2347A4DB9E0E1D50EA0454"
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
--------------CF2347A4DB9E0E1D50EA0454
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi,

>
> /"I noticed you didn't configure LVM resource agent to manage your 
> VG's (de)activation task,
> not sure if it can always work as expect, so have more exceptional 
> checking :)"
> /
>
>              Strangely the Pacemaker active-passive configuration 
> example shows VG controlled by Pacemaker, while the active-active one 
> does not. I have taken the active-active configuration for Pacemaker 
> and created 2 LVs, then instead of formatting it using the GFS2 
> clustered filesystem, I used normal XFS and made sure that it is 
> mounted only on one node at a time. (lv01 on node 2, lv02 on node2)
>
> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/global_file_system_2/ch-clustsetup-gfs2
>
>              I can see the clustered VG and LVs as soon 
> ocf:heartbeat:clvm is started.
>
> Is there anything I am missing here?

Good. "clvm" will activate all VGs by default. If you have more than one 
VG in your cluster,  you may want to
activate/deactivate one VG for each group of "vg" and "xfs", then you 
may need to look at LVM for each VG:

https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM

Eric

--------------CF2347A4DB9E0E1D50EA0454
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi,<br>
    <br>
    <blockquote type="cite"
cite="mid:CALuPYL3cuccWb98iKT_toDAP+oYYwoUFtiXs4qgNTMgL5LGwmQ@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div><i><span>"I noticed you didn't configure LVM resource agent
              to manage your VG's (de)activation task,</span><br>
            <span>not sure if it can always work as expect, so have more
              exceptional checking :)"</span><br>
          </i></div>
        <div><br>
        </div>
        <div>             Strangely the Pacemaker active-passive
          configuration example shows VG controlled by Pacemaker, while
          the active-active one does not. I have taken the active-active
          configuration for Pacemaker and created 2 LVs, then instead of
          formatting it using the GFS2 clustered filesystem, I used
          normal XFS and made sure that it is mounted only on one node
          at a time. (lv01 on node 2, lv02 on node2)</div>
        <div><br>
        </div>
        <div>             <a
href="https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/global_file_system_2/ch-clustsetup-gfs2"
            moz-do-not-send="true">https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/global_file_system_2/ch-clustsetup-gfs2</a></div>
        <div><br>
        </div>
        <div>             I can see the clustered VG and LVs as soon <span>ocf:heartbeat:clvm
            is started.</span></div>
        <div><br>
        </div>
        <div>Is there anything I am missing here?</div>
      </div>
    </blockquote>
    <br>
    Good. "clvm" will activate all VGs by default. If you have more than
    one VG in your cluster,  you may want to<br>
    activate/deactivate one VG for each group of "vg" and "xfs", then
    you may need to look at LVM for each VG:<br>
    <br>
<a class="moz-txt-link-freetext" href="https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM">https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM</a><br>
    <br>
    Eric<br>
  </body>
</html>

--------------CF2347A4DB9E0E1D50EA0454--
