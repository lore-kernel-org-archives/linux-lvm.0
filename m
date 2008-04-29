Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3TAHYjA029896
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 06:17:34 -0400
Received: from mail.osl.inic.no (mail02.osl.inic.no [85.19.150.32])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3TAHJfO015490
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 06:17:20 -0400
Received: from [192.168.3.149] (unverified [80.202.70.92]) by mail.osl.inic.no
	(Rockliffe SMTPRA 7.0.3) with ESMTP id
	<B0014237681@mail.osl.inic.no> for <linux-lvm@redhat.com>; 
	Tue, 29 Apr 2008 12:17:13 +0200
Message-ID: <4816F5B1.6010608@mortent.org>
Date: Tue, 29 Apr 2008 12:17:21 +0200
From: Morten Torstensen <morten@mortent.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM mirroring questions...
References: <E1JjBZs-00017j-E9@odzwierny0.comarch.com>
In-Reply-To: <E1JjBZs-00017j-E9@odzwierny0.comarch.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Marcin Ka�u�a wrote:
> Why software RAID is not an option? It works with partitions as well as with
> whole disks (actually it doesn't care what it is working on as long as it's
> a block device)

Because doing mirroring in the LVM is much easier as you don't have to 
set up the md layer. Simple LE to multiple PE mapping is easy to do and 
makes LVM mirroring easy and flexible.

//Morten
