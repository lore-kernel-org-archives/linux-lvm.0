Message-ID: <B5B1F1162663D411BB8000508B691B20076332BA@stimxch1.dev.mediagrif.com>
From: Jean Aumont <jaumont@mediagrif.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2FF68.E007E290"
Subject: [linux-lvm] Raid 5 Performance
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Apr 10 09:10:07 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2FF68.E007E290
Content-Type: text/plain;
	charset="iso-8859-1"

Hi everyone,

I have 4 identical disks that I have configured using the Linux Software
raid.
They are set-up in a raid 5 using a "chunksize" of 128 Kbytes as recommended
in the Linux Software Raid HowTo.

I could create an Ext3 file system directly over my raid 5 with the
following parameters:
chunksize=128KB, block size=4KB and stride=32.
I think those parameters are the best for performance. (Any better
suggestion would be appreciated !!!)

My question is: 

Since I want to be able to create/resize many file systems (ext3, XFS
ReiserFS) over the raid5, do I need to specified: 
"chunksize, stripe and stripesize", when performing the "lvcreate" command
(the logical volume creation) or are those
parameters used for backup and creating a raid 0 (stripe) ???

If I do need to specified those parameters, what would be the best values
regarding performance of the raid 5 ???

Thanks in advance,

Jean Aumont 


------_=_NextPart_001_01C2FF68.E007E290
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>Raid 5 Performance</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Hi everyone,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">I have 4 identical disks that I =
have configured using the Linux Software raid.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">They are set-up in a raid 5 =
using a &quot;chunksize&quot; of 128 Kbytes as recommended in the Linux =
Software Raid HowTo.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">I could create an Ext3 file =
system directly over my raid 5 with the following parameters:</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">chunksize=3D128KB, block =
size=3D4KB and stride=3D32.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">I think those parameters are =
the best for performance. (Any better suggestion would be appreciated =
!!!)</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">My question is: </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Since I want to be able to =
create/resize many file systems (ext3, XFS ReiserFS) over the raid5, do =
I need to specified: </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">&quot;chunksize, stripe and =
stripesize&quot;, when performing the &quot;lvcreate&quot; command (the =
logical volume creation) or are those</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">parameters used for backup and =
creating a raid 0 (stripe) ???</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">If I do need to specified those =
parameters, what would be the best values regarding performance of the =
raid 5 ???</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Thanks in advance,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Jean Aumont </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2FF68.E007E290--
