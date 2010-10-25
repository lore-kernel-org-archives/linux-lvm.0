Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9PIBTWx001416
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 14:11:29 -0400
Received: from e8.ny.us.ibm.com (e8.ny.us.ibm.com [32.97.182.138])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9PIBDbY029842
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 14:11:14 -0400
Received: from d01relay06.pok.ibm.com (d01relay06.pok.ibm.com [9.56.227.116])
	by e8.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id o9PHtlgc006831
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 13:55:47 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay06.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o9PIBAwK1458222
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 14:11:10 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	o9PIBA3M023258
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 16:11:10 -0200
Received: from malahal (malahal-009047025235.beaverton.ibm.com [9.47.25.235])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	o9PIB9uJ023231
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 16:11:09 -0200
Date: Mon, 25 Oct 2010 11:11:08 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20101025181108.GA1019@us.ibm.com>
References: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
Subject: Re: [linux-lvm] Determine boot disk device name...
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Jon Price [jonelwoodprice@gmail.com] wrote:
>    Hi,
>    For starters, how can I determine the physical device name of
>    current/active boot disk in Linux?
>    Tx,
>    Jon

cat /proc/cmdline and go from there!
