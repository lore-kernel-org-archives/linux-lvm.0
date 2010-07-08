Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o68J1mnM010489
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:01:48 -0400
Received: from e2.ny.us.ibm.com (e2.ny.us.ibm.com [32.97.182.142])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o68J1cXL015136
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:01:38 -0400
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e2.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id o68ImMqu020546
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 14:48:23 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o68J1HjR2273488
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:01:17 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	o68J1Hhu014589
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:01:17 -0400
Received: from malahal (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	o68J1HZR014552
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:01:17 -0400
Date: Thu, 8 Jul 2010 11:59:38 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20100708185938.GA25099@us.ibm.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
	<AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
	<Pine.LNX.4.64.1007051420360.11654@bmsred.bmsi.com>
	<20100706161745.GB31734@us.ibm.com>
	<AANLkTinATF8nv02K4F0SQiR1OGg0rZ3P5lpsITcB-RYb@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTinATF8nv02K4F0SQiR1OGg0rZ3P5lpsITcB-RYb@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Rebuilding ext4 filesystem on an LV
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Ken Bass [daytooner@gmail.com] wrote:
>    I did try to read anything I could out of the old disk. I do believe t=
here
>    is still some data on it that wasn't trashed. The problem is how to fi=
nd
>    it and reconstruct it without any of the LVM or ext4 filesystem=EF=BF=
=BD
>    information (as I said, I couldn't find any superblocks). Are there any
>    utilities to do something like that?

I don't know much about ext2/3/4 file systems but I imagine debugfs may
help you. I never used it myself though.

Thanks, Malahal.
