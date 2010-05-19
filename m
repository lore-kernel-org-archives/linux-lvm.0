Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JGQ56Z024489
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:26:05 -0400
Received: from e9.ny.us.ibm.com (e9.ny.us.ibm.com [32.97.182.139])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JGPuBa022752
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:25:56 -0400
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e9.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id o4JGCNsr014222
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:12:23 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o4JGPobq2416656
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:25:50 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	o4JGPnoY027133
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:25:49 -0400
Received: from malahal (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av04.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o4JGPn3q026999
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:25:49 -0400
Date: Wed, 19 May 2010 09:26:01 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20100519162601.GA18162@us.ibm.com>
References: <059801caf769$fc848350$f58d89f0$@com>
	<4BF40A8B.2000201@alteeve.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BF40A8B.2000201@alteeve.com>
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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

Digimer [linux@alteeve.com] wrote:
> On 10-05-19 11:43 AM, kevin wrote:
> >Howdy,
> >
> >(fdisk+mkfs+pvcreate+vgextend+lvextend) is the right way to go about adding
> 
> The mkfs isn't supposed to be there, just set the new drive's
> partition to type '8e' (Linux LVM).

If I were you, I would not bother with partition(s). I will add the
whole disk to LVM.
