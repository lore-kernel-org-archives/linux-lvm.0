Received: from fentible.pjc.net (vpn-4-3.stuttgart.redhat.com [10.32.4.3])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9S7J9Hm015450
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 08:19:09 +0100
Message-ID: <4361D0EC.3050004@redhat.com>
Date: Fri, 28 Oct 2005 08:19:08 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can LVM2 and CLVM co-exist
References: <200510272317.02488.edwardam@interlix.com>
In-Reply-To: <200510272317.02488.edwardam@interlix.com>
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
Content-Type: text/plain; charset="us-ascii"
To: edwardam@interlix.com, LVM general discussion and development <linux-lvm@redhat.com>

Edward Muller wrote:
> I have a system using LVM2 and recently setup a CORAID (www.coraid.com) 
> device. I'd like to use CLVM to manage the volumes on the device. But someone 
> mentioned that LVM2 and CLVM may be incompatible. 

What exactly are you trying to do?

LVM2 & CLVM can't be incompatible - they are the same thing! installing the
lvm2-cluster RPM doesn't replace any LVM2 components, it provides a new locking
method for clustered VGs and a daemon to distribute the commands across the cluster.

-- 

patrick
