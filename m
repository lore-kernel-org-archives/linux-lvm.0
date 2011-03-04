Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p24FW7iL019664
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 10:32:07 -0500
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.120])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p24FVvsD014701
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 10:31:57 -0500
Message-ID: <4D7105EA.4030000@cfl.rr.com>
Date: Fri, 04 Mar 2011 10:31:54 -0500
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>	<Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
	<1299228115.13997.37.camel@localhost>
In-Reply-To: <1299228115.13997.37.camel@localhost>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Resizing underlying LVM partition after cloning to
 bigger disk
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Radu Rendec <radu.rendec@mindbit.ro>

On 3/4/2011 3:41 AM, Radu Rendec wrote:
> They do. But the "2TB" disk is actually 2000GB, which is safe (it takes
> more than 2048GB to run into trouble with m$dos partitions).

They are actually only 2 trillion bytes, or 1862 GB.
