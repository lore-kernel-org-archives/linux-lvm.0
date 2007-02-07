Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l17EHEQF029305
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 09:17:14 -0500
Received: from souja.net (souja.net [64.22.224.60])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l17EHBXC016449
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 09:17:12 -0500
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Type: multipart/alternative; boundary=Apple-Mail-4--722945206
Message-Id: <A2E4EC06-9B8D-4C63-8567-4DF6475D4543@engineyard.com>
From: Jayson Vantuyl <jvantuyl@engineyard.com>
Date: Wed, 7 Feb 2007 08:16:23 -0600
Subject: [linux-lvm] Strange LVM Error With AoE Disks
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Linux LVM List <linux-lvm@redhat.com>
Cc: Coraid Support <support@coraid.com>


--Apple-Mail-4--722945206
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

Hello,

We have been using Coraid's ATA-Over-Ethernet shelves for a while  
with much success.

Recently, we added a second shelf (numbered 1) to our first shelf  
(numbered 0).  CLVM has been running on the old shelf perfectly fine.

As soon as I added the second shelf, attempting to lvcreate a new lv  
utilizing the new disks generated roughly the following errors:

   Error locking on node ey00-02: Internal lvm error, check syslog
   Error locking on node ey00-05: Internal lvm error, check syslog
   Error locking on node ey00-01: Internal lvm error, check syslog
   Error locking on node ey00-00: Internal lvm error, check syslog
   Error locking on node ey00-04: Internal lvm error, check syslog
   Error locking on node ey00-03: Internal lvm error, check syslog
   Failed to activate new LV.

All of the nodes show the following errors in syslog:

Feb  7 06:09:36 ey00-00 lvm[4869]: Couldn't find all physical volumes  
for volume group ey00-data.
Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find device with uuid  
'0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.
Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find all physical volumes  
for volume group ey00-data.
Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find device with uuid  
'0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.
Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find all physical volumes  
for volume group ey00-data.
Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find device with uuid  
'0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.
Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find all physical volumes  
for volume group ey00-data.
Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find device with uuid  
'0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.
Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find all physical volumes  
for volume group ey00-data.
Feb  7 06:09:37 ey00-00 lvm[4869]: Volume group for uuid not found:  
WWbD8SXOsAJzDYRCFQiciQho84Rl99nVF7QbO0ArRxnH4cZeKgzG0Nx4gbEhgALU

Inspecting the lvm.conf shows that these devices are the new ones  
that were added.

Even more bizarre, pvscan finds them just fine on all nodes.

The only thing I can note about these devices that is particularly  
different is that they appear to be using minor numbers above 256.   
Note this ls output:

brw-rw---- 1 root disk 152, 288 Feb  7 04:43 /dev/etherd/e1.2
brw-rw---- 1 root disk 152, 289 Feb  7 06:10 /dev/etherd/e1.2p1
brw-rw---- 1 root disk 152, 304 Feb  7 04:44 /dev/etherd/e1.3
brw-rw---- 1 root disk 152, 305 Feb  7 06:10 /dev/etherd/e1.3p1

Is there a known problem with LVM or CLVM related to large device  
minor numbers?

-- 
Jayson Vantuyl
Systems Architect
Engine Yard
jvantuyl@engineyard.com



