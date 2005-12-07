Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB7873V05259
	for <linux-lvm@redhat.com>; Wed, 7 Dec 2005 03:07:03 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.203])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB786v9x002208
	for <linux-lvm@redhat.com>; Wed, 7 Dec 2005 03:06:57 -0500
Received: by zproxy.gmail.com with SMTP id x7so279839nzc
	for <linux-lvm@redhat.com>; Wed, 07 Dec 2005 00:06:57 -0800 (PST)
Message-ID: <52fe6b680512070006i7578827av304946cd51d37313@mail.gmail.com>
Date: Wed, 7 Dec 2005 13:36:57 +0530
From: Anil Kumar Sharma <xplusaks@gmail.com>
Subject: Re: [linux-lvm] LVM problems
In-Reply-To: <4396439A.7080500@ntlworld.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_28685_164975.1133942817038"
References: <43963F45.5060104@ntlworld.com> <4396439A.7080500@ntlworld.com>
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
To: kelly.harding@ntlworld.com, LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_28685_164975.1133942817038
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Recently I also suffered problems with LVM(2)

These are very basic things I presume U might have already done but just in
case if not ...

imho pl boot with rescue disk (or mode)
As a precaution select read-only mount of file system
if required chroot to /mnt/sysimage
# mount  ! look for lvm things specifically a word - mapper
# pvdisplay
# vgdisplay
# lvdisplay
# pvscan
# vgscan
# lvscan

thiese will tell status of lvm things
 Then check /etc/fstab (carefully)

U may then "very very carefully" use e2fsck or fsck [{("after dismounting
the volumes")}] as you may you deem fit.
"very very carefully"  means, as a minimum, first read both manpages, try
these commands in read-only mode + do not modify anything + verbose.

### use vgck with caution and also checkout /etc/lvm/lvm.conf

U may try in init 1 mode also but more caution requested.

good luck & Pl post if U get it right this way or anyway.

--
Anil Kumar Shrama

------=_Part_28685_164975.1133942817038
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Recently I also suffered problems with LVM(2)</div>
<div>&nbsp;</div>
<div>These are very basic things I presume U might have already done but ju=
st in case if not ...</div>
<div>&nbsp;</div>
<div>imho pl boot with rescue disk (or mode)</div>
<div>As a precaution select read-only mount of file system</div>
<div>if required chroot to /mnt/sysimage </div>
<div># mount&nbsp; ! look for lvm things specifically a word - mapper</div>
<div># pvdisplay</div>
<div># vgdisplay</div>
<div># lvdisplay</div>
<div># pvscan<br># vgscan</div>
<div># lvscan</div>
<div>&nbsp;</div>
<div>thiese will tell status of lvm things</div>
<div>
<div>Then check /etc/fstab (carefully)</div>
<div>&nbsp;</div></div>
<div>U may then &quot;very very carefully&quot; use e2fsck or fsck [{(&quot=
;after dismounting the volumes&quot;)}] as you may you deem fit. </div>
<div>&quot;very very carefully&quot; &nbsp;means, as a minimum, first read =
both manpages, try these commands in read-only mode + do not modify anythin=
g + verbose. </div>
<div>&nbsp;</div>
<div>### use vgck with caution and also checkout /etc/lvm/lvm.conf </div>
<div>&nbsp;</div>
<div>U may try in init 1 mode also but more caution requested.</div>
<div>&nbsp;</div>
<div>good luck &amp; Pl post if U get it right this way or anyway.</div>
<div>&nbsp;</div>
<div>-- <br>Anil Kumar Shrama </div>

------=_Part_28685_164975.1133942817038--
