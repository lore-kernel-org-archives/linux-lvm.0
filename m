Received: from reti (vpn50-18.rdu.redhat.com [172.16.50.18])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i249Txuq017030
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2004 09:29:59 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1AypBv-000708-0t
	for linux-lvm@redhat.com; Thu, 04 Mar 2004 09:30:55 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] LVM Multi Path Support
Message-ID: <20040304093054.GS662@reti>
References: <20040303190349.14912.qmail@web60910.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040303190349.14912.qmail@web60910.mail.yahoo.com>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Mar  4 04:28:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Mar 03, 2004 at 04:03:49PM -0300, Eduardo Dias wrote:
> Dear All,
>  
> I would like to know if LVM Linux has (or will) support to multi path links?

There is a v. old patch kicking around that adds some sort of multipath
support to LVM1.  Search this list to find it.  It hasn't ever been
part of an official release.

LVM2 doesn't support multipath but we're currently developing a
multipath target for device-mapper, and Christophe Varoqui is writing
a standalone userland tool to drive it.  The current thinking is that
the LVM2 tools will just use the devices that Christophes tool
creates.

- Joe
