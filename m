Date: Sat, 13 Oct 2001 02:20:01 -0600
Subject: Re: [linux-lvm] pv recovery after trashing partition table.
Message-ID: <20011013.022001.-448365.3.james.cromie@juno.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary=--__JNP_000_3c9a.5eff.0b20
From: Jim Cromie <james.cromie@juno.com>
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
List-Id: <linux-lvm.redhat.com>
To: adilger@turbolabs.com
Cc: linux-lvm@sistina.com

This message is in MIME format.  Since your mail reader does not understand
this format, some or all of this message may not be legible.

----__JNP_000_3c9a.5eff.0b20
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

again, thanks Andreas,

Having read to the end of `man gpart`, I encountered the useful -

gpart -vdg /boot/boot.bak

which I had lying around (good luck again).  The output(s) confirm 
that my manually fdisk'd partition matches the original.

So somehow I managed to corrupt hda4 at about the same time that
I blanked the MBR.  I dont know how, but Ill accept that theyre
causally (not casually) related.

I looked a bit at gpart's partition-type-guessing code, it shouldnt
be too hard to work out which bytes are failing gpart's guesser.
Getting LVM to accept my hacks may be much harder.

So how big is an LVM super-block ?

I always have the (probably 1-way) fallback - a partion type change, 
then an fsck to see what it finds.
----__JNP_000_3c9a.5eff.0b20
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3Dcontent-type content=3Dtext/html;charset=3Dus-ascii>
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR></HEAD>
<BODY bottomMargin=3D0 leftMargin=3D3 topMargin=3D0 rightMargin=3D3>
<DIV></DIV>
<DIV>again, thanks Andreas,</DIV>
<DIV>&nbsp;</DIV>
<DIV>Having read to the end of `man gpart`, I encountered the useful -</DIV>
<DIV>&nbsp;</DIV>
<DIV>gpart -vdg /boot/boot.bak</DIV>
<DIV>&nbsp;</DIV>
<DIV>which I had lying around (good luck again).&nbsp; The output(s) =
confirm=20
</DIV>
<DIV>that my manually fdisk'd partition matches the original.</DIV>
<DIV>&nbsp;</DIV>
<DIV>So somehow I managed to corrupt hda4 at about&nbsp;the same time that<=
/DIV>
<DIV>I blanked the MBR.&nbsp; I dont know how, but Ill accept that theyre</=
DIV>
<DIV>causally (not casually)&nbsp;related.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I looked a bit at gpart's partition-type-guessing&nbsp;code, it=20
shouldnt</DIV>
<DIV>be too hard to work out which bytes are&nbsp;failing&nbsp;gpart's=20
guesser.</DIV>
<DIV>Getting LVM to accept my hacks may be much harder.</DIV>
<DIV>&nbsp;</DIV>
<DIV>So how big is an LVM super-block ?</DIV>
<DIV>&nbsp;</DIV>
<DIV>I always have the (probably 1-way) fallback - a partion type change, <=
/DIV>
<DIV>then an fsck to see what it finds.</DIV></BODY></HTML>

----__JNP_000_3c9a.5eff.0b20--
