Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m97KTQ2l006729
	for <linux-lvm@redhat.com>; Tue, 7 Oct 2008 16:29:27 -0400
Message-Id: <59555D8D-3947-4EEC-A85D-2FEE0761398B@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <2429.128.187.150.9.1222973849.squirrel@mail.esc.auckland.ac.nz>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] Can't create LV in cluster
Date: Tue, 7 Oct 2008 15:28:59 -0500
References: <2429.128.187.150.9.1222973849.squirrel@mail.esc.auckland.ac.nz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Do you have the clustering infrastructure set up?  cluster lvm relies  
on that.

  brassow

On Oct 2, 2008, at 1:57 PM, michael.osullivan@auckland.ac.nz wrote:

> Hi everyone,
>
> I have created a 2-node cluster and (after a little difficulty)  
> created a
> clustered volume group visible on both nodes. However, I can't  
> create a
> logical volume on either node. I get the following error:
>
> Error locking on node <other node>: Error backing up metadata, can't  
> find
> VG for group #global
> Aborting. Failed to activate new LV to wipe the start of it.
>
> I have locking_type = 3 and locking_library = liblvm2clusterlock.so.  
> The
> metadata areas and sequence nos are the same using vgdisplay on both
> nodes.
>
> Can anyone help me create LVs? I am happy to provide any extra info  
> needed.
>
> Thanks, Mike
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
