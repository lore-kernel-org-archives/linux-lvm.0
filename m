Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3E5b1YL024634
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 01:37:01 -0400
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3E5aW2A022382
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 01:36:33 -0400
Received: by gwaa18 with SMTP id a18so1041761gwa.33
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 22:36:32 -0700 (PDT)
Message-Id: <636CBC54-E5F0-458A-84BF-D70836AC19B3@gmail.com>
From: "linuxmails.lists" <linuxmails.lists@gmail.com>
In-Reply-To: <20100413222802.0bc5e1ee@faldara>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-3-858421831
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (iPhone Mail 7E18)
Date: Wed, 14 Apr 2010 00:36:37 -0500
References: <BAY110-W326FE139691A6ED05B4D3DBE100@phx.gbl>
	<20100413222802.0bc5e1ee@faldara>
Subject: Re: [linux-lvm] How do I tell what disk a volume group reside on
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-3-858421831
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

Hi

Assuming that you are using MPIO , have you compared the output of  
fdisk -l to the dm device names in /dev/mpath?

AT

On Tue, 13 Apr 2010 20:59:40 -0400
Vickie Troy-McKoy <vtmckoy@hotmail.com> wrote:

>
> Hi All,
>
>
> I have a RedHat4 server connected to a SAN 3510 Array.  On the host
> server, there are two volume groups set up--root_vg and san_vg.  I'm
> assuming that root_vg resides on the internal disks and san_vg on the
> SAN.  But, how can I check to make sure this is the case?
>
>
> Thank you,
>



>>

--Apple-Mail-3-858421831
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body bgcolor=3D"#FFFFFF"><div>Hi</div><div><br></div><div>Assuming =
that you are using MPIO , have you compared the output of fdisk -l to =
the dm device names in =
/dev/mpath?&nbsp;</div><div><br></div><div>AT</div><div><br></div><div><sp=
an>On Tue, 13 Apr 2010 20:59:40 -0400</span><br><span>Vickie Troy-McKoy =
&lt;<a href=3D"mailto:vtmckoy@hotmail.com" =
x-apple-data-detectors=3D"true"><a =
href=3D"mailto:vtmckoy@hotmail.com">vtmckoy@hotmail.com</a></a>&gt; =
wrote:</span><br><span></span><br><blockquote =
type=3D"cite"><span></span></blockquote><blockquote type=3D"cite"><span>Hi=
 All,</span><br></blockquote><blockquote =
type=3D"cite"><br><span></span></blockquote><blockquote =
type=3D"cite"><span></span></blockquote><blockquote type=3D"cite"><span>I =
have a RedHat4 server connected to a SAN 3510 Array. &nbsp;On the =
host</span><br></blockquote><blockquote type=3D"cite"><span>server, =
there are two volume groups set up--root_vg and san_vg. =
&nbsp;I'm</span><br></blockquote><blockquote type=3D"cite"><span>assuming =
that root_vg resides on the internal disks and san_vg on =
the</span><br></blockquote><blockquote type=3D"cite"><span>SAN. =
&nbsp;But, how can I check to make sure this is the =
case?</span><br></blockquote><blockquote =
type=3D"cite"><br><span></span></blockquote><blockquote =
type=3D"cite"><span></span></blockquote><blockquote =
type=3D"cite"><span>Thank you,</span><br></blockquote><blockquote =
type=3D"cite"><span></span><br></blockquote><br><div><br></div><div><div><=
br></div></div></div><blockquote type=3D"cite"><blockquote =
type=3D"cite"></blockquote></blockquote><div></div></body></html>=

--Apple-Mail-3-858421831--
