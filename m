Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8IKtxNR005908
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 16:55:59 -0400
Received: from expredir4.cites.uiuc.edu (expredir4.cites.uiuc.edu
	[128.174.5.187])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8IKt9ju007038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 16:55:10 -0400
Received: from [130.126.55.2] (rk12.life.uiuc.edu [130.126.55.2])
	by expredir4.cites.uiuc.edu (8.14.1/8.14.1) with ESMTP id
	l8IKt4N5003067
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 15:55:09 -0500 (CDT)
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <78B3687E-533C-4AEF-BD23-7DA4E3308C40@uiuc.edu>
Content-Type: multipart/alternative; boundary=Apple-Mail-7--758977699
From: Richard Kollmar <rkollmar@uiuc.edu>
Date: Tue, 18 Sep 2007 15:58:23 -0500
Subject: [linux-lvm] Resizing an ext3 file system after extending a logical
	volume group 
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
To: linux-lvm@redhat.com


--Apple-Mail-7--758977699
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

Dear All:

I apologize if this has been asked before, but I can't find a way to  
search the list archives:

How do you safely resize an ext3 filesystem after extending a logical  
volume?

I am adding a new hard drive to increase the size of my logical  
volume "home1" in logical volume group "home" with LVM2 under Ubuntu  
6.10.1 LTS.  The instructions in the LVM Howto are pretty  
straightforward; the only part that spooks me is the resizing of the  
ext3 filesystem.  This is what I have done so far:

	(installed new hardware & partitioned with fdisk; shows up as /dev/ 
sdb1)
	(backed up the existing logical volume in case something bad happens)

	# pvcreate /dev/sdb1
		  Physical volume "/dev/sdb1" successfully created	

	# vgextend home /dev/sdb1
		  Volume group "home" successfully extended	

	# lvextend -l 357700 /dev/home/home1
		  Extending logical volume home1 to 1.36 TB
		  Logical volume home1 successfully resized

 From what I googled, the next steps are a bit more involved for LVM2  
than the Howto lets on.  Does the following look o.k. to the experts:

	' use a root login, not su or sudo, because /home will be unmounted

	# umount /dev/home/home1	' the next steps should be done off-line

	# e2fsck -C 0 -v dev/home/home1		' make sure the file system is ok

	# tune2fs -O ^has_journal /dev/home/home1	'disable journaling on the  
logical volume

	# resize2fs /dev/home/home1		'do the resizing

	# e2fsck -C 0 -v dev/home/home1		' make sure the file system is  
still ok

	# tune2fs -O has_journal /dev/home/home1		're-enable journaling

	# e2fsck -C 0 -v dev/home/home1		' yes, I am a first-timer and  
somewhat paranoid

	# mount /dev/home/home1 /home	' back on-line

Thanks in advance for any help,

microscope


--Apple-Mail-7--758977699
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">Dear All:<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I apologize if this has =
been asked before, but I can't find a way to search the list =
archives:</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>How =
do you safely resize an ext3 filesystem after extending a logical =
volume?</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>I am =
adding a new hard drive to increase the size of my logical volume =
"home1" in logical volume group "home" with LVM2 under Ubuntu 6.10.1 =
LTS.=A0 The instructions=A0in the LVM Howto are pretty straightforward; =
the only part that spooks me is the resizing of the ext3 filesystem.=A0 =
This is what I have done so far:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>(installed new hardware &amp; partitioned with fdisk; shows up as =
/dev/sdb1)</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>(backed up the existing logical =
volume in case something bad happens)</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN># =
pvcreate /dev/sdb1</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>=A0 Physical volume =
"/dev/sdb1" successfully created<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN></DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN># =
vgextend home /dev/sdb1</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>=A0 Volume group "home" =
successfully extended<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN></DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN># =
lvextend -l 357700 /dev/home/home1</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</SPAN>=A0=
 Extending logical volume home1 to 1.36 TB</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</SPAN>=A0=
 Logical volume home1 successfully resized</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>=46rom what I googled, the =
next steps are a bit more involved for LVM2 than the Howto lets on.=A0 =
Does the following look o.k. to the experts:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>' use a =
root login, not su or sudo, because /home will be =
unmounted</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV><SPAN=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN># =
umount=A0/dev/home/home1<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>' the next steps should be done =
off-line</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN># e2fsck =
-C 0 -v=A0dev/home/home1<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>' make sure the file =
system is ok</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>#=A0tune2fs=
 -O ^has_journal=A0/dev/home/home1<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>'disable journaling on the =
logical volume</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN># =
resize2fs /dev/home/home1<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>'do the =
resizing</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN># e2fsck =
-C 0 -v=A0dev/home/home1<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>' make sure the file =
system is still ok</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>#=A0tune2fs=
 -O has_journal=A0/dev/home/home1<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>'re-enable =
journaling</DIV><DIV><BR><DIV> <SPAN class=3D"Apple-style-span" =
style=3D"border-collapse: separate; border-spacing: 0px 0px; color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; text-align: auto; =
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
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN># e2fsck =
-C 0 -v=A0dev/home/home1<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</SPAN>' yes, I am a first-timer =
and somewhat paranoid</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN># =
mount=A0/dev/home/home1 /home<SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>' back on-line</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Thanks in advance for any =
help,</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>microscope</DIV></SPAN></SPAN=
></SPAN></SPAN></DIV><BR></DIV></BODY></HTML>=

--Apple-Mail-7--758977699--
