Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3LLgOO24319
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2005 17:42:24 -0400
Received: from mail.utsl.gen.nz (210-54-92-184.ipnets.xtra.co.nz
	[210.54.92.184])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3LLgNQc009711
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2005 17:42:24 -0400
Message-ID: <42681E38.6010106@vilain.net>
Date: Fri, 22 Apr 2005 09:42:16 +1200
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Question about vgremove
References: <BAY24-F24393E566A724CED9D2E09B82C0@phx.gbl>
In-Reply-To: <BAY24-F24393E566A724CED9D2E09B82C0@phx.gbl>
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
To: yg2004_198@hotmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Ya Ning wrote:
> Hi,
> I have tried to remove logical volum. I got the error that this volume 
> is opened, so that can't be removed. How can I close this volum?

is it mounted (in /proc/mounts)?

if it is, you can see what processes need to be killed using:

   fuser -m /mount/point

if it's not in /proc/mounts then something more obscure is wrong.
A reboot is a quick fix of course.

Sam.
