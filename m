Received: from redhat.com (astrea.boston.redhat.com [172.16.80.45])
	by mail.boston.redhat.com (8.12.8/8.12.8) with ESMTP id j17NVVZq024966
	for <linux-lvm@redhat.com>; Mon, 7 Feb 2005 18:31:31 -0500
Message-ID: <4207FA53.9080107@redhat.com>
Date: Mon, 07 Feb 2005 18:31:31 -0500
From: James Parsons <jparsons@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mapping between PEs and Logical Volumes.
References: <1107704665.20387.214438621@webmail.messagingengine.com>
In-Reply-To: <1107704665.20387.214438621@webmail.messagingengine.com>
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

fromkth+lvm@fastmail.fm wrote:

>Hi,
>
>I have one Volume Group and it contains two Logical Volumes.
>There are many free PEs in Volume Group.
>I want to know which PEs inside a Physical Volume(Volume Group) are
>assigned to which Logical Volume.
>
>So which command shows this.
>  
>
There is a GUI for LVM2 that is included in the latest Fedora release 
called system-config-lvm that visually displays the mapping between PVs 
and LVs. Here is the rpmfind URL:

http://fr.rpmfind.net/linux/RPM/fedora/devel/x86_64/system-config-lvm-0.9.18-1.1.noarch.html

system-config-lvm has undergone a couple of rounds of QA. It will NOT 
work with the very latest (lvm2-2.01.03-1.0)  LVM2 package, due to a 
path issue discovered today and being addressed now, but will work just 
fine between lvm2-2.00.25-1.01 and the version listed above.

This version of system-config-lvm is the first GA version. It is under 
active development, and near term planned features include support for 
snapshotting and resizing, as well as fixes for some UI nits. Try it 
out, and please report any bugs you find or features/changes you would 
like to see.

Regards,

-Jim Parsons
