Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9IAt6C1018598
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 06:55:07 -0400
Received: from awh1.active.ee (alfa.active.ee [194.204.30.36])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9IAt4Jw032626
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 06:55:04 -0400
From: Andres Toomsalu <andres@active.ee>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2A7A9C48-AA83-478D-AB69-266F333C83A7"
Date: Thu, 18 Oct 2012 13:55:02 +0300
In-Reply-To: <CC9722DE-C18E-4CC7-A442-9256CCD46E2A@active.ee>
References: <CB12DB70-5C4F-4936-9EDE-BFF4096D064F@active.ee>
	<507FDA2E.8080301@redhat.com>
	<CC9722DE-C18E-4CC7-A442-9256CCD46E2A@active.ee>
Message-Id: <A9593949-2430-40E0-AEDB-7C7611939228@active.ee>
Subject: Re: [linux-lvm] how to recover after thin pool metadata did fill up?
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


--Apple-Mail=_2A7A9C48-AA83-478D-AB69-266F333C83A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I would happily send you the diagnostic logs  - if you could specify =
what needs to be collected.

--=20
----------------------------------------------
Andres Toomsalu, andres@active.ee






On 18.10.2012, at 13:42, Andres Toomsalu wrote:

> Yes I know that its not currently possible to recover this pool =
anymore - and we got data copied from read-only mode anyway - but bigger =
problem is that there is even no known way to reset/recreate pool - as I =
cant delete/remove the pool - which means that only erasing all PV will =
help probably. Im just looking for a way to erase faulty pool (with =
erasing data) and to be able recreate it without full OS reinstall. Is =
there a way to do it - DM mapper low level commands perhaps?
>=20
> Cheers,
> --=20
> ----------------------------------------------
> Andres Toomsalu, andres@active.ee
>=20
>=20
>=20
>=20
>=20
>=20
> On 18.10.2012, at 13:30, Zdenek Kabelac wrote:
>=20
>> Dne 17.10.2012 22:21, Andres Toomsalu napsal(a):
>>> Hi,
>>>=20
>>> I'm aware that thin provisioning is not yet production ready (no =
metadata resize) - but is there a way to recover from thin pool failure =
when pool metadata was filled up?
>>>=20
>>> I did setup 1.95T thin pool and after some usage pool metadata =
(128MB) was filling up to 99,08% - so all pool thin volumes went into =
read-only state.
>>> Problem is that I cannot find a way in order to recover from this =
failure - eg also unable to delete/erase thin volumes and pool - only =
option seems to be full disk PV re-creation (eg OS re-install).
>>>=20
>>> Is there a way to recover or delete thin pool/volumes - without =
erasing other (normal) LVs in this Volume Group?
>>> For example dmsetup remove didn't help.
>>>=20
>>> Some diagnostic output:
>>>=20
>>> lvs -a -o+metadata_percent
>>>  dm_report_object: report function failed for field data_percent
>>>  --- REPEATABLE MSG ---
>>>  dm_report_object: report function failed for field data_percent
>>>  LV                       VG         Attr     LSize   Pool Origin    =
   Data%  Move Log Copy%  Convert Meta%
>>>  pool                     VolGroupL0 twi-i-tz   1,95t                =
    75,28                          99,08
