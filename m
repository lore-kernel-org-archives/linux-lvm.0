Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1E7K7O28467
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2005 02:20:07 -0500
Received: from mailrelay01.solcon.nl (maillb.solcon.nl [212.45.32.200])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1E7K5KJ008463
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2005 02:20:06 -0500
Received: from SolconWebmail ([212.45.32.117])
	by mailrelay01.solcon.nl (8.12.11/SQL-8.12.11-5/8.12.11) with SMTP id
	j1E7Jsu4026234
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2005 08:19:54 +0100
Message-Id: <200502140719.j1E7Jsu4026234@mailrelay01.solcon.nl>
Date: Mon, 14 Feb 2005 8:19:57 +0100
From: "H.r.vanderlinde" <h.r.vanderlinde@ultimum.nl>
Subject: Re: [linux-lvm] HA Functionality for LVM
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Reply-To: "H.r.vanderlinde" <h.r.vanderlinde@ultimum.nl>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/html; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,<BR><BR>Perhaps you might be able to solve this by using network block
devices on which you use LVM. Have a look at drbd. I've used drbd fot
fail-over purposes, but used straight filesystems. I am not sure if this
will work, but suspect it very likely it will work. Just like LVM can also
be installed on top of a md device.<BR><BR>link for drbd:
http://www.drbd.org<BR><BR>Rick<BR><BR><BR>
<BLOCKQUOTE dir=ltr style="PADDING-RIGHT: 0px; PADDING-LEFT: 5px;
MARGIN-LEFT: 5px; BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
<DIV style="FONT: 10pt arial">--------- Oorspronkelijk bericht
--------<BR>Van: "LVM general discussion and development"
&lt;linux-lvm@redhat.com&gt;<BR>Naar: "linux-lvm@redhat.com"
&lt;linux-lvm@redhat.com&gt;<BR>Onderwerp: [linux-lvm] HA Functionality for
LVM<BR>Datum: 11/02/05 16:00<BR><BR><FONT face="Courier New" size=2><BR>Hi
there,<BR><BR>i have the question if there is a ha functionality for lvm
especially<BR>to activate one vg in excusive mode (like hp lvm). Or are
there other ways<BR>to<BR>do this ?<BR><BR>Any
ideas?<BR><BR>Regards<BR><BR><BR>J�rg Middendorf<BR>Tengelmann
Warenhandelsgesellschaft KG<BR>Betriebssysteme Unix / Linux<BR>Wissollstr.
5-43<BR>45478 M�lheim<BR>Deutschland<BR>+++++++++++++++++<BR>Tel:
0208-5806-6625<BR>Fax: 0208-5806-6804<BR>e-mail : <A class=autolink
href="mailto:middendorf@uz.tengelmann.de">middendorf@uz.tengelmann.de</A><BR>Groupmail
: <A class=autolink
href="mailto:unixadm@uz.tengelmann.de">unixadm@uz.tengelmann.de</A><BR>http:
<A class=autolink href="http://www.tengelmann.de/"
target=_blank>www.tengelmann.de</A><BR><BR><BR>_______________________________________________<BR>linux-lvm
mailing list<BR><A class=autolink
href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A><BR><A
class=autolink href="https://www.redhat.com/mailman/listinfo/linux-lvm"
target=_blank>https://www.redhat.com/mailman/listinfo/linux-lvm</A><BR>read
the LVM HOW-TO at <A class=autolink href="http://tldp.org/HOWTO/LVM-HOWTO/"
target=_blank>http://tldp.org/HOWTO/LVM-HOWTO/</A><BR><BR><BR><BR><BR><BR></FONT></DIV></BLOCKQUOTE>
