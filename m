Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] summary of what I need to do to mount snapshot on XFS
References: <1010503449.28039.5.camel@cali.nesnahhouse.com>
In-Reply-To: <1010503449.28039.5.camel@cali.nesnahhouse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16OHUh-0004tv-00@hermes.sistina.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Jan  9 06:07:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, Jeremy Hansen <jeremy@troubletext.com>

The basic concept is you create a snapshot LV
lvcreate -L1G -s -n snap /dev/vg/lv1

This will create a 1G snapshot logical volume called snap for the original 
logical volume /dev/vg/lv1

If this has completed successfully then you can mount it.

mount -t xfs -o nouuid /dev/vg/snap /mnt/snapshot

This will mount an xfs snapshot.  The -o nouuid is needed so that mount will 
not complain and refuse to mount an xfs volume with identical uuid's

This is a good tutorial:
http://www.sistina.com/lvm_howtos/lvm_howto/Common_tasks.html

Is this what you are after or are you having problems with lvcreate 
segfaulting and kernel Oopes?

On Wed, 9 Jan 2002 01:24, Jeremy Hansen wrote:
> I've seen a lot of posts that people do have this working.  I was hoping
> someone could give a good summary for the steps involved.  The goal is
> being able to mount the snapshots volume while the live filesystem is
> mounted.  I see bits and pieces of the answer in various posts, so could
> someone break it down for me in a single mail?
>
> Thanks
> -jeremy
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Adrian Head

(Public Key available on request.)
