Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9IE89Df014476
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 10:08:09 -0400
Received: from saturn.retrosnub.co.uk (daemon@saturn.retrosnub.co.uk
	[217.112.91.169])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9IE87Oa026343
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 10:08:07 -0400
Date: Wed, 18 Oct 2006 15:07:59 +0100 (BST)
From: Malcolm Scott <linux-lvm@malc.org.uk>
Subject: Re: [linux-lvm] pvcreate succeeds but vgcreate cannot read label
In-Reply-To: <20061018140425.GA10885@mail.mhnet.de>
Message-ID: <Pine.LNX.4.64.0610181507040.15257@saturn.retrosnub.co.uk>
References: <Pine.LNX.4.64.0610181348420.15257@saturn.retrosnub.co.uk>
	<20061018140425.GA10885@mail.mhnet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

At 16:04 today, Micha Holzmann wrote:

>> The system is running Ubuntu Edgy, with the following versions:
>
> i assume that you have the standard installation. Having this, you have
> evms installed. So will need to use /dev/evms/hdax. Please check this.

Aha - thanks very much, that solved the problem.

Best wishes,

Malcolm

-- 
Malcolm Scott
Research Associate, TINA project
University of Cambridge Computer Laboratory
