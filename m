Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o02BJek5022744
	for <linux-lvm@redhat.com>; Sat, 2 Jan 2010 06:19:41 -0500
Received: from omr7.networksolutionsemail.com (omr7.networksolutionsemail.com
	[205.178.146.57])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o02BJTaE012069
	for <linux-lvm@redhat.com>; Sat, 2 Jan 2010 06:19:30 -0500
Received: from mail.networksolutionsemail.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by omr7.networksolutionsemail.com (8.13.6/8.13.6) with SMTP id
	o02BJT27016264
	for <linux-lvm@redhat.com>; Sat, 2 Jan 2010 06:19:29 -0500
Message-ID: <4B3F2BC3.4000606@chaven.com>
Date: Sat, 02 Jan 2010 05:19:31 -0600
From: Steve Costaras <stevecs@chaven.com>
MIME-Version: 1.0
References: <4B3F1A65.90100@gmx.at>
In-Reply-To: <4B3F1A65.90100@gmx.at>
Content-Type: multipart/alternative;
	boundary="------------050007060702090504060408"
Subject: Re: [linux-lvm] size of a PV > 2TB possible? (kernel with LBD
	support)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------050007060702090504060408
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Yes, PV's can be larger than 2TiB.   I currently have PV's around 
5.46TiB here but have had them up to 10TiB on other machines.    Don't 
know what the max size is though.

Steve

On 01/02/2010 04:05, Sulla wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Dear all!
>
> I'm sorry I have to ask this question to this mailing list, but I have not
> been able to find sufficient and conclusive informaiton on the web. The
> mailing-list archive at redhat seems not to be searchable.
>
> What is the maximum size of a PV in LVM2?
>
> I run linux 2.6.24 kernel (Ubuntu server 8.04 LTS, 32bit i386) with lvm2
> 2.02.26 and mdadm 2.6.3.
> The kernel has CONFIG_LBD=y in its configuration.
>
> I currently use a 2TB (just under 2TB, 1.98TB actually) raid5 array /dev/mdN
> as the one and only PV in a VG. I would like to grow the array by addition
> of another disk to 3TB and then expand the PV.
>
> As far as I understand mdadm, on a kernel with LBD support it should be able
> to create a blockdevice>2TB, but I am not sure that LVM2 will accept it as
> a PV.
>
> The LVM2-Howto on TLDP (http://tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html)
> confirms that LVs can be>2TB (16TB on 32bit OS, 8EB on 64bit OS), but says
> nothing at all about PVs. Could somebody add that information?
>
> thanx for support
> kind regards,
> Sulla
>
>
>
>
>
>
>
>
>
>
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.2.1 (MingW32)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iD8DBQFLPxplR6b2EdogPFsRApOQAKCq5lWWCZEU3lOqDN0yNwtjSWTx/wCfb7Bu
> m2SeTwsAeRU3008a1RvWBC8=
> =IBoj
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>    

--------------050007060702090504060408
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html; charset=ISO-8859-1"
 http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
<font face="Courier New">Yes</font>, PV's can be larger than 2TiB.&nbsp;&nbsp; I
currently have PV's around 5.46TiB here but have had them up to 10TiB
on other machines.&nbsp;&nbsp;&nbsp; Don't know what the max size is though.<br>
<br>
Steve<br>
<br>
On 01/02/2010 04:05, Sulla wrote:
<blockquote cite="mid:4B3F1A65.90100@gmx.at" type="cite">
  <pre wrap="">-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear all!

I'm sorry I have to ask this question to this mailing list, but I have not
been able to find sufficient and conclusive informaiton on the web. The
mailing-list archive at redhat seems not to be searchable.

What is the maximum size of a PV in LVM2?

I run linux 2.6.24 kernel (Ubuntu server 8.04 LTS, 32bit i386) with lvm2
2.02.26 and mdadm 2.6.3.
The kernel has CONFIG_LBD=y in its configuration.

I currently use a 2TB (just under 2TB, 1.98TB actually) raid5 array /dev/mdN
as the one and only PV in a VG. I would like to grow the array by addition
of another disk to 3TB and then expand the PV.

As far as I understand mdadm, on a kernel with LBD support it should be able
to create a blockdevice &gt;2TB, but I am not sure that LVM2 will accept it as
a PV.

The LVM2-Howto on TLDP (<a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html">http://tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html</a>)
confirms that LVs can be &gt;2TB (16TB on 32bit OS, 8EB on 64bit OS), but says
nothing at all about PVs. Could somebody add that information?

thanx for support
kind regards,
Sulla












-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (MingW32)
Comment: Using GnuPG with Mozilla - <a class="moz-txt-link-freetext" href="http://enigmail.mozdev.org/">http://enigmail.mozdev.org/</a>

iD8DBQFLPxplR6b2EdogPFsRApOQAKCq5lWWCZEU3lOqDN0yNwtjSWTx/wCfb7Bu
m2SeTwsAeRU3008a1RvWBC8=
=IBoj
-----END PGP SIGNATURE-----

_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>


  </pre>
</blockquote>
</body>
</html>

--------------050007060702090504060408--