>>>  [pool_tdata]             VolGroupL0 Twi-aot-   1,95t
>>>  [pool_tmeta]             VolGroupL0 ewi-aot- 128,00m
>>>  root                     VolGroupL0 -wi-ao--  10,00g
>>>  swap                     VolGroupL0 -wi-ao--  16,00g
>>>  thin_backup              VolGroupL0 Vwi-i-tz 700,00g pool
>>>  thin_storage             VolGroupL0 Vwi---tz 900,00g pool
>>>  thin_storage-snapshot1   VolGroupL0 Vwi-i-tz 700,00g pool =
thin_storage
>>>  thin_storage-snapshot106 VolGroupL0 Vwi-i-tz 900,00g pool =
thin_storage
>>>  thin_storage-snapshot130 VolGroupL0 Vwi-i-tz 900,00g pool =
thin_storage
>>>  thin_storage-snapshot154 VolGroupL0 Vwi-i-tz 900,00g pool =
thin_storage
>>>  thin_storage-snapshot178 VolGroupL0 Vwi-i-tz 900,00g pool =
thin_storage
>>>  thin_storage-snapshot2   VolGroupL0 Vwi-i-tz 700,00g pool =
thin_storage
>>>  thin_storage-snapshot202 VolGroupL0 Vwi-i-tz 900,00g pool =
thin_storage
>>>=20
>>> dmsetup table
>>> VolGroupL0-thin_storage--snapshot2:
>>> VolGroupL0-thin_storage--snapshot178:
>>> VolGroupL0-swap: 0 33554432 linear 8:2 41945088
>>> VolGroupL0-thin_storage--snapshot1:
>>> VolGroupL0-root: 0 20971520 linear 8:2 20973568
>>> VolGroupL0-thin_storage--snapshot130:
>>> VolGroupL0-pool:
>>> VolGroupL0-thin_backup:
>>> VolGroupL0-thin_storage--snapshot106:
>>> VolGroupL0-thin_storage--snapshot154:
>>> VolGroupL0-pool-tpool: 0 4194304000 thin-pool 253:2 253:3 1024 0 0
>>> VolGroupL0-pool_tdata: 0 2097152000 linear 8:2 75499520
>>> VolGroupL0-pool_tdata: 2097152000 2097152000 linear 8:2 2172913664
>>> VolGroupL0-pool_tmeta: 0 262144 linear 8:2 2172651520
>>> VolGroupL0-thin_storage--snapshot202:
>>>=20
>>> lvremove -f VolGroupL0/pool
>>>  Thin pool transaction_id=3D640, while expected: 643.
>>>  Unable to deactivate open VolGroupL0-pool_tdata (253:3)
>>>  Unable to deactivate open VolGroupL0-pool_tmeta (253:2)
>>>  Failed to deactivate VolGroupL0-pool-tpool
>>>  Failed to resume pool.
>>>  Failed to update thin pool pool.
>>>=20
>>=20
>>=20
>> Unfortunately there is no 'easy' advice for now yet - you hit current =
Achilles heel of thinp support in lvm2 - we are thinking how to make =
recovery usable for user - but it's not easy task since many things are =
making it very complex - so it still needs some month of work.
>>=20
>> As for now - you would need to download git source and disable =
certain security check directly in the source to allow activation of =
damaged pool.
>>=20
>> I guess I could provide you some extra patch that would allow you to =
active thin pool in 'read-only' mode (but it's not yet ready for =
upstream).
>>=20
>> Thus you should be able access 'some' data in this mode with a big =
note - since devices would be in read-only mode - you cannot even run  =
fsck on such partition - and since you have transaction_id mismatch - it =
would need
>> some analysis to see what actually happened - are you able to provide =
me
>> archive files for the history of your recent lvm commands -
>> it should not allow you to have difference bigger then 1 - so there =
is probably some bug (unless you are using some old version of lvm2 with =
initial thinp support)
>>=20
>> Zdenek
>>=20
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20


