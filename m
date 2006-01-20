Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0K00n114503
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2006 19:00:49 -0500
Received: from uproxy.gmail.com (uproxy.gmail.com [66.249.92.204])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0K00hkm024863
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2006 19:00:43 -0500
Received: by uproxy.gmail.com with SMTP id q2so17066uge
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2006 16:00:43 -0800 (PST)
Message-ID: <79af7a390601191600v36f7bfccuee8643f2c3adc4bd@mail.gmail.com>
Date: Fri, 20 Jan 2006 00:00:42 +0000
From: Tiago Freitas <coolkcah@gmail.com>
Subject: Re: [linux-lvm] pv resize problem
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_24242_12262115.1137715242754"
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

------=_Part_24242_12262115.1137715242754
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I used pvresize now but it's the same. It resized the pv but I can't resize
the /dev/hda3  lvm partition.

I tried parted and fdisk and I get errors like:

"Error: Unable to open /dev/hda3 - unrecognised disk label."

"Device contains neither a valid DOS partition table, nor Sun, SGI or OSF
disklabel".

------=_Part_24242_12262115.1137715242754
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I used pvresize now but it's the same. It resized the pv but I can't resize=
 the /dev/hda3&nbsp; lvm partition.<br>
<br>
I tried parted and fdisk and I get errors like:<br>
<br>
&quot;Error: Unable to open /dev/hda3 - unrecognised disk label.&quot;<br>
<br>
&quot;Device contains neither a valid DOS partition table, nor Sun, SGI or =
OSF disklabel&quot;.<br>
<br>
<br>

------=_Part_24242_12262115.1137715242754--
