Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4NMdXuk020034
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 18:39:33 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4NMdWDt021879
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 18:39:33 -0400
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q4NMdVCE030449
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 18:39:31 -0400
Message-ID: <4FBD6722.1070507@bmsi.com>
Date: Wed, 23 May 2012 18:39:30 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<4FBCA5D6.60507@redhat.com>
	<CAOAgVpwKBXJBbzbcVFhxjN_SdvncN0Vae55MC+sLJ7H2hBHabw@mail.gmail.com>
	<4FBD03F0.9080809@redhat.com>
	<CAOAgVpzOjhKbR8VDseYRHe5wy5Uuaw4icmJ7FNbUCKcWADhnUw@mail.gmail.com>
	<4FBD1D47.204@redhat.com>
	<CAOAgVpz_b738-YwyUXMDMzjuzPYP_VV=YusaFjLVAUiMHvaOsA@mail.gmail.com>
	<alpine.LRH.2.02.1205231419310.4474@bmsred.bmsi.com>
	<CAOAgVpxUUAVbvS5qbPo6kVTcVzSoxMSR5P5gV4X4nRnkhpGnCA@mail.gmail.com>
In-Reply-To: <CAOAgVpxUUAVbvS5qbPo6kVTcVzSoxMSR5P5gV4X4nRnkhpGnCA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fun and games with mirroring
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
To: linux-lvm@redhat.com

On 05/23/2012 03:07 PM, Les Mikesell expounded in part:
> I thought these days you could raid the whole disk and put partitions 
> on the raid, although I've never done it that way. I have 2 complaints 
> about MD. One is that it doesn't handle errors/retries on members very 
> well - it will kick members that are perfectly fine running standalone 
> or as the last remaining member, and the other is that partitions over 
> 2TB need a new format that the kernel doesn't auto-detect. Much of the 
> reason I liked MD in the first place was its ability to assemble 
> things correctly at boot regardless of the drive's physical attachment 
> or location. 
You can raid the whole disk.  But having smaller partitions makes it 
easier to distribute them over odd numbers of disks.  Back when I ran 
AIX, you could add a disk of any size to the VG, and mirrored LVs would 
allocate LPs from physically separate PPs.   You never had to worry 
about matching disk sizes.  With MD, you can also add odd disk sizes and 
fully use them, but you have to do it manually, and more solutions are 
available with smaller partitions.  (But having too many is too tedious.)
