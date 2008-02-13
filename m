Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1DAEJ4t012252
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 05:14:19 -0500
Received: from ag-out-0708.google.com (ag-out-0708.google.com [72.14.246.248])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m1DADgVZ001424
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 05:13:42 -0500
Received: by ag-out-0708.google.com with SMTP id 31so13943343agc.3
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 02:13:42 -0800 (PST)
Message-ID: <b646832c0802130213l3b7eaaf5t1fa0246553904b07@mail.gmail.com>
Date: Wed, 13 Feb 2008 15:43:41 +0530
From: "=?UTF-8?Q?Yajith_Ajantha_Dayarath?=
	=?UTF-8?Q?na_|_=E0=B6=BA=E0=B6=A2=E0=B7=92=E0=B6=AD=E0=B7=8A_=E0=B6=85?=
	=?UTF-8?Q?=E0=B6=A2=E0=B6=B1=E0=B7=8A=E0=B6=AD_=E0=B6=AF?=
	=?UTF-8?Q?=E0=B6=BA=E0=B7=8F=E0=B6=BB=E0=B6=AD=E0=B7=8A=E0=B6=B1?="
	<yajith@gmail.com>
Subject: Re: [linux-lvm] pvcreate problem
In-Reply-To: <47B2BF41.8070701@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_21617_29355308.1202897621247"
References: <b646832c0802130013x2081fe55y10f6e2c079134acf@mail.gmail.com>
	<47B2AC45.6030901@redhat.com>
	<b646832c0802130104i7d8eb37fkb61d49c5127f316b@mail.gmail.com>
	<b646832c0802130106v3d7c6f6ene7475edc2c599fec@mail.gmail.com>
	<47B2BF41.8070701@redhat.com>
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

------=_Part_21617_29355308.1202897621247
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Feb 13, 2008 3:28 PM, Bryn M. Reeves <breeves@redhat.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Yajith Ajantha Dayarathna | ????? ????? ??????? wrote:
> > even though the fdisk output contains "/dev/cciss/c0d0p16" there is no
> > such device created under /dev/cciss/.
> > Is it because of the above mentioned limitation ?
>
> That's correct - under Linux, IDE hard disks (/dev/hd*) can have up to
> 63 partitions but SCSI and RAID controllers like the CCISS are limited
> to 15 partitions (16 if you count the whole-device) due to the way minor
> numbers are allocated to /dev/sd* nodes.
>
> You could cheat and map the additional partitions using kpartx - run
> "kpartx -a /dev/cciss/c0d0" and this should create a device-mapper
> device for each partition under /dev/mapper/c0d0p*. You can remove them
> again with "kpartx -d /dev/cciss/c0d0".
>
> That said, it might be better to reconsider your partitioning scheme and
> see if you really need that number of partition table entries.
>
> Regards,
> Bryn.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFHsr9B6YSQoMYUY94RAmWfAJ4uXdCCtqX8nKiER8yXqNoHFHaVkQCeOOdM
> R3aCmQuHBVUxP/9bbGvrrqg=
> =EUlc
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


i will try the mapper device.
yes, the partitioning scheme is quite inflexible.

Does LVM use the same technique to get around this limitation ? I have seen
devices getting created under /dev/mapper.
Always thought its a part of LVM.

thanks a lot for all your support...
-- 
Yajith Ajantha

------=_Part_21617_29355308.1202897621247
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Feb 13, 2008 3:28 PM, Bryn M. Reeves &lt;<a href="mailto:breeves@redhat.com">breeves@redhat.com</a>&gt; wrote:<br><div class="gmail_quote"><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
-----BEGIN PGP SIGNED MESSAGE-----<br>Hash: SHA1<br><div class="Ih2E3d"><br>Yajith Ajantha Dayarathna | ????? ????? ??????? wrote:<br>&gt; even though the fdisk output contains &quot;/dev/cciss/c0d0p16&quot; there is no<br>
&gt; such device created under /dev/cciss/.<br>&gt; Is it because of the above mentioned limitation ?<br><br></div>That&#39;s correct - under Linux, IDE hard disks (/dev/hd*) can have up to<br>63 partitions but SCSI and RAID controllers like the CCISS are limited<br>
to 15 partitions (16 if you count the whole-device) due to the way minor<br>numbers are allocated to /dev/sd* nodes.<br><br>You could cheat and map the additional partitions using kpartx - run<br>&quot;kpartx -a /dev/cciss/c0d0&quot; and this should create a device-mapper<br>
device for each partition under /dev/mapper/c0d0p*. You can remove them<br>again with &quot;kpartx -d /dev/cciss/c0d0&quot;.<br><br>That said, it might be better to reconsider your partitioning scheme and<br>see if you really need that number of partition table entries.<br>
<br>Regards,<br>Bryn.<br>-----BEGIN PGP SIGNATURE-----<br>Version: GnuPG v1.4.7 (GNU/Linux)<br>Comment: Using GnuPG with Fedora - <a href="http://enigmail.mozdev.org" target="_blank">http://enigmail.mozdev.org</a><br><br>
iD8DBQFHsr9B6YSQoMYUY94RAmWfAJ4uXdCCtqX8nKiER8yXqNoHFHaVkQCeOOdM<br>R3aCmQuHBVUxP/9bbGvrrqg=<br>=EUlc<br>-----END PGP SIGNATURE-----<br><div><div></div><div class="Wj3C7c"><br>_______________________________________________<br>
linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></div></div></blockquote></div><br><br>i will try the mapper device.<br>yes, the partitioning scheme is quite inflexible.<br>
<br>Does LVM use the same technique to get around this limitation ? I have seen devices getting created under /dev/mapper.<br>Always thought its a part of LVM.<br><br>thanks a lot for all your support...<br>-- <br>Yajith Ajantha

------=_Part_21617_29355308.1202897621247--
