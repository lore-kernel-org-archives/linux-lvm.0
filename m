Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1CGS4O15237
	for <linux-lvm@redhat.com>; Sat, 12 Feb 2005 11:28:04 -0500
Received: from smtpout03-04.mesa1.secureserver.net
	(smtpout03-04.mesa1.secureserver.net [64.202.165.74])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j1CGS28k001552
	for <linux-lvm@redhat.com>; Sat, 12 Feb 2005 11:28:02 -0500
Message-ID: <420E2E97.4000909@starnetworks.us>
Date: Sat, 12 Feb 2005 09:28:07 -0700
From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
MIME-Version: 1.0
Subject: Re: [linux-lvm] HA Functionality for LVM
References: <OFBAE0E4B6.042046DD-ONC1256FA4.003CCFFB-C1256FA4.003D216A@uz.tengelmann.de>
	<7332.1108220394@www37.gmx.net>
In-Reply-To: <7332.1108220394@www37.gmx.net>
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

Thomas Meller wrote:

> LVM is not cluster aware. There is a descendant named EVMS. You can find it
> on sourceforge. I have no idea about it's status.

There is also CLVM (Cluster LVM), which is a modified build of LVM2 with 
the RedHat-type cluster management tools installed.
