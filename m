Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q25NB3Sp024379
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2012 18:11:03 -0500
Received: from punctilious.kempt.net (punctilious.kempt.net [208.72.84.196])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q25NAxQG024665
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2012 18:11:01 -0500
Message-ID: <4F554719.4020801@kempt.net>
Date: Mon, 05 Mar 2012 18:07:05 -0500
From: "Dan B." <danb@kempt.net>
MIME-Version: 1.0
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>	<Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>	<1299228115.13997.37.camel@localhost>
	<4D7105EA.4030000@cfl.rr.com>
In-Reply-To: <4D7105EA.4030000@cfl.rr.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Phillip Susi wrote:
> On 3/4/2011 3:41 AM, Radu Rendec wrote:
>> They do. But the "2TB" disk is actually 2000GB, which is safe (it takes
>> more than 2048GB to run into trouble with m$dos partitions).
> 
> They are actually only 2 trillion bytes, or 1862 GB.

Don't abuse SI units like that.  You apparently mean 1862 GiB.

Daniel