--Apple-Mail-4--722945206
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">Hello,<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>We have been using Coraid's =
ATA-Over-Ethernet shelves for a while with much success.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Recently, we added a second =
shelf (numbered 1) to our first shelf (numbered 0).=A0 CLVM has been =
running on the old shelf perfectly fine.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>As soon as I added the =
second shelf, attempting to lvcreate a new lv utilizing the new disks =
generated roughly the following errors:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>=A0 Error locking on node =
ey00-02: Internal lvm error, check syslog</DIV><DIV>=A0 Error locking on =
node ey00-05: Internal lvm error, check syslog</DIV><DIV>=A0 Error =
locking on node ey00-01: Internal lvm error, check syslog</DIV><DIV>=A0 =
Error locking on node ey00-00: Internal lvm error, check =
syslog</DIV><DIV>=A0 Error locking on node ey00-04: Internal lvm error, =
check syslog</DIV><DIV>=A0 Error locking on node ey00-03: Internal lvm =
error, check syslog</DIV><DIV>=A0 Failed to activate new =
LV.</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>All of =
the nodes show the following errors in syslog:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Feb=A0 7 06:09:36 ey00-00 =
lvm[4869]: Couldn't find all physical volumes for volume group =
ey00-data.</DIV><DIV>Feb=A0 7 06:09:37 ey00-00 lvm[4869]: Couldn't find =
device with uuid =
'0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.</DIV><DIV>Feb=A0 7 06:09:37 =
ey00-00 lvm[4869]: Couldn't find all physical volumes for volume group =
ey00-data.</DIV><DIV>Feb=A0 7 06:09:37 ey00-00 lvm[4869]: Couldn't find =
device with uuid =
'0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.</DIV><DIV>Feb=A0 7 06:09:37 =
ey00-00 lvm[4869]: Couldn't find all physical volumes for volume group =
ey00-data.</DIV><DIV>Feb=A0 7 06:09:37 ey00-00 lvm[4869]: Couldn't find =
device with uuid =
'0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.</DIV><DIV>Feb=A0 7 06:09:37 =
ey00-00 lvm[4869]: Couldn't find all physical volumes for volume group =
ey00-data.</DIV><DIV>Feb=A0 7 06:09:37 ey00-00 lvm[4869]: Couldn't find =
device with uuid =
'0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.</DIV><DIV>Feb=A0 7 06:09:37 =
ey00-00 lvm[4869]: Couldn't find all physical volumes for volume group =
ey00-data.</DIV><DIV>Feb=A0 7 06:09:37 ey00-00 lvm[4869]: Volume group =
for uuid not found: =
WWbD8SXOsAJzDYRCFQiciQho84Rl99nVF7QbO0ArRxnH4cZeKgzG0Nx4gbEhgALU</DIV><DIV=
><BR class=3D"khtml-block-placeholder"></DIV><DIV>Inspecting the =
lvm.conf shows that these devices are the new ones that were =
added.</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>Even =
more bizarre, pvscan finds them just fine on all nodes.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>The only thing I can note =
about these devices that is particularly different is that they appear =
to be using minor numbers above 256.=A0 Note this ls =
output:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>brw-rw---- 1 root disk 152, =
288 Feb=A0 7 04:43 /dev/etherd/e1.2</DIV><DIV>brw-rw---- 1 root disk =
152, 289 Feb=A0 7 06:10 /dev/etherd/e1.2p1</DIV><DIV>brw-rw---- 1 root =
disk 152, 304 Feb=A0 7 04:44 /dev/etherd/e1.3</DIV><DIV>brw-rw---- 1 =
root disk 152, 305 Feb=A0 7 06:10 /dev/etherd/e1.3p1</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Is there a known problem =
with LVM or CLVM related to large device minor numbers?</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><DIV> <SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; =
"><DIV>--=A0</DIV><DIV>Jayson Vantuyl</DIV><DIV><FONT =
class=3D"Apple-style-span" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px; "><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px; ">Systems =
Architect</SPAN></SPAN></SPAN></FONT></DIV><DIV><B style=3D"font-weight: =
bold; "><A href=3D"http://www.engineyard.com"><SPAN =
class=3D"Apple-style-span" style=3D"font-weight: normal;; color: rgb(0, =
0, 238); -khtml-text-decorations-in-effect: underline; "><SPAN =
class=3D"Apple-style-span" style=3D"color: rgb(0, 0, 238); =
-khtml-text-decorations-in-effect: underline; ">Engine =
Yard</SPAN></SPAN></A></B></DIV><DIV><FONT class=3D"Apple-style-span" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;"><SPAN class=3D"Apple-style-span" style=3D"font-size: 10px; =
"><SPAN class=3D"Apple-style-span" style=3D"font-size: 10px; "><A =
href=3D"mailto:jvantuyl@engineyard.com">jvantuyl@engineyard.com</A></SPAN>=
</SPAN></SPAN></FONT></DIV></SPAN><BR =
class=3D"Apple-interchange-newline"></SPAN></SPAN> =
</DIV><BR></DIV></BODY></HTML>=

--Apple-Mail-4--722945206--
