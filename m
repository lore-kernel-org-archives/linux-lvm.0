Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2GN4Ij04420
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2004 18:04:18 -0500
Received: from p15124399.pureserver.info (p15124399.pureserver.info
	[217.160.182.169])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2GN4H4b005216
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2004 18:04:17 -0500
Received: from rockley.barbados (81-5-142-175.dsl.eclipse.net.uk
	[81.5.142.175]) (authenticated (0 bits))
	by p15124399.pureserver.info (8.11.6/8.11.6) with ESMTP id i2GN4BV26818
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2004 23:04:11 GMT
Subject: Re: [linux-lvm] LVM Problems when moving data off a PV
From: Nick Gushlow <nick@gushlow.com>
In-Reply-To: <20040315123445.GA17078@redhat.com>
References: <1079271129.2414.7.camel@rockley.barbados>
	<20040315123445.GA17078@redhat.com>
Content-Type: multipart/alternative; boundary="=-yjoQLci7ZNn1nc8sucMa"
Message-Id: <1079478248.28877.6.camel@rockley.barbados>
Mime-Version: 1.0
Date: Tue, 16 Mar 2004 23:04:09 +0000
Reply-To: nick@gushlow.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-yjoQLci7ZNn1nc8sucMa
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2004-03-15 at 12:34, Heinz Mauelshagen wrote:

> 
> You need to select the last valid metadata backup of vg2 from /etc/lvmconf
> (check it with vgcfgrestore -ll -f /etc/lvmconf/vg2.conf[.#.old]; see
> 'man vgcfgrestore for metadata archive file names) and restore it.
> 
> Say vg.conf.1.old is the valid one:
> 
> for dev in AllPVsOfVG2 # list all PVs reported by vgcfgrestore -ll above
> do
> 	pvcreate -ff $dev
> 	vgcfgrestore -f /etc/lvmconf/vg.conf.1.old $dev
> done
> vgscan
> vgchange -ay vg2
> 


That did the trick thanks. :-)

Of course in a moment of not concentrating I messed things up again.  I
still had pvremove on the disk from when I previously installed the lvm2
tools, and although I wanted to do a vgreduce I did a pvremove.  Even
when it kicked up an error I just followed what it said and typed
pvremove -ff. oops :-/

Now I get a a similar error as before with vgscan, and other tools give
a 'VGDA in kernel and lvmtab are NTO consistent: please run vgscan'
error.

I tried re-running what you suggested above but vgcfgrestore gives a
'can't restore part of active volume group "vg2"' error.

Is there anyway to recover from my stupidity (other than a lobotomy!)?




--=-yjoQLci7ZNn1nc8sucMa
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.9">
</HEAD>
<BODY>
On Mon, 2004-03-15 at 12:34, Heinz Mauelshagen wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE><FONT COLOR="#737373"><I>
You need to select the last valid metadata backup of vg2 from /etc/lvmconf
(check it with vgcfgrestore -ll -f /etc/lvmconf/vg2.conf[.#.old]; see
'man vgcfgrestore for metadata archive file names) and restore it.

Say vg.conf.1.old is the valid one:

for dev in AllPVsOfVG2 # list all PVs reported by vgcfgrestore -ll above
do
	pvcreate -ff $dev
	vgcfgrestore -f /etc/lvmconf/vg.conf.1.old $dev
done
vgscan
vgchange -ay vg2
</I></FONT></PRE>
</BLOCKQUOTE>
<BR>
That did the trick thanks. :-)<BR>
<BR>
Of course in a moment of not concentrating I messed things up again.&nbsp; I still had pvremove on the disk from when I previously installed the lvm2 tools, and although I wanted to do a vgreduce I did a pvremove.&nbsp; Even when it kicked up an error I just followed what it said and typed pvremove -ff. oops :-/<BR>
<BR>
Now I get a a similar error as before with vgscan, and other tools give a 'VGDA in kernel and lvmtab are NTO consistent: please run vgscan' error.<BR>
<BR>
I tried re-running what you suggested above but vgcfgrestore gives a 'can't restore part of active volume group &quot;vg2&quot;' error.<BR>
<BR>
Is there anyway to recover from my stupidity (other than a lobotomy!)?<BR>
<BR>
<BR>
<BR>
</BODY>
</HTML>

--=-yjoQLci7ZNn1nc8sucMa--
