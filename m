Message-ID: <396B8B3D.88BD3F73@libertysurf.fr>
Date: Tue, 11 Jul 2000 17:01:49 -0400
From: Philippe =?iso-8859-1?Q?Lef=E8vre?= <ph.l@libertysurf.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [Fwd: boot from lvm volume] Is ther
References: <m13Avjj-0000YgC@duffy1.franken.de>
Content-Type: multipart/alternative;
 boundary="------------98CE04CB2E4237D5AC4C7919"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Rolf Jakob <rjakob@duffy1.franken.de>, linux-lvm@msede.com


--------------98CE04CB2E4237D5AC4C7919
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm very interested in using LVM for the root partitions (I use Redhat 6.2)=
 as
I can do with IBM AIX.

I would like to make a rootvg containing some LVs with /var /tmp /bin /usr
/home for example, then make a datavg for SGBD, datas and so on.

As I plan to update my production system running 2.2.16 to 2.4.0 as soon th=
is
new kernel is available, I did some tests with the new kernel-2.4.0.test2 a=
nd
lvm-0.8final patched. It seems to work perfectly but I was unable to find a=
 way
to put rootvg under LVM.

I understood that you use the initrd way to getting up your first VG but be=
fore
that, how can you do to put /var /usr /sbin etc... under LVM. I mean, chang=
ing
the filesystem tag (-> 0x8e) then creating PV, VG and LVs will distroy all
datas on disk !!

Is there any way to create LVs before installing my RH distribution ?

Did I missed something ? Is there any documentation that could explain how =
to
do this ?


NB: LVM is integrated into my kernel and is not a module.


Could you please help me on that subject ?

Thank you in advance,

PhiL


----------------------------------------------------------------- _ ----
Linux 2.2.16 | Philippe Lefevre E-mail: ph.l@libertysurf.fr   |  =3D=EF=BF=
=BD)   |
             |                                                |  /\\   |
--------------------------------------------------------------- _\_V ---

--------------98CE04CB2E4237D5AC4C7919
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hello,
<p>I'm very interested in using LVM for the root partitions (I use Redhat
6.2) as I can do with IBM AIX.
<p>I would like to make a rootvg containing some LVs with /var /tmp /bin
/usr /home for example, then make a datavg for SGBD, datas and so on.
<p>As I plan to update my production system running 2.2.16 to 2.4.0 as
soon this new kernel is available, I did some tests with the new kernel-2.4.0.test2
and lvm-0.8final patched. It seems to work perfectly but I was unable to
find a way to put rootvg under LVM.
<p>I understood that you use the initrd way to getting up your first VG
but before that, how can you do to put /var /usr /sbin etc... under LVM.
I mean, changing the filesystem tag (-> 0x8e) then creating PV, VG and
LVs will distroy all datas on disk !!
<p>Is there any way to create LVs before installing my RH distribution
?
<p>Did I missed something ? Is there any documentation that could explain
how to do this ?
<br>&nbsp;
<p>NB: LVM is integrated into my kernel and is not a module.
<br>&nbsp;
<p>Could you please help me on that subject ?
<p>Thank you in advance,
<p>PhiL
<br>&nbsp;
<pre>----------------------------------------------------------------- _ ----
Linux 2.2.16 | Philippe Lefevre E-mail: ph.l@libertysurf.fr&nbsp;&nbsp; |&nbsp; =&deg;)&nbsp;&nbsp; |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; /\\&nbsp;&nbsp; |
--------------------------------------------------------------- _\_V ---</pre>
</html>

--------------98CE04CB2E4237D5AC4C7919--
