Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5UK2Mu06056
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 16:02:22 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.205])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5UK2GqR007654
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 16:02:16 -0400
Received: by wproxy.gmail.com with SMTP id i28so173578wra
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 13:02:06 -0700 (PDT)
Message-ID: <859a78260506301302661e0777@mail.gmail.com>
Date: Thu, 30 Jun 2005 15:02:06 -0500
From: Matt P <slarty.tj@gmail.com>
Subject: Re: [linux-lvm] how to remove the inactive physical volume ??
In-Reply-To: <20050630181858.80962.qmail@web53002.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <20050630181858.80962.qmail@web53002.mail.yahoo.com>
Content-Transfer-Encoding: 8bit
Reply-To: Matt P <slarty.tj@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 6/30/05, Sambit Nanda <sambitnanda@yahoo.com> wrote:
> Is there any command exactly oppose to pvcreate ?
> 
> when i ran thoi command
> pvcreate /dev/cciss/c0d1p[5-13]
> 
> i got this error  :  pvcreate -- can't open physical
> volume "/dev/cciss/c0d1p3" to get its size
> 
> though i have not mentioed the device c0d1p3
> 

Your regular expression is broken, or atleast not functioning the way
you seem to be expecting it to. [5-13] is seen as 5 through 1 and 3.
Since "5-1" isn't a vaild range it's ignored and only the "3" is
matched, and thus you get the c0d1p3

You'll probably have to use pvcreate like this:
pvcreate /dev/cciss/c0d1p[5-9] /dev/cciss/c0d1p1[0-3]

That will pvcreate the following devices:
/dev/cciss/c0d1p5
/dev/cciss/c0d1p6
/dev/cciss/c0d1p7
/dev/cciss/c0d1p8
/dev/cciss/c0d1p9
/dev/cciss/c0d1p10
/dev/cciss/c0d1p11
/dev/cciss/c0d1p12
/dev/cciss/c0d1p13
