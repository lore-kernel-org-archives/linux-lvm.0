Received: from o.ww.redhat.com (ovpn-204-18.brq.redhat.com [10.40.204.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u73DA0If018438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 3 Aug 2016 09:10:02 -0400
References: <CAEMJtDsvR-70bVC2E=aMGoA1nR_ReqW-jVELTjmJyQDY+xzXnw@mail.gmail.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <c5f4003c-f3ea-1aac-1727-d14ba3281d13@redhat.com>
Date: Wed, 3 Aug 2016 15:10:00 +0200
MIME-Version: 1.0
In-Reply-To: <CAEMJtDsvR-70bVC2E=aMGoA1nR_ReqW-jVELTjmJyQDY+xzXnw@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------CAD925D917C76F2820E1D350"
Subject: Re: [linux-lvm] lvm2 raid volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------CAD925D917C76F2820E1D350
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/03/2016 12:49 AM, Steve Dainard wrote:
> Hello,
>
> What are the methods for checking/monitoring a RAID LV?

Hi Stev,

see dmeventd (device-mapper monitoring daemon) and read lvm.conf WRT 
raid_fault_policy.

dmeventd provides warn or allocate mode allowing to either just warn 
about a RAID DataLV
or MetaLV failure or actively repair such failures. You'll find related 
messages in the system log.

>
> The Cpy%Sync field seems promising here:
>
> # lvs
>   LV    VG           Attr       LSize   Pool Origin Data%  Meta%  Move 
> Log Cpy%Sync Convert
>   raid1 test         rwi-aor--- 100.00m                  100.00
>   raid6 test         rwi-aor--- 108.00m                  100.00

The Cyp%Sync field tells you about the resynchronization progress, i.e. 
the initial mirroring of
all data blocks in a raid1/10 or the initial calculation and storing of 
parity blocks in raid4/5/6.

It should display a percentage value as in:

# lvs -o+devices iscsi
   LV   VG          Attr       LSize   Pool Origin Data%  Meta%  Move 
Log Cpy%Sync Convert Devices
   r    iscsi rwi-a-r--- 4.00t 0.03 
r_rimage_0(0),r_rimage_1(0),r_rimage_2(0),r_rimage_3(0),r_rimage_4(0),r_rimage_5(0)

Do you have a clean installation?
Try reinstalling lvm2 and device-mapper\*

>
> # pvs
>   PV         VG           Fmt  Attr PSize    PFree
>   /dev/vdb   test         lvm2 a--  1020.00m 876.00m
>   /dev/vdc   test         lvm2 a--  1020.00m 876.00m
>   /dev/vdd   test         lvm2 a--  1020.00m 980.00m
>   /dev/vde   test         lvm2 a--  1020.00m 980.00m
>   /dev/vdf   test         lvm2 a--  1020.00m 980.00m
>
> But testing in a VM by removing a disk does not change the output of lvs:
>
> # pvs
>   WARNING: Device for PV S5xFZ7-mLaH-GNQP-ujWh-Zbkt-Ww3u-J0aKUJ not 
> found or rejected by a filter.
>   PV             VG           Fmt  Attr PSize    PFree
>   /dev/vdb       test         lvm2 a--  1020.00m 876.00m
>   /dev/vdc       test         lvm2 a--  1020.00m 876.00m
>   /dev/vdd       test         lvm2 a--  1020.00m 980.00m
>   /dev/vde       test         lvm2 a--  1020.00m 980.00m
>   unknown device test         lvm2 a-m  1020.00m 980.00m
>
> # lvs
>   WARNING: Device for PV S5xFZ7-mLaH-GNQP-ujWh-Zbkt-Ww3u-J0aKUJ not 
> found or rejected by a filter.
>   LV    VG           Attr       LSize   Pool Origin Data%  Meta%  Move 
> Log Cpy%Sync Convert
>   raid1 test         rwi-aor--- 100.00m                  100.00
>   raid6 test         rwi-aor-p- 108.00m                  100.00
>
>
> My end goal is to write a nagios check to monitor for disk failures.

You may want to start with the Nagios checkvolmanager plugin...

Heinz

>
> Thanks,
> Steve
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------CAD925D917C76F2820E1D350
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p><br>
    </p>
    <br>
    <div class=3D"moz-cite-prefix">On 08/03/2016 12:49 AM, Steve Dainard
      wrote:<br>
    </div>
    <blockquote
cite=3D"mid:CAEMJtDsvR-70bVC2E=3DaMGoA1nR_ReqW-jVELTjmJyQDY+xzXnw@mail.gmai=
l.com"
      type=3D"cite">
      <meta http-equiv=3D"Context-Type" content=3D"text/html; charset=3DUTF=
-8">
      <div dir=3D"ltr">Hello,
        <div><br>
        </div>
        <div>What are the methods for checking/monitoring a RAID LV?</div>
      </div>
    </blockquote>
    <br>
    Hi Stev,<br>
    <br>
    see dmeventd (device-mapper monitoring daemon) and read lvm.conf WRT
    raid_fault_policy.<br>
    <br>
    dmeventd provides warn or allocate mode allowing to either just warn
    about a RAID DataLV<br>
    or MetaLV failure or actively repair such failures. You'll find
    related messages in the system log.<br>
    <br>
    <blockquote
cite=3D"mid:CAEMJtDsvR-70bVC2E=3DaMGoA1nR_ReqW-jVELTjmJyQDY+xzXnw@mail.gmai=
l.com"
      type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>The Cpy%Sync field seems promising here:</div>
        <div><br>
        </div>
        <div>
          <div># lvs</div>
          <div>=EF=BF=BD LV =EF=BF=BD =EF=BF=BDVG =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD Attr =EF=BF=BD =EF=BF=BD =EF=BF=BD LSize =EF=BF=
=BD Pool Origin Data%
            =EF=BF=BDMeta% =EF=BF=BDMove Log Cpy%Sync Convert</div>
          <div>=EF=BF=BD raid1 test =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD=
 rwi-aor--- 100.00m =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD
            =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD100.00 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD<br>
          </div>
          <div>=EF=BF=BD raid6 test =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD=
 rwi-aor--- 108.00m =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD
            =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD100.00 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD=EF=
=BF=BD <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    The Cyp%Sync field tells you about the resynchronization progress,
    i.e. the initial mirroring of<br>
    all data blocks in a raid1/10 or the initial calculation and storing
    of parity blocks in raid4/5/6.<br>
    <br>
    It should display a percentage value as in:<br>
    <br>
    # lvs -o+devices iscsi<br>
    =EF=BF=BD LV=EF=BF=BD=EF=BF=BD VG=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD Attr=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD LSize=EF=BF=BD=EF=BF=BD Pool Origin Data%=EF=
=BF=BD Meta%=EF=BF=BD Move
    Log Cpy%Sync Convert
Devices=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD
    <br>
    =EF=BF=BD r=EF=BF=BD=EF=BF=BD=EF=BF=BD iscsi rwi-a-r--- 4.00t=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD
    0.03=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD
r_rimage_0(0),r_rimage_1(0),r_rimage_2(0),r_rimage_3(0),r_rimage_4(0),r_rim=
age_5(0)<br>
    <br>
    Do you have a clean installation?<br>
    Try reinstalling lvm2 and device-mapper\*<br>
    <br>
    <blockquote
cite=3D"mid:CAEMJtDsvR-70bVC2E=3DaMGoA1nR_ReqW-jVELTjmJyQDY+xzXnw@mail.gmai=
l.com"
      type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>
          <div># pvs</div>
          <div>=EF=BF=BD PV =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD VG =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD Fmt =EF=BF=BDAttr PSize =EF=
=BF=BD =EF=BF=BDPFree =EF=BF=BD</div>
          <div>=EF=BF=BD /dev/vdb =EF=BF=BD test =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD lvm2 a-- =EF=BF=BD1020.00m 876.00m<br>
          </div>
          <div>=EF=BF=BD /dev/vdc =EF=BF=BD test =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD lvm2 a-- =EF=BF=BD1020.00m 876.00m</div>
          <div>=EF=BF=BD /dev/vdd =EF=BF=BD test =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD lvm2 a-- =EF=BF=BD1020.00m 980.00m</div>
          <div>=EF=BF=BD /dev/vde =EF=BF=BD test =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD lvm2 a-- =EF=BF=BD1020.00m 980.00m</div>
          <div>=EF=BF=BD /dev/vdf =EF=BF=BD test =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD lvm2 a-- =EF=BF=BD1020.00m 980.00m</div>
        </div>
        <div><br>
        </div>
        <div>But testing in a VM by removing a disk does not change the
          output of lvs:</div>
        <div>
          <div><br>
          </div>
          <div># pvs</div>
          <div>=EF=BF=BD WARNING: Device for PV
            S5xFZ7-mLaH-GNQP-ujWh-Zbkt-Ww3u-J0aKUJ not found or rejected
            by a filter.</div>
          <div>=EF=BF=BD PV =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD VG =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD Fmt =EF=
=BF=BDAttr PSize =EF=BF=BD =EF=BF=BDPFree =EF=BF=BD</div>
          <div>=EF=BF=BD /dev/vdb =EF=BF=BD =EF=BF=BD =EF=BF=BD test =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD lvm2 a-- =EF=BF=BD1020.00m 876.00m<br>
          </div>
          <div>=EF=BF=BD /dev/vdc =EF=BF=BD =EF=BF=BD =EF=BF=BD test =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD lvm2 a-- =EF=BF=BD1020.00m 876.00m</div>
          <div>=EF=BF=BD /dev/vdd =EF=BF=BD =EF=BF=BD =EF=BF=BD test =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD lvm2 a-- =EF=BF=BD1020.00m 980.00m</div>
          <div>=EF=BF=BD /dev/vde =EF=BF=BD =EF=BF=BD =EF=BF=BD test =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD lvm2 a-- =EF=BF=BD1020.00m 980.00m</div>
          <div>=EF=BF=BD unknown device test =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD lvm2 a-m =EF=BF=BD1020.00m 980.00m</div>
        </div>
        <div><br>
        </div>
        <div>
          <div># lvs</div>
          <div>=EF=BF=BD WARNING: Device for PV
            S5xFZ7-mLaH-GNQP-ujWh-Zbkt-Ww3u-J0aKUJ not found or rejected
            by a filter.</div>
          <div>=EF=BF=BD LV =EF=BF=BD =EF=BF=BDVG =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD Attr =EF=BF=BD =EF=BF=BD =EF=BF=BD LSize =EF=BF=
=BD Pool Origin Data%
            =EF=BF=BDMeta% =EF=BF=BDMove Log Cpy%Sync Convert</div>
          <div>=EF=BF=BD raid1 test =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD=
 rwi-aor--- 100.00m =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD
            =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD100.00 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD</div>
          <div>=EF=BF=BD raid6 test =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD=
 rwi-aor-p- 108.00m =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD
            =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD100.00 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD</div>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>My end goal is to write a nagios check to monitor for disk
          failures.</div>
      </div>
    </blockquote>
    <br>
    You may want to start with the Nagios checkvolmanager plugin...<br>
    <br>
    Heinz<br>
    <br>
    <blockquote
cite=3D"mid:CAEMJtDsvR-70bVC2E=3DaMGoA1nR_ReqW-jVELTjmJyQDY+xzXnw@mail.gmai=
l.com"
      type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>Steve</div>
      </div>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap=3D"">_______________________________________________
linux-lvm mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:linux-lvm@redhat.com">=
linux-lvm@redhat.com</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://www.redhat.com/mailman/l=
istinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class=3D"moz-txt-link-freetext" href=3D"http://tl=
dp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------CAD925D917C76F2820E1D350--
