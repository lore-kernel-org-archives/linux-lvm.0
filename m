Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0QJnWO31829
	for <linux-lvm@redhat.com>; Wed, 26 Jan 2005 14:49:32 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.203])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0QJnQth010592
	for <linux-lvm@redhat.com>; Wed, 26 Jan 2005 14:49:27 -0500
Received: by rproxy.gmail.com with SMTP id a41so195155rng
	for <linux-lvm@redhat.com>; Wed, 26 Jan 2005 11:49:26 -0800 (PST)
Message-ID: <a58063aa050126114945d1c368@mail.gmail.com>
Date: Wed, 26 Jan 2005 11:49:26 -0800
From: "M. Matt Colgin" <mcolgin@gmail.com>
Subject: Re: [linux-lvm] JFS on LVM volumes?
In-Reply-To: <20050126172328.PMUX2060.imf18aec.mail.bellsouth.net@mail.bellsouth.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <20050126172328.PMUX2060.imf18aec.mail.bellsouth.net@mail.bellsouth.net>
Reply-To: "M. Matt Colgin" <mcolgin@gmail.com>,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

It should work, but you might be better off hitting a JFS group for
more info. My FC3 machine has the JFS packages installed by default.

Check out this FAQ:
http://www.fedorafaq.org/#reiserjfs


On Wed, 26 Jan 2005 12:23:28 -0500, pvwrght@bellsouth.net
<pvwrght@bellsouth.net> wrote:
> I am trying to install Fedora Core 3 on a server with two IDE drives.
> I have set up the IDE drives as an LVM volume and selected JFS as
> the file system. Everything goes fine through the partitioning, but
> craps out when the installation starts. Is the JFS file system supported
> on LVM volumes under Fedora?
> 
> Thanks,
> Philip Wright
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
>
