Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i36FFIj30565
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 11:15:18 -0400
Received: from behemoth.sci.local (e2hst160.csg.stercomm.com [204.214.2.160])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i36FFI5D007613
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 11:15:18 -0400
Received: from stercomm.com (localhost [127.0.0.1])
	by behemoth.sci.local (Postfix) with ESMTP id 62CD8935
	for <linux-lvm@redhat.com>; Tue,  6 Apr 2004 10:15:10 -0500 (CDT)
Message-ID: <4072C97E.4040606@stercomm.com>
Date: Tue, 06 Apr 2004 10:15:10 -0500
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Best linux rescue CD  for LVM/ReiserFS systems?
References: <40718D04.9010600@alteeve.com>
In-Reply-To: <40718D04.9010600@alteeve.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Madison Kelly wrote:
> Hi all,
> 
>   On the heals of my last question; could anyone recommend a personal 
> favorite Linux-based rescue CD for systems with LVM, software RAID and 
> the ReiserFS? Thanks!'


Well.. if it's LVM1, I like the SUSE 9 first CD.
Just make the groups active and mount to temporary mount
points you create in /tmp.
