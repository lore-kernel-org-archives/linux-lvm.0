Received: from reti (vpn50-34.rdu.redhat.com [172.16.50.34])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i289c0uq029390
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 09:38:01 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1B0HEF-0003GV-59
	for linux-lvm@redhat.com; Mon, 08 Mar 2004 09:39:19 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] lvm2 vgchange -a n problem
Message-ID: <20040308093919.GI4872@reti>
References: <20040305235958.GG8500@ossmann.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040305235958.GG8500@ossmann.com>
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
Date: Mon Mar  8 04:36:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Mar 05, 2004 at 04:59:58PM -0700, Michael Ossmann wrote:
> Is this how I'm supposed to do this?

No.  There's a couple of things you could try:

i) do a 'dmsetup info <dev>' and confirm that the 'open count' is 0

ii) use 'lsof' to find out who has opened the device.

Device mapper uses reference counting on the devices, so you will
always be able to remove the device successfully, but it wont really
be destroyed until the last opener closes it.

- Joe
