Received: from [10.33.6.9] (vpn-6-9.fab.redhat.com [10.33.6.9])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n6RCUvLo016837
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 08:30:57 -0400
Message-ID: <4A6D9E00.2090600@redhat.com>
Date: Mon, 27 Jul 2009 13:30:56 +0100
From: Christine Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] CLVMD Simple method to get who holds a lock in a
	cluster
References: <29ae894c0907270525v63f0a334n464bb49ea60f71cf@mail.gmail.com>
In-Reply-To: <29ae894c0907270525v63f0a334n464bb49ea60f71cf@mail.gmail.com>
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

On 07/27/2009 01:25 PM, brem belguebli wrote:
> Hi,
> In a clustered environment, without GFS, we plan to use CLVMD exclusive
> activation of VG's in order to prevent a VG to be activated on more than
> 1 node at a time.
> I've been looking for how to check who holds a lock for a given VG but I
> could'nt find no suitable way to do it.
> The only way was to activate debug ( mount -t debugfs debug /debug) and
> cat /debug/dlm/clvmd_locks.
> Is there a way to request dlm (via dlm_tool) to get the lock holding
> node or via  any LVM command.
> Regards
>
>

Depending on the version you have dlm_tool will show you who holds the 
lock. But all it does is use the same debugfs interface you've already 
mentioned :-)

Chrissie
