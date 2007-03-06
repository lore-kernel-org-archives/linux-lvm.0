Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2657siw009101
	for <linux-lvm@redhat.com>; Tue, 6 Mar 2007 00:07:54 -0500
Received: from souja.net (souja.net [64.22.224.60])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2657qbR024893
	for <linux-lvm@redhat.com>; Tue, 6 Mar 2007 00:07:52 -0500
Received: from [64.22.234.43] (helo=[192.168.2.3])
	by souja.net with esmtpa (Exim 4.60)
	(envelope-from <jvantuyl@engineyard.com>) id 1HORu1-0002gf-HA
	for linux-lvm@redhat.com; Mon, 05 Mar 2007 23:07:57 -0600
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <45EC4306.669D.00E9.0@novell.com>
References: <45EC4306.669D.00E9.0@novell.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-3--570540908
Message-Id: <04AD64B5-479C-437C-83BD-5489D04BF180@engineyard.com>
From: Jayson Vantuyl <jvantuyl@engineyard.com>
Subject: Re: [linux-lvm] Snapshot code
Date: Mon, 5 Mar 2007 23:07:50 -0600
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-3--570540908
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

As you might know, LVM2 actually uses a kernel component called  
devicemapper (DM).

DM has various targets that are used to create LVM devices.  For  
example, a simple LV might generate a table in DM like this:

0 100000 linear 8:1 540

This table maps reads on the LVM device from blocks 0 to 100000 (512  
bytes each) to blocks on device 8:1 (sda1) starting at block 540.  As  
you might imagine, this system is very flexible and allows LVM2 to  
run entirely in userspace, with DM doing all of the heavy lifting in  
the kernel.

The secret sauce required to do snapshots requires help from LVM.   
Notice that in the above table, the single entry has a target called  
"linear".  This is a simple mapping, nothing more.  Snapshots require  
the ability to intercept writes to the original LVM device in order  
to preserve the original data in the snapshot.  Thus, a snapshot  
creates the original LV's mapping, then creates an entry that uses  
the LV but has a "snapshot-origin" target (instead of merely a linear  
target) for the entire other volume.  For the cow volume it uses a  
"snapshot" target.  With these tools it creates the devices you  
actually use, including the extra volume (which is used to get that  
snapshot target in the loop).

For a discussion of the underlying technology, look here:

http://www.mjmwired.net/kernel/Documentation/device-mapper/snapshot.txt

On Mar 5, 2007, at 4:52 AM, Nallammai S wrote:

> Hi,
>
> I am new to lvm2. I am looking at the lvm2 code primarily to  
> understand how snapshots are taken. When I debugged, i found that  
> in addition to the COW LV, a LV named 'snapshot0' is also created.  
> Why is this LV created?
>
> Thanks in advance
>
> Nallammai.S
>
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Jayson Vantuyl
Systems Architect
Engine Yard
jvantuyl@engineyard.com



--Apple-Mail-3--570540908
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">As you might know, LVM2 actually =
uses a kernel component called devicemapper (DM).<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>DM has various targets that =
are used to create LVM devices.=A0 For example, a simple LV might =
generate a table in DM like this:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>0 100000 linear 8:1 =
540</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>This =
table maps reads on the LVM device from blocks 0 to 100000 (512 bytes =
each) to blocks on device 8:1 (sda1) starting at block 540.=A0=A0As you =
might imagine, this system is very flexible and allows LVM2 to run =
entirely in userspace, with DM doing all of the heavy lifting in the =
kernel.</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>The =
secret sauce required to do snapshots requires help from LVM.=A0 Notice =
that in the above table, the single entry has a target called "linear".=A0=
 This is a simple mapping, nothing more.=A0 Snapshots require the =
ability to intercept writes to the original LVM device in order to =
preserve the original data in the snapshot.=A0 Thus, a snapshot creates =
the original LV's mapping, then creates an entry that uses the LV but =
has a "snapshot-origin" target (instead of merely a linear target) for =
the entire other volume.=A0 For the cow volume it uses a "snapshot" =
target.=A0 With these tools it creates the devices you actually use, =
including the extra volume (which is used to get that snapshot target in =
the loop).</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>For =
a discussion of the underlying technology, look here:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><A =
href=3D"http://www.mjmwired.net/kernel/Documentation/device-mapper/snapsho=
t.txt">http://www.mjmwired.net/kernel/Documentation/device-mapper/snapshot=
.txt</A></DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><DIV><DIV>On Mar 5, 2007, =
at 4:52 AM, Nallammai S wrote:</DIV><BR =
class=3D"Apple-interchange-newline"><BLOCKQUOTE type=3D"cite"><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Hi,</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; min-height: =
14px; "><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">I am new to lvm2. I am looking =
at the lvm2 code primarily to understand how snapshots are taken. When I =
debugged, i found that in addition to the COW LV, a LV named 'snapshot0' =
is also created. Why is this LV created?</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Thanks in =
advance</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Nallammai.S<SPAN =
class=3D"Apple-converted-space">=A0</SPAN></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; min-height: =
14px; "><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
">_______________________________________________</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">linux-lvm mailing list</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><A =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><A =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</A></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">read the =
LVM HOW-TO at <A =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</A></DIV> </BLOCKQUOTE></DIV></DIV><BR><DIV> <SPAN =
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
</DIV><BR></BODY></HTML>=

--Apple-Mail-3--570540908--