--Apple-Mail=_2A7A9C48-AA83-478D-AB69-266F333C83A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><div =
apple-content-edited=3D"true"><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: 2; =
text-align: -webkit-auto; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; ">I =
would happily send you the diagnostic logs &nbsp;- if you could specify =
what needs to be collected.</div></div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 12px/normal Helvetica; "><br></div></span></div><div =
apple-content-edited=3D"true">
<span class=3D"Apple-style-span" style=3D"border-collapse: separate; =
color: rgb(0, 0, 0); font-family: Helvetica; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: auto; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; color: =
rgb(0, 0, 0); font-family: Helvetica; font-style: normal; font-variant: =
normal; font-weight: normal; letter-spacing: normal; line-height: =
normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: =
0px; -webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><div><div style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; ">--&nbsp;</div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 12px/normal Helvetica; =
">----------------------------------------------</div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
">Andres Toomsalu, <a =
href=3D"mailto:andres@active.ee">andres@active.ee</a></div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
"><br></div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; min-height: 14px; =
"><br></div></div></div></span><br =
class=3D"Apple-interchange-newline"></div></span><br =
class=3D"Apple-interchange-newline"></span><br =
class=3D"Apple-interchange-newline">
</div>
<br><div><div>On 18.10.2012, at 13:42, Andres Toomsalu wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><div>Yes I =
know that its not currently possible to recover this pool anymore - and =
we got data copied from read-only mode anyway - but bigger problem is =
that there is even no known way to reset/recreate pool - as I cant =
delete/remove the pool - which means that only erasing all PV will help =
probably. Im just looking for a way to erase faulty pool (with erasing =
data) and to be able recreate it without full OS reinstall. Is there a =
way to do it - DM mapper low level commands =
perhaps?<br><br>Cheers,<br>-- =
<br>----------------------------------------------<br>Andres Toomsalu, =
<a =
href=3D"mailto:andres@active.ee">andres@active.ee</a><br><br><br><br><br><=
br><br>On 18.10.2012, at 13:30, Zdenek Kabelac wrote:<br><br><blockquote =
type=3D"cite">Dne 17.10.2012 22:21, Andres Toomsalu =
napsal(a):<br></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite">Hi,<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">I'm aware that thin provisioning =
is not yet production ready (no metadata resize) - but is there a way to =
recover from thin pool failure when pool metadata was filled =
up?<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">I did setup 1.95T thin pool and =
after some usage pool metadata (128MB) was filling up to 99,08% - so all =
pool thin volumes went into read-only =
state.<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite">Problem is that I cannot find a way in order to recover =
from this failure - eg also unable to delete/erase thin volumes and pool =
- only option seems to be full disk PV re-creation (eg OS =
re-install).<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">Is there a way to recover or =
delete thin pool/volumes - without erasing other (normal) LVs in this =
Volume Group?<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">For example dmsetup remove =
didn't help.<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">Some diagnostic =
output:<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">lvs -a =
-o+metadata_percent<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;dm_report_object: report =
function failed for field =
data_percent<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;--- REPEATABLE MSG =
---<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"> &nbsp;dm_report_object: report function failed for field =
data_percent<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;LV =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Attr =
&nbsp;&nbsp;&nbsp;&nbsp;LSize &nbsp;&nbsp;Pool Origin =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data% &nbsp;Move Log Copy% =
&nbsp;Convert Meta%<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;pool =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VolGroupL0 twi-i-tz =
&nbsp;&nbsp;1,95t =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;75,28 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;99,08<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"> &nbsp;[pool_tdata] =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vo=
lGroupL0 Twi-aot- =
&nbsp;&nbsp;1,95t<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;[pool_tmeta] =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vo=
lGroupL0 ewi-aot- 128,00m<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;root =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VolGroupL0 -wi-ao-- =
&nbsp;10,00g<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;swap =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VolGroupL0 -wi-ao-- =
&nbsp;16,00g<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;thin_backup =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;VolGroupL0 Vwi-i-tz 700,00g =
pool<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"> &nbsp;thin_storage =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vo=
lGroupL0 Vwi---tz 900,00g pool<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;thin_storage-snapshot1 =
&nbsp;&nbsp;VolGroupL0 Vwi-i-tz 700,00g pool =
thin_storage<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;thin_storage-snapshot106 =
VolGroupL0 Vwi-i-tz 900,00g pool =
thin_storage<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;thin_storage-snapshot130 =
VolGroupL0 Vwi-i-tz 900,00g pool =
thin_storage<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;thin_storage-snapshot154 =
VolGroupL0 Vwi-i-tz 900,00g pool =
thin_storage<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;thin_storage-snapshot178 =
VolGroupL0 Vwi-i-tz 900,00g pool =
thin_storage<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;thin_storage-snapshot2 =
&nbsp;&nbsp;VolGroupL0 Vwi-i-tz 700,00g pool =
thin_storage<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;thin_storage-snapshot202 =
VolGroupL0 Vwi-i-tz 900,00g pool =
thin_storage<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">dmsetup =
table<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-thin_storage--snapshot2:<br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-thin_storage--snapshot178:<br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-swap: 0 33554432 linear 8:2 =
41945088<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-thin_storage--snapshot1:<br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite">VolGroupL0-root: =
0 20971520 linear 8:2 20973568<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-thin_storage--snapshot130:<br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-pool:<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-thin_backup:<br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-thin_storage--snapshot106:<br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-thin_storage--snapshot154:<br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-pool-tpool: 0 4194304000 thin-pool 253:2 253:3 =
1024 0 0<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">VolGroupL0-pool_tdata: 0 =
2097152000 linear 8:2 75499520<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">VolGroupL0-pool_tdata: =
2097152000 2097152000 linear 8:2 =
2172913664<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">VolGroupL0-pool_tmeta: 0 262144 =
linear 8:2 2172651520<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite">VolGroupL0-thin_storage--snapshot202:<br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">lvremove -f =
VolGroupL0/pool<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;Thin pool =
transaction_id=3D640, while expected: =
643.<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"> &nbsp;Unable to deactivate open VolGroupL0-pool_tdata =
(253:3)<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"> &nbsp;Unable to deactivate open VolGroupL0-pool_tmeta =
(253:2)<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"> &nbsp;Failed to deactivate =
VolGroupL0-pool-tpool<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"> &nbsp;Failed to resume =
pool.<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"> &nbsp;Failed to update thin pool =
pool.<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote type=3D"cite">Unfortunately =
there is no 'easy' advice for now yet - you hit current Achilles heel of =
thinp support in lvm2 - we are thinking how to make recovery usable for =
user - but it's not easy task since many things are making it very =
complex - so it still needs some month of =
work.<br></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote type=3D"cite">As for now - =
you would need to download git source and disable certain security check =
directly in the source to allow activation of damaged =
pool.<br></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote type=3D"cite">I guess I could =
provide you some extra patch that would allow you to active thin pool in =
'read-only' mode (but it's not yet ready for =
upstream).<br></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote type=3D"cite">Thus you should =
be able access 'some' data in this mode with a big note - since devices =
would be in read-only mode - you cannot even run &nbsp;fsck on such =
partition - and since you have transaction_id mismatch - it would =
need<br></blockquote><blockquote type=3D"cite">some analysis to see what =
actually happened - are you able to provide =
me<br></blockquote><blockquote type=3D"cite">archive files for the =
history of your recent lvm commands -<br></blockquote><blockquote =
type=3D"cite">it should not allow you to have difference bigger then 1 - =
so there is probably some bug (unless you are using some old version of =
lvm2 with initial thinp support)<br></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote =
type=3D"cite">Zdenek<br></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote =
type=3D"cite">_______________________________________________<br></blockqu=
ote><blockquote type=3D"cite">linux-lvm mailing =
list<br></blockquote><blockquote type=3D"cite"><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br></blockqu=
ote><blockquote type=3D"cite"><a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</a><br></blockquote><blockquote =
type=3D"cite">read the LVM HOW-TO at <a =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</a><br></blockquote><blockquote =
type=3D"cite"><br></blockquote><br><br>___________________________________=
____________<br>linux-lvm mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/<br><br></div></blockquote></div><br></bod=
y></html>=

--Apple-Mail=_2A7A9C48-AA83-478D-AB69-266F333C83A7--
