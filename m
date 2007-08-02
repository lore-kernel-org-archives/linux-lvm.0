Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l729j9RX026631
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2007 05:45:09 -0400
Received: from ns2.sozvers.at (ns2.sozvers.at [194.153.217.233])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l729j60G025338
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2007 05:45:07 -0400
Received: from mailgw01.sozvers.at (gateway-ext.sozvers.at [194.153.217.230])
	by ns2.sozvers.at (8.12.11.20060308/8.12.8) with ESMTP id
	l729j5Tp003214
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2007 11:45:05 +0200
Received: from lin-mrout1.wgkk.sozvers.at (viruswall-01.sozvers.at
	[172.16.10.31])
	by mailgw01.sozvers.at (8.13.8/8.13.8) with ESMTP id l729j5gU021818
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2007 11:45:05 +0200
Received: from ivlotus3.wgkk.sozvers.at (lnvw101s10.wgkk.sozvers.at
	[1.110.51.213])
	by lin-mrout1.wgkk.sozvers.at (Postfix) with ESMTP id 875E91223A0
	for <linux-lvm@redhat.com>; Thu,  2 Aug 2007 10:34:21 +0200 (CEST)
MIME-Version: 1.0
Message-ID: <OFB2F66466.9B8DE5B5-ONC125732B.0031679C-C125732B.00358E8B@wgkk.sozvers.at>
From: Andreas.Trawoeger@wgkk.at
Date: Thu, 2 Aug 2007 11:44:58 +0200
Content-Type: multipart/alternative;
	boundary="=_alternative 00358E8AC125732B_="
Subject: [linux-lvm] How to automate lvextend?
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

Dies ist eine mehrteilige Nachricht im MIME-Format.
--=_alternative 00358E8AC125732B_=
Content-Type: text/plain; charset="US-ASCII"

Hi!

Is there a sane or somewhat standard way to automate lvextend?

I'm running LVM2 on my laptop and I'm pretty happy with it (lvm is great 
if you run 3 different distros and disk space is tight).

Main problem I have is that I have to be quite restrictive with space 
allocation (it't difficult to add disk space to a laptop) and regularily 
run into full filesystems. Which is annoying and you end up having 
problems like not beeing able to log into KDE, because your home directory 
is full.

But is is extremly annoying when you would like to use snapshots. 
Snaphshots are a great way to keep older versions of your file, but they 
are basically useless if they either have to be unnecessarily  large (you 
won't have the disc space to do it), or get invalidated pretty often 
(which isn't what you want to happen to your backup).

In theory it shouldn't be too difficult to have a script that regularily 
checks the fill rate of your  filesystems and snapshots and do an lvextend 
if necessary. But for snapshots it would be great if lvm could do the 
lvextend by it self and it shouldn't be too difficult to teach ext3 to do 
the same with a normal lv.


cu andreas

--=_alternative 00358E8AC125732B_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Hi!</font>
<br>
<br><font size=2 face="sans-serif">Is there a sane or somewhat standard
way to automate lvextend?</font>
<br>
<br><font size=2 face="sans-serif">I'm running LVM2 on my laptop and I'm
pretty happy with it (lvm is great if you run 3 different distros and disk
space is tight).</font>
<br>
<br><font size=2 face="sans-serif">Main problem I have is that I have to
be quite restrictive with space allocation (it't difficult to add disk
space to a laptop) and regularily run into full filesystems. Which is annoying
and you end up having problems like not beeing able to log into KDE, because
your home directory is full.</font>
<br>
<br><font size=2 face="sans-serif">But is is extremly annoying when you
would like to use snapshots. Snaphshots are a great way to keep older versions
of your file, but they are basically useless if they either have to be
unnecessarily &nbsp;large (you won't have the disc space to do it), or
get invalidated pretty often (which isn't what you want to happen to your
backup).</font>
<br>
<br><font size=2 face="sans-serif">In theory it shouldn't be too difficult
to have a script that regularily checks the fill rate of your &nbsp;filesystems
and snapshots and do an lvextend if necessary. But for snapshots it would
be great if lvm could do the lvextend by it self and it shouldn't be too
difficult to teach ext3 to do the same with a normal lv.</font>
<br>
<br>
<br><font size=2 face="sans-serif">cu andreas<br>
</font>
--=_alternative 00358E8AC125732B_=--
