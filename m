Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9E6WiV02058
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2005 02:32:44 -0400
Received: from smtpout05-04.prod.mesa1.secureserver.net
	(smtpout05-04.prod.mesa1.secureserver.net [64.202.165.221])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j9E6WZqw010627
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2005 02:32:35 -0400
Message-ID: <434F5079.5060303@starnetworks.us>
Date: Fri, 14 Oct 2005 01:30:17 -0500
From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
MIME-Version: 1.0
Subject: Re: [linux-lvm] removing LVM remotely
References: <434DDB83.9080300@homemachine.net>
In-Reply-To: <434DDB83.9080300@homemachine.net>
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

Tom wrote:

> I have had a server set up with centos4 and the person who installed 
> didn't follow my instructions, I wanted the partitioning set up without 
> LVM and he used LVM, is there any way I can remove it and setup with 
> normal partitoning remotely? (the server is in another country) i.e. 
> /dev/hda1 hda2 hda3 etc.

If the root filesystem is on an LV, then removing all traces of LVM will 
be non-trivial, even if you have access to the system. Remotely it will 
be quite difficult, and will require someone rebooting the machine using 
a live CD of some sort that you can use to manipulate the system. You 
will also need adequate spare disk space to move things around without 
losing them.
